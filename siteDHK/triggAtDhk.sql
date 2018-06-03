create or replace trigger trigger_new_acc
after insert on accTable_dhk
for each row 

begin
	insert into log_account_insert
	values(:new.anum, sysdate);
end;
/
create or replace trigger trigger_new_user
after insert on userTable_dhk
for each row 

begin
	insert into log_user_insert
	values(:new.unum, sysdate);
end;
/

create or replace trigger trigger_update_name
after update on userTable_dhk
for each row

begin
	insert into log_update_name
	values(:new.unum, :old.uname, :new.uname, sysdate);
end;
/

create or replace trigger trigger_update_address
after update on userTable_dhk
for each row

begin
	insert into log_update_address
	values(:new.unum, :old.address, :new.address, sysdate);
end;
/

create or replace trigger trigger_update_phn
after update on userTable_dhk
for each row

begin
	insert into log_update_phn
	values(:new.unum, :old.uphone, :new.uphone, sysdate);
end;
/