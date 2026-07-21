alter table public.permit_entries
add column if not exists record_type text not null default 'permiso';

update public.permit_entries
set record_type = 'permiso'
where record_type is null;
