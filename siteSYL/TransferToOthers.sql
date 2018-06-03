create or replace package TransferToOthers as 
	
	procedure BKash(
	senano in accTable_syl.anum%TYPE, 
	amoun in accTable_syl.amount%TYPE,
	recphn in userTable_syl.unum%TYPE);
	
end TransferToOthers;
/