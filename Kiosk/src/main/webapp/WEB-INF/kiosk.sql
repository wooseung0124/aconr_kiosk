-- 사업자 정보를 저장할 테이블

CREATE TABLE owner_info(
	sto_num VARCHAR2(100) CONSTRAINT owner_info_store_num_pk PRIMARY KEY, --사업자 번호
	sto_name VARCHAR2(100) CONSTRAINT owner_info_store_name_nn NOT NULL, -- 상호명 
	o_name VARCHAR2(100) CONSTRAINT owner_info_owner_name_nn NOT NULL,--사업자(가입자) 이름
	email VARCHAR2(100) CONSTRAINT owner_info_email_nn NOT NULL,--이메일겸 아이디
	pwd VARCHAR2(100) CONSTRAINT owner_info_pwd_nn NOT NULL
)

-- 상품의 정보를 저장할 테이블
CREATE TABLE menu_info(
	sto_num VARCHAR2(100), --사업자 번호,
	name VARCHAR2(100) NOT NULL, --메뉴 이름
	price NUMBER NOT NULL, --메뉴 가격
	description VARCHAR2(100), --메뉴 설명
	imageUrl VARCHAR2(2000),
	is_sold VARCHAR2(10) CHECK(IS_SOLD IN('YES','NO')), --메뉴 품절 유무 품절이면 "yes" 품절이 아니면 "no"
	category VARCHAR2(100) NOT NULL --메뉴 카테고리
);

-- 고객의 주문 정보를 저장할 테이블
CREATE TABLE order_info(
	sto_num VARCHAR2(100), --사업자 번호
	table_num NUMBER NOT NULL, --테이블 이름
	menu VARCHAR2(100) NOT NULL, --메뉴 이름
	price NUMBER NOT NULL --메뉴 가격
	count NUMBER NOT NULL --메뉴 개수
);