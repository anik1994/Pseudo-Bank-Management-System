create or replace procedure withdraw(
ano in accTable_syl.anum%TYPE,
amnt in accTable_syl.amount%TYPE)
is

n int;
wn accTable_syl.withnum%TYPE;
now accTable_syl.anum%TYPE;

cursor cur(aid accTable_syl.anum%TYPE) is
select amount, withnum from accTable_syl where anum = aid;

Begin
	open cur(ano);
	fetch cur into now, wn;
	close cur;
	now:=now-amnt;
	wn:=wn+1;
	update accTable_syl set amount = now, withnum = wn where anum = aid;

end;
/