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
								<td>출발역</td>
								<td><input type="text" id="depPlaceName" class="basictxt"/></td>
								<td><button id="btnDepStation" class="ui-button ui-corner-all ui-widget">조회</button></td>
							</tr>
							<tr>
								<td>도착역</td>
								<td><input type="text" id="arrPlaceName" class="basictxt" /></td>
								<td><button id="btnArrStation" class="ui-button ui-corner-all ui-widget">조회</button></td>
							</tr>
							<tr>
								<td>출발일</td>
								<td>
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
								<td><button class="ui-button ui-corner-all ui-widget">조회</button></td>
							</tr>
							<tr>
								<td>시간</td>
								<td><input type="text" class="basictxt"/></td>
								<td><button class="ui-button ui-corner-all ui-widget">조회</button></td>
							</tr>
							<tr>
								<td></td>
								<td>어른</td>
								<td>어린이</td>
								<td>경로</td>
							</tr>
							<tr>
								<td>인원</td>
								<td>
									<select name="cmbAdult" id="cmbAdult" class="cmb"></select>
								</td>
								<td>
									<select name="cmbChilde" id="cmbChilde" class="cmb"></select>
								</td>
								<td>
									<select name="cmbSenior" id="cmbSenior" class="cmb"></select>
								</td>
							</tr>
							<tr>
								<td colspan="4"><button class="ui-button ui-corner-all ui-widget">승차권 조회</button></td>
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
								<th><c:choose>
										<c:when test="${not empty noticeList}">

										</c:when>
									</c:choose></th>
							</tr>
						</table>
					</article>
					<article class="c1">
						<h2>FAQ</h2>
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