<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String root = request.getContextPath()+"/resources/";
	String rootCss = root+"front/css/";
	String rootJS = root+"front/js/";
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<%=rootCss%>res/salePOPUP.css">
<script type="text/javascript" src="<%=rootJS%>res/salePOPUP.js" /></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="saleSerch">
  <table class="tblSale">
    <thead>
    	<tr>
      		<td colspan = "7">열차 정보 : 열차시간 </td>
    	</tr>
    </thead>
    <tr>
      <td rowspan="4">구분</td>
      <td colspan="3">특실</td>
      <td colspan="3">일빈실</td>
    </tr>
    <tr>
      <td>어른</td>
      <td>어린이</td>
      <td>경로</td>
      <td>어른</td>
      <td>어린이</td>
      <td>경로</td>
    </tr>
    <tr>
      <td class = "tdsa"></td>
      <td class = "tbsc"></td>
      <td class = "tdss"></td>
      <td class = "tdva"></td>
      <td class = "tdvc"></td>
      <td class = "tdvs"></td>
    </tr>
  </table>
</div>
</body>
</html>