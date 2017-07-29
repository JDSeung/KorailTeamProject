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
<script type="text/javascript" src="<%=root%>ckeditor/ckeditor.js"></script>
<link rel="stylesheet" href="<%=rootJquery%>jquery-ui.css">
<link rel="stylesheet" href="<%=rootJquery%>jquery-ui.structure.css">
<link rel="stylesheet" href="<%=rootJquery%>jquery-ui.theme.css">
<link rel="stylesheet" href="<%=rootCss%>basic.css">
<link rel="stylesheet" href="<%=rootCss%>boardmgr/notice/noticeEdit.css">
<script type="text/javascript" src="<%=rootJS%>boardmgr/notice/noticeEdit.js" /></script>
<title>Korail</title>
</head>
<body>
	<form id="pagingInfo" enctype="multipart/form-data">
		<input type="hidden"  id="curruntPage" class="curruntPage" name="curruntPage" value="${paging.curruntPage}"/>
		<input type="hidden"  id="totalPage" class="totalPage" name="totalPage" value="${paging.totalPage}"/>
		<input type="hidden"  id="noticeNO" class="noticeNO" name="noticeNO" value="${noticeVO.noticeNO}"/>
	<jsp:include page="../../main/header.jsp" />
	<div id="wrap">
		<div class="container noticeDetailWrap">
			<section>
				<h2>공지사항 수정</h2>
				<table class="noticeDetailtbl">
					<tbody>
						<tr>
							<td class="c1">작성자</td>
							<td class="c2">${noticeVO.adminName}</td>
							<td class="c3">작성일</td>
							<td class="c4">${noticeVO.noticeRegdate}</td>
						</tr>
						<tr>
							<td>공지사항여부</td>
							<td colspan="3">
								<c:choose>
									<c:when test="${noticeVO.noticeEtc == '0'}">
							           	<input type="radio" name="noticeEtc" id="public" value="0" checked/>
										<label for="public">공지사항</label>
										<input type="radio" name="noticeEtc" id="nonpublic" value="1"/>
										<label for="public">이벤트</label>
							       </c:when>
							       <c:otherwise>
							       		<input type="radio" name="noticeEtc" id="public" value="0" />
										<label for="public">공지사항</label>
										<input type="radio" name="noticeEtc" id="nonpublic" value="1"checked/>
										<label for="public">이벤트</label>
							       </c:otherwise>
								</c:choose>
							</td>
						</tr>
						<tr>
							<td>제목</td>
							<td colspan="3">
								<input type="text" id="noticeTitle txtnotice" class="noticeTitle txtnotice" name="noticeTitle" value="${noticeVO.noticeTitle}" />
							</td>
						</tr>
						<tr>
							<td class="content">내용</td>
							<td colspan="3" class="cont">
								<textarea name="noticeContent" id="noticeContent" class="noticeContent">${noticeVO.noticeContent}</textarea>
							</td>
						</tr>
						<tr class="att">
							<td>첨부파일</td>
							<td colspan="3">
								<input type="file" id="file" class="file" name="file"/>
								<br />
								<label>기존 이미지 파일명 : </label>
								<label id="imgView" class = "noticeAttachments">
									<a class="atts" href="/admin/resources/upload/${noticeVO.noticeAttachments}" title="첨부파일 다운로드" download>
											${noticeVO.noticeAttachments}
									</a>
								</label>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="btnarea">
					<button type="button" id="btnedit" class="ui-button ui-corner-all ui-widget btnedit">수 정</button>
					<button type="button" id="btnlist" class="ui-button ui-corner-all ui-widget btnlist">취 소</button>
				</div>
			</section>
		</div>
	</div>
	</form>
</body>
</html>