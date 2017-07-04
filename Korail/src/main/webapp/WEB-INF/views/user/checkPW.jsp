<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<% 
  String root = request.getContextPath()+"/resources/";
  String rootCss = root+"front/css/";
  String rootJS = root+"front/js/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="<%=root%>jquery-3.2.1.min.js" /></script>
<script type="text/javascript" src="<%=root%>jquery/jquery-ui.js" /></script>
<link rel="stylesheet" href="<%=root%>jquery/jquery-ui.css">
<link rel="stylesheet" href="<%=root%>jquery/jquery-ui.structure.css">
<link rel="stylesheet" href="<%=root%>jquery/jquery-ui.theme.css">
<link rel="stylesheet" href="<%=rootCss%>basic.css">
<script type="text/javascript" src="<%=rootJS%>basic.js" /></script>
<link rel="stylesheet" href="<%=rootCss%>user/checkPW.css">
<script type="text/javascript" src="<%=rootJS%>user/checkPW.js"></script>
<title>Korail</title>
</head>
<body>
<jsp:include page="../main/header.jsp"/>
<input type="hidden" name="chkPw" id="chkPw" class="chkPw" value="${chkPw}" />
<h2>마이페이지</h2>
	<div id="checkWrap" class="checkWrap wrap">
		<div class="container pwContainer">
			<section>
				<h2>비밀번호 확인</h2>
				<form id="checkPwForm" onkeydown = "return eKey(event)" method="POST">
				<table class="checkPWtbl">
					<tr>
            			<td class="c2"><img src="<%=root%>front/img/Korail.jpg" alt="korail" class="logoimg" /></td>
            			<td class="c1">
            				비밀번호
            				<input type="password" id="userPw" name="userPw" class="basictxt"/>
            				<button type="button" id="pwBtn" class="btnspw ui-button ui-corner-all ui-widget pwBtn">확인</button>
            				<p>개인정보 보호를 위해 비밀번호를 입력해 주십시오.</p> 
            			</td>
          			</tr>
				</table>
				</form>
			</section>
		</div>
	</div>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>