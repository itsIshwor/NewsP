<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%--<link href="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/bootstrap/css/style.css"> --%>
<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://localhost:3306/practice" user="root"
	password="password"></sql:setDataSource>
<sql:query var="rs" dataSource="${db}">select cname from categories</sql:query>
<nav
	class="navbar navbar-expand-xs sticky-top nav-menu navbar-dark bg-dark text-white">
	<a href="${pageContext.request.contextPath}/index.jsp"
		class="navbar-brand text-light"> <span class="text-uppercase">News</span>
		<span class="h1">P</span>
	</a>
	<button class="navbar-toggler " type="button" data-toggle="collapse"
		data-target="#myNav">
		<span class="navbar-toggler-icon"></span>
		<div class="bg-light line-1"></div>
		<div class="bg-light line-2"></div>
		<div class="bg-light line-3"></div>
	</button>
	<div
		class="collapse  navbar-collapse justify-content-end text-uppercase"
		id="myNav">
		<ul class="navbar-nav">
			<li class="nav-item"><a
				href="${pageContext.request.contextPath}/index.jsp"
				class="nav-link m-2 text-uppercase menu-item nav-active">Home</a></li>
			<c:forEach items="${rs.rows}" var="row">
				<li class="nav-item"><a
					href="${pageContext.request.contextPath}/newscategory/<c:out
						value="${row.cname}"></c:out>.jsp"
					class="nav-link m-2 text-uppercase menu-item nav-active"><c:out
							value="${row.cname}"></c:out></a></li>
			</c:forEach>
			<%
				if (session.getAttribute("admin") != null) {
			%>

			<li class="nav-item"><a
				href="${pageContext.request.contextPath}/Categories/showCategories.jsp"
				class="nav-link m-2 text-uppercase menu-item nav-active">Categories</a></li>
			<li class="nav-item"><a
				href="${pageContext.request.contextPath}/news/createnews.jsp"
				class="nav-link m-2 text-uppercase menu-item nav-active">Create
					News</a></li>
			<li class="nav-item"><a
				href="${pageContext.request.contextPath}/admin/adminhome.jsp"
				class="nav-link m-2 text-uppercase menu-item nav-active">Admin
					Panel</a></li>


			<%
				}
			%>

		</ul>
	</div>
</nav>