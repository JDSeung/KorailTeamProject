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
<link rel="stylesheet" href="<%=rootCss%>boardmgr/notice/noticeWrite.css">
<script type="text/javascript" src="<%=rootJS%>boardmgr/notice/noticeWrite.js" /></script>
<title>Korail</title>
</head>
<body>
	<form id="pagingInfo" enctype="multipart/form-data">
		<input type="hidden"  id="curruntPage" class="curruntPage" name="curruntPage" value="${paging.curruntPage}"/>
		<input type="hidden"  id="totalPage" class="totalPage" name="totalPage" value="${paging.totalPage}"/>
	<jsp:include page="../../main/header.jsp" />
	<div id="wrap">
		<div class="container noticeDetailWrap">
			<section>
				<h2>공지사항 글쓰기</h2>
				<table class="noticeDetailtbl">
					<tbody>
						<tr>
							<td class="c1">작성자</td>
							<td class="c2">
								관리자
							</td>
							<td class="c3">작성일</td>
							<td class="c4">
							</td>
						</tr>
						<tr>
                     <td>공지 글 여부</td>
                     <td colspan="3" class="tdpub">
                        <input type="radio" name="noticeEtc" id="notice" value="0" checked/>
                        <label for="public">공지</label>
                        <input type="radio" name="noticeEtc" id="event" value="1"/>
                        <label for="public">이벤트</label>
                     </td>
                  </tr>
						<tr>
							<td>제목</td>
							<td colspan="3">
								<input type="text" id="noticeTitle" class="noticeTitle txtnotice" name="noticeTitle" />
						 	</td>
						</tr>
						<tr>
							<td class="content">내용</td>
							<td colspan="3" class="cont">
								<textarea name="noticeContent" id="noticeContent" class="noticeContent txtnotice"></textarea>
							</td>
						</tr>
						<tr>
							<td>첨부파일</td>
							<td colspan="3">
								<input type="file" id="file" class="file txtnotice" name="file"/>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="btnarea">
					<button type="button" id="btnWrite" class="ui-button ui-corner-all ui-widget btnWrite">작 성</button>
					<button type="button" id="btnCancel" class="ui-button ui-corner-all ui-widget btnCancel">취 소</button>
				</div>
			</section>
		</div>
	</div>
	</form>
</body>
</html>