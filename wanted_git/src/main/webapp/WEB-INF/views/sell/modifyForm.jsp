<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>modifyForm</title>
<link href="./common/bootstrap3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="./common/bootstrap3.3.7/jquery/jquery-3.2.1.min.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
	});
</script>
</head>
<body>
<div class="container">
	<h3>판매 글 수정 - <small>판매글을 수정합니다.</small> </h3>
	
	<div class="form-group">
		<form method="post" action="<c:url value="sellModifyAction.do"/>" enctype="multipart/form-data">
		<input type="hidden" name="idx" value="${dto.idx}" />
		<table class="table table-bordered" style="width: 600px;">
			<tr>
				<td class="text-center">브랜드</td>
				<td>
					<input type="text" class="form-control" name="brand" value="${dto.brand }" readonly />
				</td>
			</tr>
			<tr>
				<td class="text-center">모델</td>
				<td>
					<input type="text" class="form-control" name="model" value="${dto.model }" readonly />
				</td>
			</tr>
			<tr>
				<td class="text-center">등급</td>
				<td>
					<input type="text" class="form-control" name="grade" value="${dto.grade }" readonly />
				</td>
			</tr>
			<tr>
				<td class="text-center">연료</td>
				<td>
					<input type="text" class="form-control" name="fuel" value="${dto.fuel }" readonly />
				</td>
			</tr>
			<tr>
				<td class="text-center">연식</td>
				<td>
					<input type="text" class="form-control" name="year" value="${dto.year }" readonly />
				</td>
			</tr>
			<tr>
				<td class="text-center">주행거리</td>
				<td>
					<input type="text" class="form-control" name="km" value="${dto.km }" readonly />
				</td>
			</tr>
			<tr>
				<td class="text-center">변속기</td>
				<td>
					<input type="text" class="form-control" name="transmission" value="${dto.transmission }" readonly />
				</td>
			</tr>
			<tr>
				<td class="text-center">가격</td>
				<td>
					<input type="text" class="form-control" name="price" value="${dto.price }" />
				</td>
			</tr>
			<tr>
				<td class="text-center">제목</td>
				<td>
					<input type="text" class="form-control" name="title" value="${dto.title }" />
				</td>
			</tr>
			<tr>
				<td class="text-center">내용</td>
				<td>
					<textarea name="contents" class="form-control" rows="5">${dto.contents }</textarea>
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
						<div>
						<c:forEach items="${file }" var="file" varStatus="loop">
							<img src="./common/upload/${file.serverfile }" width="100px" height="100px" />
							<br/>
						</c:forEach>
						</div>
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
							${file.originalfile }&nbsp;&nbsp;&nbsp;
							<input type="button" style="width: 40px;" value="삭제"
								onClick="location.href='fileDelete.do?originalfile=${file.originalfile}&idx=${dto.idx }';" />
							<br/>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				</td>
			</tr>
			<tr>
				<td class="text-center">첨부파일 추가</td>
				<td>
					<input type="file" multiple="multiple" class="form-control" name="attachedfile" />
				</td>
			</tr>
		</table>
		
		<div class="row text-center" style="padding-right: 50px;">
			<!-- 각종 버튼 부분 -->
			<!-- <button type="reset" class="btn">Reset</button> -->
			<button type="button" class="btn btn-info"
				onClick="location.href='sellList.do';">리스트보기</button>
			<button type="submit" class="btn btn-primary">수정</button>
		</div>
		</form>
	</div>
	
</div>
</body>
</html>