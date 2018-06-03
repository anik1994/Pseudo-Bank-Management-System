create or replace function giveAccNo(phone in varchar2(30))
  return int
  is
	create or replace view tempView as
	select uphone, uaccno from userTable_ctg
	UNION
	select uphone, uaccno from userTable_dhk@site_dhk;

	create or replace view mainView as
	select uphone, uaccno from tempView
	UNION
	select uphone, uaccno from userTable_syl@site_syl;
	acno int;
begin
	select uaccno into acno from mainView where uphone = phone;
	return acno;
end giveAccNo;
/



