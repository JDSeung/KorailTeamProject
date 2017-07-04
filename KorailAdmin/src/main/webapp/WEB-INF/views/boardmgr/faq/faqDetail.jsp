<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<link rel="stylesheet" href="<%=rootCss%>boardmgr/faq/faqDetail.css">
<script type="text/javascript" src="<%=rootJS%>boardmgr/faq/faqDetail.js" /></script>
<title>Korail</title>
</head>
<body>
	<form id="pagingInfo">
			<input type="hidden"  id="curruntPage" class="curruntPage" name="curruntPage" value="${paging.curruntPage}"/>
			<input type="hidden"  id="faqNo" class="faqNo" name="faqNo" value="${faqVO.faqNo}"/>
		<jsp:include page="../../main/header.jsp" />
		<div id="wrap">
			<div class="container faqDetailWrap">
				<section>
					<h2>F A Q 상세보기</h2>
					<table class="faqDetailtbl">
						<thead>
							<tr>
								<th colspan="4">
									질 문
								</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="c1">작성자</td>
								<td class="c2">${faqVO.adminName}</td>
								<td class="c3">작성일</td>
								<td class="c4">${faqVO.faqRegDate}</td>
							</tr>
							<tr>
								<td>제목</td>
								<td colspan="3">${faqVO.faqTitle}</td>
							</tr>
							<tr>
								<td class="content">내용</td>
								<td colspan="3" class="cont">${faqVO.faqContent} </td>
							</tr>
						</tbody>
					</table>
					<div class="btnarea">
									<button type="button" id="btnedit" class="ui-button ui-corner-all ui-widget btnedit">수 정</button>
									<button type="button" id="btndelete" class="ui-button ui-corner-all ui-widget btndelete">삭 제</button>
						<button type="button" id="btnlist" class="ui-button ui-corner-all ui-widget btnlist">목 록</button>
					</div>
				</section>
			</div>
		</div>
	</form>
</body>
</html>