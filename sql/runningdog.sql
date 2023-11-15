SELECT * FROM tab;
SELECT * FROM user_sequences;

SELECT * FROM trail;
SELECT * FROM trailTag;
SELECT * FROM coords;
SELECT * FROM trailUsed;
SELECT * FROM walkLog;

-- DELETE FROM trail;
-- DELETE FROM trailTag;
-- DELETE FROM coords;

COMMIT;
ROLLBACK;

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
 WHERE gu LIKE '%전체%';

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
                  FROM coords c, trail t
                  LEFT OUTER JOIN ( SELECT COUNT(tt.walkLogNo) cnt
                                           ,tt.trailNo
                                      FROM trailUsed tt, trailTag ta
                                     WHERE tt.trailNo = ta.trailNo
                                       AND ta.tagName = '액티비티'
                                     GROUP BY tt.trailNo ) gt
                    ON t.trailNo = gt.trailNo
                 WHERE t.trailNo = c.useNo
                   AND c.type = 'trail'
                   AND c.coordorder = 1
                   AND c.lng BETWEEN 127.1162072 AND 127.157406
                   AND c.lat BETWEEN 37.5342968 AND 37.5557335
                   AND t.status = 'T'
                 ORDER BY gt.cnt DESC, regDate DESC
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
                  FROM coords c, trail t
                  LEFT OUTER JOIN ( SELECT COUNT(tt.userNo) cnt
                                           ,tt.trailNo
                                      FROM trailStar tt, trailTag ta
                                     WHERE tt.trailNo = ta.trailNo
                                     GROUP BY tt.trailNo ) gt
                    ON t.trailNo = gt.trailNo
                 WHERE t.trailNo = c.useNo
                   AND c.type = 'trail'
                   AND c.coordorder = 1
                   AND c.lng BETWEEN 127.1162072 AND 127.157406
                   AND c.lat BETWEEN 37.5342968 AND 37.5557335
                   AND t.status = 'T'
                 ORDER BY gt.cnt DESC, regDate DESC
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
                  FROM coords c, trail t
                  LEFT OUTER JOIN ( SELECT COUNT(tt.userNo) cnt
                                           ,tt.trailNo
                                      FROM trailCmt tt, trailTag ta
                                     WHERE tt.trailNo = ta.trailNo
                                       AND tt.status = 'T'
                                     GROUP BY tt.trailNo ) gt
                    ON t.trailNo = gt.trailNo
                 WHERE t.trailNo = c.useNo
                   AND c.type = 'trail'
                   AND c.coordorder = 1
                   AND c.lng BETWEEN 127.1162072 AND 127.157406
                   AND c.lat BETWEEN 37.5342968 AND 37.5557335
                   AND t.status = 'T'
                 ORDER BY gt.cnt DESC, regDate DESC
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
                  FROM coords c, trail t
                  LEFT OUTER JOIN ( SELECT ta.trailNo
                                      FROM trailTag ta
                                     WHERE ta.trailNo > 0
                                       AND ta.tagName = '공원 근처'
                                     GROUP BY ta.trailNo ) gt
                    ON t.trailNo = gt.trailNo
                 WHERE t.trailNo = c.useNo
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
                  FROM coords c, trail t
                  LEFT OUTER JOIN ( SELECT COUNT(tt.walkLogNo) cnt
                                           ,tt.trailNo
                                      FROM trailUsed tt, trailTag ta
                                     WHERE tt.trailNo = ta.trailNo
                                     GROUP BY tt.trailNo ) gt
                    ON t.trailNo = gt.trailNo
                 WHERE t.trailNo = c.useNo
                   AND c.type = 'trail'
                   AND c.coordorder = 1
                   AND c.lng BETWEEN 127.1162072 AND 127.157406
                   AND c.lat BETWEEN 37.5342968 AND 37.5557335
                   AND t.status = 'T'
                   AND t.userNo = '2'
                 ORDER BY gt.cnt DESC, regDate DESC
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
                  FROM coords c, trailStar ts, trail t
                  LEFT OUTER JOIN ( SELECT COUNT(tt.walkLogNo) cnt
                                           ,tt.trailNo
                                      FROM trailUsed tt, trailTag ta
                                     WHERE tt.trailNo = ta.trailNo
                                     GROUP BY tt.trailNo ) gt
                    ON t.trailNo = gt.trailNo
                 WHERE t.trailNo = c.useNo
                   AND c.type = 'trail'
                   AND c.coordorder = 1
                   AND c.lng BETWEEN 127.1162072 AND 127.157406
                   AND c.lat BETWEEN 37.5342968 AND 37.5557335
                   AND t.status = 'T'
                   AND t.trailNo = ts.trailNo
                   AND ts.userNo = '2'
                 ORDER BY gt.cnt DESC, regDate DESC
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
                  FROM coords c, walkLog w
                 WHERE w.walkLogNo = c.useNo
                   AND c.type = 'walkLog'
                   AND c.coordorder = 1
                   AND c.lng BETWEEN 127.1162072 AND 127.157406
                   AND c.lat BETWEEN 37.5342968 AND 37.5557335
                   AND w.status = 'T'
                   AND w.userNo = '2'
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
                  FROM coords c, walkLog w
                 WHERE w.walkLogNo = c.useNo
                   AND c.type = 'walkLog'
                   AND c.coordorder = 1
                   AND c.lng BETWEEN 127.1162072 AND 127.157406
                   AND c.lat BETWEEN 37.5342968 AND 37.5557335
                   AND w.status = 'T'
                   AND w.userNo = '2'
                 ORDER BY regDate ASC
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
                  FROM coords c, walkLog w
                  LEFT OUTER JOIN ( SELECT COUNT(userNo) cnt
                                           ,useNo
                                      FROM userLike
                                     WHERE type = 'walkLog'
                                     GROUP BY useNo ) gt
                    ON w.walkLogNo = gt.useNo
                 WHERE w.walkLogNo = c.useNo
                   AND c.type = 'walkLog'
                   AND c.coordorder = 1
                   AND c.lng BETWEEN 127.1162072 AND 127.157406
                   AND c.lat BETWEEN 37.5342968 AND 37.5557335
                   AND w.status = 'T'
                   AND w.userNo = '2'
                 ORDER BY gt.cnt DESC, regDate DESC
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

-- 산책로 등록

-- 산책로 이름 중복 확인
SELECT COUNT(*)
  FROM trail
 WHERE name = '천호공원 한바퀴';

-- 산책로 등록
INSERT INTO trail
VALUES(seq_trail_no.NEXTVAL, 2, 1174010900, '천호', '강동구 천호동', 150, 150, 'T', 'T', 'F', '굿', SYSDATE, SYSDATE, 'T');

-- 태그 등록
INSERT INTO trailTag
VALUES(seq_trailtag_no.NEXTVAL, 4, '산 근처');

-- 산책로 좌표 등록
INSERT INTO coords
VALUES (seq_coords_no.NEXTVAL, 'trail', 4, 1, 37.5436749, 127.1252811);

-- 산책로 정보 좌표 등록
INSERT INTO coords
VALUES (seq_coords_no.NEXTVAL, 'trailParking', 4, 1, 37.5436747, 127.1252813);

---------------------------------------------------------------------------------------

SELECT walkLogNo
  FROM walkLog;

SELECT *
  FROM coords
 WHERE type = 'walkLog';

INSERT INTO walkLog
VALUES (seq_walklog_no.NEXTVAL, 2, 1174010900, null, '제목', SYSDATE, to_date('2023-11-04 03:28','YYYY/MM/DD HH:MI'), to_date('2023-11-05 03:28','YYYY/MM/DD HH:MI'), 3560, 15, '내용을 적어주세요', '공개', 'T');

INSERT INTO coords
VALUES (seq_coords_no.NEXTVAL, 'walkLog', seq_walklog_no.CURRVAL, 1, 37.5436749, 127.1252811);

UPDATE walkLog
   SET userNo = '2'
 WHERE userNo = '99';

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
VALUES(seq_trailused_no.NEXTVAL, 3, 2);
INSERT INTO trailUsed
VALUES(seq_trailused_no.NEXTVAL, 1, 3);
INSERT INTO trailUsed
VALUES(seq_trailused_no.NEXTVAL, 2, 3);
INSERT INTO trailUsed
VALUES(seq_trailused_no.NEXTVAL, 3, 3);
INSERT INTO trailUsed
VALUES(seq_trailused_no.NEXTVAL, 16, 3);
INSERT INTO trailUsed
VALUES(seq_trailused_no.NEXTVAL, 17, 3);
INSERT INTO trailUsed
VALUES(seq_trailused_no.NEXTVAL, 18, 1);
INSERT INTO trailUsed
VALUES(seq_trailused_no.NEXTVAL, 19, 1);

select * from trailUsed;

INSERT INTO trailCmt
VALUES(seq_trailcmt_no.NEXTVAL, 1, 1, sysdate, '산책로 좋아요', 'T');
INSERT INTO trailCmt
VALUES(seq_trailcmt_no.NEXTVAL, 1, 2, sysdate, '굿', 'T');
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