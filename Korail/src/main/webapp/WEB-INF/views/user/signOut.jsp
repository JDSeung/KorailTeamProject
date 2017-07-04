<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title>회원탈퇴</title>
<script type="text/javascript" src="<%=root%>jquery-3.2.1.min.js" /></script>
<script type="text/javascript" src="<%=root%>jquery/jquery-ui.js" /></script>
<link rel="stylesheet" href="<%=rootJquery%>jquery-ui.css">
<link rel="stylesheet" href="<%=rootJquery%>jquery-ui.structure.css">
<link rel="stylesheet" href="<%=rootJquery%>jquery-ui.theme.css">
<link rel="stylesheet" href="<%=rootCss%>basic.css">
<link rel="stylesheet" href="<%=rootCss%>user/edit.css" />
<script type="text/javascript" src="<%=rootJS%>user/edit.js"></script>
</head>
<body>
	<div class="header">
		<jsp:include page="../main/header.jsp" />
	</div>

	<div class="wrap" id="wrap">
		<div class="container" id="contdainer">
			<section class="signOutContainer">
				<div>
					<h2>회원탈퇴</h2>
					<hr />
				</div>
				<div class="signOutContent">
					<form class="signOutPassword" id="signOutPassword">
						<div class="signOutContent">
							<div class="logo">
								<img src="<%=root%>/front/img/logo.gif" alt="Korail" />
							</div>
							<div>
								<ul>
									<li><label>비밀번호</label>
									<input type="text" id="newPw" name="editPw" /></li>
									<li class="pwSignOut"><button type="button" class="ui-button ui-corner-all ui-widget">PW변경</button></li>
								</ul>
							</div>
						</div>
					</form>
				</div>
			</section>
		</div>
	</div>

	<div class="header">
		<jsp:include page="../main/footer.jsp" />
	</div>
</body>
</html>
