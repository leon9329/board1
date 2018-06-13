create table board0( num number primary key,
                     writer varchar2(20) not null,
	    	         email varchar2(30),
                     subject varchar2(50) not null,
                     passwd varchar2(20) not null,
		        	 reg_date timestamp not null,
		        	 readcount number default 0,			
		        	 content varchar2(2000) not null,
		        	 ip varchar2(20) not null,
		        	 ref number not null,
					re_step number not null,
					re_level number not null);
               
               
create sequence board0_seq
	start with 1
	increment by 1
	nocache;
  
  select * from tab;
  select * from seq;
  
  insert into board0 values(board0_seq.nextval,'ÃÖ¹Î½Â','email@naver.com','°Ô½ÃÆÇ ¿¬½À','1',sysdate,0,'³»¿ë','192.168.30.27');
  
  
  