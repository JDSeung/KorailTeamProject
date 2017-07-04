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
<script type="text/javascript" src="<%=root%>jquery-3.2.1.min.js" /></script>
<script type="text/javascript" src="<%=root%>jquery/jquery-ui.js" /></script>
<link rel="stylesheet" href="<%=rootJquery%>jquery-ui.css">
<link rel="stylesheet" href="<%=rootJquery%>jquery-ui.structure.css">
<link rel="stylesheet" href="<%=rootJquery%>jquery-ui.theme.css">
<link rel="stylesheet" href="<%=rootCss%>basic.css">
<link rel="stylesheet" href="<%=rootCss%>usermgr/userList.css">
<script type="text/javascript" src="<%=rootJS%>usermgr/userList.js" /></script>
<title>Korail</title>
</head>
<body>
	<form id="pagingInfo">
			<input type="hidden"  id="curruntPage" class="curruntPage" name="curruntPage" value="${paging.curruntPage}"/>
			<input type="hidden"  id="totalPage" class="totalPage" name="totalPage" value="${paging.totalPage}"/>
			<jsp:include page="../main/header.jsp" />
		<div id="wrap">
			<div class="container userWrap">
				<section>
					<h2>회원정보 관리</h2>
					<div class="searchNavi">
						<select name="keyWordType" id="keyWordType" class="scmb keyWordType">
							<option value="all">전체</option>
							<option value="title">회원명</option>
						</select>
						<input type="text" name="keyWord" id="keyWord" class="basictxt keyWord" placeholder="검색어 입력"/>
						<button type="button" id="sbtn" class="ui-button ui-corner-all ui-widget sbtn">검색</button>
					</div>
					<table class="usertbl">
						<thead>
							<tr>
								<th class="tbln">회 원 번 호</th>
								<th class="tblt">회 원 명</th>
								<th class="tblw">나 이</th>
								<!-- <th class="tblr">주소 </th> -->
								<th class="tbla">성 별</th>
								<th class="tbla">이 메 일</th>
								<th class="tbla">전 화 번 호</th>
								<th class="tbla">비 고</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
					<div class="pagingNavi">
						<a class="pagenavi btnarrow" onclick="pfirst()"><img src="/admin/resources/front/img/btn_paginate_first.png" alt="처음으로" /></a>
						<a class="pagenavi btnarrow" onclick="ppriev()"><img src="/admin/resources/front/img/btn_paginate_prev.png" alt="이전" /></a>
						<a class="pagenavi ppage1" onclick="ppage(this)"></a>
						<a class="pagenavi ppage2" onclick="ppage(this)"></a>
						<a class="pagenavi ppage3" onclick="ppage(this)"></a>
						<a class="pagenavi ppage4" onclick="ppage(this)"></a>
						<a class="pagenavi ppage5" onclick="ppage(this)"></a>
						<a class="pagenavi btnarrow" onclick="pnext()"><img src="/admin/resources/front/img/btn_paginate_next.png" alt="다음" /></a>
						<a class="pagenavi btnarrow" onclick="plast()"><img src="/admin/resources/front/img/btn_paginate_last.png" alt="앞으로" /></a>
						<button type="button" id="swrite" class="ui-button ui-corner-all ui-widget swrite">글쓰기</button>
					</div>
				</section>
			</div>
		</div>
	</form>		
</body>
</html>