<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String root = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="<%=root%>/resources/jquery-3.2.1.min.js" /></script>
<script type="text/javascript" src="<%=root%>/resources/jquery/jquery-ui.js" /></script>
<script type="text/javascript" src="<%=root%>/resources/front/js/res/searchTrain.js" /></script>
<link rel="stylesheet" href="<%=root%>/resources/jquery/jquery-ui.css">
<link rel="stylesheet" href="<%=root%>/resources/jquery/jquery-ui.structure.css">
<link rel="stylesheet" href="<%=root%>/resources/jquery/jquery-ui.theme.css">
<link rel="stylesheet" href="<%=root%>/resources/front/css/basic.css">
<link rel="stylesheet" href="<%=root%>/resources/front/css/res/searchTrain.css">
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
					<form id="searchForm" class="SearchForm">
						<table>
							<thead>
								<tr>
									<th>인원정보</th>
									<th>여정경로</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><select name="cmbAdult" id="cmbAdult" class="cmb">
									</select></td>
									<td><label for="depPlaceName" class="labtxt">출발역</label> <input
										type="text" id="depPlaceName" class="txtroot" /></td>
								</tr>
								<tr>
									<td><select name="cmbChilde" id="cmbChilde" class="cmb">
									</select></td>
									<td><label for="depPlandTime" class="labtxt">도착역</label> <input
										type="text" id="depPlandTime" class="txtroot" /></td>
								</tr>
								<tr>
									<td><select name="cmbSenior" id="cmbSenior" class="cmb">
									</select></td>
									<td class="noncss">
										<label for="cmbYear" class="labtxt">출발일</label>
										<select name="cmbYear" id="cmbYear" class="cmbdate" onChange="javascript:fn_DayOfMonth()">
										</select> 
										<label for="cmbYear" >년</label>
										<select name="cmbMonth" id="cmbMonth" class="cmbdate" onChange="javascript:fn_DayOfMonth()">
										</select>
										<label for="cmbMonth">월</label>
										<select name="cmbDay" id="cmbDay" class="cmbdate"></select>
										<label for="cmbDay">일</label>
										<select name="cmbTime" id="cmbTime" class="cmbdate"></select>
										<label for="cmbTime">시</label> 
										<input type="text" id="datepicker"/></td>
								</tr>
								<tr>
									<td colspan="2" class="tblbtnarea">
										<button  class="ui-button ui-corner-all ui-widget" > 조 회 </button>
									</td>
								</tr>
							</tbody>
						</table>
					</form>
				</section>
			</section>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>