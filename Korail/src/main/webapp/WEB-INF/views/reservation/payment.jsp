<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String root = request.getContextPath()+"/resources/";
	String rootJquery = root+"jquery/";
	String rootCss = root+"front/css/";
	String rootJS = root+"front/js/";
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
<link rel="stylesheet" href="<%=rootCss%>res/payment.css">
<script type="text/javascript" src="<%=rootJS%>/res/payment.js" /></script>
</head>
<body>
	<h2>결제</h2>
	<jsp:include page="../main/header.jsp" />
	<form action="/korail" method="get">
		<div class="container paymentWrap wrap">
			<section>
				<h2>무통장입금</h2>
				<div class="bankInfo">
					<h3>기업은행</h3>
					<h3>계좌번호 : 123-456789-123</h3>
					<h3>예금주 : 레츠코레일 </h3>
				</div>
					<button class="ui-button ui-corner-all ui-widget btnHome">Korail Home</button>
				
			</section>
		</div>
	</form>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>