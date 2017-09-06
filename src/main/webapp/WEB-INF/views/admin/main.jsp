<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="/mysite03/assets/css/admin/main.css" rel="stylesheet"
	type="text/css">
</head>
<body>
	<div id="container">
		<c:import url="/WEB-INF/views/include/header.jsp" />
		<div id="wrapper">
			<div id="content">
				<div id="site-form">
					<form method="post"
						action="${pageContext.servletContext.contextPath }/admin/upload"
						enctype="multipart/form-data">
						<label class="block-label" for="title">사이트 타이틀</label> <input
							id="title" name="title" type="text" value="관리자페이지입니다. ">

						<label class="block-label" for="welcomeMessage">환영 메세지</label> <input
							id="welcomeMessage" name="welcomeMessage" type="text"
							value="안녕하세요"> <label class="block-label">프로필 이미지</label>
						<img id="profile" src=""> <input type="file" name="file1">

						<label class="block-label">사이트 설명</label>
						<textarea name="description"> 관리자 페이지 입니다.  </textarea>

						<input type="submit" value="변경" />
					</form>

					<br> <br> <br> 
					<a href="${pageContext.servletContext.contextPath }/admin/list">정보입력</a>



				</div>
			</div>

		</div>
	</div>
</body>
</html>