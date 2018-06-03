set serveroutput on;
create or replace package userTableAccess as
	/*
	procedure accStat(
		uaccno in userTable_ctg.uaccno%TYPE);
	*/
	procedure accStatatm(
		atmnum in accTable_ctg.atmno%TYPE);
	
end userTableAccess;
/

create or replace package body userTableAccess as
	procedure accStat(
		uaccno in userTable_ctg.uaccno%TYPE)
	is
	
		n int;
		unum userTable_ctg.unum%TYPE; 
		uname userTable_ctg.uname%TYPE; 
		uaddress userTable_ctg.uaddress%TYPE;
		uphone userTable_ctg.uphone%TYPE;
		unid userTable_ctg.unid%TYPE;
		upass userTable_ctg.upass%TYPE;
		uaccnum2 userTable_ctg.uaccno%TYPE;
		region userTable_ctg.region%TYPE;
		
		notFoundex exception;
		
		cursor userCur(uaccnum userTable_ctg.uaccno%TYPE) is
			select * from userTable_ctg where uaccno = uaccnum;
	
	begin
		
		select count(anum) into n from accTable_ctg where anum = uaccno;
		if n=0 then
			raise notFoundex;
		end if;
		open userCur(uaccno);
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
		atmnum in accTable_ctg.atmno%TYPE)
		is
	
		n int;
		unum userTable_ctg.unum%TYPE; 
		uname userTable_ctg.uname%TYPE; 
		uaddress userTable_ctg.uaddress%TYPE;
		uphone userTable_ctg.uphone%TYPE;
		unid userTable_ctg.unid%TYPE;
		upass userTable_ctg.upass%TYPE;
		uaccnum2 userTable_ctg.uaccno%TYPE;
		region userTable_ctg.region%TYPE;
		accno userTable_ctg.uaccno%TYPE;
		
		notFoundex exception;
		
		cursor userCur(uaccnum userTable_ctg.uaccno%TYPE) is
			select * from userTable_ctg where uaccno = uaccnum;
	
	begin
		select count(anum) into n from accTable_ctg where atmno = atmnum;
		if n=0 then
			raise notFoundex;
		end if;
		select anum into accno from accTable_ctg where atmno = atmnum;
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
