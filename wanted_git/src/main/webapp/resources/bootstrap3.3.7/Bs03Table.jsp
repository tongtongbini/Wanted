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

<title>Bs03Table.jsp</title>

</head>
<body>
   <div class="container-fluid">
      <h2>기본테이블</h2>
      
      <table class="table">
      <thead>
         <tr>
            <th>번호</th>
            <th>제목</th>
            <th>날짜</th>
         </tr>
       </thead>
         <tr>
            <td>1</td>
            <td>길동이 장가가요</td>
            <td>18/01/04</td>
         </tr>
         <tr>
            <td>2</td>
            <td>오늘 날씨 추워요ㅜㅜ</td>
            <td>18/01/04</td>
         </tr>
         <tr>
            <td>3</td>
            <td>나는 자바 개발자 ~</td>
            <td>18/01/04</td>
         </tr>
        
      </table>
   
   
   <h2>줄무늬가 있는 테이블</h2>
      
      <table class="table table-striped">
      <thead>
         <tr>
            <th>번호</th>
            <th>제목</th>
            <th>날짜</th>
         </tr>
      </thead>
         <tr>
            <td>1</td>
            <td>길동이 장가가요</td>
            <td>18/01/04</td>
         </tr>
         <tr>
            <td>2</td>
            <td>오늘 날씨 추워요ㅜㅜ</td>
            <td>18/01/04</td>
         </tr>
         <tr>
            <td>3</td>
            <td>나는 자바 개발자 ~</td>
            <td>18/01/04</td>
         </tr>
      
      </table>
   
   
   
   
   <h2>보더(border)가 있는 테이블</h2>
      
      <table class="table table-bordered">
      <thead>
         <tr>
            <th>번호</th>
            <th>제목</th>
            <th>날짜</th>
         </tr>
      </thead>
         <tr>
            <td>1</td>
            <td>길동이 장가가요</td>
            <td>18/01/04</td>
         </tr>
         <tr>
            <td>2</td>
            <td>오늘 날씨 추워요ㅜㅜ</td>
            <td>18/01/04</td>
         </tr>
         <tr>
            <td>3</td>
            <td>나는 자바 개발자 ~</td>
            <td>18/01/04</td>
         </tr>
         
      </table>
   
   
      <h2>마우스오버(hover)효과가 있는 테이블</h2>
      
      <table class="table table-hover">
      <thead>
         <tr>
            <th>번호</th>
            <th>제목</th>
            <th>날짜</th>
         </tr>
      </thead>
         <tr>
            <td>1</td>
            <td>길동이 장가가요</td>
            <td>18/01/04</td>
         </tr>
         <tr>
            <td>2</td>
            <td>오늘 날씨 추워요ㅜㅜ</td>
            <td>18/01/04</td>
         </tr>
         <tr>
            <td>3</td>
            <td>나는 자바 개발자 ~</td>
            <td>18/01/04</td>
         </tr>
         
      </table>
   
   
   
   <h2>보더, 줄무늬 ,hover 효과가 있는 테이블</h2>
      
      <table class="table table-hover table-striped table-bordered">
      <thead>
         <tr>
            <th>번호</th>
            <th>제목</th>
            <th>날짜</th>
         </tr>
      </thead>
         <tr>
            <td>1</td>
            <td>길동이 장가가요</td>
            <td>18/01/04</td>
         </tr>
         <tr>
            <td>2</td>
            <td>오늘 날씨 추워요ㅜㅜ</td>
            <td>18/01/04</td>
         </tr>
         <tr>
            <td>3</td>
            <td>나는 자바 개발자 ~</td>
            <td>18/01/04</td>
         </tr>
         
      </table>
      
      
      
      <h2>테이블에 사용할수 있는 클래스 테이블</h2>
      
      <table class="table">
      <thead>
         <tr class="success">
            <th>번호</th>
            <th>success</th>
            <th>날짜</th>
         </tr>
      </thead>
         <tr class="danger">
            <td>1</td>
            <td>danger</td>
            <td>18/01/04</td>
         </tr>
         <tr class="info">
            <td>2</td>
            <td>info</td>
            <td>18/01/04</td>
         </tr>
         <tr class="warning">
            <td>3</td>
            <td>warning</td>
            <td>18/01/04</td>
         </tr>
         <tr class="active">
            <td>3</td>
            <td>active</td>
            <td>18/01/04</td>
         </tr>
         
      </table>
      
      
      
      <h2>반응형 테이블 만들기</h2>
      <h4>반응형 테이블은 768px미만의 장치에서는 가로스크롤이 생기게 된다. 
      그보다 큰 장치에서는 기본테이블과 차이는 없다.</h4>
      
      <div class="table-responsive">
      <table class="table">
      <thead>
         <tr>
            <th>번호</th>
            <th>제목</th>
            <th>날짜</th>
         </tr>
        </thead>
         <tr>
            <td>1</td>
            <td>길동이 장가가요</td>
            <td>18/01/04</td>
         </tr>
         <tr>
            <td>2</td>
            <td>오늘 날씨 추워요ㅜㅜ</td>
            <td>18/01/04</td>
         </tr>
         <tr>
            <td>3</td>
            <td>나는 자바 개발자 ~</td>
            <td>18/01/04</td>
         </tr>
       
      </table>
      </div>
      
   
   
   </div>   

</body>
</html>