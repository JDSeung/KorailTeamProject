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
</head>
<body>
	<div>
		<jsp:include page="main/header.jsp"></jsp:include>
	</div>

	<div class="wrap" id="wrap">
		<div class="container" id="container">
			<section>
				<form>
					<div>
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
							<table>
								<caption>최근 QnA</caption>
								<colgroup>
									<col class="colwid1">
									<col class="colwid2">
									<col class="colwid3">
									<col class="colwid4">
									<col class="colwid5">
									<col class="colwid6">
								</colgroup>
								<thead>
									<tr>
										<th scope="col">글 번 호</th>
										<th scope="col">제 목</th>
										<th scope="col">작 성 자</th>
										<th scope="col">작 성 자 ID</th>
										<th scope="col">작 성 일</th>
										<th scope="col">첨 부 파 일</th>
									</tr>
								</thead>
								<tbody id="qnas" >

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
