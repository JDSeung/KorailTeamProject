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
<link rel="stylesheet" href="<%=rootCss%>main/index.css">
<script type="text/javascript" src="<%=rootJS%>basic.js" /></script>
<script type="text/javascript" src="<%=rootJS%>main/index.js"></script>
<title>Insert title here</title>
</head>
<body>
<jsp:include page="main/header.jsp"/>
	<div id="wrap" class="wrap">
		<div class="container">
			<div class="topSection">
				<section>
					<article>
						<table>
							<tr>
								<td colspan="4"><h4>승차권간편예매</h4></td>
							</tr>
							<tr>
								<td>
									<label for="depPlaceName" class="labtxt">출발역</label>
									<input type="text" id="depPlaceName" name="depPlaceName" class="basictxt" readonly/>
								</td>
								<td><button id="btnDepStation" class="ui-button ui-corner-all ui-widget">조회</button></td>
							</tr>
							<tr>
								<td>
									<label for="arrPlaceName" class="labtxt">도착역</label> 
									<input type="text" id="arrPlaceName" name="arrPlaceName" class="basictxt" readonly/>
								</td>
								<td><button id="btnArrStation" class="ui-button ui-corner-all ui-widget">조회</button></td>
							</tr>
							<tr>
								<td>
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
								</td>
								<td><input type="text" id="datepicker"/></td>
							</tr>
							<tr>
								<td>
									<label for="cmbTime">시간</label>
									<select name="cmbTime" id="cmbTime"></select>
									<label for="time" class="">시</label>
								</td>
							</tr>
							<tr>
								<td>
									<label for="cmbAdult">어른</label>
									<label for="cmbChilde">어린이</label>
									<label for="cmbSenior">경로</label>
								</td>
							</tr>
							<tr>
								<td>
									<label for="people">인원</label>
									<select name="cmbAdult" id="cmbAdult" class="cmb"></select>
									<select name="cmbChilde" id="cmbChilde" class="cmb"></select>
									<select name="cmbSenior" id="cmbSenior" class="cmb"></select>
								</td>
							</tr>
							<tr>
								<td><button class="ui-button ui-corner-all ui-widget">승차권 조회</button></td>
							</tr>
						</table>
					</article>
					<article>
						<div class="eventImage"><img src="<%=root%>/front/img/event_image.jpg" alt="Event"/></div>
					</article>
				</section>
			</div>
			<div class="bottomSection">
				<section>
					<article class="c1">
						<h2>공지사항</h2>
						<table id="noticeBoard">
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
						<table id="FAQBoard">
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