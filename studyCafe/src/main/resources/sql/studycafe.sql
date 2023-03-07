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
create table user_info(
u_number    number          constraint pk_user_info_member_id       primary key,  
u_name      varchar2(50)    constraint nn_user_info_name            not null,          
u_id        varchar2(50)    constraint uk_user_info_id              unique,              
u_pass      varchar2(50)    constraint nn_user_info_pass            not null,          
u_grade     number          constraint nn_user_info_grade           not null,        
u_tell      varchar2(50)    constraint nn_user_info_tell            not null,          
u_gender    varchar2(10)    constraint nn_user_info_gender          not null,   
u_credate   date	    DEFAULT SYSDATE,
u_update    date	    DEFAULT SYSDATE
);
-- ������ ����
drop  sequence seq_user_info;

-- ����������
create sequence seq_user_info
start with 1
increment by 1;

-- ���̵����� ����
insert into user_info(u_number,u_name,u_id,u_pass,u_grade,u_tell,u_gender,u_credate)
values(seq_user_info.nextval,'������','adminid','1234',999,'010-1212-1212','��',sysdate);
insert into user_info(u_number,u_name,u_id,u_pass,u_grade,u_tell,u_gender,u_credate)
values(seq_user_info.nextval,'ȫ','hongid','1234',1,'010-1111-1111','��',sysdate);
insert into user_info(u_number,u_name,u_id,u_pass,u_grade,u_tell,u_gender,u_credate)
values(seq_user_info.nextval,'��','binid','1234',1,'010-2222-2222','��',sysdate);
INSERT INTO user_info(u_number,u_name,u_id,u_pass,u_grade,u_tell,u_gender,u_credate)
VALUES(seq_user_info.nextval,'��','ryuid','1234',1,'010-222-3333','��',sysdate);
-- ���̵����� ����
delete 
from user_info
where u_name = 'ȫ';

delete 
from user_info
where u_name ='������'

-- ���� �����ϴ� user_info�� �÷� ��
select count(*) from user_info;

-- ��� ȸ������ ��ȸ
select *
from user_info;

-- Ư������ �˻�
select u_number from 
user_info where u_number=3;

-- (ȸ��id��) ��ȸ����ȸ
select u_number,u_name,u_id,u_pass,u_grade,u_tell,u_gender,u_credate
from user_info
where u_id = 'hongid';

-- ȸ�� ���� ��ȸ
select u_number,u_name,u_id,u_pass,u_grade,u_tell,u_gender,u_credate
from user_info;


-- ����
commit;

SELECT u_name,u_id,u_tell,u_gender,u_credate
FROM user_info
WHERE u_id = 'binid' AND u_pass = '1234';

SELECT COUNT(*)
FROM user_info
WHERE u_id = #{u_id} AND u_pass = #{u_pass}
		
-- ȸ������ȸ(ȸ�� ���� �ҷ�����        
SELECT u_number,u_name,u_id,u_tell,u_gender,u_credate, u_update
FROM user_info
WHERE u_id = 'binid'; 