
<%
	response.setHeader("Cache-Control",
			"no-cach,no-store,must-revalidate");
	if (session.getAttribute("admin") == null) {
		response.sendRedirect("../index.jsp");
	}
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome-All Categories</title>
<jsp:include page="../include/favicon.jsp"></jsp:include>
<link rel="stylesheet" type="text/css"
	href="../bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../bootstrap/css/style.css">
</head>
<body>
	<jsp:include page="../include/header.jsp"></jsp:include>

	<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/practice" user="root"
		password="password" />
	<sql:query var="rs" dataSource="${db}">select * from categories</sql:query>
	<div class="container my-4 c-table">
		<p class="mt-3 text-center">
			<a href="${pageContext.request.contextPath}/Categories/createCategories.jsp" class="btn btn-primary ">Create
				New Category</a>
		</p>
		<table
			class="table table-reponsive table-striped table-bordered text-center ">
			<thead class="font-weight-bold">
				<tr>
					<td>Categories id</td>
					<td>Categories Name</td>
					<td>Edit</td>
					<td>Delete</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${rs.rows}" var="row">
					<tr>
						<td><c:out value="${row.cid}"></c:out></td>
						<td><c:out value="${row.cname}"></c:out></td>
						<td><a class="btn btn-info"
							href="${pageContext.request.contextPath}/Categories/updateCategories.jsp?id=${row.cid}">Edit</a></td>
						<td>
							<form
								action="${pageContext.request.contextPath}/DeleteCategories"
								method="post">
								<input type="hidden" value="${row.cid}" name="id"> <input
									type="submit" class="btn btn-danger" value="Delete">
							</form>
						</td>

					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>