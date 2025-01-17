# 산책로(RunningDog) 프로젝트

Naver Map API를 이용한 지도 위 산책로를 만들어 공유하는 사이트

<br>

## 🚀 프로젝트 소개

* 강아지와 함께한 산책 경로와 일기를 산책 일지로 기록하며 블로그 형태로 관리
* 지도 위에 나만의 산책 경로를 새롭게 그린 산책로를 만들어 공유
* 지도를 통해 동네별, 태그별, 필터별로 산책로를 관리할 수 있으며 툴팁으로 산책로의 간단한 정보를 확인
* 지정한 산책로를 통한 모임을 결성할 수 있으며 친구 등록을 통해 강아지 카드를 공유하여 함께 산책

<br>

## 📍 기술 스택

* Java 17
* Spring
* JSP
* MyBatis / Oracle
* Selenium

<br>

## 📍 나의 구현현 기능

**walkTrail** : 산책로 기능(목록, 등록, 수정, 삭제, 상세) 구현

<br>

* **Naver Map API 분석 및 개발을 하며 다양한 알고리즘 구현**
  * 실시간 산책로 정보 업데이트를 위한 대표 산책로 알고리즘 개발 담당
  * 지역 검색을 통해 이동한 지도의 좌표값을 얻기 위해 Naver Geocoding 을 이용하여 맵의 좌표와 주소를 상호 변환
  * 산책로나 마커로 정보 툴팁 온 오프 및 경로 호버 기능 구현 → 메인 목록에서 지도 중심의 UI를 돋보이기 위해 판단

<br>

* **산책 경로를 새롭게 그려 만든 산책로 공유**
  * 지도에서 나의 산책일지 중 하나를 선택하여 Map에 나타난 산책경로 위에 새로운 산책로 경로를 그림
  * 산책로의 경로 다시 그리기, 이름 중복 확인, 태그 선택, 설명 추가 기능
  * 산책로의 주차장, 화장실, 쓰레기통의 유무와 마커로 위치 설정

<br>

* **지도를 통한 동네별 산책로를 관리**
  * 선택한 태그별, 필터별로 산책로를 볼 수 있으며 지도를 움직이거나 동네 검색으로 위치가 바뀔 때 마다 나타나는 산책로도 실시간으로 바뀜
  * 산책로를 클릭할 때 마다 툴팁 온오프로 산책로의 이름, 거리, 소요시간, 이용자 수, 찜 수, 후기 수, 공유한 메이트의 간단한 정보를 볼 수 있으며 상세보기로 갈 수 있음

<br>

* **산책로를 이용한 소통**
  * 각 산책로의 상세에서는 나의 산책로 이용정보를 간단하게 볼 수 있으며, 공유한 메이트와 가장 많이 이용한 메이트의 정보도 볼 수 있음
  * 산책로 근처에서 산책을 한 메이트들의 통계로 인한 산책로 이용 시간대를 볼 수 있으며, 해당 산책로를 이용한 메이트들의 산책일지와 모임일지를 볼 수 있음
  * 산책로의 후기를 목록과 갤러리 형식으로 볼 수 있으며 최신과 인기순으로 볼 수 있음. 이미지를 포함하여 산책로 후기를 작성

<br>

## 📝 ERD

![러닝독ERD](https://github.com/jeon-jyo/RunningDogJH/assets/96943317/2b64260e-223f-4259-875f-26087090296a)

<br>

## 📌 트러블슈팅

* [문제] 산책로를 분류하기 위해 필요한 데이터와 지도 사용을 위한 값 등 한 번에 많은 데이터를 다루어 복잡함
* [해결] 중복되는 것을 묶어 상황에 따라 분기 처리하기 위해 MyBatis 동적 쿼리 사용

<br>

* [문제] 새 산책로를 그릴 때 무분별한 산책로 공유 방지가 필요
* [해결] 기존 산책 경로와의 **오차 범위, 일치율, 최대길이 등의 제한 알고리즘 구현**

<br>

* [문제] 지도 위에 나타낼 산책로의 기준과 산책로 이용 수 카운트에 대한 모호성
* [해결]
  * 산책로의 첫 번째 좌표를 대표 주소와 마커로 지정
  * 산책로를 지정하지 않은 채 산책을 마쳤을 때 근처 산책로 대표 마커로 최근 이용한 산책로 3개가 추천으로 뜨며 모두 카운트 처리

<br>

## ✨ 구현 방법

* **산책로 목록, 등록, 상세보기 / 산책일지 목록**
  * Naver Web Dynamic Map을 이용하여 산책로와 산책일지의 산책경로 좌표와 마커 그리기
  *  Naver Geocoding, Reverse Geocoding를 이용하여 맵의 좌표와 주소를 상호변환
  * google chart 로 산책로 이용 시간대 분석

<br>

* **산책로 후기**
  * dropzone js 로 산책로 후기의 이미지들을 여러장 올리고 삭제하기

<br>

<details>
<summary>
  자세히 보기
</summary>

<br>

**산책로 목록**에서는 먼저 제가 설정한 지역의 중심주소를 얻고 좌표로 바꾸어 맵의 센터로 지정했습니다. 지역 설정을 하지 않으면 서울 전체의 중심 주소가 센터가 됩니다. 그리고 직사각형의 지도의 각 꼭짓점 안에 해당하는 산책로 마커들 중 대표 10개가 나오는데 그 때 제가 선택한 태그나 이용자 순 등의 필터도 함께 거쳐서 산출이 됩니다.
또한 지도를 줌인 줌아웃하거나 이동할 때 마다 이벤트가 발생하여 바뀐 꼭짓점 기준으로, 계산이 일어나서 최대 10개의 산책로 목록들이 계속 바뀝니다.

**산책로 등록**에서는 제가 기록한 산책일지의 좌표와 새로 그린 좌표를 비교합니다. 제가 새로 좌표를 찍을 때 마다 앞에 찍은 좌표와의 각도를 계산해서 폴리라인을 그립니다.
산책로 좌표들은 모두 기존 산책일지 좌표와 30퍼 센트는 일치해야 하고, 좌표들은 각각 가까운 산책기록 좌표와 50미터의 오차범위 제한이 있고, 전체 산책로의 길이도 산책일지 기록보다 짧게만 가능하게 했습니다.
산책 경로의 첫 번째 좌표는 대표 주소와 대표 마커가 됩니다.

**산책로 상세**에서는 먼저 해당 산책로를 이용한 산책일지를 24시간 기준으로 나누어 이용 시간대를 분석해 도표로 나누었습니다. 산책로에 해당하는 모든 후기나 산책일지, 모임일지의 정렬 기준의 제일 첫 번째는 제가 남긴 기록들입니다. 그 뒤로 최신순 인기순으로 선택이 가능합니다.
</details>

<br>

## 📑 각 구현 방법을 선택했던 이유 및 비교

<details>
<summary>
  자세히 보기
</summary>

<br>

* **Naver Maps API** <br>
무료로 사용할 수 있었고, 오픈소스를 통해 여러가지 예제로 공부하기 수월하였습니다. 프로젝트를 구상할 때 우리가 생각한 게 알고리즘으로 구현이 될지 빠른 기초구현과 시도를 하기에 알맞았기에 채택하였습니다. 작동방식과 구현방법에 익숙해지고나니 응용하기 좋았습니다.

* **산책로 메인 - 대표 산책로 목록 10개와 여러가지 필터** <br>
산책로 메인의 디자인은 자전거 라이딩 기록 어플로 유명한 STRAVA 를 참고하였습니다. 산책 사이트의 정체성을 나타내는 맵을 크게 띄우고 그 맵을 간단하게 조작하며 빠르게 값이 바뀌는 스타일리쉬한 느낌을 주는 게 목표였습니다.
여러가지 기준에 따라 항상 대표 산책로 10개를 도출해내는 방식으로 하였고, 각각 대표 주소와 대표 마커를 사용하여 구분을 하였습니다.

  * **MyBatis 동적 쿼리** <br>
산책로 메인은 하나의 지도에서 여러가지 작동으로 값이 바뀝니다.
크게 산책로 추천 목록, 등록한 목록, 찜한 목록으로 나뉘며 지도 API 사용을 위한 값들(지도의 중심 좌표, 각 꼭짓점의 좌표 등)과 선택한 태그와 필터를 통해 세부적으로 계산합니다.
중복되는 것을 최대한 묶어 필요한 모든 값을 한꺼번에 다루기 때문에 오히려 더 알고리즘을 통해 체계적으로 풀어내는 고민을 많이 하였습니다. 그래서 상황에 따라 분기 처리를 유동적으로 하는 MyBatis의 동적쿼리가 알맞았고 jstl을 사용해보아서 금방 적응하였습니다. 많은 값을 한 번에 처리하기 때문에 꼬이지 않게 조심해서 하다보니 개발 후반부에서는 빠르게 작업이 되었습니다.

* **산책로 이용 시간대 - Google Chart** <br>
Google Charts는 GET 요청으로 구동되는 차트여서 JavaScript 기반 Chart.js 보다는 덜 안전하다고 들었습니다. 하지만 많은 사람들이 잘 이용해왔고 예전에 이미 써 보았기 때문에 익숙해서 사용하였습니다.
</details>

<br>

## 📑 시연 영상

https://www.miricanvas.com/v/12nocit

<br>

## 📑 팀 깃허브

https://github.com/solchan010113/RunningDog
