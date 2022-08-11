create user scott
identified by tiger
default tablespace users;

grant connect, resource to scott;

conn scott/tiger

drop user scott cascade;

select * from tab;