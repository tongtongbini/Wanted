<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>sellList</title>
<link href="./common/bootstrap3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="./common/bootstrap3.3.7/jquery/jquery-3.2.1.min.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){

	});
</script>
</head>
<body>
<div class="container">
	<h3>판매리스트 - <small>등록된 판매글을 볼 수 있습니다.</small> </h3>
	<table class="table table-bordered">
		<thead>
			<colgroup>
				<col width="5%" />
				<col width="*" />
				<col width="15%" />
				<col width="10%" />
				<col width="15%" />
				<col width="5%" />
			</colgroup>
			<tr class="success">
				<th class="text-center">번호</th>
				<th class="text-center">제목</th>
				<th class="text-center">금액</th>
				<th class="text-center">작성자</th>
				<th class="text-center">작성일</th>
				<th class="text-center">조회수</th>
				<!-- <th class="text-center">첨부</th> -->
			</tr>
		</thead>
		<tbody>
			<!-- 리스트 반복 시작-->
			<c:choose>
				<c:when test="${empty lists }">
				<tr>
					<td colspan="6" class="text-center">
						등록된 글이 없습니다.
					</td>
				</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${lists }" var="list" varStatus="loop">
					<tr>
						<td class="text-center">${list.idx }</td>
						<td class="text-center">
							<a href="<c:url value="sellView.do" />?idx=${list.idx}">
								${list.title }
							</a>
						</td>
						<td class="text-center">${list.price }원</td>
						<td class="text-center">${list.id }</td>
						<td class="text-center">${list.regidate }</td>
						<td class="text-center">0</td>
						<!-- <td class="text-center">첨부</td> -->
					</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			
			<!-- 리스트 반복 끝 -->
		</tbody>
	</table>

	<div class="row text-right" style="padding-right: 50px;">
		<!-- 각종 버튼 부분 -->
		<!-- <button type="reset" class="btn">Reset</button> -->
		<button type="button" class="btn btn-info"
			onclick="location.href='sellWrite.do';">글쓰기</button>
	</div>
</div>
</body>
</html>