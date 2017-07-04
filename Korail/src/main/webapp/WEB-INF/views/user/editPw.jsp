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
<link rel="stylesheet" href="<%=rootCss%>user/editPw.css" />
<script type="text/javascript" src="<%=rootJS%>user/editPw.js"></script>
</head>
<body>
<h2>ID찾기</h2>
	<div class="header">
		<jsp:include page="../main/header.jsp" />
	</div>
	<div class="wrap chpwWrap" id="wrap">
		<div class="container" id="container">
			<section id="changePw" class="changePw wrap">
				<h2>비밀번호 변경</h2>
				<div class="sContent" id="sContent">
					<form id="cPwForm" class="cPwForm">
						<table class="tblid">
							<tr>
								<td rowspan="3" class="c1">
									<img src="<%=root%>front/img/Korail.jpg" alt="Korail 로고" class="logoimg"/>
								</td>
				                <td class="c2">
				                E-mail
				                </td>
				                <td rowspan="3">
				                	<button type="button" id="btnspw" class="btnspw ui-button ui-corner-all ui-widget">비밀번호변경</button>
				                </td>
							</tr>
							<tr>
				                <td>
				                	<label for="userPw" class="blab">비밀번호</label>
				                	<input type="password" id ="userPw" name="userPw" class="basictxt" placeholder="비밀번호를 입력해 주십시오."/> 
				                </td>
			               </tr>
							<tr>
				                <td>
				                	<label for="userPwchk" class="blab">비밀번호확인</label>
				                	<input type="password" id ="userPwchk" name="userPwchk" class="basictxt" placeholder="비밀번호를 입력해 주십시오."/> 
				                </td>
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