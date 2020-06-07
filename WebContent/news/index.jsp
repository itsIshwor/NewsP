
<%
	response.setHeader("Cache-Control", "no-cach,no-store,must-revalidate");
if (session.getAttribute("admin") == null) {
	response.sendRedirect("../index.jsp");
}
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>NewsP All News</title>
<jsp:include page="/include/favicon.jsp"></jsp:include>
<link rel="stylesheet" type="text/css"
	href="../bootstrap/css/bootstrap.min.css">
</head>
<body class="bg-light">
	<%-- Creating Connection to database --%>
	<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/practice" user="root"
		password="password" />
	<%-- Providing query to fetch data from server --%>
	<sql:query var="rs" dataSource="${db}">select * from news order by nid desc</sql:query>
	<sql:query var="rs1" dataSource="${db}">select * from newsi order by nid desc</sql:query>
	<jsp:include page="/include/header.jsp"></jsp:include>
	<div class="container-fluid news-table mt-4">
		<div class="row">
			<div class="col-12">
				<table class="table table-responsive table-striped table-bordered">
					<thead>
						<tr>
							<td>News-ID</td>
							<td>News Title</td>
							<td>News Content</td>
							<td>Category</td>
							<td>Edit</td>
							<td>Delete</td>
						</tr>
					</thead>
					<tbody>
						<%-- Fetching news from server in table body --%>
						<c:forEach items="${rs.rows}" var="row">
							<tr>
								<td>${row.nid}</td>
								<td>${row.newstitle}</td>
								<td>${row.news}</td>
								<td>${row.category}</td>
								<td><a
									href="${pageContext.request.contextPath}/news/updatenews.jsp?nid=${row.nid}"
									class="btn btn-info">Edit</a></td>
								<td>
									<form action="${pageContext.request.contextPath}/NewsDelete" method="post">
										<input type="hidden" name="nid" value="${row.nid}" />
										<input type="submit" Value = "Delete News" class="btn btn-danger">
									</form>
								</td>
							</tr>
						</c:forEach>
						<%-- End of Fetching news from server to table  --%>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<%--news with image here --%>
	<%--new with image ends here --%>
	<jsp:include page="/include/footer.jsp"></jsp:include>

</body>
</html>