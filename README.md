# RideShare-Server
## 목차
- [실행방법](#실행방법)
- [데이터베이스 초기설정 및 테스트 데이터 주입](#데이터베이스-초기설정-및-테스트-데이터-주입)
- [인텔리제이 초기설정](#인텔리제이-초기설정)
- [ERD](#erd)
- [REST API Guide](#rest-api-guide)
  * 파티 관련
    - [택시/카풀 리스트 반환 및 검색](#택시카풀-리스트-반환-및-검색)
    - [택시/카풀 ID로 조회](#택시카풀-ID로-조회)
    - [파티 등록](#파티-등록)
    - [파티 삭제](#파티-삭제)
    - [파티 수정](#파티-수정)
    - [파티 현재 인원 수 1 증가시키기](#파티-현재-인원-수-1-증가시키기)
    - [파티 확정 완료하기](#파티-확정-완료하기)
    - [파티 종료하기](#파티-종료하기)
  * 멤버 관련
    - [아이디/이메일/닉네임 중복 확인](#아이디이메일닉네임-중복-확인)
    - [회원가입](#회원가입)
    - [로그인](#로그인)
    - [Refresh Token 재발급](#refresh-token-재발급)
    - [마이페이지](#마이페이지)
## 실행방법
[https://jojelly.tistory.com/86](https://jojelly.tistory.com/86)
## 데이터베이스 초기설정 및 테스트 데이터 주입
프로젝트의 `Database` 폴더 -> `dbinit.sql` 파일의 SQL 문장을 **MySQL Workbench**에서 모두 실행해주세요.
## 인텔리제이 초기설정
1. file->settings->Build, Execution, Deployment-> Compiler -> Annotation Processors에서 enable annotation processing를 체크표시 해주세요.
   ![캡처](https://user-images.githubusercontent.com/70526479/229042932-646348cf-5152-410a-bdce-9fdc85a1b695.PNG)
2. RideshareApplication 파일의 main() 메서드를 실행하면 됩니다.<br>
   ![캡처2](https://user-images.githubusercontent.com/70526479/229047097-cf8ed5c7-6415-4326-bfbe-928179b7b0c3.PNG)
## ERD
![erd](https://github.com/KNUCSE23-Capston-Design/RideShare-Server/assets/70526479/d84dba09-f380-4b1c-a866-7f35d1a90562)
## REST API Guide
### 택시/카풀 리스트 반환 및 검색
- **lastId 보다 작은 값의 레코드들을 amount개 반환합니다.**
- **keyword 필드를 추가하면 원하는 출발지를 검색할 수 있습니다.**
```http
GET /parties
```
**성공**: 200 OK <br><br>
**요청 파라미터**
|필수|Params|Type|Description|
|:---:|------|---|---|
|X|`lastId`|`Integer`| 마지막으로 호출 된 id (미입력시 최근 id부터 출력)|
|O|`amount`|`Integer`| 한번에 호출 할 레코드 개수|
|O|`type`|`String`| `"택시"` or `"카풀"`|
|X|`keyword`|`String`| 검색할 키워드(출발지) (미입력시 모두 출력)|

**요청 예시**
```http
GET /parties?lastId=35&amount=3&type=카풀
```

**응답 예시(JSON)**
```json
[
    {
        "type": "카풀",
        "startDate": "2023-05-14",
        "startTime": "오전 11:20",
        "startPoint": "춘천시외버스터미널",
        "startLat": "37.86288933799438",
        "startLng": "127.71893919844631",
        "endPoint": "천지관",
        "currentHeadcnt": 1,
        "totalHeadcnt": 4,
        "isConfirm": false,
        "isFinish": false,
        "carNumber": "32고9831",
        "content": "컨텐츠내용 테스트 예제",
        "pid": 34
    },
    {
        "type": "카풀",
        "startDate": "2023-05-13",
        "startTime": "오전 11:20",
        "startPoint": "남춘천역",
        "startLat": "37.86369763697937",
        "startLng": "127.72376542374549",
        "endPoint": "강원대정문",
        "currentHeadcnt": 3,
        "totalHeadcnt": 4,
        "isConfirm": false,
        "isFinish": false,
        "carNumber": "48거4812",
        "content": "컨텐츠내용 테스트 예제",
        "pid": 33
    },
    {
        "type": "카풀",
        "startDate": "2023-05-12",
        "startTime": "오전 11:20",
        "startPoint": "남춘천역",
        "startLat": "37.86369763697937",
        "startLng": "127.72376542374549",
        "endPoint": "백록관",
        "currentHeadcnt": 1,
        "totalHeadcnt": 4,
        "isConfirm": false,
        "isFinish": false,
        "carNumber": "122더4925",
        "content": "컨텐츠내용 테스트 예제",
        "pid": 32
    }
]
```
- - -
### 택시/카풀 ID로 조회
```http request
GET /parties/{pId}
```
**성공**: 200 OK <br>
**실패**: 404 NOT_FOUND <BR><br>
**응답 예시(JSON)**
```json
{
    "type": "카풀",
    "startDate": "2023-05-20",
    "startTime": "오전 11:20",
    "startPoint": "남춘천역",
    "startLat": "37.86369763697937",
    "startLng": "127.72376542374549",
    "endPoint": "동문",
    "currentHeadcnt": 1,
    "totalHeadcnt": 4,
    "isConfirm": false,
    "isFinish": false,
    "carNumber": "237더1028",
    "content": "컨텐츠내용 테스트 예제",
    "pid": 40
}
```
- - -
### 파티 등록
```http request
POST /parties
```
**성공**: 201 CREATED <br><BR>

**요청 필드**
|필수|Field|Type|Description|
|:---:|------|---|---|
|O|`type`|`String`|`"택시"` or `"카풀"`|
|O|`startPoint`|`String`|출발지|
|O|`startLat`|`String`|출발지 위도|
|O|`startLng`|`String`|출발지 경도|
|O|`endPoint`|`String`|도착지|
|O|`totalHeadcnt`|`int`|전체 인원 수|
|O|`startDate`|`String`|출발 날짜|
|O|`startTime`|`String`|출발 시각|
|X|`carNumber`|`String`|차량 번호(only 카풀)|
|X|`content`|`String`|글 내용(only 카풀)|


**택시 등록 요청 예시(JSON)**
```json
{
  "type": "택시",
  "startPoint": "기숙사",
  "startLat": "37.87120749003905",
  "startLng": "127.7431938775162",
  "endPoint": "남춘천역",
  "totalHeadcnt": 4,
  "startDate": "2023-04-04",
  "startTime": "오후 02:30"
}
```
**택시 등록 응답 예시(JSON)**
```json
{
    "type": "택시",
    "startDate": "2023-04-04",
    "startTime": "오후 02:30",
    "startPoint": "기숙사",
    "startLat": "37.87120749003905",
    "startLng": "127.7431938775162",
    "endPoint": "남춘천역",
    "currentHeadcnt": 1,
    "totalHeadcnt": 4,
    "isConfirm": false,
    "isFinish": false,
    "carNumber": null,
    "content": null,
    "pid": 48
}
```
**카풀 등록 요청 예시(JSON)**
```json
{
  "type": "카풀",
  "startPoint": "글로벌경영관",
  "startLat": "37.87120749003905",
  "startLng": "127.7431938775162",
  "endPoint": "남춘천역",
  "totalHeadcnt": 4,
  "startDate": "2023-04-19",
  "startTime": "오후 09:10",
  "carNumber": "98가7654",
  "content": "카풀내용수정테스트asdfgh"
}
```
**카풀 등록 응답 예시(JSON)**
```json
{
    "type": "카풀",
    "startDate": "2023-04-19",
    "startTime": "오후 09:10",
    "startPoint": "글로벌경영관",
    "startLat": "37.87120749003905",
    "startLng": "127.7431938775162",
    "endPoint": "남춘천역",
    "currentHeadcnt": 1,
    "totalHeadcnt": 4,
    "isConfirm": false,
    "isFinish": false,
    "carNumber": "98가7654",
    "content": "카풀내용수정테스트asdfgh",
    "pid": 49
}
```
- - -
### 파티 삭제
```http request
DELETE /parties/{pId}
```
**성공**: 200 OK <br>
**실패**: 404 NOT_FOUND <br><BR>

- - -
### 파티 수정
- 택시 <-> 카풀 간 수정도 가능합니다. 예시를 참고해주세요.
```http request
PUT /parties/{pId}
```
**성공**: 200 OK <br>
**실패**: 404 NOT_FOUND <br><BR>

**요청 필드**
|필수|Field|Type|Description|
|:---:|------|---|---|
|O|`type`|`String`|`"택시"` or `"카풀"`|
|O|`startPoint`|`String`|출발지|
|O|`startLat`|`String`|출발지 위도|
|O|`startLng`|`String`|출발지 경도|
|O|`endPoint`|`String`|도착지|
|O|`totalHeadcnt`|`int`|전체 인원 수|
|O|`startDate`|`String`|출발 날짜|
|O|`startTime`|`String`|출발 시각|
|X|`carNumber`|`String`|차량 번호(only 카풀)|
|X|`content`|`String`|글 내용(only 카풀)|

**택시 -> 카풀 수정 요청 예시(JSON)**
```json
{
  "type": "카풀",
  "startPoint": "기숙사",
  "startLat": "37.87120749003905",
  "startLng": "127.7431938775162",
  "endPoint": "남춘천역",
  "totalHeadcnt": 4,
  "startDate": "2023-04-04",
  "startTime": "오후 02:30",
  "carNumber": "123고4567",
  "content": "카풀 내용 수정 테스트입니다."
}
```
**택시 -> 카풀 수정 응답 예시(JSON)**
```json
{
  "type": "카풀",
  "startDate": "2023-04-04",
  "startTime": "오후 02:30",
  "startPoint": "기숙사",
  "startLat": "37.87120749003905",
  "startLng": "127.7431938775162",
  "endPoint": "남춘천역",
  "currentHeadcnt": 1,
  "totalHeadcnt": 4,
  "isConfirm": false,
  "isFinish": false,
  "carNumber": "123고4567",
  "content": "카풀 내용 수정 테스트입니다.",
  "pid": 48
}
```

- - -
### 파티 현재 인원 수 1 증가시키기
- **파티의 current_headcnt 값을 1증가 시키는 기능입니다.**
```http request
PUT /parties/{pId}/current-headcnt
```
**성공**: 200 OK <br>

**응답 예시(TEXT) (1 -> 2로 증가시킨 경우)**
```json
2
```

- - -
### 파티 확정 완료하기
- **파티의 is_confirm 값을 true로 변경하는 기능입니다.**
```http request
PUT /parties/{pId}/confirm
```
**성공**: 200 OK <br>

- - -
### 파티 종료하기
- **파티의 is_finish 값을 true로 변경하는 기능입니다.**
```http request
PUT /parties/{pId}/finish
```
**성공**: 200 OK <br>

- - -
### 아이디/이메일/닉네임 중복 확인
- **아이디와 이메일, 닉네임의 중복여부를 확인하는 기능입니다.**
- **GET 요청 파라미터로 아이디, 이메일, 닉네임 중 하나를 포함하야 전송해야 합니다.**
```http request
GET /members/check
```
**요청 파라미터**
|필수|Params|Type|Description|
|:---:|------|---|---|
|X|`id`|`String`| 중복여부 확인할 아이디|
|X|`email`|`String`| 중복여부 확인할 이메일|
|X|`nickname`|`String`| 중복여부 확인할 닉네임|

**요청 예시 (ID 중복여부)**
```http request
GET /members/check?id=test1
```

**응답 예시, 중복인 경우(TEXT)**
```TEXT
exist
```

**응답 예시, 중복 아닌 경우(TEXT)**
```TEXT
non-exist
```

- - -
### 회원가입
- **신규 회원 정보를 입력받고 회원가입 요청을 보내는 기능입니다.**
- **입력했던 이메일로 회원인증 링크를 전송합니다.**
```http request
POST /members/join
```
**성공**: 200 OK <br>

**요청 필드**
|필수|Field|Type|Description|
|:---:|------|---|---|
|O|`id`|`String`|아이디(최대 15자)|
|O|`pw`|`String`|비밀번호|
|O|`email`|`String`|이메일(현재는 @kangwon.ac.kr 아니여도 가능)|
|O|`nickname`|`String`|닉네임(최대 15자)|

**요청 예시(JSON)**
```json
{
  "id": "test1",
  "pw": "1q2w3e4r",
  "email": "testmail1@kangwon.ac.kr",
  "nickname": "test1_nick"
}
```

- - -
### 로그인
- **아이디와 비밀번호로 로그인을 하고 Access Token과 Refresh Token을 반환받는 기능입니다.**
- **회원가입 완료 후 이메일 인증을 한 사용자만 로그인이 가능합니다.**
```http request
POST /members/login
```
**성공**: 200 OK <br>
**실패**: 401 Unauthorized <br>

**요청 필드**
|필수|Field|Type|Description|
|:---:|------|---|---|
|O|`id`|`String`|아이디|
|O|`pw`|`String`|비밀번호|

**응답 필드**
|Field|Type|Description|
|------|---|---|
|`grantType`|`String`|인증타입 (JWT는 `Bearer`)|
|`accessToken`|`String`|Access Token (현재 유효기간 30분으로 설정)|
|`refreshToken`|`String`|Refresh Token (현재 유효기간 7일로 설정)|
|`accessTokenExpiresIn`|`String`|Access Token 유효기간(현재시각+30분)|

**요청 예시(JSON)**
```json
{
  "id": "test1",
  "pw": "1q2w3e4r"
}
```

**응답 예시(JSON)**
```json
{
    "grantType": "Bearer",
    "accessToken": "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiI0IiwiYXV0aCI6IlJPTEVfVVNFUiIsImV4cCI6MTY4NDkyOTIwNn0.d0B2AXhmqUO_XIHYfuTVw_yKc-pj3puDV2XGwn8C-SF1yDes39ZZviYk4hBF5b-S2NZUHlmwg9oMnV_uiZBf3Q",
    "refreshToken": "eyJhbGciOiJIUzUxMiJ9.eyJleHAiOjE2ODU1MzIyMDZ9.dWnu2y-JoiggvhqbDbjuB1ir-KvqN00F-fXbX7p3vGdTvuOgFwL6U9t0oimwtkZ3MoYPhlskdxd7UkfUxt2lZw",
    "accessTokenExpiresIn": 1684929206327
}
```

- - -
### Refresh Token 재발급
- **Refresh Token의 유효기간이 만료되면 재발급 받는 기능입니다.**
```http
POST /members/reissue
```
**성공**: 200 OK <br>
**실패**: 401 Unauthorized <br>

**요청 필드**
|Field|Type|Description|
|------|---|---|
|`accessToken`|`String`|Access Token(현재 유효기간 30분으로 설정)|
|`refreshToken`|`String`|Refresh Token(현재 유효기간 7일로 설정)|

**응답 필드**
|Field|Type|Description|
|------|---|---|
|`grantType`|`String`|인증타입 (JWT는 `Bearer`)|
|`accessToken`|`String`|Access Token (현재 유효기간 30분으로 설정)|
|`refreshToken`|`String`|Refresh Token (현재 유효기간 7일로 설정)|
|`accessTokenExpiresIn`|`String`|Access Token 유효기간(현재시각+30분)|

**요청 예시(JSON)**
```json
{
    "accessToken": "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiI0IiwiYXV0aCI6IlJPTEVfVVNFUiIsImV4cCI6MTY4NDkyOTIwNn0.d0B2AXhmqUO_XIHYfuTVw_yKc-pj3puDV2XGwn8C-SF1yDes39ZZviYk4hBF5b-S2NZUHlmwg9oMnV_uiZBf3Q",
    "refreshToken": "eyJhbGciOiJIUzUxMiJ9.eyJleHAiOjE2ODU1MzIyMDZ9.dWnu2y-JoiggvhqbDbjuB1ir-KvqN00F-fXbX7p3vGdTvuOgFwL6U9t0oimwtkZ3MoYPhlskdxd7UkfUxt2lZw"
}
```

**응답 예시(JSON)**
```json
{
    "grantType": "Bearer",
    "accessToken": "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiI0IiwiYXV0aCI6IlJPTEVfVVNFUiIsImV4cCI6MTY4NDkyOTcyOH0.dimTO0aPhXQhPGr6X_9CS6DxcO9eLVwyuYr7olzZfugbcfF4sKLruS113sD_fSUAnZN4UEoeTsL1Lm4P7kRcvA",
    "refreshToken": "eyJhbGciOiJIUzUxMiJ9.eyJleHAiOjE2ODU1MzI3Mjh9.ZGCwZIvmZMAg23DQFbiEDV500D2LInxmGo3Smw_Q2qo4VVPRWAI_nMIZt-vooKvOyQ-9dBn-jVpRXCBIXWnO-Q",
    "accessTokenExpiresIn": 1684929728723
}
```

- - -
### 마이페이지
- **내 정보를 반환받는 기능입니다.**
- **HTTP 헤더**의 **Authorization 필드**에 Access Token을 포함하여 전송해야 합니다.
- **꼭 파라미터나 HTTP BODY가 아닌 HTTP 헤더에 토큰을 전송해야 합니다.**
```http
GET /members/me
```

**요청 헤더**
|Name|Description|
|---|---|
|`Authorization`|`Bearer` + `JWT Access Token`|

**응답 필드**
|Field|Type|Description|
|------|---|---|
|`id`|`String`|아이디|
|`pw`|`String`|비밀번호|
|`nickname`|`String`|닉네임|
|`email`|`String`|이메일|
|`authCode`|`Integer`|인증코드(6자리 랜덤숫자)|
|`authStatus`|`String`|인증상태(인증완료: true, 인증미완료: false)|
|`authority`|`String`|권한(ROLE_USER / ROLE_ADMIN)|
|`mid`|`Integer`|멤버ID (DB 기본키)|

**요청 예시**
```http
GET /members/me
```
```http header
Content-Type: application/json;charset=UTF-8
Authorization: Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiI0IiwiYXV0aCI6IlJPTEVfVVNFUiIsImV4cCI6MTY4NDkyOTcyOH0.dimTO0aPhXQhPGr6X_9CS6DxcO9eLVwyuYr7olzZfugbcfF4sKLruS113sD_fSUAnZN4UEoeTsL1Lm4P7kRcvA
```

**응답 예시(JSON)**
```json
{
    "id": "test1",
    "pw": "$2a$10$KSAzA388kbsSZNvgLc1enO.EXAlKlBn/XmbNPd.xKC5f3ONXyIQrK",
    "nickname": "test1_nick",
    "email": "testmail1@kangwon.ac.kr",
    "authCode": 915897,
    "authStatus": true,
    "authority": "ROLE_USER",
    "mid": 4
}
```


## TODO
- ID로 검색 실패시 404 반환하게 수정

## 참고
- 주소 -> 위도/경도 변환
  https://developers.kakao.com/docs/latest/ko/local/dev-guide#address-coord-request
- 위도/경도 -> 주소 변환
  https://developers.kakao.com/docs/latest/ko/local/dev-guide#coord-to-address
- 위도/경도 찾기
  https://apis.map.kakao.com/web/sample/addMapClickEventWithMarker/
