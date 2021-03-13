
<%
	response.setHeader("Cache-Control", "no-cach,no-store,must-revalidate");
if (session.getAttribute("admin") == null) {
	response.sendRedirect("/index.jsp");
}
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome-CreateCategories</title>
<jsp:include page="../include/favicon.jsp"></jsp:include>
<link rel="stylesheet" type="text/css"
	href="../bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../bootstrap/css/style.css">
</head>
<body class="bg-light ">
	<jsp:include page="../include/header.jsp"></jsp:include>
	<div class="container h-80  mt-5">
		<div class="row">
			<div class="col-md-6 mx-auto bg-white  p-2">
				<p class="text-center">
					<a href="showCategories.jsp" class="btn btn-success">View All
						Categories</a>
				</p>
				<div>
					<form action="${pageContext.request.contextPath}/categories/"
						method="post">
						<div class="form-group">
							<label for="cat" class="form-label">Categories Name:</label> <input
								type="text" name="cat" placeholder="Enter Categories Name"
								class="form-control" id="cat">
						</div>
						<input type="submit" value="Create Categories"
							class="btn btn-primary">
					</form>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>