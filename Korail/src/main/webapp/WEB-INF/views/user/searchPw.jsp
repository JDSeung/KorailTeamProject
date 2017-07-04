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
<link rel="stylesheet" href="<%=rootCss%>user/searchPw.css" />
<script type="text/javascript" src="<%=rootJS%>user/searchPw.js"></script>
</head>
<body>
<h2>비밀번호찾기</h2>
	<div class="header">
		<jsp:include page="../main/header.jsp" />
	</div>
	<div class="pwWrap wrap" id="wrap">
		<div class="container" id="container">
			<section id="searchId" class="searchId">
				<h2>비밀번호 찾기</h2>
				<div class="sContent" id="sContent">
					<form id="sPwForm" class="sPwForm">
						<table class="tblid">
							<tr>
								<td rowspan="4" class="c1">
									<img src="<%=root%>front/img/Korail.jpg" alt="Korail 로고" class="logoimg"/>
								</td>
				                <td class="c3">
				                E-mail
				                </td>
				                <td rowspan="4" class="c4">
				                	<button type="button" id="btnspw" class="btnspw ui-button ui-corner-all ui-widget">비밀번호변경</button>
				                </td>
							</tr>
							<tr >
				                <td class="c3">
				                	<label for="userEmail">이메일</label>
				                	<input type="text" id ="userEmail" name="userEmail" class="basictxt" placeholder="이메일을 입력해 주십시오."/> 
				                </td>
			               </tr>
							<tr>
				                <td class="c3">
				                	<label for="userId">아이디</label>
				                	<input type="text" id ="userId" name="userId" class="basictxt" placeholder="ID를 입력해 주십시오."/> 
				                </td>
			               </tr>
							<tr>
                				<td class="c3">회원님의 ID는 가입된 E-mail로 전송됩니다.</td>
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