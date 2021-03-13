<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>NewsP/Admin/Home</title>
<jsp:include page="/include/favicon.jsp"></jsp:include>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/bootstrap/css/style.css">
</head>
<body class="">
	<jsp:include page="/include/header.jsp"></jsp:include>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-3 bg-dark">
				<ul class="list-unstyled text-white px-2">
					<li class="my-2 mx-2 p-1 li-hover border-btm text-center"><a
						class="nav-link" href="#home">Home</a></li>
					<li class="my-2 p-1 li-hover border-btm text-center"><a
						class="nav-link" id="cl">Categories</a></li>
					<li class="my-2 p-1 li-hover border-btm text-center"><a
						class="nav-link" id="nt">News</a></li>
					<li class="my-2 p-1 li-hover border-btm text-center my-auto">
						<div class="mx-auto">
							<form action="${pageContext.request.contextPath}/adminLogout"
								method="post">
								<input type="submit" class=" btn btn-danger mt-2"
									value="Log Out">
							</form>
						</div>

					</li>
				</ul>
			</div>
			<div class="col-md-9 bg-white">
				<div class="container mt-4">
					<div class="row">
						<div class="col-md-4">
							<div id="" class="">

								<%-- <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"
									url="jdbc:mysql://localhost:3306/practice" user="root"
									password="root" />

								<sql:query var="rs" dataSource="${db}">
						select  *, count(*) as total from categories; 
					</sql:query>--%>
								<%-- <c:forEach items="${rs.rows}" var="count">
									<div class="card">
										<p class="card-title text-center h-4">Total Category
											Count:</p>
										<div class="card-body text-center">
											<div class="display-3">${count.total}</div>
										</div>
									</div>
								</c:forEach> --%>
							</div>
						</div>
						<div class="col-md-4">
							<%-- 	<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"
								url="jdbc:mysql://localhost:3306/practice" user="root"
								password="password" />

							<sql:query var="rsn" dataSource="${db}">
						select  *, count(*) as total from news;
					</sql:query>
							<c:forEach items="${rsn.rows}" var="countn"> 
								<div class="card">
									<p class="card-title text-center h-4">Total Category Count:</p>
									<div class="card-body text-center">
										<div class="display-3">${countn.total}</div>
									</div>
								</div>
							</c:forEach>
						</div>
						<div class="col-md-4">
							<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"
								url="jdbc:mysql://localhost:3306/practice" user="root"
								password="password" />

							<sql:query var="rsn" dataSource="${db}">
								select *,count(news) as total
		 						from  news 
								where category = "Sports";
							</sql:query>
							<c:forEach items="${rsn.rows}" var="countn">
								<div class="card">
									<p class="card-title text-center h-4">Total Sport Count:</p>
									<div class="card-body text-center">
										<div class="display-3">${countn.total}</div>
									</div>
								</div>
							</c:forEach>
						</div>
						<div class="col-md-4">
							<sql:query var="rsn" dataSource="${db}">
								select *,count(news) as total
		 						from  news 
								where category = "National";
							</sql:query>
							<c:forEach items="${rsn.rows}" var="countn">
								<div class="card">
									<p class="card-title text-center h-4">Total National Count:</p>
									<div class="card-body text-center">
										<div class="display-3">${countn.total}</div>
									</div>
								</div>
							</c:forEach>
						</div>
						<div class="col-md-4">
							<sql:query var="rsn" dataSource="${db}">
								select *,count(news) as total
		 						from  news 
								where category = "International";
							</sql:query>
							<c:forEach items="${rsn.rows}" var="countn">
								<div class="card">
									<p class="card-title text-center h-4">Total International
										Count:</p>
									<div class="card-body text-center">
										<div class="display-3">${countn.total}</div>
									</div>
								</div>
							</c:forEach>
						</div>
						<div class="col-md-4">
							<sql:query var="rsn" dataSource="${db}">
								select *,count(news) as total
		 						from  news 
								where category = "Health";
							</sql:query>
							<c:forEach items="${rsn.rows}" var="countn">
								<div class="card">
									<p class="card-title text-center h-4">Total Health Count:</p>
									<div class="card-body text-center">
										<div class="display-3">${countn.total}</div>
									</div>
								</div>
							</c:forEach> --%>
						</div>
					</div>
					<div class="row  my-2">
						<div class="col-md-6 mx-auto">
							<a href="${pageContext.request.contextPath}/news/createnews.jsp"
								class="btn btn-primary">Create News</a> &nbsp;&nbsp; <a
								class="btn btn-primary"
								href="${pageContext.request.contextPath}/categories/createCategories.jsp">Create
								New Category</a>
						</div>
					</div>
					<div class="row">
						<div id="viewer"></div>
						<div id="viewern"></div>
					</div>
				</div>

			</div>
		</div>
	</div>
	<jsp:include page="/include/footer.jsp"></jsp:include>
	<script>
		$(document).ready(function() {
			$("#cl").click(function() {
				$("#viewer").load("../Categories/showCategories.jsp .c-table");
			})
			$("#nt").click(function() {
				$("#viewern").load("../news/index.jsp .news-table");
			})
		});
	</script>
</body>
</html>