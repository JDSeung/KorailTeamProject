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
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript" src="<%=root%>jquery-3.2.1.min.js" /></script>
<script type="text/javascript" src="<%=root%>jquery/jquery-ui.js" /></script>
<link rel="stylesheet" href="<%=root%>jquery/jquery-ui.css">
<link rel="stylesheet" href="<%=root%>jquery/jquery-ui.structure.css">
<link rel="stylesheet" href="<%=root%>jquery/jquery-ui.theme.css">
<link rel="stylesheet" href="<%=rootCss%>basic.css">
<script type="text/javascript" src="<%=rootJS%>basic.js" /></script>
<link rel="stylesheet" href="<%=rootCss%>noticeboard/noticeDetail.css">
<script type="text/javascript" src="<%=rootJS%>noticeboard/noticeDetail.js"></script>
<title>Korail</title>
</head>
<body>
	<form id="pagingInfo">
		<input type="hidden" id="curruntPage" class="curruntPage" name="curruntPage" value="${paging.curruntPage}" />
		<input type="hidden" id="totalPage" class="totalPage" name="totalPage" value="${paging.totalPage}" />
		<input type="hidden" id="noticeNO" class="noticeNO" name="noticeNO" value="${noticeVO.noticeNO}"/>
	</form>
<jsp:include page="../main/header.jsp"/>
	<div id="wrap" class="wrap">
		<div class="container noticeDetailWrap">
			<section>
				<h2>공 지 사 항</h2>
				<table class="noticeDetailtbl">
					<tbody>
						<tr>
							<td class="c1">작성자</td>
							<td class="c2">${noticeVO.adminName}</td>
							<td class="c3">작성일</td>
							<td class="c4">${noticeVO.noticeRegdate}</td>
						</tr>
						<tr>
							<td>제목</td>
							<td colspan="3">${noticeVO.noticeTitle}</td>
						</tr>
						<tr>
							<td class="content">내용</td>
							<td colspan="3" class="cont">
								<c:if test="${noticeVO.noticeAttachments ne 'N'}">
								<c:set var="attachments" value="${noticeVO.noticeAttachments}"/>
								<c:set var="attarr" value="${fn:split(attachments,'/')}"/>
								<c:if test="${attarr[1] == '.jpg' || attarr[1] == '.gif' || attarr[1] == '.png'}"></c:if>
									<img class="detimg" src="/admin/resources/upload/${noticeVO.noticeAttachments}" alt="첨부파일 이미지" />
								</c:if>
								${noticeVO.noticeContent}
							</td>
						</tr>
						<tr>
							<td>첨부파일</td>
							<td colspan="3">
								<c:choose>
									<c:when test="${noticeVO.noticeAttachments eq 'N'}">
										첨부파일이 존재하지 않습니다.
									</c:when>
									<c:otherwise>
										<a class="atts" href="/admin/resources/upload/${noticeVO.noticeAttachments}" title="첨부파일 다운로드" download>
											${noticeVO.noticeAttachments}
										</a>
									</c:otherwise>
								</c:choose>
							</td>
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