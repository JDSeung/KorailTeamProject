<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title>Korail</title>
<script type="text/javascript" src="<%=root%>jquery-3.2.1.min.js" /></script>
<script type="text/javascript" src="<%=root%>jquery/jquery-ui.js" /></script>
<link rel="stylesheet" href="<%=rootJquery%>jquery-ui.css">
<link rel="stylesheet" href="<%=rootJquery%>jquery-ui.structure.css">
<link rel="stylesheet" href="<%=rootJquery%>jquery-ui.theme.css">
<link rel="stylesheet" href="<%=rootCss%>basic.css">
<link rel="stylesheet" href="<%=rootCss%>res/resInfo.css">
<script type="text/javascript" src="<%=rootJS%>basic.js" /></script>
<script type="text/javascript" src="<%=rootJS%>res/resInfo.js" /></script>
</head>
<body>
	<h2>예약</h2>
	<jsp:include page="../main/header.jsp" />
	<form id="resInfo" action="/korail/reservation/payment" method="post">
		<input type="hidden" id="trainName" name="trainName" value="${ticketingVO.trainName}"/>
		<input type="hidden" id="trainNo" name="trainNO" value="${ticketingVO.trainNO}"/>
		<input type="hidden" id="depPlaceName" name="depPlaceName" value="${ticketingVO.depPlaceName}" />
		<input type="hidden" id="arrPlaceName" name="arrPlaceName" value="${ticketingVO.arrPlaceName}" />
		<input type="hidden" id="depPlandTime" name="depPlandTime" value="${ticketingVO.depPlandTime}"/>
		<input type="hidden" id="arrPlandTime" name="arrPlandTime" value="${ticketingVO.arrPlandTime}"/>
		<input type="hidden" id="reservationNo" name="reservationNo" value="${ticketingVO.reservationNo}"/>
		<input type="hidden" id="seatDivision" name="seatDivision" value="${ticketingVO.seatDivision}"/>
		<input type="hidden" id="ticketingETC" name="ticketingETC" value="3"/>
		<input type="hidden" id="rate" name="rate" value="${ticketingVO.rate}"/>
		<input type="hidden" id="seat" name="seat" value="${ticketingVO.seat}"/>
		<input type="hidden" id="passengerType" name="passengerType" value="${ticketingVO.passengerType}"/>
		<div id="wrap" class="wrap container resInfoWrap">
			<section>
				<h2>예약정보확인</h2>
			</section>
			<table class="restbl">
				<thead>
					<tr>
						<th>승차일자</th>
						<th>열차번호</th>
						<th>열차종별</th>
						<th>출발역</th>
						<th>출발시각</th>
						<th>도착역</th>
						<th>도착시각</th>
						<th>소요시간</th>
						<th>예매매수</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="rideDate"></td>
						<td>${ticketingVO.trainName}</td>
						<td>KTX</td>
						<td>${ticketingVO.depPlaceName}</td>
						<td class="depTime"></td>
						<td>${ticketingVO.arrPlaceName}</td>
						<td class="arrTime"></td>
						<td class="takeTime"></td>
						<td>${ticketingVO.reservationNo}</td>
					</tr>
				</tbody>
			</table>
			<table class="restbl detail">
				<thead>
					<tr>
						<th>객실등급</th>
						<th>좌석정보</th>
						<th>승객유형</th>
						<th class="txt_red">총결제 금액</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>${ticketingVO.seatDivision}</td>
						<td>${ticketingVO.trainNO}호차 ${ticketingVO.seat}</td>
						<td>${ticketingVO.passengerType}</td>
						<td class="txt_red">${ticketingVO.rate}</td>
					</tr>
				</tbody>
			</table>
			<div class="btnarea">
				<button type="button" id="rescancel" class="ui-button ui-corner-all ui-widget resCancle">예약취소</button>
				<button id="res" class="ui-button ui-corner-all ui-widget res">예 약</button>
			</div>
		</div>
	</form>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>