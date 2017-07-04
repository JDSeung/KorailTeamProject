<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String root = request.getContextPath() + "/resources/";
	String rootJquery = root + "jquery/";
	String rootCss = root + "front/css/";
	String rootJS = root + "front/js/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%=root%>jquery-3.2.1.min.js" /></script>
<script type="text/javascript" src="<%=root%>jquery/jquery-ui.js" /></script>
<link rel="stylesheet" href="<%=rootJquery%>jquery-ui.css">
<link rel="stylesheet" href="<%=rootJquery%>jquery-ui.structure.css">
<link rel="stylesheet" href="<%=rootJquery%>jquery-ui.theme.css">
<link rel="stylesheet" href="<%=rootCss%>/signup/searchZipCode.css">
<script type="text/javascript" src="<%=rootJS%>signup/searchZipCode.js"></script>
</head>
<body>
	<div class="pop_container">
		<section class="pop_searchZip">
			<form id="searchZipForm" class="searchZipForm" method="post"  onsubmit="return false">
				<input type="hidden" class="currentPage" name="currentPage" id="currentPage" value="1" />
				<div class="pop_mailcontent">
					<h4>주소명 검색방법</h4>
					<p>
						1. 도로명 + 건물번호 입력 : 예) '<em>소공로</em>(도로명) <em>70</em>(건물번호)'<br>
						2. 건물명 입력 : 예) '<em>중앙우체국</em>(건물명)'
					</p>
				</div>
				<div class="pop_searchZipCode">
					<div>
						<label for="st_srp3">주소명 입력</label>
						<input type="text" id="searchData" name="query" class="basictxt"  placeholder="주소명을 입력해주세요" maxlength="20">
						<button type="button" id="searchBtn" class="ui-button ui-corner-all ui-widget searchBtn" >검색</button>
					</div>
				</div>
			</form>
			<div class="roadTable scroll" id="roadTable">
				<table class="roadtbl hidetbl">
					<thead>
						<tr>
							<th>우편번호</th>
							<th>주소</th>
						</tr>
					</thead>
					<tbody id="roadList">
					
					</tbody>
				</table>
			</div>
		</section>
	</div>
</body>
</html>