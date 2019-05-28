<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
錯誤的指示:<br>
<h1>${ExceptionError}</h1>
<c:forEach var="aVar" items="${MsgMap}">

${aVar.key}:${aVar.value}<br> 
<!-- <h1>Error Message shows Below:</h1> -->
</c:forEach>
<CENTER>
<h4>&lt;&lt;<a href="loginWithCss.jsp">回首頁</a>&gt;&gt;</h4>
</CENTER>
</body>
</html>