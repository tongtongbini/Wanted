<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>sellView</title>
<link href="./common/bootstrap3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="./common/bootstrap3.3.7/jquery/jquery-3.2.1.min.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
	});
</script>
</head>
<body>
<div class="container">
	<h3>판매글 상세보기 - <small>판매글 상세보기 페이지 입니다.</small> </h3>
	
	<div class="form-group">
		<table class="table table-bordered" style="width: 600px;">
			<tr>
				<td class="text-center">브랜드</td>
				<td>
					${dto.brand }
				</td>
			</tr>
			<tr>
				<td class="text-center">모델</td>
				<td>
					${dto.model }
				</td>
			</tr>
			<tr>
				<td class="text-center">등급</td>
				<td>
					${dto.grade }
				</td>
			</tr>
			<tr>
				<td class="text-center">연료</td>
				<td>
					${dto.fuel }
				</td>
			</tr>
			<tr>
				<td class="text-center">연식</td>
				<td>
					${dto.year }
				</td>
			</tr>
			<tr>
				<td class="text-center">주행거리</td>
				<td>
					${dto.km }
				</td>
			</tr>
			<tr>
				<td class="text-center">변속기</td>
				<td>
					${dto.transmission }
				</td>
			</tr>
			<tr>
				<td class="text-center">가격</td>
				<td>
					${dto.price }
				</td>
			</tr>
			<tr>
				<td class="text-center">제목</td>
				<td>
					${dto.title }
				</td>
			</tr>
			<tr>
				<td class="text-center">내용</td>
				<td>
					${dto.contents }
				</td>
			</tr>
			<tr>
				<td class="text-center">이미지</td>
				<td>
				<c:choose>
					<c:when test="${empty file}">
						첨부파일 없음
					</c:when>
					<c:otherwise>
						<c:forEach items="${file }" var="file" varStatus="loop">
							<img id="imgFile" src="./common/upload/${file.serverfile }" width="150px" height="100px" />
							<!-- <br/> -->
						</c:forEach>
					</c:otherwise>
				</c:choose>
				</td>
			</tr>
			<tr>
				<td class="text-center">첨부파일</td>
				<td>
				<c:choose>
					<c:when test="${empty file}">
						첨부파일 없음
					</c:when>
					<c:otherwise>
						<c:forEach items="${file }" var="file" varStatus="loop">
							<a href="fileDownload.do?idx=${dto.idx }&originalfile=${file.originalfile}">
								${file.originalfile }
							</a>	<br/>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				</td>
			</tr>
		</table>
		
		<div class="row text-center" style="padding-right: 50px;">
			<!-- 각종 버튼 부분 -->
			<!-- <button type="reset" class="btn">Reset</button> -->
			<button type="button" class="btn btn-info"
				onClick="location.href='sellList.do';">리스트보기</button>
			<button type="button" class="btn btn-danger"
				onClick="location.href='sellDelete.do?idx=${dto.idx }';">삭제</button>
			<button type="button" class="btn btn-primary"
				onClick="location.href='sellModifyForm.do?idx=${dto.idx}';">수정</button>
		</div>
	</div>
	
</div>
</body>
</html>