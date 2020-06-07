<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css">
<jsp:include page="/include/favicon.jsp"></jsp:include>
<title>NewsP/Sports</title>
</head>
<body class="bg-light">
	<%-- Creating Connection to database --%>
	<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/practice" user="root"
		password="password" />
	<%-- Providing query to fetch data from server --%>
	<sql:query var="rs" dataSource="${db}">select * from news where category="Sports" order by nid desc</sql:query>
	<jsp:include page="/include/header.jsp"></jsp:include>
	<div class="container">
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<%-- Fetching news from server --%>
				<c:forEach items="${rs.rows}" var="row">
					<div class="card m-5">
						<div class="card-title">
							<p class="text-center">${row.newstitle}</p>
						</div>
						<div class="card-text pb-2 text-jusrified">
							<p class="mx-2">${row.news}</p>
						</div>
						<div class="card-footer text-center">
							<a
								href="${pageContext.request.contextPath}/newscategory/${row.category}.jsp">${row.category}</a>
						</div>
					</div>
				</c:forEach>
				<%-- end of Fetching news from server --%>
			</div>
			<div class="col-md-1"></div>
		</div>
	</div>
	<jsp:include page="/include/footer.jsp"></jsp:include>

</body>
</html>