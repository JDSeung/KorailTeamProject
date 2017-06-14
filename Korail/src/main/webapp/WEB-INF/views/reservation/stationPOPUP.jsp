<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% 
  String rootCSS = request.getContextPath()+"/resources/front/css/res/";
  String rootJS = request.getContextPath()+"/resources/front/js/res/";
%>
<!-- 팝업창 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="<%=rootJS%>stationPOPUP.js" /></script>
<link rel="stylesheet" href="<%=rootCSS%>stationPOPUP.css">
</head>
<body>
<input type="text" class="division"/>
<div class="pop_container">
	<section class="pop_station">
   		<h2>역명조회</h2>
    	<div class="pop_item">
			<ul>
				<li><a href="javascript:putStation('서울')">서 울</a></li>
				<li><a href="javascript:putStation('용산')">용 산</a></li>
				<li><a href="javascript:putStation('영등포')">영 등 포</a></li>
				<li><a href="javascript:putStation('광명')">광 명</a></li>
				<li><a href="javascript:putStation('수원')">수 원</a></li>
				<li><a href="javascript:putStation('천안아산')">천 안 아 산</a></li>
				<li><a href="javascript:putStation('오송')">오 송</a></li>
				<li><a href="javascript:putStation('부산')">부 산</a></li>
				<li><a href="javascript:putStation('대전')">대 전</a></li>
				<li><a href="javascript:putStation('서대전')">서 대 전</a></li>
				<li><a href="javascript:putStation('김천')">김 천</a></li>
				<li><a href="javascript:putStation('동대구')">동 대 구</a></li>
				<li><a href="javascript:putStation('포항')">포 항</a></li>
				<li><a href="javascript:putStation('밀양')">밀 양</a></li>
				<li><a href="javascript:putStation('구포')">구 포</a></li>
				<li><a href="javascript:putStation('신경주')">신 경 주</a></li>
				<li><a href="javascript:putStation('울산')">울 산</a></li>
				<li><a href="javascript:putStation('진주')">진 주</a></li>
				<li><a href="javascript:putStation('마산')">마 산</a></li>
				<li><a href="javascript:putStation('창원')">창 원</a></li>
				<li><a href="javascript:putStation('창원중앙')">창 원 중 앙</a></li>
				<li><a href="javascript:putStation('진영')">진 영</a></li>
				<li><a href="javascript:putStation('논산')">논 산</a></li>
				<li><a href="javascript:putStation('공주')">공 주</a></li>
				<li><a href="javascript:putStation('익산')">익 산</a></li>
				<li><a href="javascript:putStation('정읍')">정 읍</a></li>
				<li><a href="javascript:putStation('광주송정')">광 주 송 정</a></li>
				<li><a href="javascript:putStation('나주')">나 주</a></li>
				<li><a href="javascript:putStation('목포')">목 포</a></li>
				<li><a href="javascript:putStation('전주')">전 주</a></li>
				<li><a href="javascript:putStation('서울')">남 원</a></li>
				<li><a href="javascript:putStation('서울')">순 천</a></li>
				<li><a href="javascript:putStation('서울')">여 수 EXPO</a></li>
				<li><a href="javascript:putStation('서울')">행 신</a></li>
				<li><a href="javascript:putStation('서울')">계 룡</a></li>
				<li><a href="javascript:putStation('곡성')">곡 성</a></li>
				<li><a href="javascript:putStation('여천')">여 천</a></li>
				<li><a href="javascript:putStation('구례구')">구 례 구</a></li>
			</ul>
	    </div>
	</section>
</div>
</body>
</html>