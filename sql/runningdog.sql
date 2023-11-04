SELECT * FROM tab;
SELECT * FROM user_sequences;

select * from trail;
select * from trailTag;
select * from coords;

-- DELETE FROM trail;
-- DELETE FROM trailTag;
-- DELETE FROM coords;

commit;

---------------------------------------------------------------------------------------

--

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