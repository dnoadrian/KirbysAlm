-- Kirbys Alm: Spielstände in der Cloud (Supabase, kostenloses Projekt reicht)
-- Einmal komplett im SQL Editor ausführen. Darf mehrmals laufen.
--
-- Die Tabelle ist von außen nicht lesbar (RLS an, keine Policies, keine Rechte).
-- Das Spiel ruft nur die Funktionen unten auf. Es schickt nie das Passwort, sondern den
-- PBKDF2-Hash vom Gerät; gespeichert wird davon nur noch einmal ein SHA-256.

create table if not exists public.ka_accounts (
  key        text primary key check (char_length(key) between 1 and 40),
  name       text not null check (char_length(name) between 1 and 40),
  salt       text not null check (salt ~ '^[0-9a-f]{32}$'),
  hash       text not null,
  data       jsonb not null default '{}'::jsonb,
  rev        integer not null default 1,
  wid        text,
  moved_to   text,          -- umbenannt: alter Name zeigt auf den neuen
  updated_at timestamptz not null default now()
);

alter table public.ka_accounts enable row level security;
revoke all on table public.ka_accounts from public, anon, authenticated;

create or replace function public.ka_h(p text) returns text
language sql immutable set search_path = public as $$
  select encode(sha256(convert_to(coalesce(p, ''), 'UTF8')), 'hex');
$$;

-- Salz zu einem Namen (null = Name frei)
create or replace function public.ka_salt(p_key text) returns jsonb
language sql stable security definer set search_path = public as $$
  select jsonb_build_object('salt', (select a.salt from ka_accounts a where a.key = p_key and a.moved_to is null));
$$;

-- neues Konto; schlägt fehl, wenn es den Namen schon gibt
create or replace function public.ka_register(p_key text, p_name text, p_salt text, p_hash text, p_data jsonb, p_wid text)
returns jsonb language plpgsql security definer set search_path = public as $$
begin
  if p_hash is null or char_length(p_hash) > 200 or jsonb_typeof(p_data) is distinct from 'object' or octet_length(p_data::text) > 65536 then
    return jsonb_build_object('ok', false, 'error', 'invalid');
  end if;
  delete from ka_accounts where key = p_key and moved_to is not null;
  insert into ka_accounts (key, name, salt, hash, data, rev, wid)
    values (p_key, p_name, p_salt, ka_h(p_hash), p_data, 1, p_wid)
    on conflict (key) do nothing;
  if not found then return jsonb_build_object('ok', false, 'error', 'exists'); end if;
  return jsonb_build_object('ok', true, 'rev', 1);
end $$;

-- Spielstand laden (nur mit passendem Hash)
create or replace function public.ka_load(p_key text, p_hash text)
returns jsonb language plpgsql stable security definer set search_path = public as $$
declare a ka_accounts;
begin
  select * into a from ka_accounts where key = p_key;
  if not found then return jsonb_build_object('ok', false, 'error', 'missing'); end if;
  if a.hash <> ka_h(p_hash) then return jsonb_build_object('ok', false, 'error', 'auth'); end if;
  if a.moved_to is not null then return jsonb_build_object('ok', false, 'error', 'moved', 'key', a.moved_to, 'name', a.name); end if;
  return jsonb_build_object('ok', true, 'name', a.name, 'data', a.data, 'rev', a.rev, 'wid', a.wid);
end $$;

-- Spielstand speichern: nur wenn p_rev der aktuelle Stand ist, sonst kommt der neuere Stand zurück
create or replace function public.ka_save(p_key text, p_hash text, p_rev integer, p_data jsonb, p_wid text)
returns jsonb language plpgsql security definer set search_path = public as $$
declare a ka_accounts;
begin
  if jsonb_typeof(p_data) is distinct from 'object' or octet_length(p_data::text) > 65536 then
    return jsonb_build_object('ok', false, 'error', 'invalid');
  end if;
  select * into a from ka_accounts where key = p_key for update;
  if not found then return jsonb_build_object('ok', false, 'error', 'missing'); end if;
  if a.hash <> ka_h(p_hash) then return jsonb_build_object('ok', false, 'error', 'auth'); end if;
  if a.moved_to is not null then return jsonb_build_object('ok', false, 'error', 'moved', 'key', a.moved_to, 'name', a.name); end if;
  if a.rev <> p_rev then
    return jsonb_build_object('ok', false, 'error', 'conflict', 'rev', a.rev, 'data', a.data, 'wid', a.wid);
  end if;
  update ka_accounts set data = p_data, rev = a.rev + 1, wid = p_wid, updated_at = now() where key = p_key;
  return jsonb_build_object('ok', true, 'rev', a.rev + 1);
end $$;

-- umbenennen: Spielstand zieht unter den neuen Namen, der alte zeigt dorthin
create or replace function public.ka_rename(p_key text, p_hash text, p_new_key text, p_name text)
returns jsonb language plpgsql security definer set search_path = public as $$
declare a ka_accounts;
begin
  select * into a from ka_accounts where key = p_key for update;
  if not found then return jsonb_build_object('ok', false, 'error', 'missing'); end if;
  if a.hash <> ka_h(p_hash) then return jsonb_build_object('ok', false, 'error', 'auth'); end if;
  if a.moved_to is not null then return jsonb_build_object('ok', false, 'error', 'moved', 'key', a.moved_to, 'name', a.name); end if;
  if p_new_key = p_key then
    update ka_accounts set name = p_name, updated_at = now() where key = p_key;
    return jsonb_build_object('ok', true, 'rev', a.rev);
  end if;
  if exists (select 1 from ka_accounts where key = p_new_key and moved_to is null) then
    return jsonb_build_object('ok', false, 'error', 'exists');
  end if;
  delete from ka_accounts where key = p_new_key;
  insert into ka_accounts (key, name, salt, hash, data, rev, wid) values (p_new_key, p_name, a.salt, a.hash, a.data, a.rev, a.wid);
  update ka_accounts set moved_to = p_new_key, name = p_name, data = '{}'::jsonb, updated_at = now() where key = p_key;
  update ka_accounts set moved_to = p_new_key, name = p_name where moved_to = p_key;
  return jsonb_build_object('ok', true, 'rev', a.rev);
end $$;

revoke all on function public.ka_h(text) from public, anon, authenticated;
revoke all on function public.ka_salt(text) from public;
revoke all on function public.ka_register(text, text, text, text, jsonb, text) from public;
revoke all on function public.ka_load(text, text) from public;
revoke all on function public.ka_save(text, text, integer, jsonb, text) from public;
revoke all on function public.ka_rename(text, text, text, text) from public;
grant execute on function public.ka_salt(text) to anon, authenticated;
grant execute on function public.ka_register(text, text, text, text, jsonb, text) to anon, authenticated;
grant execute on function public.ka_load(text, text) to anon, authenticated;
grant execute on function public.ka_save(text, text, integer, jsonb, text) to anon, authenticated;
grant execute on function public.ka_rename(text, text, text, text) to anon, authenticated;
