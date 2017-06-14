<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String root = request.getContextPath()+"/resources/";
	String rootCss = root+"front/css/";
%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="<%=rootCss%>res/selectSeat.css">
<meta charset="UTF-8">
<title>Korail|좌석선택</title>
</head>
<body>
<div class="seatChoice">
	<h2>좌석선택</h2>
	<ul>
		<li>원하시는 좌석을 선택하여 주십시오.</li>
		<li>발매가 가능한 좌석을 선택하실 수 있습니다.</li>
    	<li>원하시는 좌석을 선택 후 선택좌석 ‘예약하기’ 버튼을 클릭하시면 예약이 완료됩니다.(복수선택가능)</li>
    	<li>원하지 않은 좌석이 선택된 경우에는 좌석을 한번 더 클릭하시면 취소됩니다.</li>
	</ul>
	<ul class="trainNo">
  	
  	</ul>
  	<table class = "strain">
    
  </table>
</div>
</body>
</html>