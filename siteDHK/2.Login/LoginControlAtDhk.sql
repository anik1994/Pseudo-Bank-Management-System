create or replace package loginCtrl as
	procedure loginAcc(
		uaccno in userTable_dhk.uaccno%TYPE,
		upass in userTable_dhk.upass%TYPE);
	
	procedure loginAccATM(
		atmnum in accTable_dhk.atmno%TYPE,
		upass in userTable_dhk.upass%TYPE);
	
end loginCtrl;
/

create or replace package body loginCtrl as

	procedure loginAcc(
		uaccnum in userTable_dhk.uaccno%TYPE,
		uPassW in userTable_dhk.upass%TYPE)
		is
		n int;
		noUser exception;
		wrongPass exception;
	begin
		
		select count(unum) into n from userTable_dhk where uaccno = uaccnum AND upass = uPassW;
			
		if n=0 then
			select count(unum) into n from userTable_dhk where uaccno = uaccnum;
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
		atmnum in accTable_dhk.atmno%TYPE,
		uPassW in userTable_dhk.upass%TYPE)
		is
	
		uaccnum userTable_dhk.uaccno%TYPE;
		n int;
		noUser exception;
		wrongPass exception;
	
	begin
		select count(anum) into n from accTable_dhk where atmno = atmnum;
		if n = 1 then
			select anum into uaccnum from accTable_dhk where atmno = atmnum;
		else
			raise noUser;
		end if;
		
		select count(unum) into n from userTable_dhk where uaccno = uaccnum AND upass = uPassW;
			
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