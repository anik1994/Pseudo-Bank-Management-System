drop table log_account_insert;
create table log_account_insert
(accno int, log_date date);

drop table log_user_insert;
create table log_user_insert
(uno int, log_date date);

drop table log_update_name;
create table log_update_name
(uno int, o_uname varchar2(30), n_uname varchar2(30), log_date date);

drop table log_update_address;
create table log_update_address
(uno int, o_uaddress varchar2(30), n_uaddress varchar2(30), log_date date);

drop table log_user_phn;
create table log_user_phn
(uno int, o_uphone varchar2(30), n_uphone varchar2(30), log_date date);