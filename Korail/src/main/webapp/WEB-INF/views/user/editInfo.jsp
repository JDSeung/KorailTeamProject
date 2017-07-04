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
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<meta charset="UTF-8">
<title>Korail</title>
<script type="text/javascript" src="<%=root%>jquery-3.2.1.min.js" /></script>
<script type="text/javascript" src="<%=root%>jquery/jquery-ui.js" /></script>
<link rel="stylesheet" href="<%=rootJquery%>jquery-ui.css">
<link rel="stylesheet" href="<%=rootJquery%>jquery-ui.structure.css">
<link rel="stylesheet" href="<%=rootJquery%>jquery-ui.theme.css">
<link rel="stylesheet" href="<%=rootCss%>basic.css">
<script type="text/javascript" src="<%=rootJS%>basic.js" /></script>
<link rel="stylesheet" href="<%=rootCss%>user/editInfo.css" />
<script type="text/javascript" src="<%=rootJS%>user/editInfo.js"></script>
</head>
<body>
<h2 id="hide" class="hide">회원정보수정</h2>
	<div class="header">
		<jsp:include page="../main/header.jsp" />
	</div>

	<div class="editWrap wrap">
		<div class="container">
			<section class="signup">
					<h2>회원정보수정</h2>
				<div class="location">
				</div>
				<div class="content">
					<form method="post" id="signupTb" class="signupTb">
					<input type="hidden" name="uemail" id="uemail" class="uemail" value="${userVO.userEmail}" />
					<input type="hidden" name="userId" id="userId" class="userId" value="${userVO.userId}" />
						<table class="edittbl">
							<tbody>
								<tr>
									<th>이 름</th>
									<td>
										${userVO.userName}
									</td>
								</tr>
								<tr>
									<th>아 이 디</th>
									<td>
										${userVO.userId}
									</td>
								</tr>
								<tr>
									<th>비 밀 번 호</th>
									<td>
										<button type="button" id="chpwbtn" class="chpwbtn ui-button ui-corner-all ui-widget">비밀번호변경</button>
									</td>
								</tr>
								<tr>
									<th>생 년 월 일</th>
									<td>${userVO.userBirth}</td>
								</tr>
								<tr>
									<th>성 별</th>
									<td>${userVO.userGender}</td>
								</tr>
								<tr>
									<th>E-Mail</th>
									<td>
										
										<span class="email">${userVO.userEmail}</span>
										<button type="button" id="chmailbtn" class="chmailbtn ui-button ui-corner-all ui-widget">이메일 인증</button>
									</td>
								</tr>
								<tr>
									<th>전 화 번 호</th>
									<td>
										<c:set var="userPhone" value="${userVO.userPhone}"/>
										<input type="text" id="userphone1" name="userphone1" class="userphone basictxt numbersOnly" maxlength="3" value="${fn:substring(userPhone,0,3)}"/>
										-
										<input type="text" id="userphone2" name="userphone2" class="userphone basictxt numbersOnly" maxlength="4" value="${fn:substring(userPhone,4,8)}"/>
										-
										<input type="text" id="userphone3" name="userphone3" class="userphone basictxt numbersOnly" maxlength="4" value="${fn:substring(userPhone,9,13)}"/>
									</td>
								</tr>
								<tr>
									<th rowspan="3">주 소</th>
									<td>
										<c:set var="userAddr" value="${fn:split(userVO.userAddr,'/')}"/>
										<input type="text" id="dorozip" name="dorozip" class="useraddr basictxt" readonly="readonly" value="${userAddr[0]}"/>
										<button type="button" class="ui-button ui-corner-all ui-widget" id="zipBtn">우편번호검색</button>
									</td>
								</tr>
								<tr>
									<td>
										<input type="text" id="doroaddrVil" name="doroaddrVil" class="useraddr basictxt addrditail" readonly="readonly" value="${userAddr[1]}"/>
									</td>
								</tr>
								<tr>
									<td>
										<input type="text" id="doroaddrDit" name="doroaddrDit" class="useraddr basictxt addrditail" maxlength="20" value="${userAddr[2]}"/>
									</td>
								</tr>
							</tbody>
						</table>
						<div class="btnarea">
							<button type="button" class="ui-button ui-corner-all ui-widget" id="editBtn">수정</button>
							<button type="button" class="ui-button ui-corner-all ui-widget" id="cencleBtn">취소</button>
						</div>
					</form>
				</div>
			</section>
		</div>
	</div>

	<div class="header">
		<jsp:include page="../main/footer.jsp" />
	</div>
	<div id="maildialog" title="E-Mail인증">
		<jsp:include page="../mail/validation.jsp"></jsp:include>
	</div>
	<div id="zipCodedialog" title="우편번호검색">
		<jsp:include page="../signup/searchZipCodePOPUP.jsp"></jsp:include>
	</div>
</body>
</html>