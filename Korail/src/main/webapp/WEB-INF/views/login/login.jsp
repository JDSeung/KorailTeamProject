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
<link rel="stylesheet" href="<%=rootCss%>login/login.css" />
<script type="text/javascript" src="<%=rootJS%>login/login.js"></script>
<script type="text/javascript" src="<%=rootJS%>rsa/jsbn.js"></script>
<script type="text/javascript" src="<%=rootJS%>rsa/rsa.js"></script>
<script type="text/javascript" src="<%=rootJS%>rsa/prng4.js"></script>
<script type="text/javascript" src="<%=rootJS%>rsa/rng.js"></script>
</head>
<body>
	<input type="hidden" id="loginCheck" value="${sessionScope.loginCheck}" />
	<input type="hidden" id="RSAModulus" value="${RSAModulus}"/>
     <input type="hidden" id="RSAExponent" value="${RSAExponent}"/>
	<%
		session.removeAttribute("loginCheck");
	%>
	<div class="header">
		<jsp:include page="../main/header.jsp" />
	</div>

	<div class="wrap" id="wrap">
		<div class="container" id="container">
			<section id="login" class="login">
				<h2>로 그 인</h2>
				<div class="loginContent" id="loginContent">
					<form id="loginForm" class="loginForm">
						<div class="loginCenter">
							<div class="box1">
								<ul>
									<li><label id="uId">아 이 디</label>
									<input type="text" id="userId" name="userId" maxlength="15"/>
									</li>
									<li><label id="uPw">패스워드</label>
									<input type="password" id="userPw" name="userPw" maxlength="20"/>
									</li>
									<li id="loginBtn" class="loginBtn">
									<button type="button" class="ui-button ui-corner-all ui-widget ui-okBtn ">확인</button></li>
								</ul>
								<div class="aha">
									<button id="btnid"  type="button" class="ui-button ui-corner-all ui-widget">아이디찾기</button>
									<button id="btnpw" type="button" class="ui-button ui-corner-all ui-widget">비밀번호찾기</button>
									<button id="signup" type="button" class="ui-button ui-corner-all ui-widget" >회원가입</button>
								</div>
								<p class="idAndpw" id="idAndpw">* 아이디와 비밀번호는 영문자 대소문자를 구별 합니다.</p>
							</div>
							<div class="box2">
								<p>
									비회원은 아래 버튼을 이용하시기 바랍니다.
								</p>
								<ul>
									<li><button type="button" id="guestRes" class="ui-button ui-corner-all ui-widget">비회원예매</button></li>
									<li><button type="button" id="guestResSearch" class="ui-button ui-corner-all ui-widget">비회원 예매 조회</button></li>
								</ul>
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