drop database link site_ctg;

create database link site_ctg
 connect to system identified by "12345"
 using '(DESCRIPTION =
       (ADDRESS_LIST =
         (ADDRESS = (PROTOCOL = TCP)
		 (HOST = 192.168.0.106)
		 (PORT = 1521))
       )
       (CONNECT_DATA =
         (SID = XE)
       )
     )'
; 

drop database link site_dhk;

create database link site_dhk
 connect to system identified by "12345"
 using '(DESCRIPTION =
       (ADDRESS_LIST =
         (ADDRESS = (PROTOCOL = TCP)
		 (HOST = 192.168.0.107)
		 (PORT = 1521))
       )
       (CONNECT_DATA =
         (SID = XE)
       )
     )'
; 