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
<title>회원 가입</title>
<script type="text/javascript" src="<%=root%>jquery-3.2.1.min.js" /></script>
<script type="text/javascript" src="<%=root%>jquery/jquery-ui.js" /></script>
<link rel="stylesheet" href="<%=rootJquery%>jquery-ui.css">
<link rel="stylesheet" href="<%=rootJquery%>jquery-ui.structure.css">
<link rel="stylesheet" href="<%=rootJquery%>jquery-ui.theme.css">
<link rel="stylesheet" href="<%=rootCss%>basic.css">
<script type="text/javascript" src="<%=rootJS%>basic.js" /></script>
<link rel="stylesheet" href="<%=rootCss%>signup/signup.css" />
<script type="text/javascript" src="<%=rootJS%>signup/signup.js"></script>
</head>
<body>
<h2 class="hide">회원가입</h2>
	<div class="header">
		<jsp:include page="../main/header.jsp" />
	</div>

	<div class="signupWrap wrap">
		<div class="container">
			<section class="signup">
					<h2>회원가입</h2>
				<div class="location">
				</div>
				<div class="content">
					<form method="post" id="signupTb" class="signupTb">
						<table class="signtbl">
							<tbody>
								<tr>
									<th>이 름</th>
									<td><input type="text" id="userName" name="userName" class="basictxt koreanOnly" maxlength="10"/></td>
								</tr>
								<tr>
									<th>아 이 디</th>
									<td><input type="text" maxlength="15" id="userId" name="userId" class="basictxt engNumOnly" maxlength="15"/>
									<button type="button" id="idChk" name="idChk" class="ui-button ui-corner-all ui-widget" >중복검사</button></td>
								</tr>
								<tr>
									<th>비 밀 번 호</th>
									<td><input type="password" maxlength="20" id="userPw" name="userPw" class="basictxt" maxlength="20"/>
									</td>
								</tr>
								<tr>
									<th>비 밀 번 호 확 인</th>
									<td><input type="password" maxlength="20" id="userchkpw" name="userchkpw" class="basictxt" maxlength="20"/>
									</td>
								</tr>
								<tr>
									<th>생 년 월 일</th>
									<td>
										<select name="cmbYear" id="cmbYear" class="cmbdate" onChange="javascript:fn_GetDay();">
										</select> 
										<label for="cmbYear">년</label> 
										<select name="cmbMonth" id="cmbMonth" class="cmbdate" onChange="javascript:fn_GetDay();">
										</select> 
										<label for="cmbMonth">월</label>
										<select name="cmbDay" id="cmbDay" class="cmbdate"></select>
										<label for="cmbDay">일</label> <input type="text" id="datepicker" />
									</td>
								</tr>
								<tr>
									<th>성 별</th>
									<td>
										<input type="radio" id="userGenderM" name="userGender" class="usergender" value="남" checked/>
										<label for="userGender" >남자</label>
										<input type="radio" id="userGenderF" name="userGender" class="usergender" value="여" />
										<label for="userGender">여자</label>
									</td>
								</tr>
								<tr>
									<th>E-Mail</th>
									<td>
										<input type="text" id="userEmail" name="userEmail" class="basictxt" readonly="readonly" value="${email}" />
									</td>
								</tr>
								<tr>
									<th>전 화 번 호</th>
									<td>
									<input type="text" id="userphone1" name="userphone1" class="userphone basictxt numbersOnly" maxlength="3"/>
									-
									<input type="text" id="userphone2" name="userphone2" class="userphone basictxt numbersOnly" maxlength="4"/>
									-
									<input type="text" id="userphone3" name="userphone3" class="userphone basictxt numbersOnly" maxlength="4"/>
									</td>
								</tr>
								<tr>
									<th rowspan="3">주 소</th>
									<td>
										<input type="text" id="dorozip" name="dorozip" class="useraddr basictxt" readonly="readonly" />
										<button type="button" class="ui-button ui-corner-all ui-widget" id="zipBtn">우편번호검색</button>
									</td>
								</tr>
								<tr>
									<td>
										<input type="text" id="doroaddrVil" name="doroaddrVil" class="useraddr basictxt addrditail" readonly="readonly" />
									</td>
								</tr>
								<tr>
									<td>
										<input type="text" id="doroaddrDit" name="doroaddrDit" class="useraddr basictxt addrditail" maxlength="20"/>
									</td>
								</tr>
							</tbody>
						</table>
						<div class="btnarea">
							<button type="button" class="ui-button ui-corner-all ui-widget" id="okJoinBtn">확인</button>
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

	<div id="zipCodedialog" title="우편번호검색">
		<jsp:include page="searchZipCodePOPUP.jsp"></jsp:include>
	</div>
</body>
</html>