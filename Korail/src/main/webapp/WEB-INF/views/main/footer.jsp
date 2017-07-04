<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% 
  String root = request.getContextPath();
  String rootImg = request.getContextPath()+"/resources/front/img/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<%=root%>/resources/front/css/main/footer.css">
<title>Insert title here</title>
</head>
<body>
   <div id="wrap" >
         <div class="footwrap">
         	<footer>
	            <div class="container comInfowrap">
	               <ul class="comInfo">
	                  <li class="liLogo">
	                     <div class="logo"></div>
	                  </li>
	                  <li class="liBox">
	                     <ul>
	                        <li>
	                           <ul class="ulBox">
	                              <li>
	                                 <div class="logo">
	                                    <img src="<%=rootImg%>f_logo.gif" alt="Korail"/>
	                                 </div>
	                              </li>
	                              <li><a href="#">개인정보방침</a></li>
	                              <li><a href="#">고객서비스현장</a></li>
	                              <li><a href="#">여객운송약관/부속약관</a></li>
	                              <li><a href="#">저작권정책</a></li>
	                           </ul>
	                        </li>
	                        <li>
	                           <address>
	                           	<img src="<%=rootImg%>f_add.gif" alt="(우 140-704) 서울특별시 용산구 녹사평대로 150 (이태원동 34-87) TEL:2199-6114">
	                           </address>
	                        </li>
	                     </ul>
	                  </li>
	               </ul>
	            </div>
	         </footer>
         </div>
   </div>
</body>
</html>