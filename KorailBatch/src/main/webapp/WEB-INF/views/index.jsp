<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true"%>
<% 
	String root = request.getContextPath()+"/resources/";
	String rootCss = root+"front/css/";
	String rootJS = root+"front/js/";
%>
<!doctype html>
<html>
<head>
	<meta charset="UTF-8"/>
	<title>Korail</title>
	<script type="text/javascript" src="<%=root%>jquery-3.2.1.min.js"/></script>
	<script type="text/javascript" src="<%=root%>jquery/jquery-ui.js"/></script>
	<link rel="stylesheet" href="<%=root%>jquery/jquery-ui.css">
	<link rel="stylesheet" href="<%=root%>jquery/jquery-ui.structure.css">
	<link rel="stylesheet" href="<%=root%>jquery/jquery-ui.theme.css">
	<link rel="stylesheet" href="<%=rootCss%>index.css">
	<script type="text/javascript" src="<%=rootJS%>batch.js" /></script>
	<jsp:include page="main/header.jsp"></jsp:include>
</head>
<body>
	<div class="wrap">
		<form id="insertform">
			<button id="insertdata" class="ui-button ui-corner-all ui-widget" type="button">Bath 실행</button>
		</form>
		<div class="batchwrap">
		</div>
		<div id="progress" class="hide">
			<img src="<%=root%>/front/img/ajax-loader.gif" alt="로딩 이미지" />
			<p>배치를 실행중입니다. 잠시만 기다려 주십시오.</p>
		</div>
	</div>
</body>
</html>
