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
<link rel="stylesheet" href="<%=root%>/resources/front/css/basic.css">
<link rel="stylesheet" href="<%=root%>/resources/front/css/main/header.css">
<script type="text/javascript" src="<%=root%>/resources/front/js/main/header.js"></script>
<title>Insert title here</title>
</head>
<body>
   <div id="headerWrap" class="headerWrap">
         <div class="container">
            <header>
               <div id="sidegnb" class="sidegnb">
                     <ul>
                        <li><a href="/korail/">HOME</a></li>
<<<<<<< HEAD
                        <li><a href="/korail/login/">로그인</a></li>
                        <li><a href="/korail/user/">마이페이지</a></li>
                        <li><a href="/korail/mail/">회원가입</a></li>
                        <li><a href="/korail/qnaboard/">고객센터</a></li>
=======
                        <li><a href="#">로그인</a></li>
                        <li><a href="#">마이페이지</a></li>
                        <li><a href="#"onclick="return join_link()">회원가입</a></li>
                        <li><a href="#">고객센터</a></li>
>>>>>>> 97e9861b63e70e8dc741ef86d08e504fe0d923df
                        <li><a href="#">사이트맵</a></li>
                     </ul>
               </div>
               <div id="maingnb" class="maingnb">
                     <ul>
                        <li>
                           <div class="logo"><img src="<%=root%>/resources/img/logo.png" /></div>
                        </li>
                        <li><a href="/korail/reservation/">승차권</a></li>
                        <li>
                           <a href="/korail/qnaboard/">고객센터</a>
                           <ul>
                              <li><a href="/korail/faqboard">FAQ</a></li>
                              <li><a href="/korail/qnaboard/">QnA</a></li>
                           </ul>
                        </li>
                        <li><a href="/korail/noticeboard/">공지사항</a></li>
                        <li><a href="#">회사소개</a></li>
                     </ul>
               </div>
            </header>
         </div>
   </div>
</body>
</html>