<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% 
  String root = request.getContextPath()+"/resources/";
  String rootCss = root+"front/css/";
  String rootJS = root+"front/js/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="<%=root%>jquery-3.2.1.min.js" /></script>
<script type="text/javascript" src="<%=root%>jquery/jquery-ui.js" /></script>
<link rel="stylesheet" href="<%=root%>jquery/jquery-ui.css">
<link rel="stylesheet" href="<%=root%>jquery/jquery-ui.structure.css">
<link rel="stylesheet" href="<%=root%>jquery/jquery-ui.theme.css">
<link rel="stylesheet" href="<%=rootCss%>basic.css">
<script type="text/javascript" src="<%=rootJS%>basic.js" /></script>
<link rel="stylesheet" href="<%=rootCss%>main/index.css">
<script type="text/javascript" src="<%=rootJS%>main/index.js"></script>
<title>Insert title here</title>
</head>
<body>
<jsp:include page="main/header.jsp"/>
	<div id="wrap" class="wrap">
		<div class="container">
			<div class="topSection">
				<section>
					<form id="searchForm">
					<input type="text"  id="curruntPage" class="curruntPage" name="curruntPage" value="0"/>
						<article>
							<table class = "tbleasyres">
								<tr>
									<td colspan="3"><h4>승차권간편예매</h4></td>
								</tr>
								<tr>
									<td>
										<label for="depPlaceName" class="labtxt">출발역</label>
									</td>
									<td>
										<input type="text" id="depPlaceName" name="depPlaceName" class="basictxt" readonly onclick="getDepStation()"/>
									</td>
									<td><button type="button" id="btnDepStation" class="ui-button ui-corner-all ui-widget sbtn" onclick="getDepStation()">조회</button></td>
								</tr>
								<tr>
									<td>
										<label for="arrPlaceName" class="labtxt">도착역</label> 
									</td>	
									<td>
										<input type="text" id="arrPlaceName" name="arrPlaceName" class="basictxt" readonly onclick="getArrStation()"/>
									</td>
									<td><button type="button" id="btnArrStation" class="ui-button ui-corner-all ui-widget sbtn" onclick="getArrStation()">조회</button></td>
								</tr>
								<tr>
									<td>
										<label for="cmbYear" class="labtxt">출발일</label>
									</td>
									<td>
										<select name="cmbYear" id="cmbYear" class="cmbdate" onChange="javascript:fn_GetDay();fn_validateDay()">
										</select> 
										<label for="cmbYear" >년</label>
										<select name="cmbMonth" id="cmbMonth" class="cmbdate cmbsecond" 
											onChange="javascript:fn_GetDay();javascript:fn_validateDay()">
										</select>
										<label for="cmbMonth">월</label>
										<select name="cmbDay" id="cmbDay" class="cmbdate cmbsecond" onChange="javascript:fn_validateDay()"></select>
										<label for="cmbDay">일</label>
										<select name="cmbTime" id="cmbTime" class="cmbdate" ></select>
										<label for="time" class="">시</label>
									</td>
									<td><input type="text" id="datepicker"/></td>
								</tr>
								<tr>
									<td>
										<label for="people">인원</label>
									</td>
									<td>
										<select name="cmbAdult" id="cmbAdult" class="cmb"></select>
										<select name="cmbChilde" id="cmbChilde" class="cmb"></select>
										<select name="cmbSenior" id="cmbSenior" class="cmb"></select>
									</td>
									<td colspan="3"><button type="button" id ="getTicketingInfo" class="ui-button ui-corner-all ui-widget sbtn">승차권 조회</button></td>
								</tr>
							</table>
						</article>
						<article>
							<div class="eventImage"><img src="<%=root%>/front/img/event_image.jpg" alt="Event"/></div>
						</article>
					</form>
				</section>
			</div>
			<div class="bottomSection">
				<section class="sinfo">
					<article class="c1">
						<h2>공지사항</h2>
						<table id="noticeBoard" class="tblBoard">
							<tr>
								<th>
									<c:forEach var="noticeList" items="${getNoticeList}" varStatus="status">
										<tr>
											<td>${noticeList.noticeTitle}</td>
											<td>&nbsp;&nbsp;${noticeList.noticeRegdate}</td>
										</tr>
									</c:forEach>
								</th>
							</tr>
						</table>
					</article>
					<article class="c1">
						<h2>FAQ</h2>
						<table id="FAQBoard" class="tblBoard">
							<tr>
								<th>
									<c:forEach var="FAQList" items="${getFAQList}" varStatus="status">
										<tr>
											<td>${FAQList.faqTitle}</td>
											<td>&nbsp;&nbsp;${FAQList.faqRegdate}</td>
										</tr>
									</c:forEach>
								</th>
							</tr>
						</table>
					</article>
					<article class="c1">
						<img src="" alt="" />이미지
					</article>
				</section>
			</div>
		</div>
	</div>
	<jsp:include page="main/footer.jsp"/>
	<div id="dialog" title="역명조회">
		<jsp:include page="reservation/stationPOPUP.jsp"></jsp:include>
	</div>
</body>
</html>