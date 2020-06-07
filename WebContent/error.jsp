<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<jsp:include page="/include/favicon.jsp"></jsp:include>
<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrap.min.css">
<title>NewP-Error</title>
</head>
<body>
	<jsp:include page="/include/header.jsp"></jsp:include>

	<div class="text-center">
		<h1>Error</h1>
		<p>Sorry, Java has thrown an exception.</p>
		<p>To continue, click the Back button.</p>
		<a href="${pageContext.request.contextPath}/index.jsp" class="btn btn-info">Continue</a>
		<h2>Details</h2>
		<p>Type: ${pageContext.exception["class"]}</p>
		<p>Message: ${pageContext.exception.message}</p>
		
	</div>
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>