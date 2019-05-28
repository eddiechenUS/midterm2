<%@ page contentType="text/html; charset=gb2312"%>
<%@ page import="java.io.*"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head><title>jsp map</title>
</head>
<body>
<c:forEach var="aVar" items="${MsgMap}">

${aVar.key}:${aVar.value}<br>
<%-- ${aVar.key}<br> 有效--%>
<%-- ${aVar.value}<br>有效 --%>
<%-- ${aVar.key}:${aVar.key.value}<br>無效 --%>
</c:forEach>
</body>
</html>