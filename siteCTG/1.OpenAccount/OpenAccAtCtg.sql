set serveroutput on;
create or replace procedure openAcc(
	anum in accTable_ctg.anum%TYPE,
	amount in accTable_ctg.amount%TYPE, 
	interest in accTable_ctg.interest%TYPE,
	acctype in accTable_ctg.acctype%TYPE,
	atmnum in accTable_ctg.atmno%TYPE,
	unum in userTable_ctg.unum%TYPE,
	uname in userTable_ctg.uname%TYPE, 
	uaddress in userTable_ctg.uaddress%TYPE, 
	uphone in userTable_ctg.uphone%TYPE, 
	unid in userTable_ctg.unid%TYPE,
	upass in userTable_ctg.upass%TYPE)
	is
	
	accnum userTable_ctg.uaccno%TYPE;
	errorAmount exception;
	negAmount exception;
	
begin
	
	if amount < 0 then
		raise negAmount;
	elsif amount < 500 then
		raise errorAmount;
	end if;
	
	insert into accTable_ctg values(anum,amount, interest, acctype, 0, atmnum);
	select anum into accnum from accTable_ctg where atmno=atmnum;
	insert into userTable_ctg values(unum, uname, uaddress, uphone, unid, upass, accnum, 'ctg'); 
	dbms_output.put_line('Account openned successfully');
exception
	when errorAmount then
		dbms_output.put_line('Amount too low');
	when negAmount then
		dbms_output.put_line('Invalid Amount');
		
end openAcc;
/