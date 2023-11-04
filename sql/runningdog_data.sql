-- insert 더미 데이터

---------------------------------------------------------------------------------------
--회원
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

---------------------------------------------------------------------------------------------
--강아지 
INSERT INTO dog
VALUES (1, 1, '릴파', sysdate, 'male', 10.6, '리트리버', 'T', '사람을 만나면 신나요', 'T', '#c7dfff', 'T');

INSERT INTO dog
VALUES (2, 2, '아이네', sysdate, 'male', 6.2, '푸들', 'T', '노견이라 체력이 약해요', 'T', '#e1c8f7', 'T');

INSERT INTO dog
VALUES (3, 3, '주르르', sysdate, 'male', 8, '도베르만', 'T', '여우 같아요', 'T', '#ffc7ed', 'T');

-----------------------------------------------------------------------
--산책일지 + 산책좌표

-- 회원
INSERT INTO users
VALUES (99,    -- 회원번호 userNo
        20,     -- 동네 번호 locationNo
        '아이디',  -- 아이디 id
        '1234',  -- 비밀번호 password
        '손성진', -- 닉네임 name
        '4321', -- 회원코드 code
        SYSDATE,  -- 생일 birth
        '남자', -- 성별 gender
        't');  -- 상태 status

-- 산책일지
INSERT INTO walkLog
VALUES (1,    -- 산책일지번호 walkLogNo
        99,     -- 회원번호 userNo
        111,    -- 동네번호 locationNo
        11111, -- 모임번호 meetingNo
        SYSDATE, -- 작성시간 regDate
        SYSDATE, -- 시작시간 startTime
        SYSDATE, -- 종료시간 endTime
        SYSDATE, -- 소요시간 logTime
        15, -- 거리 distance
        '내용을 적어주세요', -- 내용 content
        '공개', -- 공개여부 security
        'T' -- 상태 status
        ); 

INSERT INTO walkLog
VALUES (2,    -- 산책일지번호 walkLogNo
        99,     -- 회원번호 userNo
        111,    -- 동네번호 locationNo
        11111, -- 모임번호 meetingNo
        SYSDATE, -- 작성시간 regDate
        SYSDATE, -- 시작시간 startTime
        SYSDATE, -- 종료시간 endTime
        SYSDATE, -- 소요시간 logTime
        15, -- 거리 distance
        '내용을 적어주세요', -- 내용 content
        '공개', -- 공개여부 security
        'T' -- 상태 status
        ); 

INSERT INTO walkLog
VALUES (3,    -- 산책일지번호 walkLogNo
        99,     -- 회원번호 userNo
        111,    -- 동네번호 locationNo
        11111, -- 모임번호 meetingNo
        SYSDATE, -- 작성시간 regDate
        SYSDATE, -- 시작시간 startTime
        SYSDATE, -- 종료시간 endTime
        SYSDATE, -- 소요시간 logTime
        15, -- 거리 distance
        '내용을 적어주세요', -- 내용 content
        '공개', -- 공개여부 security
        'T' -- 상태 status
        );
        
INSERT INTO walkedDog
VALUES (1,    -- 산책한강아지번호 walkedDogNo
        1,     -- 산책일지번호 walkLogNo
        1    -- 강아지번호 dogNo       
        );
        
INSERT INTO walkedDog
VALUES (2,    -- 산책한강아지번호 walkedDogNo
        1,     -- 산책일지번호 walkLogNo
        2    -- 강아지번호 dogNo       
        );        
 
INSERT INTO walkedDog
VALUES (3,    -- 산책한강아지번호 walkedDogNo
        1,     -- 산책일지번호 walkLogNo
        3    -- 강아지번호 dogNo       
        );  
        
INSERT INTO walkedDog
VALUES (4,    -- 산책한강아지번호 walkedDogNo
        2,     -- 산책일지번호 walkLogNo
        1    -- 강아지번호 dogNo       
        );        
 
INSERT INTO walkedDog
VALUES (5,    -- 산책한강아지번호 walkedDogNo
        2,     -- 산책일지번호 walkLogNo
        2    -- 강아지번호 dogNo       
        );  
        
INSERT INTO walkedDog
VALUES (6,    -- 산책한강아지번호 walkedDogNo
        3,     -- 산책일지번호 walkLogNo
        1    -- 강아지번호 dogNo       
        );       
        
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 1, 'walkLog', 1, 127.1252811, 37.5436749);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 2, 'walkLog', 1, 127.1254717, 37.54419228);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 3, 'walkLog', 1, 127.1256622, 37.54470965);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 4, 'walkLog', 1, 127.1258528, 37.54522703);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 5, 'walkLog', 1, 127.1259195, 37.5454081);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 6, 'walkLog', 1, 127.1265874, 37.54530779);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 7, 'walkLog', 1, 127.1272553, 37.54520748);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 8, 'walkLog', 1, 127.1274483, 37.5451785);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 9, 'walkLog', 1, 127.1272841, 37.54465546);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 10, 'walkLog', 1, 127.12712, 37.54413243);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 11, 'walkLog', 1, 127.1269558, 37.54360939);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 12, 'walkLog', 1, 127.1268609, 37.543307);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 13, 'walkLog', 1, 127.1262086, 37.54345857);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 14, 'walkLog', 1, 127.1255562, 37.54361014);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 15, 'walkLog', 1, 127.1252865, 37.5436728);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 1, 'walkLog', 2, 127.1190346, 37.5460517);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 2, 'walkLog', 2, 127.118883, 37.5459092);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 3, 'walkLog', 2, 127.1187422, 37.5458794);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 4, 'walkLog', 2, 127.1187046, 37.5459432);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 5, 'walkLog', 2, 127.1187073, 37.546091);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 6, 'walkLog', 2, 127.1187489, 37.5461973);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 7, 'walkLog', 2, 127.1188803, 37.5462973);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 8, 'walkLog', 2, 127.1190413, 37.5463537);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 9, 'walkLog', 2, 127.1192263, 37.5463494);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 10, 'walkLog', 2, 127.1192304, 37.546309);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 11, 'walkLog', 2, 127.1191405, 37.5462771);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 12, 'walkLog', 2, 127.1189769, 37.5462292);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 13, 'walkLog', 2, 127.1189836, 37.5461867);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 14, 'walkLog', 2, 127.1190386, 37.5460421);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 1, 'walkLog', 3, 127.119225, 37.5441239);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 2, 'walkLog', 3, 127.1193088, 37.54465878);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 3, 'walkLog', 3, 127.1193323, 37.5448086);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 4, 'walkLog', 3, 127.1196006, 37.54530383);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 5, 'walkLog', 3, 127.1196434, 37.5453828);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 6, 'walkLog', 3, 127.1198848, 37.5455317);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 7, 'walkLog', 3, 127.1196541, 37.5456678);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 8, 'walkLog', 3, 127.1193162, 37.5457444);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 9, 'walkLog', 3, 127.1188817, 37.5457274);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 10, 'walkLog', 3, 127.1187261, 37.5457189);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 11, 'walkLog', 3, 127.1186188, 37.5457316);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 12, 'walkLog', 3, 127.118646, 37.54519304);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 13, 'walkLog', 3, 127.118651, 37.5450936);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 14, 'walkLog', 3, 127.1182563, 37.54465477);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 15, 'walkLog', 3, 127.1182379, 37.5446343);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 16, 'walkLog', 3, 127.117687, 37.54431856);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 17, 'walkLog', 3, 127.1175996, 37.5442685);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 18, 'walkLog', 3, 127.1173743, 37.5441451);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 19, 'walkLog', 3, 127.1172294, 37.5437666);

-------------------------------------------------------------------------------------
--산책로 + 산책좌표 
INSERT INTO trail
VALUES (1, 1, 1174010900, '천호공원 한바퀴', '서울 강동구 올림픽로 702 해공도서관',
'694m', '50분', 'T', 'F', 'F', '저녁에 사람이 많다. 공기가 좋다', sysdate, sysdate, 'T');

INSERT INTO trail
VALUES (2, 2, 1174010900, '광나루한강공원', '서울 강동구 천호동 351-1',
'164m', '17분', 'F', 'T', 'F', '강아지들과 운동하기 좋음', sysdate, sysdate, 'T');

INSERT INTO trail
VALUES (3, 3, 1174010900, '광나루자전거공원', '서울 강동구 선사로 83-19',
'563m', '30분', 'F', 'F', 'T', '산책길이 잘 되어 있음', sysdate, sysdate, 'T');

INSERT INTO trailTag
VALUES (1, 1, '공원 근처');
INSERT INTO trailTag
VALUES (2, 1, '유동인구 많음');
INSERT INTO trailTag
VALUES (3, 2, '공원 근처');
INSERT INTO trailTag
VALUES (4, 2, '넓은 공간');
INSERT INTO trailTag
VALUES (5, 3, '공원 근처');

INSERT INTO coords
VALUES (seq_coords_no.NEXTVAL, 'trailParking', 1, 1, 37.544770, 127.126219);
INSERT INTO coords
VALUES (seq_coords_no.NEXTVAL, 'trailRestroom', 2, 1, 37.548796, 127.119965);
INSERT INTO coords
VALUES (seq_coords_no.NEXTVAL, 'trailTrashCan', 3, 1, 37.545122, 127.119196);

INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 1, 'trail', 1, 127.1252811, 37.5436749);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 2, 'trail', 1, 127.1254717, 37.54419228);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 3, 'trail', 1, 127.1256622, 37.54470965);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 4, 'trail', 1, 127.1258528, 37.54522703);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 5, 'trail', 1, 127.1259195, 37.5454081);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 6, 'trail', 1, 127.1265874, 37.54530779);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 7, 'trail', 1, 127.1272553, 37.54520748);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 8, 'trail', 1, 127.1274483, 37.5451785);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 9, 'trail', 1, 127.1272841, 37.54465546);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 10, 'trail', 1, 127.12712, 37.54413243);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 11, 'trail', 1, 127.1269558, 37.54360939);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 12, 'trail', 1, 127.1268609, 37.543307);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 13, 'trail', 1, 127.1262086, 37.54345857);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 14, 'trail', 1, 127.1255562, 37.54361014);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 15, 'trail', 1, 127.1252865, 37.5436728);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 1, 'trail', 2, 127.1190346, 37.5460517);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 2, 'trail', 2, 127.118883, 37.5459092);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 3, 'trail', 2, 127.1187422, 37.5458794);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 4, 'trail', 2, 127.1187046, 37.5459432);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 5, 'trail', 2, 127.1187073, 37.546091);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 6, 'trail', 2, 127.1187489, 37.5461973);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 7, 'trail', 2, 127.1188803, 37.5462973);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 8, 'trail', 2, 127.1190413, 37.5463537);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 9, 'trail', 2, 127.1192263, 37.5463494);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 10, 'trail', 2, 127.1192304, 37.546309);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 11, 'trail', 2, 127.1191405, 37.5462771);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 12, 'trail', 2, 127.1189769, 37.5462292);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 13, 'trail', 2, 127.1189836, 37.5461867);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 14, 'trail', 2, 127.1190386, 37.5460421);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 1, 'trail', 3, 127.119225, 37.5441239);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 2, 'trail', 3, 127.1193088, 37.54465878);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 3, 'trail', 3, 127.1193323, 37.5448086);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 4, 'trail', 3, 127.1196006, 37.54530383);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 5, 'trail', 3, 127.1196434, 37.5453828);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 6, 'trail', 3, 127.1198848, 37.5455317);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 7, 'trail', 3, 127.1196541, 37.5456678);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 8, 'trail', 3, 127.1193162, 37.5457444);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 9, 'trail', 3, 127.1188817, 37.5457274);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 10, 'trail', 3, 127.1187261, 37.5457189);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 11, 'trail', 3, 127.1186188, 37.5457316);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 12, 'trail', 3, 127.118646, 37.54519304);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 13, 'trail', 3, 127.118651, 37.5450936);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 14, 'trail', 3, 127.1182563, 37.54465477);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 15, 'trail', 3, 127.1182379, 37.5446343);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 16, 'trail', 3, 127.117687, 37.54431856);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 17, 'trail', 3, 127.1175996, 37.5442685);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 18, 'trail', 3, 127.1173743, 37.5441451);
INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 19, 'trail', 3, 127.1172294, 37.5437666);

-----------------------------------------------------------------------------------------------
---동아리 

INSERT INTO CLUB(clubNo,name,description,regDate,status,join,authNoti,authBoard,authJoin,authSece,locationNo)
VALUES(seq_club_no.nextVal,'천호동 귀요미들','귀요미들만',sysdate, 'T','T','A','A','A','A',1174010900);
INSERT INTO CLUB(clubNo,name,description,regDate,status,join,authNoti,authBoard,authJoin,authSece,locationNo)
VALUES(seq_club_no.nextVal,'산책갈래요?','귀요미들만',sysdate, 'T','T','A','A','A','A',1174010900);
INSERT INTO CLUB(clubNo,name,description,regDate,status,join,authNoti,authBoard,authJoin,authSece,locationNo)
VALUES(seq_club_no.nextVal,'펫카페투어','귀요미들만',sysdate, 'T','T','A','A','A','A',1174010900);

INSERT INTO clubUsers
VALUES(seq_clubusers_no.nextVal,'A',sysdate,'T',0,sysdate,1,1);
INSERT INTO clubUsers
VALUES(seq_clubusers_no.nextVal,'N',sysdate,'T',0,sysdate,2,1);
INSERT INTO clubUsers
VALUES(seq_clubusers_no.nextVal,'M',sysdate,'T',0,sysdate,3,1);

INSERT INTO meeting
VALUES(seq_meeting_no.nextVal,'귀요미모임','아주귀요미들만 오세요','23/11/10',5,'T','T','T','T','T',37.538012,127.126008,1,1,'');

INSERT INTO meetingInfo
VALUES(seq_meeting_no.nextVal,1,1,1);
INSERT INTO meetingInfo
VALUES(seq_meeting_no.nextVal,1,2,2);
INSERT INTO meetingInfo
VALUES(seq_meeting_no.nextVal,1,3,3);

--------------------------------------------------------------------------------------------------------------------
