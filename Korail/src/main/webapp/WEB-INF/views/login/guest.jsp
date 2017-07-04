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
<title>Insert title here</title>
<script type="text/javascript" src="<%=root%>jquery-3.2.1.min.js" /></script>
<script type="text/javascript" src="<%=root%>jquery/jquery-ui.js" /></script>
<link rel="stylesheet" href="<%=rootJquery%>jquery-ui.css">
<link rel="stylesheet" href="<%=rootJquery%>jquery-ui.structure.css">
<link rel="stylesheet" href="<%=rootJquery%>jquery-ui.theme.css">
<link rel="stylesheet" href="<%=rootCss%>basic.css">
<link rel="stylesheet" href="<%=rootCss%>login/guest.css" />
<script type="text/javascript" src="<%=rootJS%>login/guest.js"></script>
<script type="text/javascript" src="<%=rootJS%>basic.js"></script>
</head>
<body>
<h2 id="ghide" class="hide">비회원정보입력</h2>
	<div class="header">
		<jsp:include page="../main/header.jsp" />
	</div>
	
	<div class="gestWrap" id="wrap">
		<div class="container" id="container">
			<section>
				<h2>비회원정보입력</h2>
				<div class="loginContent" id="loginContent">
					<form id="guestTb" class="guestTb">
						<div>
							<table class="gesttbl">
								<tbody>
									<tr>
										<th>이 름</th>
										<td><input type="text" id="userName" name="userName" class="basictxt koreanOnly" maxlength="10"/></td>
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
										<th>생년월일</th>
										<td>
										<select name="cmbYear" id="cmbYear" class="cmbdate"	onChange="javascript:fn_GetDay();"></select> 
										<label for="cmbYear">년</label>
										<select name="cmbMonth" id="cmbMonth" class="cmbdate"onChange="javascript:fn_GetDay();"></select> 
										<label for="cmbMonth">월</label> 
										<select name="cmbDay"id="cmbDay" class="cmbdate"></select> 
										<label for="cmbDay">일</label>
										<input type="text" id="datepicker" />
										</td>
									</tr>
									<tr>
										<th>E-Mail</th>
										<td>
											<input type="text" id="uemail" name="uemail" class="basictxt uemail" onclick="javascript:emailChk();" readonly />
											<button type="button" id="chmailbtn" class="ui-button ui-corner-all ui-widget">중복검사</button>
										</td>
									</tr>
									<tr>
										<th>전 화 번 호</th>
										<td>
										<input type="text" id="userphone1" name="userphone1" class="userphone basictxt numbersOnly" maxlength="3"/> -
										<input type="text" id="userphone2" name="userphone2" class="userphone basictxt numbersOnly" maxlength="4"/> -
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
											<input type="text" id="doroaddrDit" name="doroaddrDit" class="useraddr  basictxt addrditail" maxlength="20"/>
										</td>
									</tr>
								</tbody>
							</table>
							<div class="btnarea">
								<button type="button" class="ui-button ui-corner-all ui-widget" id="okguestBtn">확인</button>
								<button type="button" class="ui-button ui-corner-all ui-widget" id="cencleBtn">취소</button>
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

	<div id="maildialog" title="E-Mail인증">
		<jsp:include page="../mail/validation.jsp"></jsp:include>
	</div>
	<div id="zipCodedialog" title="우편번호검색">
		<jsp:include page="../signup/searchZipCodePOPUP.jsp"></jsp:include>
	</div>
</body>
</html>