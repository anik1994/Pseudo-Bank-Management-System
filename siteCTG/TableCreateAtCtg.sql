clear screen;

DROP TABLE accTable_ctg CASCADE CONSTRAINTS;
DROP TABLE userTable_ctg CASCADE CONSTRAINTS;
DROP TABLE empTable_ctg CASCADE CONSTRAINTS;

CREATE TABLE accTable_ctg(
	anum int, 
	amount number, 
	interest number,
	acctype varchar2(30), 
	withnum int,
	atmno varchar2(30),
        PRIMARY KEY(anum));

/*		
CREATE SEQUENCE SEQ_ctg_accNo START WITH 5000;

CREATE OR REPLACE TRIGGER TRG_ctg_accNo
BEFORE INSERT ON accTable_ctg
FOR EACH ROW
BEGIN
    SELECT SEQ_ctg_accNo.NEXTVAL
    INTO :NEW.anum
    FROM DUAL;
END;
/
*/
CREATE TABLE userTable_ctg(
	unum int, 
	uname varchar2(30), 
	uaddress varchar2(30), 
	uphone varchar2(30), 
	unid varchar2(30),
	upass varchar2(30),
	uaccno int,
	region varchar2(30),
        PRIMARY KEY(unum),
		FOREIGN KEY(uaccno) REFERENCES accTable_ctg(anum));
/*		
CREATE SEQUENCE SEQ_ctg_userID START WITH 2000;

CREATE OR REPLACE TRIGGER TRG_ctg_userID
BEFORE INSERT ON userTable_ctg
FOR EACH ROW
BEGIN
    SELECT SEQ_ctg_userID.NEXTVAL
    INTO :NEW.unum
    FROM DUAL;
END;
/
*/		
CREATE TABLE empTable_ctg(
	enum int, 
	eaccno int,
	salary number,
        PRIMARY KEY(enum),
		FOREIGN KEY(eaccno) REFERENCES accTable_ctg(anum));
		
/*		
CREATE SEQUENCE SEQ_ctg_empID START WITH 8000;

CREATE OR REPLACE TRIGGER TRG_ctg_empID
BEFORE INSERT ON empTable_ctg
FOR EACH ROW
BEGIN
    SELECT SEQ_ctg_empID.NEXTVAL
    INTO :NEW.enum
    FROM DUAL;
END;
/
*/