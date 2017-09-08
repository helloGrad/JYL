<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>jQuery UI Slider - Range slider</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
<link
	href="${pageContext.request.contextPath}/resources/css/higrad-signup.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/filter.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
	$(function() {
		$("#slider-range").slider({
			range : true,
			min : 0,
			max : 500,
			values : [ 75, 300 ],
			slide : function(event, ui) {
				$("#amount").val("$" + ui.values[0] + " - $" + ui.values[1]);
			}
		});
		$("#amount").val(
				"$" + $("#slider-range").slider("values", 0) + " - $"
						+ $("#slider-range").slider("values", 1));
	});
</script>
</head>
<body>
	<c:import url="/WEB-INF/views/include/header.jsp" />
	<br>
	<br>
	<br>

	<div class="container">
		<p>
			<label for="amount">Price range:</label> <input type="text"
				id="amount" readonly
				style="border: 0; color: #f6931f; font-weight: bold;">
		</p>

		<div id="slider-range"></div>
		<div class="row filter">
			<div class="col-lg-12">
				<table class="table table-bordered">
					<tbody>
						<tr>
							<td>
								<div class="dropdown">
									<div id="ar" data-toggle="dropdown">
										지역
										<div class="caret"></div>
									</div>
									<form class="dropdown-menu">
										<ul class="dropdown-ul">
											<li class="dropdown-li"><label for="ar1" class="ar-item"><input
													type="checkbox" class="filter-check" id="ar0" name=""
													value="전체">전체</label> <label for="ar1" class="ar-item"><input
													type="checkbox" class="filter-check" id="ar1" name=""
													value="서울">서울</label> <label for="ar2" class="ar-item"><input
													type="checkbox" class="btn-primary" id="ar2" name=""
													value="세종">세종</label> <label for="ar3" class="ar-item"><input
													type="checkbox" class="filter-check" id="ar3" name=""
													value="인천">인천</label> <label for="ar4" class="ar-item"><input
													type="checkbox" class="filter-check" id="ar4" name=""
													value="대전">대전</label> <label for="ar5" class="ar-item"><input
													type="checkbox" class="filter-check" id="ar5" name=""
													value="대구">대구</label> <label for="ar6" class="ar-item"><input
													type="checkbox" class="filter-check" id="ar6" name=""
													value="부산">부산</label> <label for="ar7" class="ar-item"><input
													type="checkbox" class="filter-check" id="ar7" name=""
													value="울산">울산</label> <label for="ar8" class="ar-item"><input
													type="checkbox" class="filter-check" id="ar8" name=""
													value="광주">광주</label> <label for="ar9" class="ar-item"><input
													type="checkbox" class="filter-check" id="ar9" name=""
													value="경기">경기</label> <label for="ar10" class="ar-item"><input
													type="checkbox" class="filter-check" id="ar10" name=""
													value="충북">충북</label> <label for="ar11" class="ar-item"><input
													type="checkbox" class="filter-check" id="ar11" name=""
													value="충남">충남</label> <label for="ar12" class="ar-item"><input
													type="checkbox" class="filter-check" id="ar12" name=""
													value="강원">강원</label> <label for="ar13" class="ar-item"><input
													type="checkbox" class="filter-check" id="ar13" name=""
													value="경북">경북</label> <label for="ar14" class="ar-item"><input
													type="checkbox" class="filter-check" id="ar14" name=""
													value="경남">경남</label> <label for="ar15" class="ar-item"><input
													type="checkbox" class="filter-check" id="ar15" name=""
													value="전북">전북</label> <label for="ar16" class="ar-item"><input
													type="checkbox" class="filter-check" id="ar16" name=""
													value="전남">전남</label> <label for="ar17" class="ar-item"><input
													type="checkbox" class="filter-check" id="ar17" name=""
													value="제주">제주</label></li>
										</ul>
									</form>
								</div>
							</td>
							<td>
								<div class="dropdown">
									<div id="ar" data-toggle="dropdown">
										Filter
										<div class="caret"></div>
									</div>
									<form class="dropdown-menu">
										<ul class="dropdown-ul">
											<li class="dropdown-li"><h5>학위</h5> <label for="ar1"
												class="ar-item"><input type="checkbox"
													class="filter-check" id="ar0" name="" value="전체">석사</label>
												<label for="ar1" class="ar-item"><input
													type="checkbox" class="filter-check" id="ar1" name=""
													value="서울">박사</label> <label for="ar2" class="ar-item"><input
													type="checkbox" class="filter-check" id="ar2" name=""
													value="세종">석박사</label> <label for="ar3" class="ar-item"><input
													type="checkbox" class="filter-check" id="ar3" name=""
													value="인천">인천</label> <label for="ar4" class="ar-item"><input
													type="checkbox" class="filter-check" id="ar4" name=""
													value="대전">대전</label></li>
											<li class="dropdown-li"><h5>등록금</h5>
										</ul>
									</form>
								</div>
							</td>
							<td>
								<div class="dropdown">
									<div id="sort" data-toggle="dropdown">
										구분
										<div class="caret"></div>
									</div>
									<form class="dropdown-menu">
										<ul class="dropdown-ul">
											<li class="dropdown-li"></li>
										</ul>
									</form>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>



</body>
</html>