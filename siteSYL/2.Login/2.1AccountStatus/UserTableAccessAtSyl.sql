create or replace package userTableAccess as
	procedure accStat(
		uaccno in userTable_syl.uaccno%TYPE);
	
	procedure accStatatm(
		atmnum in accTable_syl.atmno%TYPE);
	
end userTableAccess;
/

create or replace package body userTableAccess as
	procedure accStat(
		accno in userTable_syl.uaccno%TYPE)
	is
	
		n int;
		unum userTable_syl.unum%TYPE; 
		uname userTable_syl.uname%TYPE; 
		uaddress userTable_syl.uaddress%TYPE;
		uphone userTable_syl.uphone%TYPE;
		unid userTable_syl.unid%TYPE;
		upass userTable_syl.upass%TYPE;
		uaccnum2 userTable_syl.uaccno%TYPE;
		region userTable_syl.region%TYPE;
		accno userTable_syl.uaccno%TYPE;
		
		notFoundex exception;
		
		cursor userCur(uaccnum userTable_syl.uaccno%TYPE) is
			select * from userTable_syl where uaccno = uaccnum;
	
	begin
		select count(anum) into n from accTable_syl where anum = accno;
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
		atmnum in accTable_syl.atmno%TYPE)
		is
	
		n int;
		unum userTable_syl.unum%TYPE; 
		uname userTable_syl.uname%TYPE; 
		uaddress userTable_syl.uaddress%TYPE;
		uphone userTable_syl.uphone%TYPE;
		unid userTable_syl.unid%TYPE;
		upass userTable_syl.upass%TYPE;
		uaccnum2 userTable_syl.uaccno%TYPE;
		region userTable_syl.region%TYPE;
		
		notFoundex exception;
		
		cursor userCur(uaccnum userTable_syl.uaccno%TYPE) is
			select * from userTable_syl where uaccno = uaccnum;
	
	begin
		select count(anum) into n from accTable_syl where atmno = atmnum;
		if n=0 then
			raise notFoundex;
		end if;
		select anum into accno from accTable_syl where atmno = atmnum;
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