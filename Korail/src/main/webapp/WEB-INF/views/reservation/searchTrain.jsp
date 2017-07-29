<%@page import="com.korail.client.user.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import = "com.korail.client.user.*" %>
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
<script type="text/javascript" src="<%=rootJS%>basic.js" /></script>
<link rel="stylesheet" href="<%=rootCss%>res/searchTrain.css">
<script type="text/javascript" src="<%=rootJS%>res/searchTrain.js" /></script>
<title>Korail</title>
<body>
<input type="hidden" id="hdepPlandTime" name="depPlandTime" value="${depPlandTime}" />
<input type="hidden" id="hcmbAdult" name="cmbAdult" value="${cmbAdult}" />
<input type="hidden" id="hcmbChild" name="cmbChild" value="${cmbChild}" />
<input type="hidden" id="hcmbSenior" name="cmbSenior" value="${cmbSenior}" />
<input type="hidden" id="hcmbYear" name="cmbYear" value="${cmbYear}" />
<input type="hidden" id="hcmbMonth" name="cmbMonth" value="${cmbMonth}" />
<input type="hidden" id="hcmbDay" name="cmbDay" value="${cmbDay}" />
<input type="hidden" id="hcmbTime" name="cmbTime" value="${cmbTime}" />
<form id="resInfoForm">
	<input type="hidden" id="strainName" name="trainName" />
	<input type="hidden" id="strainNo" name="trainNO" />
	<input type="hidden" id="hdepPlaceName" name="depPlaceName" value="${depPlaceName}" />
	<input type="hidden" id="harrPlaceName" name="arrPlaceName" value="${arrPlaceName}" />
	<input type="hidden" id="sdepPlandTime" name="depPlandTime" />
	<input type="hidden" id="sarrPlandTime" name="arrPlandTime" />
	<input type="hidden" id="sreservationNo" name="reservationNo" />
	<input type="hidden" id="sseatDivision" name="seatDivision" />
	<input type="hidden" id="srate" name="rate" />
	<input type="hidden" id="sseat" name="seat" />
	<input type="hidden" id="spassengerType" name="passengerType" />
</form>
	<jsp:include page="../main/header.jsp" />
	<div id="wrap" class="wrap">
		<div class="container">
			<section class="res">
				<h2>승차권 예약</h2>
				<section class="searchData">
					<h2>좌석조회</h2>
					<form id="searchForm" class="SearchForm" name ="ktxInfoVO">
					<input type="text"  id="curruntPage" class="curruntPage" name="curruntPage" value="0"/>
						<table>
							<thead>
								<tr>
									<th>인원정보</th>
									<th>여정경로</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>
										<select name="cmbAdult" id="cmbAdult" class="cmb"></select>
									</td>
									<td>
										<label for="depPlaceName" class="labtxt">출발역</label> 
										<input type="text" id="depPlaceName" name="depPlaceName" class="txtroot" onclick="getDepStation()" readonly value="서울"/>
										<button type="button" id="btnDepStation" class="ui-button ui-corner-all ui-widget" onclick="getDepStation()"> 조 회 </button>
									</td>
								</tr>
								<tr>
									<td>
										<select name="cmbChild" id="cmbChild" class="cmb"></select>
									</td>
									<td>
										<label for="arrPlaceName" class="labtxt">도착역</label>
										<input type="text" id="arrPlaceName" name="arrPlaceName" class="txtroot" onclick="getArrStation()" readonly value="부산"/>
										<button type="button" id="btnArrStation" class="ui-button ui-corner-all ui-widget" onclick="getArrStation()"> 조 회 </button>	
									</td>
								</tr>
								<tr>
									<td>
										<select name="cmbSenior" id="cmbSenior" class="cmb"></select>
									</td>
									<td class="noncss">
										<label for="cmbYear" class="labtxt">출발일</label>
										<select name="cmbYear" id="cmbYear" class="cmbdate" onChange="javascript:fn_GetDay();fn_validateDay()">
										</select> 
										<label for="cmbYear" >년</label>
										<select name="cmbMonth" id="cmbMonth" class="cmbdate" 
											onChange="javascript:fn_GetDay();javascript:fn_validateDay()">
										</select>
										<label for="cmbMonth">월</label>
										<select name="cmbDay" id="cmbDay" class="cmbdate" onChange="javascript:fn_validateDay()"></select>
										<label for="cmbDay">일</label>
										<select name="cmbTime" id="cmbTime" class="cmbdate"></select>
										<label for="cmbTime">시</label> 
										<input type="text" id="datepicker"/></td>
								</tr>
								<tr>
								<td colspan="2" class="tblbtnarea">
										<button type="button" id="getTicketingInfo" class="ui-button ui-corner-all ui-widget calUser" > 조 회 </button>
								</td>
								</tr>
							</tbody>
						</table>
						
					</form>
					<div id="dialog" title="Korail 역명조회">
						<jsp:include page="stationPOPUP.jsp"></jsp:include>
					</div>
					<div id="popSale" class="popSale" title="Korail 운임요금조회">
						<jsp:include page="salePOPUP.jsp"></jsp:include>
					</div>
					<div id="popSeat" class="popSale" title="Korail 좌석선택">
						<jsp:include page="selectSeat.jsp"></jsp:include>
					</div>
					<section class="searchData">
						<h2>열차정보</h2>
						<div id="trainInfoWrap" class="trainInfoWrap">
							<jsp:include page="trainInfo.jsp"></jsp:include>
						</div>
					</section>	
				</section>
			</section>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp" />
	
	
</body>
</html>