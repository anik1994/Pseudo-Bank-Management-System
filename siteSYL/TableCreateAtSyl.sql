clear screen;

DROP TABLE accTable_syl CASCADE CONSTRAINTS;
DROP TABLE userTable_syl CASCADE CONSTRAINTS;
DROP TABLE empTable_syl CASCADE CONSTRAINTS;

CREATE TABLE accTable_syl(
	anum int, 
	amount number, 
	interest number,
	acctype varchar2(30), 
	withnum int,
	atmno varchar2(30),
        PRIMARY KEY(anum));

/*		
CREATE SEQUENCE SEQ_syl_accNo START WITH 6000;

CREATE OR REPLACE TRIGGER TRG_syl_accNo
BEFORE INSERT ON accTable_syl
FOR EACH ROW
BEGIN
    SELECT SEQ_syl_accNo.NEXTVAL
    INTO :NEW.anum
    FROM DUAL;
END;
/
*/
CREATE TABLE userTable_syl(
	unum int, 
	uname varchar2(30), 
	uaddress varchar2(30), 
	uphone varchar2(30), 
	unid varchar2(30),
	upass varchar2(30),
	uaccno int,
	region varchar2(30),
        PRIMARY KEY(unum),
		FOREIGN KEY(uaccno) REFERENCES accTable_syl(anum));
/*		
CREATE SEQUENCE SEQ_syl_userID START WITH 3000;

CREATE OR REPLACE TRIGGER TRG_syl_userID
BEFORE INSERT ON userTable_syl
FOR EACH ROW
BEGIN
    SELECT SEQ_syl_userID.NEXTVAL
    INTO :NEW.unum
    FROM DUAL;
END;
/
*/		
CREATE TABLE empTable_syl(
	enum int, 
	eaccno int,
	salary number,
        PRIMARY KEY(enum),
		FOREIGN KEY(eaccno) REFERENCES accTable_syl(anum));
		
/*		
CREATE SEQUENCE SEQ_syl_empID START WITH 9000;

CREATE OR REPLACE TRIGGER TRG_syl_empID
BEFORE INSERT ON empTable_syl
FOR EACH ROW
BEGIN
    SELECT SEQ_syl_empID.NEXTVAL
    INTO :NEW.enum
    FROM DUAL;
END;
/
*/
		