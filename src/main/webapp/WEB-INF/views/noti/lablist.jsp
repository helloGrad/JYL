<!-- 허규준 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	pageContext.setAttribute("newLine", "\n");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/list.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/comparison.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<script>
	$(window).resize(
			function() {
				var windowWidth = $(window).width();
				var labNameMobile = $("#lab-name1").value;
				console.log(windowWidth);
				console.log(labNameMobile);
				if (window.innerWidth <= 1000) {
					$("#lab-name1").removeClass("lead").addClass(
							"w3-round-xxlarge labNameMobile");
					$("#lab-name2").removeClass("lead").addClass(
							"w3-round-xxlarge labNameMobile");
					$("#lab-name3").removeClass("lead").addClass(
							"w3-round-xxlarge labNameMobile");
				} else {
					$("#lab-name1").addClass("lead").removeClass(
							"w3-round-xxlarge labNameMobile");
					$("#lab-name2").addClass("lead").removeClass(
							"w3-round-xxlarge labNameMobile");
					$("#lab-name3").addClass("lead").removeClass(
							"w3-round-xxlarge labNameMobile");
				}
			});
</script>
</head>
<body>

	<c:import url="/WEB-INF/views/include/header.jsp" />

	<div class="container">

		<div class="row">
			<h3>연구실 공고 페이지</h3>
			<div class="col-lg-4 centering">

				<a id="gradBtn" class="btn btn-info"
					href="${pageContext.servletContext.contextPath }/noti/grad">대학원
					더보기</a> <a id="labBtn" class="btn btn-info"
					href="${pageContext.servletContext.contextPath }/noti/lab">연구실
					더보기</a>
			</div>
		</div>
		<hr class="nav-line">

		<!-- ////// filter ///////-->
		<div class="row">
			<div class="col-lg-4">
				분야 <a href="*" class="remove-btn">EDIT</a>

				<hr>
				<div class="well well-sm">
					<i class="glyphicon glyphicon-search"></i>검색
				</div>
				<div class="well well-sm">
					<i class="glyphicon glyphicon-tag"></i> 국내 (전체) <a href=""> <i
						class="glyphicon glyphicon-remove remove-btn"></i></a>
				</div>
				<div class="well well-sm">
					<i class="glyphicon glyphicon-tag"></i> 데이터베이스 <a href=""> <i
						class="glyphicon glyphicon-remove remove-btn"></i></a>
				</div>
				<div class="well well-sm">
					<i class="glyphicon glyphicon-tag"></i> 인공지능 <a href=""> <i
						class="glyphicon glyphicon-remove remove-btn"></i></a>
				</div>
				<div class="well well-sm">
					<i class="glyphicon glyphicon-tag"></i> 빅 데이터 <a href=""> <i
						class="glyphicon glyphicon-remove remove-btn"></i></a>
				</div>
				<div class="well well-sm">
					<i class="glyphicon glyphicon-tag"></i> 컴퓨터 <a href=""> <i
						class="glyphicon glyphicon-remove remove-btn"></i></a>
				</div>
			</div>

			<form name="Comparison" id="Comparison" method="post"
				onsubmit="comparinsert();">
				<div id="labList" class="col-lg-8">
					<c:forEach items="${notiList }" var="list" varStatus="status">
						<div class="col-md-12">
							<h3>
								<a
									href="${pageContext.servletContext.contextPath }/noti/detail?no=${list.slctnNotiNo}&tabnm=${list.slctnNotiDstnct}">${list.slctnTitle }</a>
								<input type="checkbox" name="selectcheck"
									value="${list.slctnNotiNo}" onclick="javascript:chk(this);" />
							</h3>
							<hr>
						</div>
					</c:forEach>
				</div>
				<input type="submit" value="비교하기" id="myBtn">
			</form>


			<!-- Modal content -->
			<div id="myModal" class="modal">
				<!-- <div class="modal-content" id="modal-content"> -->

				<div class="modal-content" id="modal-content">
					<span class="close">&times;</span>
					<div class="modal-header">
						<h2 class="modal-title">
							<b>연구실 지원내역 모아보기</b>
						</h2>
					</div>
					<div class="row">
						<div class="col-lg-12">
							<div class="thumbnail">
								<table class="w3-table w3-striped w3-centered">
									<tbody>
										<tr id="tdName">
											<td class="contents">&nbsp;</td>
										</tr>
										<tr id="tdbk21EorgnzSuprtYn">
											<td class="contents">bk21 여부</td>
										</tr>
										<tr id="tdtuitionSuprtYn">
											<td class="contents">등록금 지원 여부</td>
										</tr>
										<tr id="tdlvncSuprtYn">
											<td class="contents">생활비 지원 여부</td>
										</tr>

										<tr id="tdincetSuprtYn">
											<td class="contents">인센티브 지원 여부</td>
										</tr>

										<tr id="tddormSuprtYn">
											<td class="contents">기숙사 지원 여부</td>
										</tr>

										<tr id="tdinternYn">
											<td class="contents">인턴 여부</td>
										</tr>

										<tr id="tdlrstyJoingYn">
											<td class="contents">학회 참가 여부</td>
										</tr>

										<tr id="tdlrstyJoingfeeSuprtYn">
											<td class="contents">학회 참가비 지원 여부</td>
										</tr>

										<tr id="tdresrchTaskJoingYn">
											<td class="contents">연구과제 참가 여부</td>
										</tr>

										<tr id="tdstdtrOpptySuprtYn">
											<td class="contents">연수기회 지원 여부</td>
										</tr>
										<tr id="tdeduPgmJoingSuprtYn">
											<td class="contents">교육프로그램지원 여부</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!--footer-->
	<c:import url="/WEB-INF/views/include/footer.jsp" />
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/comparison.js"></script>

</body>
</html>