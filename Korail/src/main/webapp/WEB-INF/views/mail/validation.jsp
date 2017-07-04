<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String root = request.getContextPath() + "/resources/";
	String rootJquery = root + "jquery/";
	String rootCss = root + "front/css/";
	String rootJS = root + "front/js/";
	String rootCSS = request.getContextPath() + "/resources/front/css/mail/";
	String rootjs = request.getContextPath() + "/resources/front/js/mail/";
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
<script type="text/javascript" src="<%=rootjs%>validation.js" /></script>
<link rel="stylesheet" href="<%=rootCSS%>validation.css">
</head>
<body>
	<div class="pop_container">
		<form id="mailForm" class="mailForm" method="post">
			<table class="mailtbl">
				<tr>
					<td><label for="userEmail" class="mailtxt">E-Mail 인증</label></td>
					<td>
						<input type="text" id="email" name="email" class="mailroot basictxt " maxlength="50" />
						<input type="hidden" id="userEmail" name="userEmail"/>
					</td>
					<td>
						<button type="button" class="ui-button ui-corner-all ui-widget ui-validation" id="validationBtn2">메일 인증</button>
					</td>
				</tr>
				<tr>
					<td>
						<label for="validation">인증번호</label>	
					</td>
					<td>
						<input type="text" id="key" name="key" class="key basictxt numbersOnly" maxlength="6" readonly="readonly"/>
						<span class="certify_count" id="countTime" onload="fnOnload()"></span>
					</td>
					<td>
						<button type="button" id="revalidationBtn" class="ui-button ui-corner-all ui-widget ui-validation" disabled="disabled">인증번호 재발송</button>
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<p class="pmail">이메일을 통하여 인증을 하므로 정확한 이메일을 입력해 주십시오</p>
					</td>
				</tr>
			</table>
			<div class="pop_footer">
				<button type="button" id="okBtn" class="ui-button ui-corner-all ui-widget ui-validation" onclick="check()" disabled="disabled">확인</button>
				<button type="button" id="cancelBtn" class="ui-button ui-corner-all ui-widget ui-validation">취소</button>
			</div>
		</form>
	</div>
</body>
</html>