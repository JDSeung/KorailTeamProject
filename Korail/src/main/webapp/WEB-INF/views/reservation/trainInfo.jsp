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
<script type="text/javascript" src="<%=root%>jquery-3.2.1.min.js" /></script>
<script type="text/javascript" src="<%=root%>jquery/jquery-ui.js" /></script>
<link rel="stylesheet" href="<%=rootJquery%>jquery-ui.css">
<link rel="stylesheet" href="<%=rootJquery%>jquery-ui.structure.css">
<link rel="stylesheet" href="<%=rootJquery%>jquery-ui.theme.css">
<link rel="stylesheet" href="<%=rootCss%>basic.css">
<link rel="stylesheet" href="<%=rootCss%>res/trainInfo.css">
<script type="text/javascript" src="<%=rootJS%>basic.js" /></script>
<title>Insert title here</title>
</head>
<body>
<table id= "tbl_Train">
 	<thead class= "thead_train">
		<tr>
			<th class="th_train">열 차 번 호</th>
			<th class="th_train">출 발</th>
			<th class="th_train">도 착</th>
			<th class="th_train">특 실</th>
			<th class="th_train">일 반 실</th>
			<th class="th_train">예 약 대 기</th>
			<th class="th_train">운 임 요 금</th>
			<th class="th_train">소 요 시 간</th>
		</tr>
	</thead>
	<tbody>
	</tbody>
</table>
<div class="btnArea">
	<button type="button" id="btnPrev" class="btnHide ui-button ui-corner-all ui-widget">이전</button>
	<button type="button" id="btnNext" class="btnHide ui-button ui-corner-all ui-widget">다음</button>
</div>
</body>
</html>