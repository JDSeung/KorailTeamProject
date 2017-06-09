<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	/* 검색 버튼 클릭 시 처리 이벤트 */
	$("#insertdata").click(function(){
		$("#insertform").attr({"method":"get",
			"action":"insert"});
		alert($("#insertform").html());
		$("#insertform").submit();
	});
});
</script>
</head>
<body>
<h1>
	Hello world!  
</h1>
	<form id="insertform">
		<button id="insertdata">실행</button>
	</form>
<P>  The time on the server is ${serverTime}. </P>
</body>
</html>
