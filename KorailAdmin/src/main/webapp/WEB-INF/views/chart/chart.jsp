<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true"%>
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
<link rel="stylesheet" href="<%=rootCss%>chart/chart.css">
<script type="text/javascript" src="<%=rootJS%>chart/chart.js"></script>
<link rel="stylesheet" href="<%=root%>jqplot/jquery.jqplot.css" />
<script type="text/javascript" src="<%=root%>jqplot/jquery.jqplot.js"></script>
<script type="text/javascript" src="<%=root%>jqplot/plugins/jqplot.categoryAxisRenderer.js"></script>
<script type="text/javascript" src="<%=root%>jqplot/plugins/jqplot.highlighter.js"></script>
<script type="text/javascript" src="<%=root%>jqplot/plugins/jqplot.dateAxisRenderer.js"></script>
<title>Insert title here</title>
</head>
<body>
   <div id="chartWrap" class="chartWrap">
      <div class="container">
         <section>
            <h2>매  출</h2>
            <div id="graph"></div>
            <table class="salestbl">
               <thead>
                  <tr>
                     <th>구 분</th>
                     <th>날 짜</th>
                     <th>인 원 수</th>
                     <th>결재수</th>
                     <th>금 액</th>
                  </tr>
               </thead>
               <tbody>
               		<tr>
               			<c:forEach var="salesList" items="${salesList}" varStatus="status">
               				<tr>
               					<td>
               					<c:choose>
									<c:when test="${salesList.ticketingETC == 1 }">
										매출
									</c:when>
									<c:otherwise>
										환불
									</c:otherwise>
								</c:choose>
               					</td>
               					<td>${salesList.ticketingDate}</td>
               					<td>${salesList.seat+1}</td>
               					<td>${salesList.cnt}</td>
               					<td>${salesList.rate}</td>
               				</tr>
               			</c:forEach>
               		</tr>
               </tbody>
            </table>
         </section>
      </div>
   </div>
</body>
</html>