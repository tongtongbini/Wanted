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

<title>BS05Alert.jsp</title>
</head>
<body>
	
	<div class="container-fluid">
		<h2>alert 일반</h2>
		<div class="alert alert-success">alert-success 경고상자입니다.</div>
		<div class="alert alert-info">alert-info 경고상자입니다.</div>
		<div class="alert alert-warning">alert-warning 경고상자입니다.</div>
		<div class="alert alert-danger">alert-danger 경고상자입니다.</div>	
		<div class="alert alert-active">alert-active 경고상자입니다.</div>
	
	<h2>닫기 기능이 있는 alert</h2>
		<div class="alert alert-success alert-dismissable"><a href="#" class="close" data-dismiss="alert" aria-label="close">X
		</a>alert-success 경고상자입니다.</div>
	
	
		<div class="alert alert-info alert-dismissable"><a href="#" class="close" data-dismiss="alert" aria-label="close">X
		</a>alert-success 경고상자입니다.</div>
	
	
		<div class="alert alert-warning alert-dismissable"><a href="#" class="close" data-dismiss="alert" aria-label="close">닫기
		</a>alert-success 경고상자입니다.</div>
	
	
		<div class="alert alert-danger alert-dismissable"><a href="#" class="close" data-dismiss="alert" aria-label="close">CLOSE
		</a>alert-success 경고상자입니다.</div>
	
	
	
	<h2>애니메이션이 있는 닫기 기능을 구현한 alert</h2>
		<div class="alert alert-success alert-dismissable fade in"><a href="#" class="close" data-dismiss="alert" aria-label="close">X
		</a>alert-success 경고상자입니다.</div>
	
		<div class="alert alert-info alert-dismissable fade in"><a href="#" class="close" data-dismiss="alert" aria-label="close">X
		</a>alert-success 경고상자입니다.</div>
	
	
		<div class="alert alert-warning alert-dismissable fade in"><a href="#" class="close" data-dismiss="alert" aria-label="close">닫기
		</a>alert-success 경고상자입니다.</div>
	
	
		<div class="alert alert-danger alert-dismissable fade in"><a href="#" class="close" data-dismiss="alert" aria-label="close">CLOSE
		</a>alert-success 경고상자입니다.</div>
	
	
	</div>
	
	



</body>
</html>