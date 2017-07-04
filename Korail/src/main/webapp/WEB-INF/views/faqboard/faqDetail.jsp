<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<% 
  String root = request.getContextPath()+"/resources/";
  String rootCss = root+"front/css/";
  String rootJS = root+"front/js/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="<%=root%>jquery-3.2.1.min.js" /></script>
<script type="text/javascript" src="<%=root%>jquery/jquery-ui.js" /></script>
<link rel="stylesheet" href="<%=root%>jquery/jquery-ui.css">
<link rel="stylesheet" href="<%=root%>jquery/jquery-ui.structure.css">
<link rel="stylesheet" href="<%=root%>jquery/jquery-ui.theme.css">
<link rel="stylesheet" href="<%=rootCss%>basic.css">
<script type="text/javascript" src="<%=rootJS%>basic.js" /></script>
<link rel="stylesheet" href="<%=rootCss%>cscenter/faqDetail.css">
<script type="text/javascript" src="<%=rootJS%>cscenter/faqDetail.js"></script>
<title>Korail</title>
</head>
<body>
	<form id="pagingInfo">
		<input type="hidden" id="curruntPage" class="curruntPage" name="curruntPage" value="${paging.curruntPage}" />
		<input type="hidden" id="totalPage" class="totalPage" name="totalPage" value="${paging.totalPage}" />
	</form>
<jsp:include page="../main/header.jsp"/>
	<div id="wrap" class="wrap">
		<div class="container wrap">
			<section>
				<h2>F A Q</h2>
				<table class="faqDetailtbl">
					<tbody>
						<tr>
							<td class="c1">작성자</td>
							<td class="c2">${faqVO.adminName}</td>
							<td class="c3">작성일</td>
							<td class="c4">${faqVO.faqRegdate}</td>
						</tr>
						<tr>
							<td>제목</td>
							<td colspan="3">${faqVO.faqTitle}</td>
						</tr>
						<tr>
							<td class="content">내용</td>
							<td colspan="3" class="cont">${faqVO.faqContent}</td>
						</tr>
					</tbody>
				</table>
				<div class="btnarea">
					<button type="button" id="btnlist" class="ui-button ui-corner-all ui-widget btnlist">목 록</button>
				</div>
			</section>
		</div>
	</div>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>