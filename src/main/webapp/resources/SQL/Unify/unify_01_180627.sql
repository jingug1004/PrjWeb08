create table tbl_usery
(
	uid varchar(50) not null comment '회원의 아이디'
		primary key,
	upw varchar(50) default '' not null comment '회원의 패스워드',
	upwconfirm varchar(50) default '' not null comment '회원의 패스워드 확인(검증)',
	uname varchar(50) default '' null comment '회원의 별명',
	email varchar(50) default '' null comment '회원의 이메일',
	nickname varchar(50) default '' null,
	uday varchar(3) default '' null,
	uyear varchar(50) default '' null,
	delyn varchar(50) default 'N' null,
	ugender varchar(50) default '0' null,
	upoint int default '0' null,
	sessionkey varchar(50) default 'none' not null,
	sessionlimit timestamp default CURRENT_TIMESTAMP not null,
	regdate timestamp default CURRENT_TIMESTAMP null,
	regip varchar(50) null,
	updip varchar(50) null,
	tpost int null,
	tspam int null,
	tgood int null,
	tbad int null,
	treply int null,
	utotallevel int null comment '회원의 전체 순위 Lv.0 ~ Lv.100',
	ucolorlevel int null comment '회원의 칼라 순위 Lv.0 ~ Lv.100'
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;

create table tbl_user_modify
(
	modid varchar(50) null comment '수정한 회원 아이디',
	modupw varchar(50) null comment '회원 정보 수정 비밀번호',
	modupwconf varchar(50) null comment '회원 정보 수정 비밀번호 재확인',
	modrespectname varchar(50) null comment '존경하는 정치인 수정',
	modupoint int null comment '수정하는 회원의 포인트',
	modemail varchar(50) null comment '이메일 회원 정보 수정',
	modnickname varchar(50) null comment '별명 회원 정보 수정',
	modcolor varchar(50) null comment '칼라 회원 정보 수정',
	moddelyn varchar(50) null comment '아이디 삭제 여부 회원 정보 수정',
	modtrendency varchar(50) null comment '정치성향 회원 정보 수정',
	modregdate timestamp null comment '수정일 등록 회원 정보 수정',
	modregip varchar(50) null comment '최초 회원가입 등록시 아이피',
	modblindip varchar(50) null comment '회원정보 변경시 아이피',
	modtpost int null comment '글 등록수',
	modtreply int null comment '댓글 등록수',
	modtgood int null comment '굿 누른 수',
	modtbad int null comment '배드 누른수',
	modtspam int null comment '스팸 누른 수',
	modutotallevel int null comment '회원의 전체 순위',
	moducolorlevel int null comment '회원의 칼라 순위'
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
comment '회원 정보 수정 내역'
;

create table user_role
(
	app_user_id varchar(100) not null,
	role varchar(20) not null,
	primary key (app_user_id, role)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;

create table tbl_cate
(
	cname varchar(50) default '' null comment '상단 헤더 메뉴의 이름 menu_name',
	cnum int not null comment '헤더 상단 메뉴 카테고리의 넘버 menu_id',
	cid int auto_increment comment '고유한 시퀀스 값(1씩 증가) menu_seq',
	cdescription text null comment '헤더 메뉴의 마우스 툴팁(말풍선) 보여줌',
	cmenu_parent int null comment '메뉴 부모자식 넘버 menu_parent',
	cmenu_sort int null comment '메뉴 순서 정렬 menu_sort',
	cmenu_visible int null comment '메뉴 사용 여부 menu_visible',
	cmenu_depth int null comment '메뉴 스텝, 깊이 menu_depth',
	primary key(cid)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;

create index cid
	on tbl_cate (cid)
;

create table tbl_board
(
	id varchar(50) null comment '게시판 작성자 아이디',
	bno int auto_increment comment '게시판 작성글 번호',
	title varchar(200) null comment '게시판 작성글 제목',
	content text null,
	writer varchar(50) null,
	regdate datetime null,
	updatedate datetime null,
	goodcnt int default '0' null,
	badcnt int default '0' null,
	gbcnt double default '0' null,
	spamcnt int default '0' null,
	replycnt int default '0' null,
	cnum int default '0' null comment '게시판 카테고리 넘버',
	viewcnt int default '0' null,
	boardvisible varchar(50) default 'Y' null comment '게시판 작성글 삭제 여부',
	getcolor varchar(50) null comment '게시판 칼라 넘버',
	boardip varchar(50) null comment '게시판 작성글 아이피 번호',
	boardipreal varchar(50) null comment '게시판 작성글 아이피 번호(블라인드 처리 안 된)',
	primary key(bno),
	constraint fk_cnum
		foreign key (cnum) references tbl_cate (cnum)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;

create index fk_cnum
	on tbl_board (cnum)
;

create table tbl_attach
(
	fullName varchar(150) not null
		primary key,
	bno int not null,
	regdate timestamp default CURRENT_TIMESTAMP not null,
	constraint fk_board_attach
		foreign key (bno) references tbl_board (bno)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;

create index fk_board_attach
	on tbl_attach (bno)
;

create table tbl_board_goodcnt
(
	goodcntbno int(6) null,
	goodcntuid varchar(20) null,
	goodcnttemp varchar(20) null,
	badcntuid varchar(20) null,
	badcnttemp varchar(20) null,
	spamcntuid varchar(20) null,
	spamcnttemp varchar(20) null,
	usercolor varchar(3) null comment '좋아요 싫어요 스팸 누른 회원의 칼라',
	constraint tbl_board_goodcnt_goodcnttemp_uindex
		unique (goodcnttemp),
	constraint tbl_board_goodcnt_badcnttemp_uindex
		unique (badcnttemp),
	constraint tbl_board_goodcnt_spamcnttemp_uindex
		unique (spamcnttemp)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;

create table tbl_color_result
(
	userregnum int null comment '회원가입수',
	userpostnum int null comment '회원활동량 : 글 작성',
	userreplynum int null comment '회원활동량 : 댓글 작성',
	usergoodnum int null comment '회원활동량 : 버튼(굿) 누른 수',
	userbadnum int null comment '회원활동량 : 버튼(배드) 누른 수',
	userspamnum int null comment '회원활동량 : 버튼(스팸) 누른 수',
	colorpostnum int null comment '글 쓴 통계(원형 테이블)',
	colorgoodnum int null comment '굿 누른 통계(원형 테이블)',
	colorbadnum int null comment '배드 누른 통계(원형 테이블)',
	colorspamnum int null comment '스팸 누른 통계(원형 테이블)',
	colorreplynum int null comment '댓글 쓴 통계(원형 테이블)',
	divisionnum varchar(11) null
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;

create table tbl_member
(
	userid varchar(50) not null
		primary key,
	userpw varchar(50) not null,
	username varchar(50) default '' not null,
	email varchar(100) null,
	regdate timestamp default CURRENT_TIMESTAMP not null,
	updatedate timestamp default CURRENT_TIMESTAMP not null
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;

create table tbl_message
(
	mno int auto_increment
		primary key,
	targetid varchar(50) not null,
	sender varchar(50) not null,
	message text not null,
	opendate timestamp default CURRENT_TIMESTAMP not null,
	senddate timestamp default CURRENT_TIMESTAMP not null,
	constraint fk_usersender
		foreign key (targetid) references tbl_user (uid),
	constraint fk_usertarget
		foreign key (targetid) references tbl_user (uid)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;

create index fk_usersender
	on tbl_message (targetid)
;

create table tbl_point_delete
(
	pdelid varchar(50) null,
	pdeldate datetime null,
	pdelseq int auto_increment
		primary key,
	pdelpoint int null,
	pdelcontent varchar(400) null
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;

create table tbl_point_insert
(
	pinsid varchar(50) null,
	pinsregdate datetime null,
	pinsseq int auto_increment
		primary key,
	pinspoint int null,
	pinsdeldate datetime null,
	pinscontent varchar(400) null
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;

create table tbl_point_update
(
	pupdid varchar(50) null,
	pupddate datetime null,
	pupdseq int auto_increment
		primary key,
	pupdpoint int null,
	pupdcontent varchar(400) null
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;

create table tbl_reply
(
	rid varchar(50) null,
	rno int auto_increment
		primary key,
	bno int default '0' not null,
	replytext varchar(1000) not null,
	replyer varchar(50) not null,
	regdate timestamp default CURRENT_TIMESTAMP not null,
	updatedate timestamp default CURRENT_TIMESTAMP not null comment '댓글 수정 시간',
	bringreplycolor varchar(50) null comment '댓글에 등록된 컬러 넘버',
	replyvisible varchar(50) null comment '댓글 삭제 여부',
	replyip varchar(50) null comment '댓글 등록 아이피',
	replyipreal varchar(50) null comment '댓글 등록 아이피 (블라인드 처리 안 된)',
	constraint fk_board
		foreign key (bno) references tbl_board (bno)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;

create index fk_board
	on tbl_reply (bno)
;

create table tbl_authorities
(
	userid varchar(50) not null,
	authority varchar(50) not null,
	constraint fk_authorities
		foreign key (userid) references tbl_member (userid)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;

create index fk_authorities
	on tbl_authorities (userid)
;


