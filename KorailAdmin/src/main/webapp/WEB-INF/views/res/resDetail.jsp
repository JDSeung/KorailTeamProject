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
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript" src="<%=root%>jquery-3.2.1.min.js" /></script>
<script type="text/javascript" src="<%=root%>jquery/jquery-ui.js" /></script>
<link rel="stylesheet" href="<%=rootJquery%>jquery-ui.css">
<link rel="stylesheet" href="<%=rootJquery%>jquery-ui.structure.css">
<link rel="stylesheet" href="<%=rootJquery%>jquery-ui.theme.css">
<link rel="stylesheet" href="<%=rootCss%>basic.css">
<link rel="stylesheet" href="<%=rootCss%>res/resDetail.css">
<script type="text/javascript" src="<%=rootJS%>res/resDetail.js" /></script>
<title>Korail</title>
</head>
<body>
	<form id="pagingInfo">
			<input type="hidden"  id="curruntPage" class="curruntPage" name="curruntPage" value="${paging.curruntPage}"/>
			<input type="hidden"  id="totalPage" class="totalPage" name="totalPage" value="${paging.totalPage}"/>
			<input type="hidden"  id="ticketingNo" class="ticketingNo" name="ticketingNo" value="${ticketingVO.ticketingNo}"/>
			<jsp:include page="../main/header.jsp" />
		<div id="wrap">
			<div class="container resWrap">
				<section>
					<h2>예매관리</h2>
					<table class="restbl">
						<tbody>
							<fmt:parseDate value="${ticketingVO.depPlandTime}" var="dapFmt" pattern="yyyyMMddHHmm"/>
							<fmt:parseDate value="${ticketingVO.arrPlandTime}" var="arrFmt" pattern="yyyyMMddHHmm"/>
							<tr>
								<td>승차일자</td>
								<td>열차종별</td>
								<td>열차번호</td>
								<td>출발역</td>
								<td>출발시각</td>
								<td>도착역</td>
								<td>도착시각</td>
								<td>상태</td>
							</tr>
							<tr>
								<td><fmt:formatDate value="${dapFmt}" pattern="MM'월 'dd'일 '"/></td>
								<td>KTX</td>
								<td>${ticketingVO.trainName}</td>
								<td>${ticketingVO.depPlaceName}</td>
								<td><fmt:formatDate value="${dapFmt}" pattern="HH'시 'mm'분 '"/></td>
								<td>${ticketingVO.arrPlaceName}</td>
								<td><fmt:formatDate value="${arrFmt}" pattern="HH'시 'mm'분 '"/></td>
								<td rowspan="3">
									<c:choose>
										<c:when test="${ticketingVO.ticketingETC == 1}">
											환불
										</c:when>
										<c:when test="${ticketingVO.ticketingETC == 2}">
											진행
										</c:when>
										<c:when test="${ticketingVO.ticketingETC == 3}">
											결제
											<br />
											<button type="button" class="resCancel ui-button ui-corner-all ui-widget">환 불</button>											
										</c:when>
										<c:when test="${ticketingVO.ticketingETC == 4}">
											만료
										</c:when>
									</c:choose>
								</td>
							</tr>
							<tr>
								<td colspan="1">객실등급</td>
								<td colspan="1">예매매수</td>
								<td colspan="3">좌석정보</td>
								<td colspan="1">승객유형</td>
								<td colspan="1" class="txt_red">총결제 금액</td>
							</tr>
							<tr>
								<td colspan="1">${ticketingVO.seatDivision}</td>
								<td colspan="1">${ticketingVO.reservationNo}</td>
								<td colspan="3">${ticketingVO.seat}</td>
								<td colspan="1">${ticketingVO.passengerType} </td>
								<td colspan="1" class="txt_red">${ticketingVO.rate}원</td>
								</tr>
							</tbody>
					</table>
				</section>
			</div>
		</div>
	</form>		
</body>
</html>