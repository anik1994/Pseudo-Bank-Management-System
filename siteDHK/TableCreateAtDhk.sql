clear screen;

DROP TABLE accTable_dhk CASCADE CONSTRAINTS;
DROP TABLE userTable_dhk CASCADE CONSTRAINTS;
DROP TABLE empTable_dhk CASCADE CONSTRAINTS;
DROP TABLE loanTable CASCADE CONSTRAINTS;

CREATE TABLE accTable_dhk(
	anum int, 
	amount number, 
	interest number,
	acctype varchar2(30), 
	withnum int,
	atmno varchar2(30),
        PRIMARY KEY(anum));
		
/*		
CREATE SEQUENCE SEQ_dhk_accNo START WITH 4000;

CREATE OR REPLACE TRIGGER TRG_dhk_accNo
BEFORE INSERT ON accTable_dhk
FOR EACH ROW
BEGIN
    SELECT SEQ_dhk_accNo.NEXTVAL
    INTO :NEW.anum
    FROM DUAL;
END;
/
*/
CREATE TABLE userTable_dhk(
	unum int, 
	uname varchar2(30), 
	uaddress varchar2(30), 
	uphone varchar2(30), 
	unid varchar2(30),
	upass varchar2(30),
	uaccno int,
	region varchar2(30),
        PRIMARY KEY(unum),
		FOREIGN KEY(uaccno) REFERENCES accTable_dhk(anum));

/*		
CREATE SEQUENCE SEQ_dhk_userID START WITH 1000;

CREATE OR REPLACE TRIGGER TRG_dhk_userID
BEFORE INSERT ON userTable_dhk
FOR EACH ROW
BEGIN
    SELECT SEQ_dhk_userID.NEXTVAL
    INTO :NEW.unum
    FROM DUAL;
END;
/
*/		
CREATE TABLE empTable_dhk(
	enum int, 
	eaccno int,
	salary number,
        PRIMARY KEY(enum),
		FOREIGN KEY(eaccno) REFERENCES accTable_dhk(anum));
	
		
/*		
CREATE SEQUENCE SEQ_dhk_empID START WITH 7000;

CREATE OR REPLACE TRIGGER TRG_dhk_empID
BEFORE INSERT ON empTable_dhk
FOR EACH ROW
BEGIN
    SELECT SEQ_dhk_empID.NEXTVAL
    INTO :NEW.enum
    FROM DUAL;
END;
/
*/
CREATE TABLE loanTable (
	lnum int,
	accNo int,
	loanAmount number,
	premAmount number,
	mAcc int,
	restYears int,
	takenDate date,
        PRIMARY KEY(lnum),
		FOREIGN KEY(accNo) REFERENCES accTable(anum)
		FOREIGN KEY(mAcc) REFERENCES accTable(anum));

/*		
CREATE SEQUENCE SEQ_lnum START WITH 7770000;

CREATE OR REPLACE TRIGGER TRG_lnum
BEFORE INSERT ON loanTable
FOR EACH ROW
BEGIN
    SELECT SEQ_lnum.NEXTVAL
    INTO :NEW.lnum
    FROM DUAL;
END;
/
*/	
insert into accTable_dhk(anum, amount, interest, acctype, withnum, atmno) values (4001, 5000, 10, 'sav', 0, 'dhk001');	
insert into accTable_dhk(anum, amount, interest, acctype, withnum, atmno) values (4002, 6000, 10, 'sav', 0, 'dhk002');	
insert into accTable_dhk(anum, amount, interest, acctype, withnum, atmno) values (4003, 7000, 10, 'cur', 0, 'dhk003');	
insert into accTable_dhk(anum, amount, interest, acctype, withnum, atmno) values (4004, 8000, 10, 'cur', 0, 'dhk004');	
insert into accTable_dhk(anum, amount, interest, acctype, withnum, atmno) values (4005, 9000, 10, 'cur', 0, 'dhk005');	
insert into accTable_dhk(anum, amount, interest, acctype, withnum, atmno) values (4006, 10000, 10, 'sav', 0, 'dhk006');	
insert into accTable_dhk(anum, amount, interest, acctype, withnum, atmno) values (4007, 51000, 10, 'sav', 0, 'dhk007');	
insert into accTable_dhk(anum, amount, interest, acctype, withnum, atmno) values (4008, 125000, 10, 'sav', 0, 'dhk008');	

insert into userTable_dhk(unum, uname, uaddress, uphone, unid, upass, uaccno, region) values (1001,'Anik Chowdhury', 'basaboo','01672948180','1234567891011','1234',4001,'dhk');	
insert into userTable_dhk(unum, uname, uaddress, uphone, unid, upass, uaccno, region) values (1002,'Shihab', 'tejgaon','01672180','1234567891011','1234',4002,'dhk');	
insert into userTable_dhk(unum, uname, uaddress, uphone, unid, upass, uaccno, region) values (1003,'Shetu', 'modhubagh','0167180','1234567891011','1234',4003,'dhk');	
insert into userTable_dhk(unum, uname, uaddress, uphone, unid, upass, uaccno, region) values (1004,'Tanjila', 'santinogor','0148180','1234567891011','1234',4004,'dhk');	
insert into userTable_dhk(unum, uname, uaddress, uphone, unid, upass, uaccno, region) values (1005,'Redone', 'basaboo','0167294','1234567891011','1234',4005,'dhk');	
insert into userTable_dhk(unum, uname, uaddress, uphone, unid, upass, uaccno, region) values (1006,'Faiza', 'ishkaton','2948180','1234567891011','1234',4006,'dhk');	
insert into userTable_dhk(unum, uname, uaddress, uphone, unid, upass, uaccno, region) values (1007,'Inzamam', 'modhubagh','016748180','1234567891011','1234',4007,'dhk');	
insert into userTable_dhk(unum, uname, uaddress, uphone, unid, upass, uaccno, region) values (1008,'Nafis', 'kolabagan','016729480','1234567891011','1234',4008,'dhk');	

insert into empTable_dhk(enum, eaccno, salary) values (7001,4004,50000);
insert into empTable_dhk(enum, eaccno, salary) values (7002,4005,60000);
insert into empTable_dhk(enum, eaccno, salary) values (7003,4006,9000);
insert into empTable_dhk(enum, eaccno, salary) values (7004,4007,12000);

commit;