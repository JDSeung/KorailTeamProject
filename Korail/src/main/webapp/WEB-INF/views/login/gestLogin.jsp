<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%
	String root = request.getContextPath() + "/resources/";
	String rootJquery = root + "jquery/";
	String rootCss = root + "front/css/";
	String rootJS = root + "front/js/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Korail</title>
<script type="text/javascript" src="<%=root%>jquery-3.2.1.min.js" /></script>
<script type="text/javascript" src="<%=root%>jquery/jquery-ui.js" /></script>
<link rel="stylesheet" href="<%=rootJquery%>jquery-ui.css">
<link rel="stylesheet" href="<%=rootJquery%>jquery-ui.structure.css">
<link rel="stylesheet" href="<%=rootJquery%>jquery-ui.theme.css">
<link rel="stylesheet" href="<%=rootCss%>basic.css">
<link rel="stylesheet" href="<%=rootCss%>login/guestlogin.css" />
<script type="text/javascript" src="<%=rootJS%>login/guestlogin.js"></script>
</head>
<body>
	<input type="hidden" id="loginCheck" value="${sessionScope.loginCheck}" />
	<%
		session.removeAttribute("loginCheck");
	%>
	<div class="header">
		<jsp:include page="../main/header.jsp" />
	</div>

	<div class="wrap" id="wrap">
		<div class="container" id="container">
			<section id="login" class="login">
				<h2>비회원로그인</h2>
				<div class="loginContent" id="loginContent">
					<form id="loginForm" class="loginForm">
						<div class="loginCenter">
							<div class="box1">
								<table class="glogintbl">
									<tr>
										<th>E-mail</th>
										<td><input type="text" id="userEmail" name="userEmail" class="inp" maxlength="20"/></td>
										<td rowspan="3"><button type="button" id="guestLogin" class="ui-button ui-corner-all ui-widget ui-okBtn ">확인</button></td>
									</tr>
									<tr>
										<th><label for="userPw"class="pwa">비밀번호</label></th>
										<td><input type="password" id="userPw" class ="pwa inp"name="userPw" maxlength="30"/></td>
									</tr>
								</table>
								<p class="idAndpw" id="idAndpw">* 비회원 예매시 입력하신 이메일과 비밀번호를 입력해 주십시오.</p>
							</div>
						</div>
					</form>
				</div>
			</section>
		</div>
	</div>

	<div class="footer">
		<jsp:include page="../main/footer.jsp" />
	</div>
</body>
</html>