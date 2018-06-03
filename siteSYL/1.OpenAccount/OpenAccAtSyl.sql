create or replace procedure openAcc(
	amount accTable_syl.amount%TYPE, 
	interest accTable_syl.interest%TYPE,
	acctype accTable_syl.acctype%TYPE,
	atmnum accTable_syl.atmno%TYPE,
	uname userTable_syl.uname%TYPE, 
	uaddress userTable_syl.uaddress%TYPE, 
	uphone userTable_syl.uphone%TYPE, 
	unid userTable_syl.unid%TYPE,
	upass userTable_syl.upass%TYPE)
	is
	
	accnum userTable_syl.uaccno%TYPE,
	errorAmount exception;
	negAmount exception;
	
begin

	if amount < 0 then
		raise negAmount;
	elsif amount < 500 then
		raise errorAmount;
	end if;
	
	insert into accTable_syl values(amount, interest, acctype, 0, atmnum);
	select uaccno into accnum from accTable_syl where atmno=atmnum;
	insert into userTable_syl values(uname, uaddress, uphone, unid, upass, accnum, 'syl'); 
	dbms.output.put_line('Account openned successfully');
	
exception

	when errorAmount
		dbms.output.put_line('Amount too low');
	when negAmount
		dbms.output.put_line('Invalid Amount');
		
end openAcc;
/