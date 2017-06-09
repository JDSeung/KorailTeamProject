<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% 
  String root = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<%=root%>/WEB-INF/css/main/index.css">

<title>Insert title here</title>
</head>
<body>
<jsp:include page="main/header.jsp"/>
	<div id="mainHomeWrap" class="mainHomeWrap">
			<div class="container">
				<div class="topSection">
					<section>
						<article>
							<table>
								<tr>
									<td colspan="4"><h4>승차권간편예매</h4></td>
								</tr>
								<tr>
									<td>출발역</td>
									<td><input type="text" /></td>
                  <td>조회</td>
								</tr>
								<tr>
									<td>도착역</td>
									<td><input type="text" /></td>
                  <td>조회</td>
								</tr>
								<tr>
									<td>출발일</td>
									<td><input type="text" /></td>
                  <td>조회</td>
								</tr>
								<tr>
									<td>시간</td>
									<td><input type="text" /></td>
                  <td>조회</td>
								</tr>
								<tr>
                  <td></td>
                  <td>어른</td>
									<td>어린이</td>
									<td>경로</td>
								</tr>
								<tr>
                  <td>인원</td>
									<td><input type="text" /></td>
									<td><input type="text" /></td>
									<td><input type="text" /></td>
								</tr>
								<tr>
									<td colspan="4"><button>승차권 조회</button></td>
								</tr>
							</table>
						</article>
						<article>
							<div class="eventImage">이미지</div>
						</article>
					</section>
				</div>
				<div class="bottomSection">
					<section>
						<article class="c1">
							<h2>공지사항</h2>
							<table>
								<tr>
									<th>
										
									</th>
								</tr>
							</table>
						</article>
						<article class="c1"><h2>FAQ</h2></article>
						<article class="c1"><img src="" alt="" />이미지</article>
					</section>
				</div>
			</div>
	</div>S
<jsp:include page="main/footer.jsp"/>
</body>
</html>