create or replace procedure openAcc(
	amount accTable_dhk.amount%TYPE, 
	interest accTable_dhk.interest%TYPE,
	acctype accTable_dhk.acctype%TYPE,
	atmnum accTable_dhk.atmno%TYPE,
	uname userTable_dhk.uname%TYPE, 
	uaddress userTable_dhk.uaddress%TYPE, 
	uphone userTable_dhk.uphone%TYPE, 
	unid userTable_dhk.unid%TYPE,
	upass userTable_dhk.upass%TYPE)
	is
	
	accnum userTable_dhk.uaccno%TYPE,
	errorAmount exception;
	negAmount exception;
	
begin

	if amount < 0 then
		raise negAmount;
	elsif amount < 500 then
		raise errorAmount;
	end if;
	
	insert into accTable_dhk values(amount, interest, acctype, 0, atmnum);
	select uaccno into accnum from accTable_dhk where atmno=atmnum;
	insert into userTable_dhk values(uname, uaddress, uphone, unid, upass, accnum, 'dhk'); 
	dbms.output.put_line('Account openned successfully');
	
exception

	when errorAmount
		dbms.output.put_line('Amount too low');
	when negAmount
		dbms.output.put_line('Invalid Amount');
		
end openAcc;
/