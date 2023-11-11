SELECT * FROM tab;
SELECT * FROM user_sequences;

SELECT * FROM trail;
SELECT * FROM trailTag;
SELECT * FROM coords;

-- DELETE FROM trail;
-- DELETE FROM trailTag;
-- DELETE FROM coords;

COMMIT;

---------------------------------------------------------------------------------------

-- 산책로 메인

-- 유저 설정 위치
SELECT l.locationNo
       ,l.si
       ,l.gu
       ,l.dong
  FROM users u, location l
 WHERE u.locationNo = l.locationNo
   AND u.userNo = 2;

-- 서울 전체 위치
SELECT locationNo
       ,si
       ,gu
       ,dong
  FROM location
 WHERE l.gu LIKE '%전체%';

-- 산책로 목록
-- 이용자순
SELECT ort.trailNo
       ,ort.name
       ,ort.distance
       ,ort.eta
       ,ort.regDate
  FROM (SELECT ROWNUM rn
               ,ot.trailNo
               ,ot.name
               ,ot.distance
               ,ot.eta
               ,ot.regDate
          FROM (SELECT t.trailNo
                       ,t.name
                       ,t.distance
                       ,t.eta
                       ,TO_CHAR(t.regdate, 'YY-MM-DD HH24:MI:SS') regDate
                  FROM trail t, coords c, ( SELECT COUNT(tt.walkLogNo) cnt
                                                   ,tt.trailNo
                                              FROM trailUsed tt, trailTag ta
                                             WHERE tt.trailNo = ta.trailNo
                                             GROUP BY tt.trailNo ) gt
                 WHERE t.trailNo = c.useNo
                   AND t.trailNo = gt.trailNo
                   AND c.type = 'trail'
                   AND c.coordorder = 1
                   AND c.lng BETWEEN 127.1162072 AND 127.157406
                   AND c.lat BETWEEN 37.5342968 AND 37.5557335
                   AND t.status = 'T'
                 ORDER BY gt.cnt DESC
               ) ot
       ) ort
 WHERE ort.rn >= 1
   AND ort.rn <= 10;

-- 인기순
SELECT ort.trailNo
       ,ort.name
       ,ort.distance
       ,ort.eta
       ,ort.regDate
  FROM (SELECT ROWNUM rn
               ,ot.trailNo
               ,ot.name
               ,ot.distance
               ,ot.eta
               ,ot.regDate
          FROM (SELECT t.trailNo
                       ,t.name
                       ,t.distance
                       ,t.eta
                       ,TO_CHAR(t.regdate, 'YY-MM-DD HH24:MI:SS') regDate
                  FROM trail t, coords c, ( SELECT COUNT(tt.userNo) cnt
                                                   ,tt.trailNo
                                              FROM trailStar tt, trailTag ta
                                             WHERE tt.trailNo = ta.trailNo
                                             GROUP BY tt.trailNo ) gt
                 WHERE t.trailNo = c.useNo
                   AND t.trailNo = gt.trailNo
                   AND c.type = 'trail'
                   AND c.coordorder = 1
                   AND c.lng BETWEEN 127.1162072 AND 127.157406
                   AND c.lat BETWEEN 37.5342968 AND 37.5557335
                   AND t.status = 'T'
                 ORDER BY gt.cnt DESC
               ) ot
       ) ort
 WHERE ort.rn >= 1
   AND ort.rn <= 10;

-- 후기순
SELECT ort.trailNo
       ,ort.name
       ,ort.distance
       ,ort.eta
       ,ort.regDate
  FROM (SELECT ROWNUM rn
               ,ot.trailNo
               ,ot.name
               ,ot.distance
               ,ot.eta
               ,ot.regDate
          FROM (SELECT t.trailNo
                       ,t.name
                       ,t.distance
                       ,t.eta
                       ,TO_CHAR(t.regdate, 'YY-MM-DD HH24:MI:SS') regDate
                  FROM trail t, coords c, ( SELECT COUNT(tt.userNo) cnt
                                                   ,tt.trailNo
                                              FROM trailCmt tt, trailTag ta
                                             WHERE tt.trailNo = ta.trailNo
                                               AND tt.status = 'T'
                                             GROUP BY tt.trailNo ) gt
                 WHERE t.trailNo = c.useNo
                   AND t.trailNo = gt.trailNo
                   AND c.type = 'trail'
                   AND c.coordorder = 1
                   AND c.lng BETWEEN 127.1162072 AND 127.157406
                   AND c.lat BETWEEN 37.5342968 AND 37.5557335
                   AND t.status = 'T'
                 ORDER BY gt.cnt DESC
               ) ot
       ) ort
 WHERE ort.rn >= 1
   AND ort.rn <= 10;

-- 최신순
SELECT ort.trailNo
       ,ort.name
       ,ort.distance
       ,ort.eta
       ,ort.regDate
  FROM (SELECT ROWNUM rn
               ,ot.trailNo
               ,ot.name
               ,ot.distance
               ,ot.eta
               ,ot.regDate
          FROM (SELECT t.trailNo
                       ,t.name
                       ,t.distance
                       ,t.eta
                       ,TO_CHAR(t.regdate, 'YY-MM-DD HH24:MI:SS') regDate
                  FROM trail t, coords c, ( SELECT tt.trailNo
                                              FROM trailTag tt
                                             WHERE tt.trailNo > 0
                                             GROUP BY tt.trailNo ) gt
                 WHERE t.trailNo = c.useNo
                   AND t.trailNo = gt.trailNo
                   AND c.type = 'trail'
                   AND c.coordorder = 1
                   AND c.lng BETWEEN 127.1162072 AND 127.157406
                   AND c.lat BETWEEN 37.5342968 AND 37.5557335
                   AND t.status = 'T'
                 ORDER BY t.regDate DESC
               ) ot
       ) ort
 WHERE ort.rn >= 1
   AND ort.rn <= 10;

-- 등록한 산책로
SELECT ort.trailNo
       ,ort.name
       ,ort.distance
       ,ort.eta
       ,ort.regDate
  FROM (SELECT ROWNUM rn
               ,ot.trailNo
               ,ot.name
               ,ot.distance
               ,ot.eta
               ,ot.regDate
          FROM (SELECT t.trailNo
                       ,t.name
                       ,t.distance
                       ,t.eta
                       ,TO_CHAR(t.regdate, 'YY-MM-DD HH24:MI:SS') regDate
                  FROM trail t, coords c, ( SELECT COUNT(tt.walkLogNo) cnt
                                                   ,tt.trailNo
                                              FROM trailUsed tt, trailTag ta
                                             WHERE tt.trailNo = ta.trailNo
                                             GROUP BY tt.trailNo ) gt
                 WHERE t.trailNo = c.useNo
                   AND t.trailNo = gt.trailNo
                   AND c.type = 'trail'
                   AND c.coordorder = 1
                   AND c.lng BETWEEN 127.1162072 AND 127.157406
                   AND c.lat BETWEEN 37.5342968 AND 37.5557335
                   AND t.status = 'T'
                   AND t.userNo = '1'
                 ORDER BY gt.cnt DESC
               ) ot
       ) ort
 WHERE ort.rn >= 1
   AND ort.rn <= 10;

-- 찜한 산책로
SELECT ort.trailNo
       ,ort.name
       ,ort.distance
       ,ort.eta
       ,ort.regDate
  FROM (SELECT ROWNUM rn
               ,ot.trailNo
               ,ot.name
               ,ot.distance
               ,ot.eta
               ,ot.regDate
          FROM (SELECT t.trailNo
                       ,t.name
                       ,t.distance
                       ,t.eta
                       ,TO_CHAR(t.regdate, 'YY-MM-DD HH24:MI:SS') regDate
                  FROM trail t, coords c, trailStar ts, ( SELECT COUNT(tt.walkLogNo) cnt
                                                   ,tt.trailNo
                                              FROM trailUsed tt, trailTag ta
                                             WHERE tt.trailNo = ta.trailNo
                                             GROUP BY tt.trailNo ) gt
                 WHERE t.trailNo = c.useNo
                   AND t.trailNo = gt.trailNo
                   AND c.type = 'trail'
                   AND c.coordorder = 1
                   AND c.lng BETWEEN 127.1162072 AND 127.157406
                   AND c.lat BETWEEN 37.5342968 AND 37.5557335
                   AND t.status = 'T'
                   AND t.trailNo = ts.trailNo
                   AND ts.userNo = '1'
                 ORDER BY gt.cnt DESC
               ) ot
       ) ort
 WHERE ort.rn >= 1
   AND ort.rn <= 10;

-- 태그
SELECT tt.trailNo
  FROM trailTag tt
 WHERE tt.trailNo > 0
 GROUP BY tt.trailNo;

SELECT COUNT(tt.walkLogNo) cnt
       ,tt.trailNo
  FROM trailUsed tt, trailTag ta
 WHERE tt.trailNo = ta.trailNo
   AND ta.tagname IN ('넓은 공간', '공원 근처')
 GROUP BY tt.trailNo;

-- 산책일지 이용순
SELECT ort.walkLogNo
       ,ort.userNo
       ,ort.distance
       ,ort.logTime
       ,ort.regDate
  FROM (SELECT ROWNUM rn
               ,ot.walkLogNo
               ,ot.userNo
               ,ot.distance
               ,ot.logTime
               ,ot.regDate
          FROM (SELECT w.walkLogNo
                       ,w.userNo
                       ,w.distance
                       ,w.logTime
                       ,TO_CHAR(w.regdate, 'YY-MM-DD HH24:MI:SS') regDate
                  FROM walkLog w, coords c, ( SELECT COUNT(trailNo) cnt
                                                     ,walkLogNo
                                                FROM trailUsed
                                               GROUP BY walkLogNo ) gt
                 WHERE w.walkLogNo = c.useNo
                   AND w.walkLogNo = gt.walkLogNo
                   AND c.type = 'walkLog'
                   AND c.coordorder = 1
                   AND c.lng BETWEEN 127.1162072 AND 127.157406
                   AND c.lat BETWEEN 37.5342968 AND 37.5557335
                   AND w.status = 'T'
                   AND w.userNo = '99'
                 ORDER BY gt.cnt DESC
               ) ot
       ) ort
 WHERE ort.rn >= 1
   AND ort.rn <= 10;

-- 산책일지 좋아요순
SELECT ort.walkLogNo
       ,ort.userNo
       ,ort.distance
       ,ort.logTime
       ,ort.regDate
  FROM (SELECT ROWNUM rn
               ,ot.walkLogNo
               ,ot.userNo
               ,ot.distance
               ,ot.logTime
               ,ot.regDate
          FROM (SELECT w.walkLogNo
                       ,w.userNo
                       ,w.distance
                       ,w.logTime
                       ,TO_CHAR(w.regdate, 'YY-MM-DD HH24:MI:SS') regDate
                  FROM walkLog w, coords c, ( SELECT COUNT(userNo) cnt
                                                     ,useNo
                                                FROM userLike
                                               WHERE type = 'walkLog'
                                               GROUP BY useNo ) gt
                 WHERE w.walkLogNo = c.useNo
                   AND w.walkLogNo = gt.useNo
                   AND c.type = 'walkLog'
                   AND c.coordorder = 1
                   AND c.lng BETWEEN 127.1162072 AND 127.157406
                   AND c.lat BETWEEN 37.5342968 AND 37.5557335
                   AND w.status = 'T'
                   AND w.userNo = '99'
                 ORDER BY gt.cnt DESC
               ) ot
       ) ort
 WHERE ort.rn >= 1
   AND ort.rn <= 10;

-- 산책일지 최신순
SELECT ort.walkLogNo
       ,ort.userNo
       ,ort.distance
       ,ort.logTime
       ,ort.regDate
  FROM (SELECT ROWNUM rn
               ,ot.walkLogNo
               ,ot.userNo
               ,ot.distance
               ,ot.logTime
               ,ot.regDate
          FROM (SELECT w.walkLogNo
                       ,w.userNo
                       ,w.distance
                       ,w.logTime
                       ,TO_CHAR(w.regdate, 'YY-MM-DD HH24:MI:SS') regDate
                  FROM walkLog w, coords c
                 WHERE w.walkLogNo = c.useNo
                   AND c.type = 'walkLog'
                   AND c.coordorder = 1
                   AND c.lng BETWEEN 127.1162072 AND 127.157406
                   AND c.lat BETWEEN 37.5342968 AND 37.5557335
                   AND w.status = 'T'
                   AND w.userNo = '99'
                 ORDER BY regDate DESC
               ) ot
       ) ort
 WHERE ort.rn >= 1
   AND ort.rn <= 10;

-- 산책일지 오래된순
SELECT ort.walkLogNo
       ,ort.userNo
       ,ort.distance
       ,ort.logTime
       ,ort.regDate
  FROM (SELECT ROWNUM rn
               ,ot.walkLogNo
               ,ot.userNo
               ,ot.distance
               ,ot.logTime
               ,ot.regDate
          FROM (SELECT w.walkLogNo
                       ,w.userNo
                       ,w.distance
                       ,w.logTime
                       ,TO_CHAR(w.regdate, 'YY-MM-DD HH24:MI:SS') regDate
                  FROM walkLog w, coords c
                 WHERE w.walkLogNo = c.useNo
                   AND c.type = 'walkLog'
                   AND c.coordorder = 1
                   AND c.lng BETWEEN 127.1162072 AND 127.157406
                   AND c.lat BETWEEN 37.5342968 AND 37.5557335
                   AND w.status = 'T'
                   AND w.userNo = '99'
                 ORDER BY regDate ASC
               ) ot
       ) ort
 WHERE ort.rn >= 1
   AND ort.rn <= 10;

-- 산책일지 좌표
SELECT c.useNo
       ,c.coordOrder
       ,c.lat
       ,c.lng
  FROM walkLog w, coords c
 WHERE w.walkLogNo = c.useNo
   AND c.type = 'walkLog'
   AND c.useNo = 1
   AND w.status = 'T'
 ORDER BY c.coordOrder;

-- 산책로 좌표 목록
SELECT c.useNo
       ,c.coordOrder
       ,c.lat
       ,c.lng
  FROM trail t, coords c
 WHERE t.trailNo = c.useNo
   AND c.type = 'trail'
   AND c.useNo = 1
   AND t.status = 'T'
 ORDER BY c.coordOrder;

-- 산책로 툴팁
SELECT t.trailNo
       ,t.name
       ,t.distance
       ,t.eta
       ,TO_CHAR(t.regdate, 'YY-MM-DD') regDate
       ,u.userNo
       ,u.name
  FROM trail t, users u
 WHERE t.userNo = u.userNo
   AND t.trailNo = 1;

SELECT u.userNo
       ,u.name
       ,i.orgName
       ,i.saveName
       ,i.filePath
  FROM users u, images i
 WHERE i.type = 'users'
   AND i.useNo = 1;

SELECT COUNT(*)
  FROM trailUsed
 WHERE trailNo = 1;

SELECT COUNT(*)
  FROM trailStar
 WHERE trailNo = 1;

SELECT COUNT(*)
  FROM trailCmt
 WHERE trailNo = 1;

---------------------------------------------------------------------------------------

SELECT COUNT(*)
  FROM walkLog
 WHERE userNo = 2;

SELECT walkLogNo
  FROM walkLog;

SELECT useNo
  FROM coords
 WHERE type = 'walkLog';

UPDATE walkLog
   SET userNo = 99
 WHERE userNo = 2;

INSERT INTO walkLog
VALUES (seq_walklog_no.NEXTVAL, 2, 1174010900, 11, SYSDATE, SYSDATE, SYSDATE, SYSDATE, 15, '내용을 적어주세요', '공개', 'T');

INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) VALUES (seq_coords_no.NEXTVAL, 1, 'walkLog', 28, 127.1252811, 37.5436749);

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

UPDATE walkLog
   SET regDate = sysdate
 WHERE walkLogNo = 3;

INSERT INTO userLike
VALUES(seq_userlike_no.NEXTVAL, 1, 'walkLog', 1);
INSERT INTO userLike
VALUES(seq_userlike_no.NEXTVAL, 2, 'walkLog', 1);
INSERT INTO userLike
VALUES(seq_userlike_no.NEXTVAL, 3, 'walkLog', 1);
INSERT INTO userLike
VALUES(seq_userlike_no.NEXTVAL, 2, 'walkLog', 2);
INSERT INTO userLike
VALUES(seq_userlike_no.NEXTVAL, 3, 'walkLog', 2);
INSERT INTO userLike
VALUES(seq_userlike_no.NEXTVAL, 3, 'walkLog', 3);

INSERT INTO trailUsed
VALUES(seq_trailused_no.NEXTVAL, 1, 1);
INSERT INTO trailUsed
VALUES(seq_trailused_no.NEXTVAL, 2, 1);
INSERT INTO trailUsed
VALUES(seq_trailused_no.NEXTVAL, 2, 2);
INSERT INTO trailUsed
VALUES(seq_trailused_no.NEXTVAL, 1, 3);
INSERT INTO trailUsed
VALUES(seq_trailused_no.NEXTVAL, 2, 3);
INSERT INTO trailUsed
VALUES(seq_trailused_no.NEXTVAL, 3, 3);

INSERT INTO trailCmt
VALUES(seq_trailcmt_no.NEXTVAL, 1, 1, sysdate, '산책로 좋아요', 'T');
INSERT INTO trailCmt
VALUES(seq_trailcmt_no.NEXTVAL, 1, 2, sysdate, '굿', 'T');
INSERT INTO trailCmt
VALUES(seq_trailcmt_no.NEXTVAL, 1, 3, sysdate, '짱', 'T');
INSERT INTO trailCmt
VALUES(seq_trailcmt_no.NEXTVAL, 2, 1, sysdate, '산책로 좋아요', 'T');
INSERT INTO trailCmt
VALUES(seq_trailcmt_no.NEXTVAL, 2, 2, sysdate, '굿', 'T');
INSERT INTO trailCmt
VALUES(seq_trailcmt_no.NEXTVAL, 2, 3, sysdate, '짱', 'T');
INSERT INTO trailCmt
VALUES(seq_trailcmt_no.NEXTVAL, 3, 1, sysdate, '산책로 좋아요', 'T');

INSERT INTO trailStar
VALUES(seq_trailstar_no.NEXTVAL, 1, 1, sysdate);
INSERT INTO trailStar
VALUES(seq_trailstar_no.NEXTVAL, 2, 1, sysdate);
INSERT INTO trailStar
VALUES(seq_trailstar_no.NEXTVAL, 3, 1, sysdate);
INSERT INTO trailStar
VALUES(seq_trailstar_no.NEXTVAL, 1, 2, sysdate);
INSERT INTO trailStar
VALUES(seq_trailstar_no.NEXTVAL, 2, 2, sysdate);
INSERT INTO trailStar
VALUES(seq_trailstar_no.NEXTVAL, 3, 3, sysdate);

UPDATE trail
   SET regDate = sysdate
 WHERE trailNo = 3;

UPDATE trailTag
   SET tagName = '넓은 공간'
 WHERE trailTagNo = 5;

---------------------------------------------------------------------------------------

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