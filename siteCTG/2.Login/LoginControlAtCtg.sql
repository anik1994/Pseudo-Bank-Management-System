set serveroutput on;
create or replace package loginCtrl as
	procedure loginAcc(
		uaccno in userTable_ctg.uaccno%TYPE,
		upass in userTable_ctg.upass%TYPE);
	procedure loginAccATM(
		atmnum in accTable_ctg.atmno%TYPE,
		upass in userTable_ctg.upass%TYPE);
	
end loginCtrl;
/

create or replace package body loginCtrl as
	procedure loginAcc(
		uaccno in userTable_ctg.uaccno%TYPE,
		upass in userTable_ctg.upass%TYPE)
		is
		n int;
		noUser exception;
		wrongPass exception;
	begin
		null;
		
		select count(unum) into n from userTable_ctg where uaccno = uaccno AND upass = upass;
			
		if n=0 then
			select count(unum) into n from userTable_ctg where uaccno = uaccno;
			if n=0 then
				raise noUser;
			else
				raise wrongPass;
			end if;
		else
			DBMS_OUTPUT.PUT_LINE('Login successful');
		end if;
	exception
		when noUser then
			DBMS_OUTPUT.PUT_LINE('No user found');
		when wrongPass then
			DBMS_OUTPUT.PUT_LINE('Wrong PASSWORD');
			
	end loginAcc;
	
	procedure loginAccATM(
		atmnum in accTable_ctg.atmno%TYPE,
		upass in userTable_ctg.upass%TYPE)
		is
	
		uaccnum userTable_ctg.uaccno%TYPE;
		n int;
		noUser exception;
		wrongPass exception;
	
	begin
		select count(anum) into n from accTable_ctg where atmno = atmnum;
		if n = 1 then
			select anum into uaccnum from accTable_ctg where atmno = atmnum;
		else
			raise noUser;
		end if;
		
		select count(unum) into n from userTable_ctg where uaccno = uaccnum AND upass = upass;
			
		if n=0 then
			raise wrongPass;
		else
			DBMS_OUTPUT.PUT_LINE('Login successful');
		end if;
			
	exception
		
		when noUser then
			DBMS_OUTPUT.PUT_LINE('No user found');
		when wrongPass then
			DBMS_OUTPUT.PUT_LINE('Wrong PASSWORD');
			
	end loginAccATM;
		
	
end loginCtrl;
/