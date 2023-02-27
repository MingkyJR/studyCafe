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
-- 시퀀스 삭제
drop  sequence seq_user_info;

-- 시퀀스생성
create sequence seq_user_info
start with 1
increment by 1;

-- 더미데이터 삽입
insert into user_info(user_number,u_name,u_id,u_pass,u_grade,u_tell,u_gender)
values(seq_user_info.nextval,'관리자','adminid','1234',999,'010-1212-1212','남');
insert into user_info(user_number,u_name,u_id,u_pass,u_grade,u_tell,u_gender)
values(seq_user_info.nextval,'홍','hongid','1234',1,'010-1111-1111','남');
insert into user_info(user_number,u_name,u_id,u_pass,u_grade,u_tell,u_gender)
values(seq_user_info.nextval,'빈','binid','1234',1,'010-2222-2222','여');

-- 더미데이터 삭제
delete 
from user_info
where u_name = '홍';


select count(*) from user_info;

-- 모든 회원정보 조회
select *
from user_info;

commit;