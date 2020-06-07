<%@page import="java.sql.*"%>
<%
	String nid = request.getParameter("nid");
String driver = "com.mysql.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/practice";
String user = "root";
String password = "password";
Class.forName(driver);
Connection con = DriverManager.getConnection(url, user, password);

String sql = "select * from news where nid =" + nid;

Statement st = con.createStatement();
ResultSet rs = st.executeQuery(sql);
con.createStatement();
if (session.getAttribute("admin") == null) {
	response.sendRedirect(request.getContextPath());
}
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>NewsP-Add News</title>
<jsp:include page="/include/favicon.jsp"></jsp:include>
<link rel="stylesheet" type="text/css"
	href="../bootstrap/css/bootstrap.min.css">
</head>
<body>
	<jsp:include page="/include/header.jsp"></jsp:include>
	<div class="container mt-5">
		<div class="row">
			<%
				while (rs.next()) {
			%>

			<div class="col-md-6 mx-auto">
				<h1 class="text-center">Update News</h1>
				<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"
					url="jdbc:mysql://localhost:3306/practice" user="root"
					password="password" />
				<sql:query var="rs" dataSource="${db}">select * from categories</sql:query>

				<form action="${pageContext.request.contextPath}/NewsUpdate"
					method="post">

					<input type="hidden" class="form-control border border-primary"
						id="news-title" placeholder="News Title" name="nid"
						value="<%=rs.getString(1)%>">

					<div class="form-group">
						<label for="news-title" class="form-label">News Title</label> <input
							type="text" class="form-control border border-primary"
							id="news-title" placeholder="News Title" name="newst"
							value="<%=rs.getString(2)%>">
					</div>

					<div class="form-group">
						<label for="news-title" class="form-label">News Category</label> <select
							class="form-control border border-primary" name="newsc">
							<c:forEach items="${rs.rows}" var="row">
								<option value="${row.cname}"><c:out
										value="${row.cname}"></c:out></option>
							</c:forEach>
						</select>
					</div>

					<div class="form-group">
						<label for="news-content" class="form-label">News Title</label>
						<textarea rows="8" cols="10"
							class="form-control border border-primary" id="new-content"
							name="news"><%=rs.getString(3)%></textarea>
					</div>
					<input type="submit" class="btn btn-primary" value="Create News">
				</form>


			</div>

			<%
				}
			%>
		</div>
	</div>
	<jsp:include page="/include/footer.jsp"></jsp:include>

</body>
</html>