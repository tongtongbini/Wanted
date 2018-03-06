<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>sellForm</title>
<link href="./common/bootstrap3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="./common/bootstrap3.3.7/jquery/jquery-3.2.1.min.js" type="text/javascript"></script>
<style type="text/css">
#imgView img {
            max-width: 150px;
            margin-left: 10px;
            margin-right: 10px;
        }
</style>

<script type="text/javascript">
	$(document).ready(function(){
		
		$("#attchFile").on("change", handleImgFileSelect);
	});
	
	function handleImgFileSelect(e)
	{
        // 이미지 정보들을 초기화
        sel_files = [];
        $("#imgView").empty();

        var files = e.target.files;
        var filesArr = Array.prototype.slice.call(files);

        var index = 0;
        filesArr.forEach(function(f) {
        	
            if(!f.type.match("image.*")) 
            {
                alert("확장자는 이미지 확장자만 가능합니다.");
                return;
            }

            sel_files.push(f);

            var reader = new FileReader();
            reader.onload = function(e) {
                var html = "<img src=\"" + e.target.result + "\" data-file='" + f.name + "'>";
                		
                $("#imgView").append(html);
                index++;
            }
            
            reader.readAsDataURL(f);
        });
    }
</script>
</head>
<body>
<div class="container">
	<h3>판매 글작성 - <small>판매글을 등록합니다.</small> </h3>
	
	<div class="form-group">
	<form name="sellFrm" method="post" action="<c:url value="sellWriteAction.do?id=hong1" />"
		enctype="multipart/form-data">
		<table class="table table-bordered" id="writeTable" style="width: 600px;">
			<tr>
				<td class="text-center">브랜드</td>
				<td>
					<select class="form-control" name="brand">
						<option value="">--선택하세요--</option>
						<option selected="selected" value="현대">현대</option>
						<option value="기아">기아</option>
						<option value="쉐보레">쉐보레</option>
						<option value="르노삼성자동차">르노삼성자동차</option>
						<option value="쌍용자동차">쌍용자동차</option>
					</select>
				</td>
			</tr>
			<tr>
				<td class="text-center">모델</td>
				<td>
					<select class="form-control" name="model">
						<option value="">--선택하세요--</option>
						<option selected="selected" value="쏘나타">쏘나타</option>
						<option value="아반떼">아반떼</option>
						<option value="그랜저">그랜저</option>
						<option value="제네시스">제네시스</option>
						<option value="산타페">산타페</option>
					</select>
				</td>
			</tr>
			<tr>
				<td class="text-center">등급</td>
				<td>
					<select class="form-control" name="grade">
						<option value="">--선택하세요--</option>
						<option selected="selected" value="2.0 GDI">2.0 GDI</option>
						<option value="1.6 GDI">1.6 GDI</option>
					</select>
				</td>
			</tr>
			<tr>
				<td class="text-center">연료</td>
				<td>
					<select class="form-control" name="fuel">
						<option value="">--선택하세요--</option>
						<option selected="selected" value="가솔린">가솔린</option>
						<option value="디젤">디젤</option>
					</select>
				</td>
			</tr>
			<tr>
				<td class="text-center">연식</td>
				<td>
					<input type="text" name="year" class="form-control" />
				</td>
			</tr>
			<tr>
				<td class="text-center">주행거리</td>
				<td>
					<input type="text" name="km" class="form-control" />
				</td>
			</tr>
			<tr>
				<td class="text-center">변속기</td>
				<td>
					<input type="text" name="transmission" class="form-control" />
				</td>
			</tr>
			<tr>
				<td class="text-center">가격</td>
				<td>
					<input type="text" name="price" class="form-control" />
				</td>
			</tr>
			<tr>
				<td class="text-center">제목</td>
				<td>
					<input type="text" name="title" class="form-control" />
				</td>
			</tr>
			<tr>
				<td class="text-center">내용</td>
				<td>
					<textarea name="contents" class="form-control" rows="5"></textarea>
				</td>
			</tr>
			<tr>
				<td class="text-center">첨부파일</td>
				<td>
					<input type="file" id="attchFile" multiple="multiple" class="form-control" name="attachedfile" />
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div id="imgView"></div>
				</td>
			</tr>
		</table>
		
		
		<div class="row text-right" style="padding-right: 50px;">
		<!-- 각종 버튼 부분 -->
		<!-- <button type="reset" class="btn">Reset</button> -->
		<button type="submit" class="btn btn-info">완료</button>
		<button type="button" class="btn btn-primary"
				onClick="location.href='sellList.do';">리스트보기</button>
	</div>
	</form>
	</div>
	
</div>
</body>
</html>