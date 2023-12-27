-- 사업자 정보를 저장할 테이블

CREATE TABLE owner_info(
	sto_num VARCHAR2(100) CONSTRAINT owner_info_store_num_pk PRIMARY KEY, --사업자 번호
	sto_name VARCHAR2(100) CONSTRAINT owner_info_store_name_nn NOT NULL, -- 상호명 
	o_name VARCHAR2(100) CONSTRAINT owner_info_owner_name_nn NOT NULL,--사업자(가입자) 이름
	email VARCHAR2(100) CONSTRAINT owner_info_email_nn NOT NULL,--이메일겸 아이디
	pwd VARCHAR2(100) CONSTRAINT owner_info_pwd_nn NOT NULL
);

-- 상품의 정보를 저장할 테이블
CREATE TABLE menu_info(
	sto_num VARCHAR2(100), --사업자 번호,
	name VARCHAR2(100) NOT NULL, --메뉴 이름
	price NUMBER NOT NULL, --메뉴 가격
	description VARCHAR2(100), --메뉴 설명
	imageUrl VARCHAR2(2000),
	sell VARCHAR2(10) CHECK(sell IN('YES','NO')), --메뉴 품절 유무 품절이면 "yes" 품절이 아니면 "no"
	category VARCHAR2(100) NOT NULL --메뉴 카테고리
);

-- 고객의 주문 정보를 저장할 테이블
CREATE TABLE order_info(
	sto_num VARCHAR2(100), --사업자 번호
	table_num NUMBER NOT NULL, --테이블 이름
	menu VARCHAR2(100) NOT NULL, --메뉴 이름
	price NUMBER NOT NULL, --메뉴 가격
	count NUMBER NOT NULL --메뉴 개수
);

-- 사장님이 지정한 요청사항 정보를 저장할 테이블
CREATE TABLE etc_info(
	sto_num VARCHAR2(100), --사업자 번호
	etc VARCHAR2(100) NOT NULL --요청 정보
);

-- 고객이 요청한 정보를 저장할 테이블
CREATE TABLE call_info(
	sto_num VARCHAR2(100), --사업자 번호
	table_num NUMBER NOT NULL, --테이블 이름
	etc VARCHAR2(100) NOT NULL --요청 정보
);

-- 키오스크 테스트용 데이터(사업자 임시정보)
insert into owner_info (sto_num, sto_name, o_name, email, pwd)values('000-00-00000','가게이름이다','사장이름이다','aa@aa.aa','@');

-- 키오스크 테스트용 데이터(메뉴 임시정보)
insert into menu_info (sto_num, name, price, description, imageUrl, sell, category)values('000-00-00000','아메리카노','1800','맛있쪙','','YES','커피');
insert into menu_info (sto_num, name, price, description, imageUrl, sell, category)values('000-00-00000','카페라떼','1800','맛있쪙','','YES','커피');
insert into menu_info (sto_num, name, price, description, imageUrl, sell, category)values('000-00-00000','아포가토','1800','맛있쪙','','YES','커피');

insert into menu_info (sto_num, name, price, description, imageUrl, sell, category)values('000-00-00000','마카롱','1800','맛있쪙','','YES','디저트');
insert into menu_info (sto_num, name, price, description, imageUrl, sell, category)values('000-00-00000','치즈케이크','1800','맛있쪙','','YES','디저트');
insert into menu_info (sto_num, name, price, description, imageUrl, sell, category)values('000-00-00000','허니브레드','1800','맛있쪙','','YES','디저트');

insert into menu_info (sto_num, name, price, description, imageUrl, sell, category)values('000-00-00000','사이다','1800','맛있쪙','','YES','음료');
insert into menu_info (sto_num, name, price, description, imageUrl, sell, category)values('000-00-00000','탄산수','1800','맛있쪙','','YES','음료');
insert into menu_info (sto_num, name, price, description, imageUrl, sell, category)values('000-00-00000','쥬스','1800','맛있쪙','','YES','음료');

-- 키오스크 테스트용 데이터(지정한 요청사항 임시정보)
insert into etc_info (sto_num, etc) values('000-00-00000', '물');
insert into etc_info (sto_num, etc) values('000-00-00000', '수저');
insert into etc_info (sto_num, etc) values('000-00-00000', '앞접시');
insert into etc_info (sto_num, etc) values('000-00-00000', '영수증');
insert into etc_info (sto_num, etc) values('000-00-00000', '냅킨');