SELECT 'DROP TABLE "'  ||TABLE_NAME||  '" CASCADE CONSTRAINTS;' FROM user_tables;

DROP TABLE "WALKLOG" CASCADE CONSTRAINTS;
DROP TABLE "COORDS" CASCADE CONSTRAINTS;
DROP TABLE "BLOG" CASCADE CONSTRAINTS;
DROP TABLE "IMAGES" CASCADE CONSTRAINTS;
DROP TABLE "CLUB" CASCADE CONSTRAINTS;
DROP TABLE "CLUBUSERS" CASCADE CONSTRAINTS;
DROP TABLE "MEETING" CASCADE CONSTRAINTS;
DROP TABLE "MEETINGINFO" CASCADE CONSTRAINTS;
DROP TABLE "CLUBBOARDCATEGORY" CASCADE CONSTRAINTS;
DROP TABLE "WALKEDDOG" CASCADE CONSTRAINTS;
DROP TABLE "TRAIL" CASCADE CONSTRAINTS;
DROP TABLE "TRAILUSED" CASCADE CONSTRAINTS;
DROP TABLE "TRAILSTAR" CASCADE CONSTRAINTS;
DROP TABLE "TRAILCMT" CASCADE CONSTRAINTS;
DROP TABLE "TRAILTAG" CASCADE CONSTRAINTS;
DROP TABLE "WALKLOGCMT" CASCADE CONSTRAINTS;
DROP TABLE "COMMBOARD" CASCADE CONSTRAINTS;
DROP TABLE "COMMCMT" CASCADE CONSTRAINTS;
DROP TABLE "FOLLOW" CASCADE CONSTRAINTS;
DROP TABLE "FRIEND" CASCADE CONSTRAINTS;
DROP TABLE "CLUBJOIN" CASCADE CONSTRAINTS;
DROP TABLE "COMPLAINTS" CASCADE CONSTRAINTS;
DROP TABLE "LOCATION" CASCADE CONSTRAINTS;
DROP TABLE "CLUBBOARD" CASCADE CONSTRAINTS;
DROP TABLE "CLUBCMT" CASCADE CONSTRAINTS;
DROP TABLE "USERLIKE" CASCADE CONSTRAINTS;

CREATE TABLE users (
	userNo	NUMBER	NOT NULL,
	locationNo	NUMBER	NOT NULL,
	id	varchar2(20)	NOT NULL,
	password	varchar2(20)	NOT NULL,
	name	varchar2(20)	NOT NULL,
	code	varchar2(20)	NOT NULL,
	birth	date	NULL,
	gender	varchar2(20)	NULL,
	status	char	NOT NULL
);

CREATE TABLE dog (
	dogNo	NUMBER	NOT NULL,
	userNo	NUMBER	NOT NULL,
	name	varchar2(50)	NOT NULL,
	birth	date	NOT NULL,
	gender	varchar2(20)	NOT NULL,
	weight	NUMBER	NOT NULL,
	kind	varchar2(50)	NULL,
	neuter	varchar2(20)	NULL,
	personality	varchar2(50)	NULL,
	cert	varchar2(20)	NULL,
	color	varchar2(20)	NULL,
	status	char	NOT NULL
);

CREATE TABLE walkLog (
	walkLogNo	NUMBER	NOT NULL,
	userNo	NUMBER	NOT NULL,
	locationNo	NUMBER	NOT NULL,
	meetingNo	NUMBER	NULL,
	regDate	date	NOT NULL,
	startTime	date	NOT NULL,
	endTime	date	NOT NULL,
	logTime	date	NOT NULL,
	distance	NUMBER	NOT NULL,
	content	varchar2(2000)	NULL,
	security	varchar2(10)	NOT NULL,
	status	char	NOT NULL
);

CREATE TABLE coords (
	coordNo	NUMBER	NOT NULL,
	coordOrder	NUMBER	NOT NULL,
	type	varchar2(50)	NOT NULL,
	useNo	NUMBER	NOT NULL,
	lat	NUMBER	NOT NULL,
	lng	NUMBER	NOT NULL
);

CREATE TABLE blog (
	blogNo	NUMBER	NOT NULL,
	userNo	NUMBER	NOT NULL
);

CREATE TABLE images (
	imageNo	NUMBER	NOT NULL,
	orgName	varchar2(500)	NULL,
	saveName	varchar2(500)	NOT NULL,
	filePath	varchar2(500)	NOT NULL,
	fileSize	NUMBER	NULL,
	type	varchar2(50)	NOT NULL,
	useNo	NUMBER	NOT NULL,
	imageOrder	NUMBER	NULL
);

CREATE TABLE club (
	clubNo	NUMBER	NOT NULL,
	name	VARCHAR2(50)	NOT NULL,
	description	VARCHAR2(1000)	NOT NULL,
	startYear	DATE	NULL,
	endYear	DATE	NULL,
	gender	VARCHAR2(20)	NULL,
	regDate	DATE	NOT NULL,
	status	CHAR	NOT NULL,
	join	CHAR	NOT NULL,
	authNoti	CHAR	NOT NULL,
	authBoard	CHAR	NOT NULL,
	authJoin	CHAR	NOT NULL,
	authSece	CHAR	NOT NULL,
	locationNo	NUMBER	NOT NULL
);

CREATE TABLE clubUsers (
	clubUserNo	NUMBER	NOT NULL,
	auth	CHAR	NOT NULL,
	regDate	DATE	NOT NULL,
	status	CHAR	NOT NULL,
	visits	NUMBER	NOT NULL,
	lastVisit	DATE	NOT NULL,
	userNo	NUMBER	NOT NULL,
	clubNo	NUMBER	NOT NULL
);

CREATE TABLE meeting (
	meetingNo	NUMBER	NOT NULL,
	name	VARCHAR2(50)	NOT NULL,
	description	VARCHAR2(1000)	NOT NULL,
	meetingDate	DATE	NOT NULL,
	maxPersonnel	NUMBER	NOT NULL,
	openStatus	CHAR	NOT NULL,
	small	CHAR	NOT NULL,
	medium	CHAR	NOT NULL,
	large	CHAR	NOT NULL,
	status	CHAR	NOT NULL,
	lng	NUMBER	NOT NULL,
	lat	NUMbER	NOT NULL,
	clubNo	NUMBER	NOT NULL,
	userNo	NUMBER	NOT NULL,
	trailNo	NUMBER	NULL
);

CREATE TABLE meetingInfo (
	meetingInfoNo	NUMBER	NOT NULL,
	meetingNo	NUMBER	NOT NULL,
	userNo	NUMBER	NOT NULL,
	dogNo	NUMBER	NOT NULL
);

CREATE TABLE clubBoardCategory (
	categoryNo	NUMBER	NOT NULL,
	name	VARCHAR2(50)	NOT NULL,
	orderNo	NUMBER	NOT NULL,
	regDate	DATE	NOT NULL,
	status	CHAR	NULL,
	defaultCategory	CHAR	NULL,
	clubNo	NUMBER	NOT NULL
);

CREATE TABLE walkedDog (
	walkedDogNo	NUMBER	NOT NULL,
	walkLogNo	NUMBER	NOT NULL,
	dogNo	NUMBER	NOT NULL
);

CREATE TABLE trail (
	trailNo	NUMBER	NOT NULL,
	userNo	NUMBER	NOT NULL,
	locationNo	NUMBER	NOT NULL,
	name	varchar2(50)	NOT NULL,
	spot	varchar2(500)	NOT NULL,
	distance	varchar2(20)	NOT NULL,
	eta	varchar2(20)	NOT NULL,
	parking	char	NOT NULL,
	restroom	char	NOT NULL,
	trashCan	char	NOT NULL,
	explanation	varchar2(1000)	NULL,
	regDate	date	NOT NULL,
	updateDate	date	NULL,
	status	char	NOT NULL
);

CREATE TABLE trailUsed (
	trailUserdNo	NUMBER	NOT NULL,
	walkLogNo	NUMBER	NOT NULL,
	trailNo	NUMBER	NOT NULL
);

CREATE TABLE trailStar (
	trailStarNo	NUMBER	NOT NULL,
	userNo	NUMBER	NOT NULL,
	trailNo	NUMBER	NOT NULL,
	StarDate	date	NOT NULL
);

CREATE TABLE trailCmt (
	trailCmtNo	NUMBER	NOT NULL,
	trailNo	NUMBER	NOT NULL,
	userNo	NUMBER	NOT NULL,
	regDate	date	NOT NULL,
	content	varchar2(1000)	NULL,
	status	char	NOT NULL
);

CREATE TABLE trailTag (
	trailTagNo	NUMBER	NOT NULL,
	trailNo	NUMBER	NOT NULL,
	tagName	varchar2(20)	NOT NULL
);

CREATE TABLE walkLogCmt (
	walkLogCmtNo	NUMBER	NOT NULL,
	walkLogNo	NUMBER	NOT NULL,
	userNo	NUMBER	NOT NULL,
	content	varchar2(1000)	NOT NULL,
	regDate	NUMBER	NOT NULL,
	status	char	NOT NULL
);

CREATE TABLE commBoard (
	commBoardNo	NUMBER	NOT NULL,
	userNo	NUMBER	NOT NULL,
	commCategory	varchar2(50)	NOT NULL,
	title	varchar2(50)	NOT NULL,
	content	varchar2(2000)	NULL,
	regDate	date	NOT NULL,
	count	NUMBER	NOT NULL,
	status	char	NOT NULL
);

CREATE TABLE commCmt (
	commCmtNo	NUMBER	NOT NULL,
	commBoardNo	NUMBER	NOT NULL,
	userNo	NUMBER	NOT NULL,
	content	varchar2(1000)	NULL,
	regDate	date	NOT NULL,
	groupNo	NUMBER	NOT NULL,
	status	char	NOT NULL
);

CREATE TABLE follow (
	followNo	NUMBER	NOT NULL,
	followeeNo	NUMBER	NOT NULL,
	followerNo	NUMBER	NOT NULL
);

CREATE TABLE friend (
	friendNo	NUMBER	NOT NULL,
	applyUserNo	NUMBER	NOT NULL,
	appliedUserNo	NUMBER	NOT NULL,
	status	char	NOT NULL
);

CREATE TABLE clubJoin (
	joinNo	NUMBER	NOT NULL,
	regDate	DATE	NULL,
	userNo	NUMBER	NOT NULL,
	clubNo	NUMBER	NOT NULL
);

CREATE TABLE complaints (
	complNo	NUMBER	NOT NULL,
	complDate	date	NULL,
	complUser	varchar2(100)	NOT NULL,
	complTarget	varchar2(100)	NOT NULL,
	complProcess	varchar2(50)	NULL
);

CREATE TABLE location (
	locationNo	NUMBER	NOT NULL,
	SI	varchar2(20)	NOT NULL,
	GU	varchar2(20)	NOT NULL,
	DONG	varchar2(20)	NOT NULL
);

CREATE TABLE clubBoard (
	clubBoardNo	NUMBER	NOT NULL,
	title	VARCHAR2(50)	NOT NULL,
	contents	VARCHAR2(1000)	NOT NULL,
	regDate	DATE	NOT NULL,
	status	CHAR	NOT NULL,
	visits	NUMBER	NOT NULL,
	categoryNo	NUMBER	NOT NULL,
	userNo	NUMBER	NOT NULL
);

CREATE TABLE clubCmt (
	clubCommentNo	NUMBER	NOT NULL,
	contents	VARCHAR2(1000)	NOT NULL,
	regDate	DATE	NOT NULL,
	groupNo	NUMBER	NOT NULL,
	status	CHAR	NOT NULL,
	clubBoardNo	NUMBER	NOT NULL,
	userNo	NUMBER	NOT NULL
);

CREATE TABLE userLike (
	likeNo	NUMBER	NOT NULL,
	userNo	NUMBER	NOT NULL,
	type	varchar2(50)	NOT NULL,
	useNo	NUMBER	NOT NULL
);

ALTER TABLE users ADD CONSTRAINT PK_USERS PRIMARY KEY (
	userNo
);

ALTER TABLE dog ADD CONSTRAINT PK_DOG PRIMARY KEY (
	dogNo
);

ALTER TABLE walkLog ADD CONSTRAINT PK_WALKLOG PRIMARY KEY (
	walkLogNo
);

ALTER TABLE coords ADD CONSTRAINT PK_COORDS PRIMARY KEY (
	coordNo
);

ALTER TABLE blog ADD CONSTRAINT PK_BLOG PRIMARY KEY (
	blogNo
);

ALTER TABLE images ADD CONSTRAINT PK_IMAGES PRIMARY KEY (
	imageNo
);

ALTER TABLE club ADD CONSTRAINT PK_CLUB PRIMARY KEY (
	clubNo
);

ALTER TABLE clubUsers ADD CONSTRAINT PK_CLUBUSERS PRIMARY KEY (
	clubUserNo
);

ALTER TABLE meeting ADD CONSTRAINT PK_MEETING PRIMARY KEY (
	meetingNo
);

ALTER TABLE meetingInfo ADD CONSTRAINT PK_MEETINGINFO PRIMARY KEY (
	meetingInfoNo
);

ALTER TABLE clubBoardCategory ADD CONSTRAINT PK_CLUBBOARDCATEGORY PRIMARY KEY (
	categoryNo
);

ALTER TABLE walkedDog ADD CONSTRAINT PK_WALKEDDOG PRIMARY KEY (
	walkedDogNo
);

ALTER TABLE trail ADD CONSTRAINT PK_TRAIL PRIMARY KEY (
	trailNo
);

ALTER TABLE trailUsed ADD CONSTRAINT PK_TRAILUSED PRIMARY KEY (
	trailUserdNo
);

ALTER TABLE trailStar ADD CONSTRAINT PK_TRAILSTAR PRIMARY KEY (
	trailStarNo
);

ALTER TABLE trailCmt ADD CONSTRAINT PK_TRAILCMT PRIMARY KEY (
	trailCmtNo
);

ALTER TABLE trailTag ADD CONSTRAINT PK_TRAILTAG PRIMARY KEY (
	trailTagNo
);

ALTER TABLE walkLogCmt ADD CONSTRAINT PK_WALKLOGCMT PRIMARY KEY (
	walkLogCmtNo
);

ALTER TABLE commBoard ADD CONSTRAINT PK_COMMBOARD PRIMARY KEY (
	commBoardNo
);

ALTER TABLE commCmt ADD CONSTRAINT PK_COMMCMT PRIMARY KEY (
	commCmtNo
);

ALTER TABLE follow ADD CONSTRAINT PK_FOLLOW PRIMARY KEY (
	followNo
);

ALTER TABLE friend ADD CONSTRAINT PK_FRIEND PRIMARY KEY (
	friendNo
);

ALTER TABLE clubJoin ADD CONSTRAINT PK_CLUBJOIN PRIMARY KEY (
	joinNo
);

ALTER TABLE complaints ADD CONSTRAINT PK_COMPLAINTS PRIMARY KEY (
	complNo
);

ALTER TABLE location ADD CONSTRAINT PK_LOCATION PRIMARY KEY (
	locationNo
);

ALTER TABLE clubBoard ADD CONSTRAINT PK_CLUBBOARD PRIMARY KEY (
	clubBoardNo
);

ALTER TABLE clubCmt ADD CONSTRAINT PK_CLUBCMT PRIMARY KEY (
	clubCommentNo
);

ALTER TABLE userLike ADD CONSTRAINT PK_USERLIKE PRIMARY KEY (
	likeNo
);



CREATE SEQUENCE seq_users_no
INCREMENT BY 1                 
START WITH 1                   
nocache; 


CREATE SEQUENCE seq_dog_no
INCREMENT BY 1                 
START WITH 1                   
nocache; 

CREATE SEQUENCE seq_walkdog_no
INCREMENT BY 1                 
START WITH 1                   
nocache; 

CREATE SEQUENCE seq_coords_no
INCREMENT BY 1                 
START WITH 1                   
nocache; 

CREATE SEQUENCE seq_blog_no
INCREMENT BY 1                 
START WITH 1                   
nocache; 

CREATE SEQUENCE seq_images_no
INCREMENT BY 1                 
START WITH 1                   
nocache; 

CREATE SEQUENCE seq_club_no
INCREMENT BY 1                 
START WITH 1                   
nocache; 

CREATE SEQUENCE seq_clubusers_no
INCREMENT BY 1                 
START WITH 1                   
nocache; 

CREATE SEQUENCE seq_meeting_no
INCREMENT BY 1                 
START WITH 1                   
nocache; 

CREATE SEQUENCE seq_meetinginfo_no
INCREMENT BY 1                 
START WITH 1                   
nocache; 

CREATE SEQUENCE seq_clubboardcategory_no
INCREMENT BY 1                 
START WITH 1                   
nocache; 

CREATE SEQUENCE seq_walkeddog_no
INCREMENT BY 1                 
START WITH 1                   
nocache; 

CREATE SEQUENCE seq_trail_no
INCREMENT BY 1                 
START WITH 1                   
nocache; 

CREATE SEQUENCE seq_trailused_no
INCREMENT BY 1                 
START WITH 1                   
nocache; 

CREATE SEQUENCE seq_trailstar_no
INCREMENT BY 1                 
START WITH 1                   
nocache; 

CREATE SEQUENCE seq_trailcmt_no
INCREMENT BY 1                 
START WITH 1                   
nocache; 


CREATE SEQUENCE seq_trailtag_no
INCREMENT BY 1                 
START WITH 1                   
nocache; 

CREATE SEQUENCE seq_walklogcmt_no
INCREMENT BY 1                 
START WITH 1                   
nocache; 

CREATE SEQUENCE seq_commboard_no
INCREMENT BY 1                 
START WITH 1                   
nocache; 

CREATE SEQUENCE seq_commcmt_no
INCREMENT BY 1                 
START WITH 1                   
nocache; 

CREATE SEQUENCE seq_follow_no
INCREMENT BY 1                 
START WITH 1                   
nocache; 

CREATE SEQUENCE seq_friend_no
INCREMENT BY 1                 
START WITH 1                   
nocache; 

CREATE SEQUENCE seq_clubjoin_no
INCREMENT BY 1                 
START WITH 1                   
nocache; 

CREATE SEQUENCE seq_complaints_no
INCREMENT BY 1                 
START WITH 1                   
nocache; 


CREATE SEQUENCE seq_location_no
INCREMENT BY 1                 
START WITH 1                   
nocache; 

CREATE SEQUENCE seq_clubboard_no
INCREMENT BY 1                 
START WITH 1                   
nocache; 

CREATE SEQUENCE seq_clubcmt_no
INCREMENT BY 1                 
START WITH 1                   
nocache; 


CREATE SEQUENCE seq_userlike_no
INCREMENT BY 1                 
START WITH 1                   
nocache; 



INSERT INTO location (locationNo, si, gu, dong) VALUES ('1111010100', '서울특별시', '종로구', '청운동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1111010200', '서울특별시', '종로구', '신교동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1111010300', '서울특별시', '종로구', '궁정동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1111010400', '서울특별시', '종로구', '효자동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1111010500', '서울특별시', '종로구', '창성동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1111010600', '서울특별시', '종로구', '통의동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1111010700', '서울특별시', '종로구', '적선동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1111010800', '서울특별시', '종로구', '통인동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1111010900', '서울특별시', '종로구', '누상동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1111011000', '서울특별시', '종로구', '누하동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1111011100', '서울특별시', '종로구', '옥인동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1111011200', '서울특별시', '종로구', '체부동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1111011300', '서울특별시', '종로구', '필운동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1111011400', '서울특별시', '종로구', '내자동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1111011500', '서울특별시', '종로구', '사직동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1111011600', '서울특별시', '종로구', '도렴동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1111011700', '서울특별시', '종로구', '당주동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1111011800', '서울특별시', '종로구', '내수동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1111011900', '서울특별시', '종로구', '세종로');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1111012000', '서울특별시', '종로구', '신문로1가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1111012100', '서울특별시', '종로구', '신문로2가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1111012200', '서울특별시', '종로구', '청진동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1111012300', '서울특별시', '종로구', '서린동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1111012400', '서울특별시', '종로구', '수송동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1111012500', '서울특별시', '종로구', '중학동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1111012600', '서울특별시', '종로구', '종로1가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1111012700', '서울특별시', '종로구', '공평동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1111012800', '서울특별시', '종로구', '관훈동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1111012900', '서울특별시', '종로구', '견지동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1111013000', '서울특별시', '종로구', '와룡동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1111013100', '서울특별시', '종로구', '권농동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1111013200', '서울특별시', '종로구', '운니동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1111013300', '서울특별시', '종로구', '익선동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1111013400', '서울특별시', '종로구', '경운동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1111013500', '서울특별시', '종로구', '관철동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1111013600', '서울특별시', '종로구', '인사동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1111013700', '서울특별시', '종로구', '낙원동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1111013800', '서울특별시', '종로구', '종로2가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1111013900', '서울특별시', '종로구', '팔판동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1111014000', '서울특별시', '종로구', '삼청동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1111014100', '서울특별시', '종로구', '안국동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1111014200', '서울특별시', '종로구', '소격동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1111014300', '서울특별시', '종로구', '화동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1111014400', '서울특별시', '종로구', '사간동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1111014500', '서울특별시', '종로구', '송현동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1111014600', '서울특별시', '종로구', '가회동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1111014700', '서울특별시', '종로구', '재동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1111014800', '서울특별시', '종로구', '계동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1111014900', '서울특별시', '종로구', '원서동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1111015000', '서울특별시', '종로구', '훈정동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1111015100', '서울특별시', '종로구', '묘동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1111015200', '서울특별시', '종로구', '봉익동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1111015300', '서울특별시', '종로구', '돈의동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1111015400', '서울특별시', '종로구', '장사동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1111015500', '서울특별시', '종로구', '관수동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1111015600', '서울특별시', '종로구', '종로3가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1111015700', '서울특별시', '종로구', '인의동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1111015800', '서울특별시', '종로구', '예지동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1111015900', '서울특별시', '종로구', '원남동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1111016000', '서울특별시', '종로구', '연지동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1111016100', '서울특별시', '종로구', '종로4가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1111016200', '서울특별시', '종로구', '효제동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1111016300', '서울특별시', '종로구', '종로5가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1111016400', '서울특별시', '종로구', '종로6가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1111016500', '서울특별시', '종로구', '이화동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1111016600', '서울특별시', '종로구', '연건동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1111016700', '서울특별시', '종로구', '충신동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1111016800', '서울특별시', '종로구', '동숭동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1111016900', '서울특별시', '종로구', '혜화동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1111017000', '서울특별시', '종로구', '명륜1가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1111017100', '서울특별시', '종로구', '명륜2가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1111017200', '서울특별시', '종로구', '명륜4가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1111017300', '서울특별시', '종로구', '명륜3가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1111017400', '서울특별시', '종로구', '창신동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1111017500', '서울특별시', '종로구', '숭인동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1111017600', '서울특별시', '종로구', '교남동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1111017700', '서울특별시', '종로구', '평동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1111017800', '서울특별시', '종로구', '송월동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1111017900', '서울특별시', '종로구', '홍파동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1111018000', '서울특별시', '종로구', '교북동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1111018100', '서울특별시', '종로구', '행촌동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1111018200', '서울특별시', '종로구', '구기동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1111018300', '서울특별시', '종로구', '평창동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1111018400', '서울특별시', '종로구', '부암동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1111018500', '서울특별시', '종로구', '홍지동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1111018600', '서울특별시', '종로구', '신영동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1111018700', '서울특별시', '종로구', '무악동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1114010100', '서울특별시', '중구', '무교동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1114010200', '서울특별시', '중구', '다동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1114010300', '서울특별시', '중구', '태평로1가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1114010400', '서울특별시', '중구', '을지로1가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1114010500', '서울특별시', '중구', '을지로2가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1114010600', '서울특별시', '중구', '남대문로1가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1114010700', '서울특별시', '중구', '삼각동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1114010800', '서울특별시', '중구', '수하동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1114010900', '서울특별시', '중구', '장교동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1114011000', '서울특별시', '중구', '수표동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1114011100', '서울특별시', '중구', '소공동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1114011200', '서울특별시', '중구', '남창동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1114011300', '서울특별시', '중구', '북창동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1114011400', '서울특별시', '중구', '태평로2가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1114011500', '서울특별시', '중구', '남대문로2가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1114011600', '서울특별시', '중구', '남대문로3가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1114011700', '서울특별시', '중구', '남대문로4가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1114011800', '서울특별시', '중구', '남대문로5가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1114011900', '서울특별시', '중구', '봉래동1가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1114012000', '서울특별시', '중구', '봉래동2가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1114012100', '서울특별시', '중구', '회현동1가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1114012200', '서울특별시', '중구', '회현동2가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1114012300', '서울특별시', '중구', '회현동3가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1114012400', '서울특별시', '중구', '충무로1가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1114012500', '서울특별시', '중구', '충무로2가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1114012600', '서울특별시', '중구', '명동1가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1114012700', '서울특별시', '중구', '명동2가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1114012800', '서울특별시', '중구', '남산동1가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1114012900', '서울특별시', '중구', '남산동2가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1114013000', '서울특별시', '중구', '남산동3가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1114013100', '서울특별시', '중구', '저동1가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1114013200', '서울특별시', '중구', '충무로4가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1114013300', '서울특별시', '중구', '충무로5가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1114013400', '서울특별시', '중구', '인현동2가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1114013500', '서울특별시', '중구', '예관동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1114013600', '서울특별시', '중구', '묵정동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1114013700', '서울특별시', '중구', '필동1가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1114013800', '서울특별시', '중구', '필동2가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1114013900', '서울특별시', '중구', '필동3가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1114014000', '서울특별시', '중구', '남학동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1114014100', '서울특별시', '중구', '주자동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1114014200', '서울특별시', '중구', '예장동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1114014300', '서울특별시', '중구', '장충동1가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1114014400', '서울특별시', '중구', '장충동2가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1114014500', '서울특별시', '중구', '광희동1가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1114014600', '서울특별시', '중구', '광희동2가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1114014700', '서울특별시', '중구', '쌍림동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1114014800', '서울특별시', '중구', '을지로6가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1114014900', '서울특별시', '중구', '을지로7가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1114015000', '서울특별시', '중구', '을지로4가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1114015100', '서울특별시', '중구', '을지로5가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1114015200', '서울특별시', '중구', '주교동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1114015300', '서울특별시', '중구', '방산동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1114015400', '서울특별시', '중구', '오장동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1114015500', '서울특별시', '중구', '을지로3가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1114015600', '서울특별시', '중구', '입정동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1114015700', '서울특별시', '중구', '산림동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1114015800', '서울특별시', '중구', '충무로3가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1114015900', '서울특별시', '중구', '초동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1114016000', '서울특별시', '중구', '인현동1가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1114016100', '서울특별시', '중구', '저동2가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1114016200', '서울특별시', '중구', '신당동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1114016300', '서울특별시', '중구', '흥인동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1114016400', '서울특별시', '중구', '무학동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1114016500', '서울특별시', '중구', '황학동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1114016600', '서울특별시', '중구', '서소문동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1114016700', '서울특별시', '중구', '정동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1114016800', '서울특별시', '중구', '순화동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1114016900', '서울특별시', '중구', '의주로1가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1114017000', '서울특별시', '중구', '충정로1가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1114017100', '서울특별시', '중구', '중림동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1114017200', '서울특별시', '중구', '의주로2가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1114017300', '서울특별시', '중구', '만리동1가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1114017400', '서울특별시', '중구', '만리동2가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1117010100', '서울특별시', '용산구', '후암동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1117010200', '서울특별시', '용산구', '용산동2가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1117010300', '서울특별시', '용산구', '용산동4가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1117010400', '서울특별시', '용산구', '갈월동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1117010500', '서울특별시', '용산구', '남영동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1117010600', '서울특별시', '용산구', '용산동1가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1117010700', '서울특별시', '용산구', '동자동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1117010800', '서울특별시', '용산구', '서계동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1117010900', '서울특별시', '용산구', '청파동1가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1117011000', '서울특별시', '용산구', '청파동2가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1117011100', '서울특별시', '용산구', '청파동3가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1117011200', '서울특별시', '용산구', '원효로1가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1117011300', '서울특별시', '용산구', '원효로2가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1117011400', '서울특별시', '용산구', '신창동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1117011500', '서울특별시', '용산구', '산천동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1117011600', '서울특별시', '용산구', '청암동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1117011700', '서울특별시', '용산구', '원효로3가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1117011800', '서울특별시', '용산구', '원효로4가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1117011900', '서울특별시', '용산구', '효창동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1117012000', '서울특별시', '용산구', '도원동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1117012100', '서울특별시', '용산구', '용문동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1117012200', '서울특별시', '용산구', '문배동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1117012300', '서울특별시', '용산구', '신계동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1117012400', '서울특별시', '용산구', '한강로1가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1117012500', '서울특별시', '용산구', '한강로2가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1117012600', '서울특별시', '용산구', '용산동3가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1117012700', '서울특별시', '용산구', '용산동5가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1117012800', '서울특별시', '용산구', '한강로3가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1117012900', '서울특별시', '용산구', '이촌동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1117013000', '서울특별시', '용산구', '이태원동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1117013100', '서울특별시', '용산구', '한남동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1117013200', '서울특별시', '용산구', '동빙고동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1117013300', '서울특별시', '용산구', '서빙고동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1117013400', '서울특별시', '용산구', '주성동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1117013500', '서울특별시', '용산구', '용산동6가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1117013600', '서울특별시', '용산구', '보광동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1120010100', '서울특별시', '성동구', '상왕십리동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1120010200', '서울특별시', '성동구', '하왕십리동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1120010300', '서울특별시', '성동구', '홍익동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1120010400', '서울특별시', '성동구', '도선동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1120010500', '서울특별시', '성동구', '마장동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1120010600', '서울특별시', '성동구', '사근동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1120010700', '서울특별시', '성동구', '행당동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1120010800', '서울특별시', '성동구', '응봉동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1120010900', '서울특별시', '성동구', '금호동1가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1120011000', '서울특별시', '성동구', '금호동2가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1120011100', '서울특별시', '성동구', '금호동3가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1120011200', '서울특별시', '성동구', '금호동4가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1120011300', '서울특별시', '성동구', '옥수동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1120011400', '서울특별시', '성동구', '성수동1가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1120011500', '서울특별시', '성동구', '성수동2가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1120011800', '서울특별시', '성동구', '송정동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1120012200', '서울특별시', '성동구', '용답동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1121510100', '서울특별시', '광진구', '중곡동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1121510200', '서울특별시', '광진구', '능동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1121510300', '서울특별시', '광진구', '구의동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1121510400', '서울특별시', '광진구', '광장동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1121510500', '서울특별시', '광진구', '자양동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1121510700', '서울특별시', '광진구', '화양동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1121510900', '서울특별시', '광진구', '군자동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1123010100', '서울특별시', '동대문구', '신설동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1123010200', '서울특별시', '동대문구', '용두동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1123010300', '서울특별시', '동대문구', '제기동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1123010400', '서울특별시', '동대문구', '전농동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1123010500', '서울특별시', '동대문구', '답십리동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1123010600', '서울특별시', '동대문구', '장안동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1123010700', '서울특별시', '동대문구', '청량리동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1123010800', '서울특별시', '동대문구', '회기동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1123010900', '서울특별시', '동대문구', '휘경동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1123011000', '서울특별시', '동대문구', '이문동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1126010100', '서울특별시', '중랑구', '면목동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1126010200', '서울특별시', '중랑구', '상봉동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1126010300', '서울특별시', '중랑구', '중화동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1126010400', '서울특별시', '중랑구', '묵동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1126010500', '서울특별시', '중랑구', '망우동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1126010600', '서울특별시', '중랑구', '신내동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1129010100', '서울특별시', '성북구', '성북동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1129010200', '서울특별시', '성북구', '성북동1가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1129010300', '서울특별시', '성북구', '돈암동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1129010400', '서울특별시', '성북구', '동소문동1가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1129010500', '서울특별시', '성북구', '동소문동2가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1129010600', '서울특별시', '성북구', '동소문동3가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1129010700', '서울특별시', '성북구', '동소문동4가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1129010800', '서울특별시', '성북구', '동소문동5가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1129010900', '서울특별시', '성북구', '동소문동6가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1129011000', '서울특별시', '성북구', '동소문동7가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1129011100', '서울특별시', '성북구', '삼선동1가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1129011200', '서울특별시', '성북구', '삼선동2가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1129011300', '서울특별시', '성북구', '삼선동3가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1129011400', '서울특별시', '성북구', '삼선동4가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1129011500', '서울특별시', '성북구', '삼선동5가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1129011600', '서울특별시', '성북구', '동선동1가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1129011700', '서울특별시', '성북구', '동선동2가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1129011800', '서울특별시', '성북구', '동선동3가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1129011900', '서울특별시', '성북구', '동선동4가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1129012000', '서울특별시', '성북구', '동선동5가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1129012100', '서울특별시', '성북구', '안암동1가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1129012200', '서울특별시', '성북구', '안암동2가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1129012300', '서울특별시', '성북구', '안암동3가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1129012400', '서울특별시', '성북구', '안암동4가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1129012500', '서울특별시', '성북구', '안암동5가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1129012600', '서울특별시', '성북구', '보문동4가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1129012700', '서울특별시', '성북구', '보문동5가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1129012800', '서울특별시', '성북구', '보문동6가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1129012900', '서울특별시', '성북구', '보문동7가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1129013000', '서울특별시', '성북구', '보문동1가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1129013100', '서울특별시', '성북구', '보문동2가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1129013200', '서울특별시', '성북구', '보문동3가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1129013300', '서울특별시', '성북구', '정릉동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1129013400', '서울특별시', '성북구', '길음동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1129013500', '서울특별시', '성북구', '종암동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1129013600', '서울특별시', '성북구', '하월곡동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1129013700', '서울특별시', '성북구', '상월곡동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1129013800', '서울특별시', '성북구', '장위동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1129013900', '서울특별시', '성북구', '석관동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1130510100', '서울특별시', '강북구', '미아동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1130510200', '서울특별시', '강북구', '번동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1130510300', '서울특별시', '강북구', '수유동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1130510400', '서울특별시', '강북구', '우이동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1132010500', '서울특별시', '도봉구', '쌍문동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1132010600', '서울특별시', '도봉구', '방학동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1132010700', '서울특별시', '도봉구', '창동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1132010800', '서울특별시', '도봉구', '도봉동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1135010200', '서울특별시', '노원구', '월계동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1135010300', '서울특별시', '노원구', '공릉동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1135010400', '서울특별시', '노원구', '하계동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1135010500', '서울특별시', '노원구', '상계동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1135010600', '서울특별시', '노원구', '중계동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1138010100', '서울특별시', '은평구', '수색동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1138010200', '서울특별시', '은평구', '녹번동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1138010300', '서울특별시', '은평구', '불광동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1138010400', '서울특별시', '은평구', '갈현동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1138010500', '서울특별시', '은평구', '구산동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1138010600', '서울특별시', '은평구', '대조동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1138010700', '서울특별시', '은평구', '응암동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1138010800', '서울특별시', '은평구', '역촌동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1138010900', '서울특별시', '은평구', '신사동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1138011000', '서울특별시', '은평구', '증산동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1138011400', '서울특별시', '은평구', '진관동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1141010100', '서울특별시', '서대문구', '충정로2가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1141010200', '서울특별시', '서대문구', '충정로3가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1141010300', '서울특별시', '서대문구', '합동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1141010400', '서울특별시', '서대문구', '미근동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1141010500', '서울특별시', '서대문구', '냉천동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1141010600', '서울특별시', '서대문구', '천연동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1141010700', '서울특별시', '서대문구', '옥천동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1141010800', '서울특별시', '서대문구', '영천동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1141010900', '서울특별시', '서대문구', '현저동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1141011000', '서울특별시', '서대문구', '북아현동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1141011100', '서울특별시', '서대문구', '홍제동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1141011200', '서울특별시', '서대문구', '대현동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1141011300', '서울특별시', '서대문구', '대신동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1141011400', '서울특별시', '서대문구', '신촌동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1141011500', '서울특별시', '서대문구', '봉원동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1141011600', '서울특별시', '서대문구', '창천동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1141011700', '서울특별시', '서대문구', '연희동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1141011800', '서울특별시', '서대문구', '홍은동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1141011900', '서울특별시', '서대문구', '북가좌동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1141012000', '서울특별시', '서대문구', '남가좌동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1144010100', '서울특별시', '마포구', '아현동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1144010200', '서울특별시', '마포구', '공덕동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1144010300', '서울특별시', '마포구', '신공덕동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1144010400', '서울특별시', '마포구', '도화동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1144010500', '서울특별시', '마포구', '용강동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1144010600', '서울특별시', '마포구', '토정동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1144010700', '서울특별시', '마포구', '마포동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1144010800', '서울특별시', '마포구', '대흥동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1144010900', '서울특별시', '마포구', '염리동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1144011000', '서울특별시', '마포구', '노고산동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1144011100', '서울특별시', '마포구', '신수동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1144011200', '서울특별시', '마포구', '현석동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1144011300', '서울특별시', '마포구', '구수동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1144011400', '서울특별시', '마포구', '창전동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1144011500', '서울특별시', '마포구', '상수동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1144011600', '서울특별시', '마포구', '하중동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1144011700', '서울특별시', '마포구', '신정동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1144011800', '서울특별시', '마포구', '당인동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1144012000', '서울특별시', '마포구', '서교동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1144012100', '서울특별시', '마포구', '동교동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1144012200', '서울특별시', '마포구', '합정동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1144012300', '서울특별시', '마포구', '망원동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1144012400', '서울특별시', '마포구', '연남동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1144012500', '서울특별시', '마포구', '성산동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1144012600', '서울특별시', '마포구', '중동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1144012700', '서울특별시', '마포구', '상암동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1147010100', '서울특별시', '양천구', '신정동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1147010200', '서울특별시', '양천구', '목동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1147010300', '서울특별시', '양천구', '신월동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1150010100', '서울특별시', '강서구', '염창동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1150010200', '서울특별시', '강서구', '등촌동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1150010300', '서울특별시', '강서구', '화곡동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1150010400', '서울특별시', '강서구', '가양동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1150010500', '서울특별시', '강서구', '마곡동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1150010600', '서울특별시', '강서구', '내발산동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1150010700', '서울특별시', '강서구', '외발산동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1150010800', '서울특별시', '강서구', '공항동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1150010900', '서울특별시', '강서구', '방화동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1150011000', '서울특별시', '강서구', '개화동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1150011100', '서울특별시', '강서구', '과해동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1150011200', '서울특별시', '강서구', '오곡동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1150011300', '서울특별시', '강서구', '오쇠동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1153010100', '서울특별시', '구로구', '신도림동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1153010200', '서울특별시', '구로구', '구로동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1153010300', '서울특별시', '구로구', '가리봉동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1153010600', '서울특별시', '구로구', '고척동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1153010700', '서울특별시', '구로구', '개봉동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1153010800', '서울특별시', '구로구', '오류동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1153010900', '서울특별시', '구로구', '궁동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1153011000', '서울특별시', '구로구', '온수동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1153011100', '서울특별시', '구로구', '천왕동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1153011200', '서울특별시', '구로구', '항동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1154510100', '서울특별시', '금천구', '가산동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1154510200', '서울특별시', '금천구', '독산동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1154510300', '서울특별시', '금천구', '시흥동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1156010100', '서울특별시', '영등포구', '영등포동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1156010200', '서울특별시', '영등포구', '영등포동1가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1156010300', '서울특별시', '영등포구', '영등포동2가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1156010400', '서울특별시', '영등포구', '영등포동3가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1156010500', '서울특별시', '영등포구', '영등포동4가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1156010600', '서울특별시', '영등포구', '영등포동5가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1156010700', '서울특별시', '영등포구', '영등포동6가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1156010800', '서울특별시', '영등포구', '영등포동7가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1156010900', '서울특별시', '영등포구', '영등포동8가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1156011000', '서울특별시', '영등포구', '여의도동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1156011100', '서울특별시', '영등포구', '당산동1가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1156011200', '서울특별시', '영등포구', '당산동2가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1156011300', '서울특별시', '영등포구', '당산동3가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1156011400', '서울특별시', '영등포구', '당산동4가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1156011500', '서울특별시', '영등포구', '당산동5가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1156011600', '서울특별시', '영등포구', '당산동6가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1156011700', '서울특별시', '영등포구', '당산동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1156011800', '서울특별시', '영등포구', '도림동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1156011900', '서울특별시', '영등포구', '문래동1가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1156012000', '서울특별시', '영등포구', '문래동2가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1156012100', '서울특별시', '영등포구', '문래동3가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1156012200', '서울특별시', '영등포구', '문래동4가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1156012300', '서울특별시', '영등포구', '문래동5가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1156012400', '서울특별시', '영등포구', '문래동6가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1156012500', '서울특별시', '영등포구', '양평동1가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1156012600', '서울특별시', '영등포구', '양평동2가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1156012700', '서울특별시', '영등포구', '양평동3가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1156012800', '서울특별시', '영등포구', '양평동4가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1156012900', '서울특별시', '영등포구', '양평동5가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1156013000', '서울특별시', '영등포구', '양평동6가');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1156013100', '서울특별시', '영등포구', '양화동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1156013200', '서울특별시', '영등포구', '신길동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1156013300', '서울특별시', '영등포구', '대림동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1156013400', '서울특별시', '영등포구', '양평동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1159010100', '서울특별시', '동작구', '노량진동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1159010200', '서울특별시', '동작구', '상도동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1159010300', '서울특별시', '동작구', '상도1동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1159010400', '서울특별시', '동작구', '본동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1159010500', '서울특별시', '동작구', '흑석동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1159010600', '서울특별시', '동작구', '동작동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1159010700', '서울특별시', '동작구', '사당동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1159010800', '서울특별시', '동작구', '대방동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1159010900', '서울특별시', '동작구', '신대방동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1162010100', '서울특별시', '관악구', '봉천동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1162010200', '서울특별시', '관악구', '신림동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1162010300', '서울특별시', '관악구', '남현동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1165010100', '서울특별시', '서초구', '방배동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1165010200', '서울특별시', '서초구', '양재동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1165010300', '서울특별시', '서초구', '우면동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1165010400', '서울특별시', '서초구', '원지동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1165010600', '서울특별시', '서초구', '잠원동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1165010700', '서울특별시', '서초구', '반포동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1165010800', '서울특별시', '서초구', '서초동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1165010900', '서울특별시', '서초구', '내곡동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1165011000', '서울특별시', '서초구', '염곡동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1165011100', '서울특별시', '서초구', '신원동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1168010100', '서울특별시', '강남구', '역삼동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1168010300', '서울특별시', '강남구', '개포동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1168010400', '서울특별시', '강남구', '청담동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1168010500', '서울특별시', '강남구', '삼성동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1168010600', '서울특별시', '강남구', '대치동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1168010700', '서울특별시', '강남구', '신사동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1168010800', '서울특별시', '강남구', '논현동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1168011000', '서울특별시', '강남구', '압구정동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1168011100', '서울특별시', '강남구', '세곡동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1168011200', '서울특별시', '강남구', '자곡동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1168011300', '서울특별시', '강남구', '율현동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1168011400', '서울특별시', '강남구', '일원동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1168011500', '서울특별시', '강남구', '수서동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1168011800', '서울특별시', '강남구', '도곡동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1171010100', '서울특별시', '송파구', '잠실동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1171010200', '서울특별시', '송파구', '신천동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1171010300', '서울특별시', '송파구', '풍납동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1171010400', '서울특별시', '송파구', '송파동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1171010500', '서울특별시', '송파구', '석촌동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1171010600', '서울특별시', '송파구', '삼전동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1171010700', '서울특별시', '송파구', '가락동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1171010800', '서울특별시', '송파구', '문정동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1171010900', '서울특별시', '송파구', '장지동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1171011100', '서울특별시', '송파구', '방이동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1171011200', '서울특별시', '송파구', '오금동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1171011300', '서울특별시', '송파구', '거여동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1171011400', '서울특별시', '송파구', '마천동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1174010100', '서울특별시', '강동구', '명일동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1174010200', '서울특별시', '강동구', '고덕동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1174010300', '서울특별시', '강동구', '상일동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1174010500', '서울특별시', '강동구', '길동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1174010600', '서울특별시', '강동구', '둔촌동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1174010700', '서울특별시', '강동구', '암사동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1174010800', '서울특별시', '강동구', '성내동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1174010900', '서울특별시', '강동구', '천호동');
INSERT INTO location (locationNo, si, gu, dong) VALUES ('1174011000', '서울특별시', '강동구', '강일동');

INSERT INTO users
VALUES (1,    -- 회원번호 usersNo
        1174010800,    -- 동네번호 locationNo 성내동
        'aaa', -- 아이디 id
        '1234', -- 비밀번호 password
        '이정재', -- 닉네임 name
        '123', -- 회원코드 code
        SYSDATE, -- 생일 birth
        'male', -- 성별 gender
        'T' -- 상태 status
        ); 

INSERT INTO users 
VALUES (2,    -- 회원번호 usersNo
        1174010900,    -- 동네번호 locationNo 천호동
        'bbb', -- 아이디 id
        '12345', -- 비밀번호 password
        '이효리', -- 닉네임 name
        '456', -- 회원코드 code
        SYSDATE, -- 생일 birth
        'female', -- 성별 gender 
        'T' -- 상태 status
        ); 

INSERT INTO users
VALUES (3,    -- 회원번호 usersNo
        1174011000,    -- 동네번호 locationNo 강일동
        'ccc', -- 아이디 id
        '123456', -- 비밀번호 password
        '정우성', -- 닉네임 name
        '789', -- 회원코드 code
        SYSDATE, -- 생일 birth
        'male', -- 성별 gender
        'T' -- 상태 status
        );

INSERT INTO dog
VALUES (1, 1, '릴파', sysdate, 'male', 10.6, '리트리버', 'T', '사람을 만나면 신나요', 'T', '#c7dfff', 'T');

INSERT INTO dog
VALUES (2, 2, '아이네', sysdate, 'male', 6.2, '푸들', 'T', '노견이라 체력이 약해요', 'T', '#e1c8f7', 'T');

INSERT INTO dog
VALUES (3, 3, '주르르', sysdate, 'male', 8, '도베르만', 'T', '여우 같아요', 'T', '#ffc7ed', 'T');


--friend 더미 데이터

INSERT INTO friend
VALUES (1, 1, 2, 'F');

INSERT INTO friend
VALUES (1, 2, 3, 'F');

INSERT INTO friend
VALUES (1, 3, 1, 'F');

INSERT INTO friend
VALUES (1, 3, 1, 'F');

select *
from users;

select *
from dog;

select *
from friend;

select *
from location;

select  id,
        name,
        code
from users
where id = 'aaa'
and password = 1234;





