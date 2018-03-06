<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 
부트스트랩(Bootstrap)
	:부트스트랩은 웹에서 반응형웹  페이지를 개발하기 위해 가장 널리 사용되는 HTML,CSS,JS 프레임워크임
	
	배포사이트 : http://getbootstrap.com
	한글사이트 : http://bootstrapk.com
	2018년 1월 현재 4.0.0beta 버전출시 
	안정화 버전 3.3.7

뷰포트
	width=device-width : 장치의 화면폭에 따라 페이지의 폭을 설정함.(디바이스에 따라 다름) device-width는 100%의
						스케일에서 CSS픽셀들로 계산된 화면의 폭을 의미함
	initial-scale=1 : 페이지가 처음 브라우저에 의해 로드된 초기 줌 레벨을 설정함(초기확대값)
 -->
 
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- 
CDN(Content Delivery Network) :
	접속자가 인터넷상에서 가장 가까운곳의 서버의 컨텐츠를 전송 받아 트래픽이 특정 서버에 집중되지 않고 각 서버로 분산되도록 
	하는 기술을 말한다.
 -->
 
 <!--  
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
-->

<!-- External방식으로 부트스트랩사용 -->

<link href="../bootstrap3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="../bootstrap3.3.7/jquery/jquery-3.2.1.min.js"></script>
<script src="../bootstrap3.3.7/js/bootstrap.min.js"></script>


<title>Bs01Start.jsp</title>
</head>
<body>
	
	<div class="container">
		<h2>컨테이너사용1</h2>
		<p>해당 컨테이너는 반응형 고정폭 컨테이너를 제공함</p>
	</div>
	
	
	<div class="container-fluid">
		<h2>컨테이너-플루이드사용</h2>
		<p>해당 컨테이너는 뷰포트의 전체폭에 펼쳐진 전체 폭 컨테이너를 제공함</p>
	</div>

	<div class="container">
  <h1>Hello World!</h1>
  <div class="row">
    <div class="col-sm-6" style="background-color:yellow;">
      <p>Lorem ipsum...</p>
    </div>
    <div class="col-sm-5" style="background-color:pink;">
      <p>Sed ut perspiciatis...</p>
    </div>
    <div class="col-sm-4" style="background-color:blue;">
      <p>Sed ut perspiciatis...</p>
    </div>
  </div>
</div> 


</body>
</html>