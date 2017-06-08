<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
   String root = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>본인 인증 || 회원가입 Korail</title>
<link rel="stylesheet" href="<%=root%>/resources/css/main/index.css" />
<link rel="stylesheet" href="<%=root%>/resources/css/mail/mail.css" />
</head>
<body>
   <div class="header">
      <jsp:include page="../main/header.jsp" />
   </div>
   <div class="mailWrap" id="mailWrap">
      <div class="container">
         <section class="mail">
            <div class="location">
               <h2>회원가입</h2>
            </div>
            <div class="content">
               <h3>회원 가입 여부 확인</h3>
               <div>
                  <ul>
                     <li>E-Mail을 통하여 홈페이지 회원 가입 여부를 확인 할 수 있습니다.</li>
                  </ul>
               </div>
               <div class="content join_form">
                  <form action="" class="join_form">
                     <div>
                        <ul>
                           <li><a href=""><b>E-Mail 인증</b></a> <br /> 이메일은 반드시 본인
                              명의로 된 메일 주소로 인증 하셔야 합니다.</li>
                        </ul>
                     </div>
                  </form>
               </div>
            </div>
         </section>
      </div>
   </div>
   <div class="footer">
      <jsp:include page="../main/footer.jsp" />
   </div>
</body>
</html>