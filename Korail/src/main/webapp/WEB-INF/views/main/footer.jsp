<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
   String root = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<%=root%>/resources/front/css/main/index.css">
<link rel="stylesheet" href="<%=root%>/resources/front/css/main/footer.css">
<title>Insert title here</title>
</head>
<body>
   <div id="footerWrap" class="footerWrap">
         <footer>
            <div class="container">
               <ul>
                  <li class="liLogo">
                     <div class="logo"></div>
                  </li>
                  <li class="liBox">
                     <ul>
                        <li>
                           <ul class="ulBox">
                              <li>
                                 <div class="logo">
                                    <a href="#">logo image</a>
                                 </div>
                              </li>
                              <li><a href="#">개인정보방침</a></li>
                              <li><a href="#">고객서비스현장</a></li>
                              <li><a href="#">여객운송약관/부속약관</a></li>
                              <li><a href="#">저작권정책</a></li>
                           </ul>
                        </li>
                        <li>
                           <address>address</address>
                        </li>
                     </ul>
                  </li>
               </ul>
            </div>
         </footer>
   </div>
</body>
</html>