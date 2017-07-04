<%@page import="com.korail.client.reservation.vo.TicketingVO"%>
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
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript" src="<%=root%>jquery-3.2.1.min.js" /></script>
<script type="text/javascript" src="<%=root%>jquery/jquery-ui.js" /></script>
<link rel="stylesheet" href="<%=root%>jquery/jquery-ui.css">
<link rel="stylesheet" href="<%=root%>jquery/jquery-ui.structure.css">
<link rel="stylesheet" href="<%=root%>jquery/jquery-ui.theme.css">
<link rel="stylesheet" href="<%=rootCss%>basic.css">
<script type="text/javascript" src="<%=rootJS%>basic.js" /></script>
<link rel="stylesheet" href="<%=rootCss%>user/myPage.css">
<script type="text/javascript" src="<%=rootJS%>user/myPage.js"></script>
<title>Korail</title>
</head>
<body>
<h2 class="hide">마이페이지</h2>
<jsp:include page="../main/header.jsp"/>
	<form id="userInfo"></form>
	<div id="myPageWrap" class="myPageWrap wrap">
		<div class="container pageContainer">
			<section>
				<h2>마이페이지</h2>
				<table class="myPagetbl">
					<thead>
						<tr class="thr">
							<th colspan="2">회원정보</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="thr">이름</td>
							<td>${userVO.userName}</td>
						</tr>
						<tr>
							<td class="thr">아이디</td>
							<td>${userVO.userId}</td>
						</tr>
						<tr>
							<td class="thr">비밀번호</td>
							<td>
								<button type="button" id="chpwbtn" class="chpwbtn ui-button ui-corner-all ui-widget">비밀번호변경</button>
							</td>
						</tr>
						<tr>
							<td class="thr">생년월일</td>
							<td>${userVO.userBirth}</td>
						</tr>
						<tr>
							<td class="thr">성별</td>
							<td>${userVO.userGender}</td>
						</tr>
						<tr>
							<td class="thr">E-mail</td>
							<td>${userVO.userEmail}</td>
						</tr>
						<tr>
							<td class="thr">전화번호</td>
							<td>${userVO.userPhone}</td>
						</tr>
						<tr>
							<td class="thr">주소</td>
							<td>${userVO.userAddr}</td>
						</tr>
					</tbody>
				</table>
	            <table class="myPagetbl stbl">
	               <thead>
	                  <tr>
	                  	<th colspan="2">예매 조회/취소</th>
	                  </tr>
	               </thead>
	               <tbody >
	                  <tr>
	                     <td class="thrs">승차일자</td>
	                     <td class="thrs">열차번호</td>
	                     <td class="thrs">열차종별</td>
	                     <td class="thrs">출발역</td>
	                     <td class="thrs">출발시각</td>
	                     <td class="thrs">도착역</td>
	                     <td class="thrs">도착시각</td>
	                     <td class="thrs">예매매수</td>
	                     <td class="thrs">총결제금액</td>
	                  </tr>
	                  <tr>
	                     <td>
		                     <fmt:parseDate var="fsDate" value="${ticketingVO.getDepPlandTime().substring(4,8)}" pattern="mmdd"/>
		                     <fmt:formatDate  var="fdDate" value="${fsDate}" pattern="mm월dd일"/>
		                     ${fdDate} 
	                     </td>
	                     <td>${ticketingVO.trainName}</td>
	                     <td>${ticketingVO.vehiclekndNm}</td>
	                     <td>${ticketingVO.depPlaceName}</td>
	                     <td>
	                    	<fmt:parseDate var="fsDate" value="${ticketingVO.getDepPlandTime().substring(8,12)}" pattern="HHmm"/>
		                 	<fmt:formatDate  var="fdDate" value="${fsDate}" pattern="HH시mm분"/>
		                     ${fdDate} 
	                     </td>
	                     <td>${ticketingVO.arrPlaceName}</td>
	                     <td>
	                     	<fmt:parseDate var="fsDate" value="${ticketingVO.getArrPlandTime().substring(8,12)}" pattern="HHmm"/>
		                 	<fmt:formatDate  var="fdDate" value="${fsDate}" pattern="HH시mm분"/>
		                     ${fdDate}
	                     </td>
	                     <td>${ticketingVO.reservationNo}</td>
	                     <td>${ticketingVO.rate}</td>
	                  </tr>
	               </tbody>
	            </table>
				<div class="btnarea">
					<button type="button" id="btnedit" class="ui-button ui-corner-all ui-widget">회원정보 수정</button>
					<button type="button" id="btnsearch" class="ui-button ui-corner-all ui-widget">예매 조회</button>
					<button type="button" id="btnsignOut" class="ui-button ui-corner-all ui-widget">회원 탈퇴</button>
				</div>
			</section>
			<section>
			<h2 class="hide">예매 조회/취소</h2>
         </section>
		</div>
	</div>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>