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
<title>Korail</title>
<script type="text/javascript" src="<%=root%>jquery-3.2.1.min.js" /></script>
<script type="text/javascript" src="<%=root%>jquery/jquery-ui.js" /></script>
<link rel="stylesheet" href="<%=rootJquery%>jquery-ui.css">
<link rel="stylesheet" href="<%=rootJquery%>jquery-ui.structure.css">
<link rel="stylesheet" href="<%=rootJquery%>jquery-ui.theme.css">
<link rel="stylesheet" href="<%=rootCss%>basic.css">
<link rel="stylesheet" href="<%=rootCss%>user/searchId.css" />
<script type="text/javascript" src="<%=rootJS%>user/searchId.js"></script>
</head>
<body>
<h2>ID찾기</h2>
	<div class="header">
		<jsp:include page="../main/header.jsp" />
	</div>
	<div class="idWrap wrap" id="wrap">
		<div class="container" id="container">
			<section id="searchId" class="searchId">
				<h2>아 이 디 찾 기</h2>
				<div class="sContent" id="sContent">
					<form id="sIdForm" class="sIdForm">
						<table class="tblid">
							<tr>
								<td rowspan="3" class="c1">
									<img src="<%=root%>front/img/Korail.jpg" alt="Korail 로고" class="logoimg"/>
								</td>
				                <td class="c2">
				                E-mail
				                </td>
							</tr>
							<tr>
				                <td>
				                	<label for="userEmail">이메일</label>
				                	<input type="text" id ="userEmail" name="userEmail" class="basictxt" placeholder="이메일을 입력해 주십시오."/> 
				                	<button type="button" id="btnsid" class="btnsid ui-button ui-corner-all ui-widget">확인</button>
				                </td>
			               </tr>
							<tr>
                				<td>회원님의 ID는 가입된 E-mail로 전송됩니다.</td>
              				</tr>
						</table>
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