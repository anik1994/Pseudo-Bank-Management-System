drop database link site_syl;

create database link site_syl
 connect to system identified by "123"
 using '(DESCRIPTION =
       (ADDRESS_LIST =
         (ADDRESS = (PROTOCOL = TCP)
		 (HOST = 192.168.10.106)
		 (PORT = 1521))
       )
       (CONNECT_DATA =
         (SID = XE)
       )
     )'
; 

drop database link site_ctg;

create database link site_ctg
 connect to system identified by "123"
 using '(DESCRIPTION =
       (ADDRESS_LIST =
         (ADDRESS = (PROTOCOL = TCP)
		 (HOST = 192.168.10.104)
		 (PORT = 1521))
       )
       (CONNECT_DATA =
         (SID = XE)
       )
     )'
; 