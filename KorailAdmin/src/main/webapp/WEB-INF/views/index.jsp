<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%
	String root = request.getContextPath() + "/resources/";
	String rootCss = root + "front/css/";
	String rootJS = root + "front/js/";
%>
<html>
<head>
<title>Home</title>
<script type="text/javascript" src="<%=root%>jquery-3.2.1.min.js" /></script>
<script type="text/javascript" src="<%=root%>jquery/jquery-ui.js" /></script>
<link rel="stylesheet" href="<%=root%>jquery/jquery-ui.css">
<link rel="stylesheet" href="<%=root%>jquery/jquery-ui.structure.css">
<link rel="stylesheet" href="<%=root%>jquery/jquery-ui.theme.css">
<link rel="stylesheet" href="<%=rootCss%>basic.css">
<link rel="stylesheet" href="<%=rootCss%>main/index.css">
</head>
<body>
	<div>
		<jsp:include page="main/header.jsp"></jsp:include>
	</div>

	<div class="wrap" id="wrap">
		<div class="container" id="maincontainer">
			<section>
				<form>
					<div class="adminMain">
						<div>
							<h2>관리자 메인</h2>
						</div>
						<div>
							<ul>
								<li id="newUser">신규가입 회원 ${newUser} 건</li>
								<li>총 회원수 ${userTotal} 탈퇴 : ${deleteTotal}</li>
							</ul>
						</div>
					</div>
					<div>
						<div>
							<h2>최근 QnA</h2>
						</div>
						<div class="qnaNew">
							<table class="qnaNewTb">
								<thead>
									<tr>
										<th>글 번 호</th>
										<th>제 목</th>
										<th>작 성 자</th>
										<th>작 성 일</th>
										<th>저리상태</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="newQna" items="${qnaList}" varStatus="status">
										<tr>
											<td id="qNo">${newQna.qnaNo}</td>
											<td id="qtitle"><a class="at" href="/admin/boardmgr/qna/qnadetail?curruntPage=0&totalPage=0&qnaNo=${newQna.qnaNo}">${newQna.qnaTitle}</a></td>
											<td id="qWriter">${newQna.qnaWriter}</td>
											<td id="qDate">${newQna.qnaRegDate}</td>
											<td id="qPostNo">대 기 중</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</form>
			</section>
		</div>
	</div>
</body>
</html>
