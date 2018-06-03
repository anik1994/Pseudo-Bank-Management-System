create or replace package TransferToOthers as 
	
	procedure BKash(
	senano in accTable_dhk.anum%TYPE, 
	amoun in accTable_dhk.amount%TYPE,
	recphn in userTable_dhk.unum%TYPE);
	
end TransferToOthers;
/