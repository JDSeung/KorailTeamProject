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
<link rel="stylesheet" href="<%=rootCss%>noticeboard/noticeList.css">
<script type="text/javascript" src="<%=rootJS%>noticeboard/noticeList.js"></script>
<title>Korail</title>
</head>
<body>
<jsp:include page="../main/header.jsp"/>
	<form id="pagingInfo">
		<input type="hidden" id="curruntPage" class="curruntPage" name="curruntPage" value="${paging.curruntPage}" />
		<input type="hidden" id="totalPage" class="totalPage" name="totalPage" value="${paging.totalPage}" />
		<input type="hidden" id="noticeNO" class="noticeNO" name="noticeNO" value="0"/>
		<input type="hidden" name="keyWord" id="keyWord" class="basictxt keyWord"/>
	</form>
	<div id="wrap">
		<div class="container">
			<section>
				<h2>공 지 사 항</h2>
				<div class="searchNavi">
					<select name="keyWordType" id="keyWordType" class="scmb keyWordType">
						<option value="title">제목</option>
					</select>
					<input type="text" name="word" id="word" class="basictxt keyWord" placeholder="검색어 입력"/>
					<button type="button" id="sbtn" class="ui-button ui-corner-all ui-widget sbtn">검색</button>
				</div>
				<table class="noticetbl">
					<thead>
						<tr>
							<th class="tbln">글 번 호</th>
							<th class="tblt">제 목</th>
							<th class="tblr">작 성 일</th>
						</tr>
					</thead>
					<tbody>
					
					</tbody>
				</table>
				<form id="detailForm" name="detailForm">
					<input type="hidden" name="noticeNo" id="noticeNo" />
				</form>
				<div class="pagingNavi">
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
			</section>
		</div>
	</div>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>