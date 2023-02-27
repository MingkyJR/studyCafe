-- studycafe���� ����
create   user  studycafe
identified by  asdf123
default  tablespace   myts
temporary  tablespace    temp;

-- studycafe���� connect, resource�� �ο�
grant connect, resource, create view
to studycafe;

-- ȸ������ ���̺� ����

drop table user_info;

-- ȸ������(ȸ������ / �α���)
CREATE TABLE user_info (
	user_number	number          constraint uinfo_number     primary key,
	u_name	    varchar2(50)	constraint uinfo_name       NOT NULL,
	u_id	    varchar2(50)	constraint uinfo_id         NOT NULL,
	u_pass	    varchar2(50)	constraint uinfo_pass       NOT NULL,
	u_grade	    number  		default 1                    NOT NULL,
	u_tell	    varchar2(50)	constraint uinfo_tell       NOT NULL,
	u_gender	varchar2(10)	constraint uinfo_gender     NOT NULL,
    u_credate   date	        DEFAULT SYSDATE
);
-- ������ ����
drop  sequence seq_user_info;

-- ����������
create sequence seq_user_info
start with 1
increment by 1;

-- ���̵����� ����
insert into user_info(user_number,u_name,u_id,u_pass,u_grade,u_tell,u_gender)
values(seq_user_info.nextval,'������','adminid','1234',999,'010-1212-1212','��');
insert into user_info(user_number,u_name,u_id,u_pass,u_grade,u_tell,u_gender)
values(seq_user_info.nextval,'ȫ','hongid','1234',1,'010-1111-1111','��');
insert into user_info(user_number,u_name,u_id,u_pass,u_grade,u_tell,u_gender)
values(seq_user_info.nextval,'��','binid','1234',1,'010-2222-2222','��');

-- ���̵����� ����
delete 
from user_info
where u_name = 'ȫ';


select count(*) from user_info;

-- ��� ȸ������ ��ȸ
select *
from user_info;

commit;