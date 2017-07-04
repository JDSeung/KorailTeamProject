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
<link rel="stylesheet" href="<%=rootCss%>boardmgr/qna/qnaDetail.css">
<script type="text/javascript" src="<%=rootJS%>boardmgr/qna/qnaDetail.js" /></script>
<title>Korail</title>
</head>
<body>
	<form id="pagingInfo">
		<input type="hidden"  id="curruntPage" class="curruntPage" name="curruntPage" value="${paging.curruntPage}"/>
		<input type="hidden"  id="totalPage" class="totalPage" name="totalPage" value="${paging.totalPage}"/>
		<input type="hidden"  id="qnaNo" class="qnaNo" name="qnaNo" value="${qnaVO.qnaNo}"/>
	<jsp:include page="../../main/header.jsp" />
	<div id="wrap">
		<div class="container qnaDetailWrap">
			<section>
				<h2>Q &#38; A 상세보기</h2>
				<table class="qnaDetailtbl">
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
							<td class="c2">${qnaVO.qnaWriter}</td>
							<td class="c3">작성일</td>
							<td class="c4">${qnaVO.qnaRegDate}</td>
						</tr>
						<tr>
							<td>글 공개 여부</td>
							<td colspan="3">
								<c:choose>
									<c:when test="${qnaVO.ispublic eq'0'}">
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
							<td colspan="3">${qnaVO.qnaTitle}</td>
						</tr>
						<tr>
							<td class="content">내용</td>
							<td colspan="3" class="cont">${qnaVO.qnaContent}</td>
						</tr>
						<tr>
							<td>첨부파일</td>
							<td id="att" colspan="3">
								<c:choose>
									<c:when test="${qnaVO.qnaAttachments eq 'N'}">
										첨부파일이 존재하지 않습니다.
									</c:when>
									<c:otherwise>
										<a class="atts" href="/korail/resources/upload/${qnaVO.qnaAttachments}" title="첨부파일 다운로드" download>
											${qnaVO.qnaAttachments}
										</a>
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
					</tbody>
				</table>
				<c:if test="${qnaReply.qnaNo != null }">
					<table class="qnaDetailtbl reply">
						<thead>
							<tr>
								<th colspan="4">
									답 변
								</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="c1">작성자</td>
								<td class="c2">${qnaReply.qnaWriter}</td>
								<td class="c3">작성일</td>
								<td class="c4">${qnaReply.qnaRegDate}</td>
							</tr>
							<tr>
								<td>글 공개 여부</td>
								<td colspan="3">
									<c:choose>
										<c:when test="${qnaReply.ispublic eq'0'}">
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
								<td colspan="3">${qnaReply.qnaTitle}</td>
							</tr>
							<tr>
								<td class="content">내용</td>
								<td colspan="3" class="cont">${qnaReply.qnaContent}</td>
							</tr>
							<tr>
								<td>첨부파일</td>
								<td id="attr" colspan="3">
									<c:choose>
										<c:when test="${qnaReply.qnaAttachments eq 'N'}">
											첨부파일이 존재하지 않습니다.
										</c:when>
										<c:otherwise>
											<a class="atts" href="/korail/resources/upload/${qnaReply.qnaAttachments}" title="첨부파일 다운로드" download>
												${qnaReply.qnaAttachments}
											</a>
										</c:otherwise>
									</c:choose>
								</td>
							</tr>
						</tbody>
					</table>
				</c:if>
				<div class="btnarea">
					<button type="button" id="swrite" class="ui-button ui-corner-all ui-widget swrite">답변</button>
					<c:if test="${qnaReply.qnaNo != null }">
					<button type="button" id="btnEdit" class="ui-button ui-corner-all ui-widget swrite">수정</button>
					</c:if>
					<button type="button" id="btnDelete" class="ui-button ui-corner-all ui-widget swrite">삭제</button>
					<button type="button" id="btnlist" class="ui-button ui-corner-all ui-widget btnlist">목 록</button>
				</div>
			</section>
		</div>
	</div>
	</form>
</body>
</html>