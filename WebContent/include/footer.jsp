<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://localhost:3306/practice" user="root"
	password="root"></sql:setDataSource>
<sql:query var="rs" dataSource="${db}">select cname from categories</sql:query>
<footer class="bg-dark mt-2">
	<div class="container ">
		<div class="row text-white ">
			<div class="col-md-4">
				<h5 class="text-lead text-center mt-4">Browse News By Category</h5>
				<ul class="navbar-nav">
					<c:forEach items="${rs.rows}" var="row">
						<li class="nav-item"><a class="footer-link"
							href="${pageContext.request.contextPath}/newscategory/<c:out
						value="${row.cname}"></c:out>.jsp"
							class="nav-link m-2 text-uppercase menu-item nav-active"><c:out
									value="${row.cname}"></c:out></a></li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<div class="row">
			<%
				if (session.getAttribute("admin") != null) {
			%>
			<div class="mx-auto">
				<form action="${pageContext.request.contextPath}/adminLogout"
					method="post">
					<input type="submit" class="btn btn-danger mt-2" value="Log Out">
				</form>
			</div>
			<%
				} else {
			%>
			<div class="col-md-4 mt-2 mx-auto">
				<form action="${pageContext.request.contextPath}/subscribe"
					method="post">
					<div class="form-group">
						<label class="form-label text-white">Subscribe Our
							NewsLatter for Daily Update</label> <input class="form-control"
							type="email" name="subscriberemail" required>
					</div>
					<input type="submit" value="Subscribe" class="btn btn-primary">
				</form>
			</div>


			<%
				}
			%>
		</div>
	</div>
	<p class="p-5 text-center text-white">
		&copy;-<span id="year"></span> -CopyRight Reserved to <a
			href="${pageContext.request.contextPath}/index.jsp"
			class="navbar-brand text-light"> <span class="text-uppercase">News</span>
			<span class="h1">P</span>
		</a>
	</p>
</footer>


<script>
	var a = new Date().getFullYear();

	document.querySelector("#year").innerHTML = a;
</script>
<script
	src="${pageContext.request.contextPath}/bootstrap/js/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.js"></script>
