create or replace package userTableAccess as
	procedure accStat(
		uaccno in userTable_dhk.uaccno%TYPE);
	
	procedure accStatatm(
		atmnum in accTable_dhk.atmno%TYPE);
	
end userTableAccess;
/

create or replace package body userTableAccess as
	procedure accStat(
		accno in userTable_dhk.uaccno%TYPE)
	is
	
		n int;
		unum userTable_dhk.unum%TYPE; 
		uname userTable_dhk.uname%TYPE; 
		uaddress userTable_dhk.uaddress%TYPE;
		uphone userTable_dhk.uphone%TYPE;
		unid userTable_dhk.unid%TYPE;
		upass userTable_dhk.upass%TYPE;
		uaccnum2 userTable_dhk.uaccno%TYPE;
		region userTable_dhk.region%TYPE;
		
		notFoundex exception;
		
		cursor userCur(uaccnum userTable_dhk.uaccno%TYPE) is
			select * from userTable_dhk where uaccno = uaccnum;
	
	begin
		select count(anum) into n from accTable_dhk where anum = accno;
		if n=0 then
			raise notFoundex;
		end if;
		open userCur(accno);
		loop
			fetch userCur into unum, uname, uaddress, uphone, unid, upass, uaccnum2, region;
			exit when userCur%notfound;
				DBMS_OUTPUT.PUT_LINE(TO_CHAR(unum)||' '||TO_CHAR(uname)||' '||TO_CHAR(uaddress)||' '||TO_CHAR(uphone)||' '||TO_CHAR(unid)||' '||TO_CHAR(upass)||' '||TO_CHAR(uaccnum2)||' '||TO_CHAR(region));
		end loop;
		close userCur;
	
	exception
		
		when notFoundex then
			DBMS_OUTPUT.PUT_LINE('No user found');
	
	end accStat;
	
	procedure accStatatm(
		atmnum in accTable_dhk.atmno%TYPE)
		is
	
		n int;
		unum userTable_dhk.unum%TYPE; 
		uname userTable_dhk.uname%TYPE; 
		uaddress userTable_dhk.uaddress%TYPE;
		uphone userTable_dhk.uphone%TYPE;
		unid userTable_dhk.unid%TYPE;
		upass userTable_dhk.upass%TYPE;
		uaccnum2 userTable_dhk.uaccno%TYPE;
		region userTable_dhk.region%TYPE;
		accno userTable_dhk.uaccno%TYPE;
		
		notFoundex exception;
		
		cursor userCur(uaccnum userTable_dhk.uaccno%TYPE) is
			select * from userTable_dhk where uaccno = uaccnum;
	
	begin
		select count(anum) into n from accTable_dhk where atmno = atmnum;
		if n=0 then
			raise notFoundex;
		end if;
		select anum into accno from accTable_dhk where atmno = atmnum;
		open userCur(accno);
		loop
			fetch userCur into unum, uname, uaddress, uphone, unid, upass, uaccnum2, region;
			exit when userCur%notfound;
				DBMS_OUTPUT.PUT_LINE(TO_CHAR(unum)||' '||TO_CHAR(uname)||' '||TO_CHAR(uaddress)||' '||TO_CHAR(uphone)||' '||TO_CHAR(unid)||' '||TO_CHAR(upass)||' '||TO_CHAR(uaccnum2)||' '||TO_CHAR(region));
		end loop;
		close userCur;
	
	exception
		
		when notFoundex then
			DBMS_OUTPUT.PUT_LINE('No user found');
	
	end accStatatm;
	
end userTableAccess;
/