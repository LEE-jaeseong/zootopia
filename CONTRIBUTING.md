## 프로젝트 기여 가이드
- 불법주정차 단속 공공 DataSet을 활용하여 프로젝트에 기여할 수 있습니다.

### 브랜치명명법
 예를 들어 안산시인경우 dev-ansan 로 명명해주시면됩니다.
 
 
###1. 데이터 가공
 1-1 불법 주정차 단속 데이터셋 추가를 위해서는 관리기관, 적발일자,년,월,일,도로명주소,위도 경도,단속방식 데이터가 필요합니다.
 
 -> 적발일자로적발일자,단속월,단속일,단속,단속시간 얻기
 -> 도로명주소로 네이버API를 이용하여 위도,경도구하기
 
 1-2 CCTV 확충지역을 조회를 위해서는  
 
###2. 데이터 분석

 데이터를 추가하셨다면, 고정형 CCTV 단속현황,불법주정차단속현황,CCTV 확충지역, 불법주정차 심각도 분석을 할 수 있습니다.
 고정형 CCTV 단속현황인경우,FixedCCTVDashboard.java
 불법주정차 단속현황인경우, SituationIllegalBoard.java
 CCTV 확충지역인경우, AnalysisCCTV.java
 불법주정차 심각지역인경우, AnalysisSerious.java 를 통해 분석이 가능합니다.


###3. Controller에 URL 매핑 및 서비스추가 확인 

- URL 매핑 규칙
src/main/java HomeController.java에 URL 매핑규칙에 맞게 매핑시켜주시면 됩니다.
예를들어 안산시인 경우 
- /zootopia/ansan/dashboard   : 고정형CCTV dashboard URL
- /zootopia/ansan/situation/sangrok  : 안산시(상록구) 불법주정차 단속현황
- /zootopia/ansan/situation/danwon : 안산시(단원구) 불법주정차 단속현황
- /zootopia/ansan/analytics/cctv   : 안산시의 CCTV 확충지역 분석 URL
- /zootopia/ansan/analytics/seriousArea : 불법주정차 심각지수 분석 
