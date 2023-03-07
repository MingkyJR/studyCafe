-- studycafe유저 생성
create   user  studycafe
identified by  asdf123
default  tablespace   myts
temporary  tablespace    temp;

-- studycafe에게 connect, resource롤 부여
grant connect, resource, create view
to studycafe;

-- 회원정보 테이블 삭제
drop table user_info;

-- 회원정보(회원가입 / 로그인)
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
-- 시퀀스 삭제
drop  sequence seq_user_info;

-- 시퀀스생성
create sequence seq_user_info
start with 1
increment by 1;

-- 더미데이터 삽입
insert into user_info(u_number,u_name,u_id,u_pass,u_grade,u_tell,u_gender,u_credate)
values(seq_user_info.nextval,'관리자','adminid','1234',999,'010-1212-1212','남',sysdate);
insert into user_info(u_number,u_name,u_id,u_pass,u_grade,u_tell,u_gender,u_credate)
values(seq_user_info.nextval,'홍','hongid','1234',1,'010-1111-1111','남',sysdate);
insert into user_info(u_number,u_name,u_id,u_pass,u_grade,u_tell,u_gender,u_credate)
values(seq_user_info.nextval,'빈','binid','1234',1,'010-2222-2222','여',sysdate);
INSERT INTO user_info(u_number,u_name,u_id,u_pass,u_grade,u_tell,u_gender,u_credate)
VALUES(seq_user_info.nextval,'류','ryuid','1234',1,'010-222-3333','여',sysdate);
-- 더미데이터 삭제
delete 
from user_info
where u_name = '홍';

delete 
from user_info
where u_name ='관리자'

-- 현재 존재하는 user_info의 컬럼 수
select count(*) from user_info;

-- 모든 회원정보 조회
select *
from user_info;

-- 특정유저 검색
select u_number from 
user_info where u_number=3;

-- (회원id로) 상세회원조회
select u_number,u_name,u_id,u_pass,u_grade,u_tell,u_gender,u_credate
from user_info
where u_id = 'hongid';

-- 회원 정보 조회
select u_number,u_name,u_id,u_pass,u_grade,u_tell,u_gender,u_credate
from user_info;


-- 저장
commit;

SELECT u_name,u_id,u_tell,u_gender,u_credate
FROM user_info
WHERE u_id = 'binid' AND u_pass = '1234';

SELECT COUNT(*)
FROM user_info
WHERE u_id = #{u_id} AND u_pass = #{u_pass}
		
-- 회원상세조회(회원 정보 불러오기        
SELECT u_number,u_name,u_id,u_tell,u_gender,u_credate, u_update
FROM user_info
WHERE u_id = 'binid'; 