clear screen;
set serveroutput on;
set verify off;

declare
	sacno int := &Sender_Account_Number;
	amount number := &Amount;
	racno int := &Receiver_Account_Number;
begin
	Transactions.Transfer(acno, amount, racno);
end;
/