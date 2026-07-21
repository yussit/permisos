create table if not exists public.permit_entries (
  id text primary key,
  person text not null,
  permit_number text not null unique,
  record_type text not null default 'permiso',
  day_index integer not null check (day_index between 0 and 6),
  week_id text not null,
  created_ms bigint not null,
  captured_time text not null default '',
  hidden_week boolean not null default false
);

alter table public.permit_entries
add column if not exists record_type text not null default 'permiso';

alter table public.permit_entries enable row level security;

drop policy if exists "permit_entries_read_all" on public.permit_entries;
drop policy if exists "permit_entries_insert_all" on public.permit_entries;
drop policy if exists "permit_entries_update_all" on public.permit_entries;
drop policy if exists "permit_entries_delete_all" on public.permit_entries;

create policy "permit_entries_read_all"
on public.permit_entries
for select
to anon
using (true);

create policy "permit_entries_insert_all"
on public.permit_entries
for insert
to anon
with check (true);

create policy "permit_entries_update_all"
on public.permit_entries
for update
to anon
using (true)
with check (true);

create policy "permit_entries_delete_all"
on public.permit_entries
for delete
to anon
using (true);
