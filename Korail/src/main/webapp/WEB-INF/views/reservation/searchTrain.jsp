<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
   String root = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="<%=root%>/resources/jquery-3.2.1.min.js"/></script>
<script type="text/javascript" src="<%=root%>/resources/jquery/jquery-ui.js"/></script>
<link rel="stylesheet" href="<%=root%>/resources/jquery/jquery-ui.css">
<link rel="stylesheet" href="<%=root%>/resources/jquery/jquery-ui.structure.css">
<link rel="stylesheet" href="<%=root%>/resources/jquery/jquery-ui.theme.css">
<link rel="stylesheet" href="<%=root%>/resources/front/css/main/index.css">
<link rel="stylesheet" href="<%=root%>/resources/front/css/res/resInfo.css">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<div id="wrap">
			<div class="container">
				<section class="res">
					<h2>예약</h2>
					<div class="step">
						<ul>
							<li class="prograss">조회</li>
							<li class="prograss">예약</li>
							<li class="prograss">결제</li>
						</ul>
					</div>
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
												<option value="1">성인 1명</option>
										</select></td>
										<td><label for="depPlaceName" class="labtxt">출발역</label> <input
											type="text" id="depPlaceName" class="txtroot" /></td>
									</tr>
									<tr>
										<td><select name="cmbChilde" id="cmbChilde" class="cmb">
												<option value="0">만 4세 ~ 12세</option>
										</select></td>
										<td><label for="depPlandTime" class="labtxt">도착역</label> <input
											type="text" id="depPlandTime" class="txtroot" /></td>
									</tr>
									<tr>
										<td><select name="cmbSenior" id="cmbSenior" class="cmb">
												<option value="0">만 65세 이상</option>
										</select></td>
										<td class="noncss"><label for="cmbYear" class="labtxt">출발일</label>
											<select name="cmbYear" id="cmbYear" class="cmbdate">
										</select> <label for="cmbYear">년</label> <select name="cmbMonth"
											id="cmbMonth" class="cmbdate">
										</select> <label for="cmbMonth">월</label> <select name="cmbDay"
											id="cmbDay" class="cmbdate">
										</select> <label for="cmbDay">일</label> <input type="text"
											id="datepicker" /></td>
									</tr>
								</tbody>
							</table>
						</form>
					</section>
				</section>
			</div>
		</div>
	<jsp:include page="trainInfo.jsp" />
	<jsp:include page="../main/footer.jsp" />
</body>
</html>