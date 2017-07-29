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
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript" src="<%=root%>jquery-3.2.1.min.js" /></script>
<script type="text/javascript" src="<%=root%>jquery/jquery-ui.js" /></script>
<link rel="stylesheet" href="<%=rootJquery%>jquery-ui.css">
<link rel="stylesheet" href="<%=rootJquery%>jquery-ui.structure.css">
<link rel="stylesheet" href="<%=rootJquery%>jquery-ui.theme.css">
<link rel="stylesheet" href="<%=rootCss%>basic.css">
<link rel="stylesheet" href="<%=rootCss%>boardmgr/notice/noticeDetail.css">
<script type="text/javascript" src="<%=rootJS%>boardmgr/notice/noticeDetail.js" /></script>
<title>Korail</title>
</head>
<body>
	<form id="pagingInfo">
		<input type="hidden"  id="curruntPage" class="curruntPage" name="curruntPage" value="${paging.curruntPage}"/>
		<input type="hidden"  id="totalPage" class="totalPage" name="totalPage" value="${paging.totalPage}"/>
		<input type="hidden"  id="noticeNo" class="noticeNo" name="noticeNO" value="${noticeVO.noticeNO}"/>
	<jsp:include page="../../main/header.jsp" />
	<div id="wrap">
		<div class="container noticeDetailWrap">
			<section>
				<h2>공지사항 상세보기</h2>
				<table class="noticeDetailtbl">
					<tbody>
						<tr>
							<td class="c1">작성자</td>
							<td class="c2">${noticeVO.adminName}</td>
							<td class="c3">작성일</td>
							<td class="c4">${noticeVO.noticeRegdate}</td>
						</tr>
						<tr>
							<td>공지사항 글 여부</td>
							<td colspan="3">
								<c:choose>
									<c:when test="${noticeVO.noticeEtc eq'0'}">
										공지사항
									</c:when>
									<c:otherwise>
										이벤트
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
						<tr>
							<td>제목</td>
							<td colspan="3">${noticeVO.noticeTitle}</td>
						</tr>
						<tr>
							<td class="content">내용</td>
							<td colspan="3" class="cont">
								${noticeVO.noticeContent}
								<c:if test="${noticeVO.noticeAttachments ne 'N'}">
								<c:set var="attachments" value="${noticeVO.noticeAttachments}"/>
								<c:set var="attarr" value="${fn:split(attachments,'/')}"/>
								<c:if test="${attarr[1] == '.jpg' || attarr[1] == '.gif' || attarr[1] == '.png'}"></c:if>
									<img class="detimg" src="/admin/resources/upload/${noticeVO.noticeAttachments}" alt="첨부파일 이미지" />
								</c:if>
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