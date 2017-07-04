<%@page import="com.korail.client.reservation.vo.TicketingVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<% 
  String root = request.getContextPath()+"/resources/";
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
<link rel="stylesheet" href="<%=root%>jquery/jquery-ui.css">
<link rel="stylesheet" href="<%=root%>jquery/jquery-ui.structure.css">
<link rel="stylesheet" href="<%=root%>jquery/jquery-ui.theme.css">
<link rel="stylesheet" href="<%=rootCss%>basic.css">
<script type="text/javascript" src="<%=rootJS%>basic.js" /></script>
<link rel="stylesheet" href="<%=rootCss%>user/resInfoList.css">
<script type="text/javascript" src="<%=rootJS%>user/resInfoList.js"></script>
<title>Korail</title>
</head>
<body>
<h2 class="hide">마이페이지</h2>
<jsp:include page="../main/header.jsp"/>
	<div id="resWrap" class="resWrap wrap">
		<div class="container pageContainer">
			<section>
				<h2>예 매 내 역 조 회</h2>
				<form id="pagingInfo">
					<input type="hidden"  id="curruntPage" class="curruntPage" name="curruntPage" value="${paging.curruntPage}"/>
					<input type="hidden"  id="totalPage" class="totalPage" name="totalPage" value="${paging.totalPage}"/>
					<input type="hidden" id="ticketingDate" name="ticketingDate" />
					<input type="hidden" id="keyWordType" name="keyWordType" value="all"/>		
				</form>
				<form id="resInfo">
					<input type="hidden" id="depPlaceName" name="depPlaceName" />		
					<input type="hidden" id="arrPlaceName" name="arrPlaceName" />		
					<input type="hidden" id="arrPlandTime" name="arrPlandTime" />		
					<input type="hidden" id="depPlandTime" name="depPlandTime" />		
					<input type="hidden" id="seatDivision" name="seatDivision" />		
					<input type="hidden" id="seat" name="seat" />		
				</form>
	            <div class="tblwrap">
				<p class="info">&#8251; 예매내역은 15일 이내 정보만 유지됩니다.</p>
					<div class="dateArea">
						<select name="cmbYear" id="cmbYear" class="cmbdate" onChange="javascript:fn_resvDay()">
						</select> 
						<label for="cmbYear" >년</label>
						<select name="cmbMonth" id="cmbMonth" class="cmbdate cmbsecond" onChange="javascript:fn_resvDay()">
						</select>
						<label for="cmbMonth">월</label>
						<select name="cmbDay" id="cmbDay" class="cmbdate cmbsecond" onChange="javascript:fn_resvDay()"></select>
						<label for="cmbDay">일</label>
						<input type="text" id="resdatepicker"/>
						<button type="button" id="btnSearch" class="ui-button ui-corner-all ui-widget">조회</button>
						<button type="button" id="btnAllSearch" class="ui-button ui-corner-all ui-widget">전체조회</button>
					</div>
	            </div>
	            <c:if test="${not empty sessionScope.userVO.userId}">      
	   				<div class="btnarea">
						<button type="button" id="btnmypage" class="ui-button ui-corner-all ui-widget">마이페이지</button>
					</div>
				</c:if>
				
			</section>
			<div class="pagingNavi pagingdiv">
				<a class="pagenavi btnarrow" onclick="pfirst()"><img src="/korail/resources/front/img/btn_paginate_first.png" alt="처음으로" /></a>
				<a class="pagenavi btnarrow" onclick="ppriev()"><img src="/korail/resources/front/img/btn_paginate_prev.png" alt="이전" /></a>
				<a class="pagenavi ppage1" onclick="ppage(this)"></a>
				<a class="pagenavi ppage2" onclick="ppage(this)"></a>
				<a class="pagenavi ppage3" onclick="ppage(this)"></a>
				<a class="pagenavi ppage4" onclick="ppage(this)"></a>
				<a class="pagenavi ppage5" onclick="ppage(this)"></a>
				<a class="pagenavi btnarrow" onclick="pnext()"><img src="/korail/resources/front/img/btn_paginate_next.png" alt="다음" /></a>
				<a class="pagenavi btnarrow" onclick="plast()"><img src="/korail/resources/front/img/btn_paginate_last.png" alt="앞으로" /></a>
			</div>
			<section>
			<h2 class="hide">예매 조회/취소</h2>
         </section>
		</div>
	</div>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>