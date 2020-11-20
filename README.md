# Project Document

팀원: 이혜진, 장덕인

# Architecture

- **Spirng boot** 기반
- DB: MyBatis 연동
- Server: tomcat 9.0

![Project%20Document%20b727de3633f640cbac02eba1eb0a8b97/Untitled.png](Project%20Document%20b727de3633f640cbac02eba1eb0a8b97/Untitled.png)

# Basic Functions

### 메인화면

- 매물 실거래가 시/도, 구/군, 동 옵션 선택하여 검색
- 결과화면에서 각 항목 클릭 시 상세정보 출력
- 공지사항 게시판
- Q&A 게시판

### 유저관리

- 로그인 / 회원가입 / 비밀번호 찾기 구현
- 개인 회원의 경우 자신의 정보 수정 가능
- 관리자의 경우 전체 회원관리 가능

# Extra Functions

- 관심지역 설정하여 모아보기 기능 제공
- 매물 주변 교통정보, 편의시설 정보를 상세 화면에 제공
- 부동산 관련 뉴스기사 제공
- 매물별 실거래가 동향 그래프로 제공
- 각 지역별 생활권계획 정보를 불러와 집 선택시 유용한 정보 제공