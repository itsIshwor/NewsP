
<%
	response.setHeader("Cache-Control", "no-cach,no-store,must-revalidate");
if (session.getAttribute("admin") == null) {
	response.sendRedirect("../index.jsp");
}
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update-Categories</title>
<jsp:include page="../include/favicon.jsp"></jsp:include>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../bootstrap/css/style.css">
</head>
<body>
	<%
		String id = (request.getParameter("id"));
	%>
	<%--<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/practice" user="root"
		password="root" />
	<sql:query var="ps" dataSource="${db}"></sql:query> --%>
	<%
		try {
		Class.forName("com.mysql.jdbc.Driver");
		String user = "root";
		String pass = "password";
		String url = "jdbc:mysql://localhost:3306/practice";
		String sql = "select  * from categories where cid = ?";

		Connection con = DriverManager.getConnection(url, user, pass);

		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, id);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
	%>


	<jsp:include page="../include/header.jsp"></jsp:include>
	<div class="container h-80">
		<div class="row">
			<div class="col-md-6 mx-auto bg-white  p-2">
				<div>
					<form action="${pageContext.request.contextPath}/CategoriesUpdate"
						method="post">
						<input type="hidden" name="id" placeholder="enter categories name"
							class="form-control" id="cat" value="<%=rs.getString("cid")%>">
						<div class="form-group">
							<label for="cat" class="form-label">Categories Name:</label> <input
								type="text" name="cat" placeholder="Enter value to Update"
								class="form-control" id="cat" value="<%=rs.getString("cname")%>">
						</div>
						<%
							}
						} catch (ClassNotFoundException e) {

							e.printStackTrace();
						}
						%>
						<input type="submit" value="Update Categories"
							class="btn btn-primary">
					</form>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>