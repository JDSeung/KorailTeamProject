<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>본인 인증 || 회원가입 Korail</title>
<script type="text/javascript" src="<%=root%>jquery-3.2.1.min.js" /></script>
<script type="text/javascript" src="<%=root%>jquery/jquery-ui.js" /></script>
<link rel="stylesheet" href="<%=rootJquery%>jquery-ui.css">
<link rel="stylesheet" href="<%=rootJquery%>jquery-ui.structure.css">
<link rel="stylesheet" href="<%=rootJquery%>jquery-ui.theme.css">
<link rel="stylesheet" href="<%=rootCss%>basic.css">
<link rel="stylesheet" href="<%=rootCss%>signup/mail.css" />
<script type="text/javascript" src="<%=rootJS%>signup/mail.js"></script>
</head>
<body>
	<div class="header">
		<jsp:include page="../main/header.jsp" />
	</div>
	<div class="wrap" id="mailwrap">
		<div class="container" id="mailcontainer">
			<section class="mail">
				<div class="location">
					<h2>회원가입</h2>
				</div>
				<div class="content">
					<h3>회원 가입 여부 확인</h3>
					<div>
						<ul>
							<li>E-Mail을 통하여 홈페이지 회원 가입 여부를 확인 할 수 있습니다.</li>
						</ul>
					</div>
					<div class="content join">
						<div id="mail">
							<ul>
								<li><button type="button" id="validationBtn"
										class="ui-button ui-corner-all ui-widget">E-Mail 인증</button>
									<br /> 이메일은 반드시 본인 명의로 된 메일 주소로 인증 하셔야 합니다.</li>
							</ul>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
	<div class="footer">
		<jsp:include page="../main/footer.jsp" />
	</div>
	<div id="maildialog" title="E-Mail인증">
		<jsp:include page="../mail/validation.jsp"></jsp:include>
	</div>
</body>
</html>