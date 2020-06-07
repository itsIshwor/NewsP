<%
	response.setHeader("Cache-Control",
			"no-cach,no-store,must-revalidate");
	if (session.getAttribute("admin") == null) {
		response.sendRedirect("../index.jsp");
	}
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete</title>
<jsp:include page="../include/favicon.jsp"></jsp:include>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../bootstrap/css/style.css">
</head>
<body>
	<%
		String id = (request.getParameter("id"));
		response.sendRedirect("DeleteCategories");
	%>

</body>
</html>