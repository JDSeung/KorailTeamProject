<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String root = request.getContextPath()+"/resources/";
	String rootCss = root+"front/css/";
	String rootJs = root+"front/js/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="<%=root%>jquery-3.2.1.min.js" ></script>
<link rel="stylesheet" href="<%=rootCss%>admin/login.css">
<script type="text/javascript" src="<%=rootJs %>admin/login.js"></script>
<title>로그인</title>
</head>
<body>
<input type="hidden" id="loginCheck" value="${loginCheck}"/>
	<div id="loginWrap" class="loginWrap">
		<div class="container">
			<h2>관리자 로그인</h2>
			<form name="loginForm" id="loginForm" method="post">
				<table id="adminLogin" class="adminLogin">
					<tr>
						<td><label for="id" class="labtxt">ID</label></td>
						<td><input type="text" id="adminId" name="adminId" class="logintxt"/></td>
						<td rowspan="2">
							<button id="btnLogin" class="btnLogin" type="button">로그인</button>
						</td>
					</tr>
					<tr>
						<td><label for="pw" class="labtxt">PW</label></td>
						<td><input type="password" id="adminPw" name="adminPw" class="logintxt"/></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>