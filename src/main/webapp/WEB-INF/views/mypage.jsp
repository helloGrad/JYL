<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mypage.css">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<body>

	<c:import url="/WEB-INF/views/include/header.jsp" />

	<div class="container">
		<div class="row">
			<div class="col-lg-2"></div>
			<div class="col-lg-8">

				<div class="row">
					<div class="col-lg-4 centering">
						<h2>설정</h2>
					</div>
				</div>
				<hr class="nav-line">

				<div class="row">
					<div class="col-lg-4 centering">
						<h3>개인정보</h3>
					</div>
				</div>
				<ul>
					<li><h4>Email</h4></li>
					<li><input type="text" class="mypage-input"></li>
				</ul>
				<hr class="">
				<ul>
					<li><h4>Email</h4></li>
					<li><p>내용</p></li>
				</ul>
				<hr>
				<ul>
					<li><h4>Email</h4></li>
					<li><p>내용</p></li>
				</ul>
				<hr>
				<ul>
					<li><h4>Email</h4></li>
					<li><p>내용</p></li>
				</ul>
				<hr>
				<ul>
					<li><h4>Email</h4></li>
					<li><p>내용</p></li>
				</ul>

			</div>

			<div class="col-lg-2"></div>

		</div>
	</div>

	<!--footer-->
	<c:import url="/WEB-INF/views/include/footer.jsp" />
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
</body>
</html>