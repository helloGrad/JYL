<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<base target="_self" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
<link
	href="${pageContext.request.contextPath}/resources/css/higrad-signup.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/login.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap-social.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css"
	rel="stylesheet">


<title>하이그래드넷</title>
</head>

<nav class="navbar navbar-default navbar-fixed-top">
	<c:import url="/WEB-INF/views/modal/filter.jsp" />
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#myNavbar">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand"
				href="${pageContext.servletContext.contextPath }/main2">하이그래드넷</a>
		</div>
		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav navbar-right">
				<li><a
					href="${pageContext.servletContext.contextPath }/noti/list">모집공고</a></li>
				<li><a
					href="${pageContext.servletContext.contextPath }/organz/list">기관정보</a></li>
				<li><a href="conference.html">학회</a></li>
				<li><a
					href="${pageContext.servletContext.contextPath }/counseling/list">상담실</a></li>
				<li><a href="community.html">커뮤니티</a></li>
				<c:choose>
					<c:when test='${authUser.mbDstnct == "관리자" }'>
						<li><a
							href="${pageContext.servletContext.contextPath }/admin/main">관리자페이지</a>
						<li>
					</c:when>
				</c:choose>
				<c:choose>
					<c:when test="${empty authUser }">
						<li><a id="myBtnlogin" href="javascript:void(0);">로그인</a>
						<li>
						<li><a href="#" onclick="modalOpen2();">회원가입</a>
						<li>
					</c:when>
					<c:otherwise>
						<li>${authUser.nknm }님안녕하세요^^;</li>
						<li><a
							href="${pageContext.servletContext.contextPath }/user/logout"
							id="logout">로그아웃</a>
						<li>
						<li><a
							href="${pageContext.servletContext.contextPath }/user/mypage">마이페이지</a>
						<li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>


	<!-- 로그인 modal-->
	<div id="login" class="modal">
		<div class="modal-content">
			<span class="close">×</span>
			<div class="signupbnt">
				<button id="loginBtn" class="btn btn-social btn-facebook socialbtn">
					<span class="fa fa-facebook"></span> 페이스북 아이디로 로그인
				</button>
				<div id="naver_id_login"></div>
				<div class="login-devider">
					<span>또는</span>
				</div>

				<div class="form-group1">
					<input type="text" class="form-control logininputbox" id="email"
						name="iden" placeholder="Enter email">
				</div>
				<div id='emailMsg' class="text-danger"></div>
				<div class="form-group1">
					<input type="password" class="form-control logininputbox" id="pwd"
						name="pw" placeholder="Enter password">
				</div>
				<div id="passwdMsg" class="text-danger"></div>
				<div id="loginMsg" class="text-danger"></div>
				<div class="form-group">
					<label class="remember-me"><input type="checkbox">
						로그인 상태 유지 </label>
					<p class="sighup">
						<a href="javascript:void(0);" onclick="modalOpen3();">비밀번호 찾기</a>
						/ <a href="javascript:void(0);" onclick="modalOpen2();">회원가입</a>
					</p>
				</div>
				<button type="submit" class="btn formbtn" onclick="login();">로그인</button>
				<div class="login"></div>
			</div>
			<span class="close"></span>
		</div>
	</div>

	<!-- 회원가입 modal -->
	<div id="signup" class="modal">
		<div class="modal-content">
			<span class="close">×</span>

			<div class="signupbnt">

				<button id="facebookLogin"
					class="btn btn-social btn-facebook socialbtn">
					<span id="facebooklogo" class="fa fa-facebook"></span> 페이스북으로 계속하기
				</button>

				<button id="naverLoginBtn2"
					class="btn btn-social socialbtn naverlogin" style='color: white;'>
					<span id='naverLogo' class="fa "></span> 네이버로 계속하기
				</button>

			</div>
			<div class="separator">
				<hr class="signuphr">
				<h6 class="texthr">또는</h6>
				<hr class="signuphr">
			</div>

			<form action="#" id="join-form">
				<div class="input">

					<div class="signupinput">
						<input type="text" class="inputbox" id="nickname"
							placeholder="닉네임(2~8자리)" name="nknm">
						<div class="checkinput" id="nicknamecheck">경고</div>
					</div>

					<div class="signupinput">
						<input type="text" class="inputbox" id="remail" placeholder="이메일"
							name="iden">
						<div class="checkinput" id="emailcheck">경고</div>
					</div>

					<div class="signupinput">
						<input type="password" class="inputbox" placeholder="비밀번호(6~20자)"
							id="rpwd" name="pw">
						<div class="checkinput" id="pwdcheck">경고</div>
					</div>
					<div class="signupinput" id="lastinput">
						<input type="password" class="inputbox" placeholder="비밀번호 확인"
							id="rpwd_again">
						<div class="checkinput" id="pwdcheck2">경고</div>
					</div>
					<hr class="loginhr">
					<div class="gender">
						<label class="genderlabel on" id="M"> <input type="radio"
							name="sex" value="M" id="radiomale" checked
							onclick="changeColor(this);"> 남자
						</label> <label class="genderlabel" id="F"> <input type="radio"
							name="sex" value="F" id="radiofemale"
							onclick="changeColor(this);">여자
						</label>
					</div>
					<div class="birth">
						<input type="number" name="birdt" maxlength="4" id="birthy"
							max="9999" min="1900" maxlength="4"
							oninput="maxLengthCheck(this)">
					</div>
					<div class="birth">
						<select id="birthm" name="birdt">
							<option selected disabled id="selectm">월</option>
						</select>
					</div>
					<div class="birth">
						<select id="birthd" name="birdt">
							<option selected disabled id="selectd">일</option>
						</select>
					</div>
					<button type="submit" class="btn formbtn">회원가입</button>
				</div>
			</form>
			<div class="login">
				이미 가입한 회원이라면 <a onclick="modalOpen();" href="javascript:void(0);">로그인
					하러 가기</a>
			</div>
		</div>
	</div>

</nav>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/login.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/signup.js"></script>