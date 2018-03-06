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

<style>
	div{
		height:50px; margin:0 0 20px 0;
	}
</style>

<title>Bs02GridSystem.jsp</title>
</head>
<body>

	<div class="container-fluid">
		<h2>부트스트랩 그리드 시스템</h2>
		<!-- 
			부트스트랩의 그리드 시스템은 페이지 전체를 12개로 나눌수 있도록 컬럼을 제공한다.
			12개의 열을 개별적으로 사용하지 않으려면 열을 그룹화하여 더 넓은 열을 만들수도 있다.
			
			사용법 : col-xx-컬럼크기
			-xx : 디바이스에 따라 아래 4가지가 있다.
				•xs (for phones)
				•sm (for tablets)
				•md (for small laptops)
				•lg (for laptops and desktops)
			-컬럼크기 : 1~12까지의 숫자로 작성한다		
			-하나의 레이어를 작성할때 row 클래스를 사용한다.	
		-->
		<div class="row">
			<div class="col-sm-4 col-md-4" style="background-color: red">나는 col-sm-4
			</div>
			<div class="row">
				<div class="col-sm-4 col-md-4" style="background-color: blue">나는
					col-sm-4</div>
				<div class="row">
					<div class="col-sm-4 col-md-4" style="background-color: green">나는
						col-sm-4</div>
		</div>
		
		<div class="row">
			<div class="col-sm-4 col-md-4" style="background-color: red">
			나는 4개의 컬럼을 가짐
			</div>
			<div class="row">
				<div class="col-sm-8 col-md-8" style="background-color: yellow">
				나는 8개의 컬럼을 가짐
			</div>
			
		</div>
</body>
</html>