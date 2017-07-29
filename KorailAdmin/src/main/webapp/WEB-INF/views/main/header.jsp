<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%
	String root = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" type="image/jpg" href="<%=root%>/front/img/Korail.jpg" />
<link rel="stylesheet"
	href="<%=root%>/resources/front/css/main/header.css">
</head>
<body>
	<div class="headerWrap" id="headerWrap">
		<div class="headerContainer" id="headerContainer">
			<header>
				<div id="maingnb" class="maingnb">
					<ul>
						<li>
							<div class="logo">
								<a href="/admin/loginCheck"><img src="<%=root%>/resources/front/img/logo.gif" alt="Korail" /></a>
							</div>
						</li>
						<li><a href="/admin/index">HOME</a></li>
						<li><a href="/admin/usermgr/">회원관리</a></li>
						<li><a href="/admin/res/">예매관리</a></li>
						<li><a href="/admin/chart/">통계</a></li>
						<li><a href="#">게시판관리</a>
							<ul>
								<li><a href="/admin/boardmgr/faq/">FAQ</a></li>
								<li><a href="/admin/boardmgr/qna/">QnA</a></li>
								<li><a href="/admin/boardmgr/notice/">공지사항</a></li>
							</ul>
						</li>
						<li><a href="/admin/company">회사정보</a></li>
						<li><a href="/batch/">DB이전</a></li>
					</ul>
				</div>
			</header>
		</div>
	</div>
</body>
</html>