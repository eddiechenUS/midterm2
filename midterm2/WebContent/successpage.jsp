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
<CENTER>
<h4>&lt;&lt;<a href="loginWithCss.jsp">回首頁</a>&gt;&gt;</h4>
</CENTER>
<h1>Success Page</h1>
<h1>${DelSuccess}</h1>
<h1>${InsertSuccess}</h1>
<h1>${UpdateSuccess}</h1>
<c:forEach var="aVar" items="${alldata}">
<!-- <h1>All data shows below</h1> -->
${aVar.num},
${aVar.school_code},
${aVar.school_name}, 
${aVar.major_code}, 
${aVar.major_name}, 
${aVar.level_code}, 
${aVar.city_code}, 
${aVar.avg_score1}, 
${aVar.deadline1} 
------------------------------------------<BR>
</c:forEach>
<CENTER>
<h4>&lt;&lt;<a href="loginWithCss.jsp">回首頁</a>&gt;&gt;</h4>
</CENTER>
</body>
</html>