<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<script type="text/javascript" src="<%=root%>jquery-3.2.1.min.js" /></script>
<script type="text/javascript" src="<%=root%>jquery/jquery-ui.js" /></script>
<link rel="stylesheet" href="<%=rootJquery%>jquery-ui.css">
<link rel="stylesheet" href="<%=rootJquery%>jquery-ui.structure.css">
<link rel="stylesheet" href="<%=rootJquery%>jquery-ui.theme.css">
<link rel="stylesheet" href="<%=rootCss%>basic.css">
<link rel="stylesheet" href="<%=rootCss%>res/searchTrain.css">
<script type="text/javascript" src="<%=rootJS%>res/searchTrain.js" /></script>
<script type="text/javascript" src="<%=rootJS%>basic.js" /></script>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<div id="wrap">
		<div class="container">
			<section class="res">
				<h2>승차권 예약</h2>
				<section class="searchData">
					<h2>좌석조회</h2>
					<form id="searchForm" class="SearchForm" name ="ktxInfoVO">
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
										<input type="text" id="depPlaceName" name="depPlaceName" class="txtroot" />
										<button type="button" id="btnDepStation" class="ui-button ui-corner-all ui-widget" > 조 회 </button>
									</td>
								</tr>
								<tr>
									<td>
										<select name="cmbChilde" id="cmbChilde" class="cmb"></select>
									</td>
									<td>
										<label for="arrPlaceName" class="labtxt">도착역</label>
										<input type="text" id="arrPlaceName" name="arrPlaceName" class="txtroot" />
										<button type="button" id="btnArrStation" class="ui-button ui-corner-all ui-widget" > 조 회 </button>	
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
										<button type="button" id="getTicketingInfo" class="ui-button ui-corner-all ui-widget" > 조 회 </button>
								</td>
								</tr>
							</tbody>
						</table>
					</form>
					<jsp:include page="../main/footer.jsp" />
				</section>
			</section>
		</div>
	</div>
	<div id="dialog" title="역명조회">
		<jsp:include page="stationPOPUP.jsp"></jsp:include>
	</div>
	
</body>
</html>