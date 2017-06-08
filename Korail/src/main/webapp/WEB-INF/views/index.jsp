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
<link rel="stylesheet" href="<%=root%>/resources/css/main/index.css">

<title>Insert title here</title>
</head>
<body>
	<jsp:include page="main/header.jsp" />
	
	<h1>메인페이지</h1>
	<jsp:include page="main/footer.jsp" />
</body>
</html>