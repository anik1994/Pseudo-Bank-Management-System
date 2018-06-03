create or replace package loginCtrl as
	procedure loginAcc(
		uaccno in userTable_syl.uaccno%TYPE,
		upass in userTable_syl.upass%TYPE);
	
	procedure loginAccATM(
		atmnum in accTable_syl.atmno%TYPE,
		upass in userTable_syl.upass%TYPE);
	
end loginCtrl;
/

create or replace package body loginCtrl as

	procedure loginAcc(
		uaccnum in userTable_syl.uaccno%TYPE,
		uPassW in userTable_syl.upass%TYPE)
		is
		n int;
		noUser exception;
		wrongPass exception;
	begin
		
		select count(unum) into n from userTable_syl where uaccno = uaccnum AND upass = uPassW;
			
		if n=0 then
			select count(unum) into n from userTable_syl where uaccno = uaccnum;
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
		atmnum in accTable_syl.atmno%TYPE,
		uPassW in userTable_syl.upass%TYPE)
		is
	
		uaccnum userTable_syl.uaccno%TYPE;
		n int;
		noUser exception;
		wrongPass exception;
	
	begin
		select count(anum) into n from accTable_syl where atmno = atmnum;
		if n = 1 then
			select anum into uaccnum from accTable_syl where atmno = atmnum;
		else
			raise noUser;
		end if;
		
		select count(unum) into n from userTable_syl where uaccno = uaccnum AND upass = uPassW;
			
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