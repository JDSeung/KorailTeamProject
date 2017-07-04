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
<link rel="stylesheet" href="<%=rootCss%>cscenter/qnaEdit.css">
<script type="text/javascript" src="<%=rootJS%>cscenter/qnaEdit.js" /></script>
<title>Korail</title>
</head>
<body>
	<form id="pagingInfo" enctype="multipart/form-data">
		<input type="hidden"  id="curruntPage" class="curruntPage" name="curruntPage" value="${paging.curruntPage}"/>
		<input type="hidden"  id="totalPage" class="totalPage" name="totalPage" value="${paging.totalPage}"/>
		<input type="hidden"  id="ispublic" class="ispublic" name="ispublic" value="${qnaVO.ispublic}"/>
		<input type="hidden"  id="qnaNo" class="qnaNo" name="qnaNo" value="${qnaVO.qnaNo}"/>
	<jsp:include page="../main/header.jsp" />
	<div id="wrap" class="wrap">
		<div class="container qnaDetailWrap">
			<section>
				<h2>Q &#38; A 수정</h2>
				<table class="qnaDetailtbl">
					<tbody>
						<tr>
							<td class="c1">작성자</td>
							<td class="c2">${qnaVO.qnaWriter}</td>
							<td class="c3">작성일</td>
							<td class="c4">${qnaVO.qnaRegDate}</td>
						</tr>
						<tr>
							<td>글 공개 여부</td>
							<td colspan="3">
								<c:choose>
									<c:when test="${qnaVO.ispublic == '0'}">
							           	공개
							       </c:when>
							       <c:otherwise>
							       		비공개
							       </c:otherwise>
								</c:choose>
							</td>
						</tr>
						<tr>
							<td>제목</td>
							<td colspan="3">
								<input type="text" id="qnaTitle txtqna" class="qnaTitle txtqna" name="qnaTitle" value="${qnaVO.qnaTitle}" />
							</td>
						</tr>
						<tr>
							<td class="content">내용</td>
							<td colspan="3" class="cont">
								<textarea name="qnaContent" id="qnaContent" class="qnaContent">${qnaVO.qnaContent}</textarea>
							</td>
						</tr>
						<tr>
							<td>첨부파일</td>
							<td colspan="3">
								<input type="file" id="file" class="file" name="file" />
								<br />
								<label>기존 이미지 파일명 : </label>
								<label id="imgView" class = "qnaAttachments">
									<a class="atts" href="/korail/resources/upload/${qnaVO.qnaAttachments}" title="첨부파일 다운로드" download>
											${qnaVO.qnaAttachments}
									</a>
								</label>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="btnarea">
					<button type="button" id="btnedit" class="ui-button ui-corner-all ui-widget btnedit">수 정</button>
					<button type="button" id="btndelete" class="ui-button ui-corner-all ui-widget btndelete">삭 제</button>
					<button type="button" id="btnlist" class="ui-button ui-corner-all ui-widget btnlist">취 소</button>
				</div>
			</section>
		</div>
	</div>
	</form>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>