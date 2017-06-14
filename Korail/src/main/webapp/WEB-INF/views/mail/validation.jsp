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
<title>Insert title here</title>
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
		<section class="pop_mail">
			<form id="mailForm" class="mailForm" method="post">
				<div class="pop_haeder">
					<h2>E-Mail 인증</h2>
				</div>
				<div class="pop_mailcontent">
					<label for="usermail" class="mailtxt">E-Mail 인증</label> <input
						type="text" id="usermail" name="usermail" class="mailroot"
						maxlength="50" />
					<button type="button"
						class="ui-button ui-corner-all ui-widget ui-validation"
						id="validationBtn2">메일 인증</button>
					<br />
					<p>이메일을 통하여 인증을 하므로 정확한 이메일을 입력해 주십시오</p>
				</div>
				<div class="pop_validation">
					<div class="pop">
						<label for="validation">인증번호</label> <input type="text" id="key"
							name="key" class="key" maxlength="6" readonly="readonly" />
					</div>
					<span class="certify_count" id="countTime" onload="fnOnload()"></span>
					<button type="button" id="revalidationBtn"
						class="ui-button ui-corner-all ui-widget ui-validation"
						disabled="disabled">인증번호 재발송</button>
				</div>
				<div class="pop_footer">
					<button type="button" id="okBtn"
						class="ui-button ui-corner-all ui-widget ui-validation"
						onclick="check()" disabled="disabled">확인</button>
					<button type="button" id="cencleBtn"
						class="ui-button ui-corner-all ui-widget ui-validation">취소</button>
				</div>
			</form>
		</section>
	</div>
</body>
</html>