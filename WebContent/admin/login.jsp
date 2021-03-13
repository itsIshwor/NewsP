
<%
	if (session.getAttribute("admin") != null) {
		response.sendRedirect("adminhome.jsp");
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Entering Restricted Area</title>
<jsp:include page="/include/favicon.jsp"></jsp:include>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/bootstrap/css/style.css">
</head>
<body class="bg-info">
	<jsp:include page="/include/header.jsp"></jsp:include>
	<div class="container">
		<div class="row my-3 my-5">
			<div class="col-md-8 mx-auto bg-light  py-3">
				<form action="${pageContext.request.contextPath}/admin" method="post">
					<div class="form-group">
						<label class="form-label" for="email">User Email</label> <input
							type="email" class="form-control border border-primary"
							id="email" name="email" placeholder="User Email">
					</div>
					<div class="form-group">
						<label class="form-label" for="pass">Password</label> <input
							type="password" class="form-control border border-primary"
							id="pass" placeholder="Admin Password" name="pass">
					</div>
					<input type="submit" value="Login" class="btn btn-primary d-inline-block mx-auto">
				</form>
			</div>
		</div>
	</div>
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>