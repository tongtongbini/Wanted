<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="../bootstrap3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="../bootstrap3.3.7/jquery/jquery-3.2.1.min.js"></script>
<script src="../bootstrap3.3.7/js/bootstrap.min.js"></script>

<title>Bs04Image.jsp</title>
</head>
<body>
	
	<div class="container-fluid">
		<h2>이미지</h2>
		
		<div class="row">
			<h3>img-rounded클래스</h3>
			<p>이미지 가장자리 부분을 라운드 처리</p>
			<img src="../images/2.png" class="img-rounded"/>
		</div>
		
		<div class="row">
			<h3>img-circle 클래스</h3>
			<p>이미지를 원형으로 처리</p>
			<img src="../images/4.png" class="img-circle"/>
		</div>
		
		<div class="row">
			<h3>img-thumbnail 클래스</h3>
			<p>이미지 가장자리를 얇은 보더로 처리</p>
			<img src="../images/korea.jpg" class="img-thumbnail"/>
		</div>
		<div class="row">
			<h3>img-responsive 클래스</h3>
			<p>화면 사이즈에 따라 이미지 사이즈가 변함(반응형)</p>
			<img src="../images/korea.jpg" class="img-responsive"/>
		</div>
		
			<div class="row">
	  <div class="col-md-4">
	    <div class="thumbnail">
	      <a href="../images/4.png">
	        <img src="../images/4.png" alt="Lights" style="width:100%">
	        <div class="caption">
	          <p>이미지 설명이 들어가요</p>
	        </div>
	      </a>
	    </div>
	  </div>
	  <div class="col-md-4">
	    <div class="thumbnail">
	      <a href="../images/4.png">
	        <img src="../images/4.png" alt="Lights" style="width:100%">
	        <div class="caption">
	          <p>이미지 설명이 들어가요</p>
	        </div>
	      </a>
	    </div>
	  </div>
	  <div class="col-md-4">
	    <div class="thumbnail">
	     <a href="../images/4.png">
	        <img src="../images/4.png" alt="Lights" style="width:100%">
	        <div class="caption">
	          <p>이미지 설명이 들어가요</p>
	        </div>
	      </a>
	    </div>
	  </div>
	</div> 
	
	
	
	</div>



</body>
</html>