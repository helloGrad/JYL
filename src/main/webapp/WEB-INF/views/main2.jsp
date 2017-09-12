<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
<link
	href="${pageContext.request.contextPath}/resources/css/higrad-signup.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/filter.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>
	<c:import url="/WEB-INF/views/include/header.jsp" />
	
	<!-- 정예린 -->
	<!--  dropdown	<div class="container">
		<div class="row filter">
			<div class="col-lg-12">

				<div class="filter-td">
					<div class="dropdown">
						<div data-toggle="dropdown">
							<div class="inner-tr">
								<div class="inner-td">조건</div>
								<div class="inner-td">지역</div>
							</div>
							<div class="caret"></div>
						</div>

						<form class="dropdown-menu" id="filter1">
							<ul class="filter-ul">
								<li class="dropdown-li"><h5>일정</h5> <label for="sche1"
									class="sche-item" id="SCHE00001"> <input
										type="checkbox" name="" id="sche1" value="SCHE00001"
										onclick="changeClass(this);">학회
								</label> <label for="sche2" class="sche-item" id="SCHE00002"> <input
										type="checkbox" name="" id="sche2" value="SCHE00002"
										onclick="changeClass(this);">교육
								</label> <label for="sche3" class="sche-item" id="SCHE00003"> <input
										type="checkbox" name="" id="sche3" value="SCHE00003"
										onclick="changeClass(this);">세미나
								</label> <label for="sche4" class="sche-item" id="SCHE00004"> <input
										type="checkbox" name="" id="sche4" value="SCHE00004"
										onclick="changeClass(this);">공고
								</label> <label for="sche5" class="sche-item" id="SCHE00005"> <input
										type="checkbox" name="" id="sche5" value="SCHE00005"
										onclick="changeClass(this);">공고
								</label> <label for="sche6" class="sche-item" id="SCHE00006"> <input
										type="checkbox" name="" id="sche6" value="SCHE00006"
										onclick="changeClass(this);">공고
								</label></li>

								<li class="dropdown-li"><h5>학위</h5> <label for="de1"
									id="DE00001" class="de-item"><input type="checkbox"
										name="" value="DE00001" id="de1" onclick="changeClass(this);">석사</label>
									<label for="de2" class="de-item" id="DE00002"><input
										type="checkbox" name="" id="de2" value="DE00002"
										onclick="changeClass(this);">박사</label> <label for="de3"
									class="de-item" id="DE00003"><input type="checkbox"
										name="" id="de3" value="DE00003" onclick="changeClass(this);">석박사</label></li>
								<li class="dropdown-li"><label for="amount"><h5>등록금</h5></label>
									<input type="text" id="amount" readonly
									style="border: 0; color: #6D6D6D; font-weight: bold;"
									class="inner-td">
									<div id="slider-range-max"></div></li>
							</ul>

							<ul class="filter-ul">
								<li class="dropdown-li"><label for="ar0" class="ar-item"
									id="전체"><input type="checkbox" class="filter-check"
										id="ar0" name="" value="전체" onclick="changeClass(this);">전체</label>
									<label for="ar1" class="ar-item" id="AR00001"><input
										type="checkbox" class="filter-check" id="ar1" name=""
										value="AR00001" onclick="changeClass(this);">서울</label> <label
									for="ar2" class="ar-item" id="AR00002"><input
										type="checkbox" class="btn-primary" id="ar2" name=""
										value="AR00002" onclick="changeClass(this);">세종</label> <label
									for="ar3" class="ar-item" id="AR00003"><input
										type="checkbox" class="filter-check" id="ar3" name=""
										value="AR00003" onclick="changeClass(this);">인천</label> <label
									for="ar4" class="ar-item" id="AR00004"><input
										type="checkbox" class="filter-check" id="ar4" name=""
										value="AR00004" onclick="changeClass(this);">대전</label> <label
									for="ar5" class="ar-item" id="AR00005"><input
										type="checkbox" class="filter-check" id="ar5" name=""
										value="AR00005" onclick="changeClass(this);">대구</label> <label
									for="ar6" class="ar-item" id="AR00006"><input
										type="checkbox" class="filter-check" id="ar6" name=""
										value="AR00006" onclick="changeClass(this);">부산</label> <label
									for="ar7" class="ar-item" id="AR00007"><input
										type="checkbox" class="filter-check" id="ar7" name=""
										value="AR00007" onclick="changeClass(this);">울산</label> <label
									for="ar8" class="ar-item" id="AR00008"><input
										type="checkbox" class="filter-check" id="ar8" name=""
										value="AR00008" onclick="changeClass(this);">광주</label> <label
									for="ar9" class="ar-item" id="AR00009"><input
										type="checkbox" class="filter-check" id="ar9" name=""
										value="AR00009" onclick="changeClass(this);">경기</label> <label
									for="ar10" class="ar-item" id="AR00010"><input
										type="checkbox" class="filter-check" id="ar10" name=""
										value="AR00010" onclick="changeClass(this);">충북</label> <label
									for="ar11" class="ar-item" id="AR00011"><input
										type="checkbox" class="filter-check" id="ar11" name=""
										value="AR00011" onclick="changeClass(this);">충남</label> <label
									for="ar12" class="ar-item" id="AR00012"><input
										type="checkbox" class="filter-check" id="ar12" name=""
										value="AR00012" onclick="changeClass(this);">강원</label> <label
									for="ar13" class="ar-item" id="AR00013"><input
										type="checkbox" class="filter-check" id="ar13" name=""
										value="AR00013" onclick="changeClass(this);">경북</label> <label
									for="ar14" class="ar-item" id="AR00014"><input
										type="checkbox" class="filter-check" id="ar14" name=""
										value="AR00014" onclick="changeClass(this);">경남</label> <label
									for="ar15" class="ar-item" id="AR00015"><input
										type="checkbox" class="filter-check" id="ar15" name=""
										value="AR00015" onclick="changeClass(this);">전북</label> <label
									for="ar16" class="ar-item" id="AR00016"><input
										type="checkbox" class="filter-check" id="ar16" name=""
										value="AR00016" onclick="changeClass(this);">전남</label> <label
									for="ar17" class="ar-item" id="AR00017"><input
										type="checkbox" class="filter-check" id="ar17" name=""
										value="AR00017" onclick="changeClass(this);">제주</label><label
									for="ar18" class="ar-item" id="AR00018"><input
										type="checkbox" class="filter-check" id="ar18" name=""
										value="AR00018" onclick="changeClass(this);">국외</label></li>
							</ul>
							<ul class="btn-ul">
								<li class="btn-li"><button type="submit"
										class="btn btn-default filter-btn">저장</button></li>
								<li class="btn-li"><button type="submit"
										class="btn btn-default filter-btn">초기화</button></li>
							</ul>

						</form>
					</div>
				</div>
				<!--  	<div class="filter-td sort">
					<div class="dropdown">
						<div data-toggle="dropdown">
							<div class="inner-tr" id="sort">구분</div>
							<div class="caret"></div>
						</div>

						<form class="dropdown-menu" id="dropdown-sort">
							<ul class="second-dropdown-ul">
								<li class="second-dropdown-li"><a>모집예정</a> <a>모집중</a></li>
								<li class="second-dropdown-li"><a>모집중</a></li>
							</ul>
							<ul class="second-dropdown-ul">
								<li class="second-dropdown-li"><button
										class="w3-button w3-white w3-border w3-round-large">모집예정</button>
									<button class="w3-button w3-white w3-border w3-round-large">모집중
									</button></li>
							</ul>
							<div class="filterBtn">
								<button type="submit" class="btn btn-primary">모두비우기</button>
								<button type="submit" class="btn btn-primary">저장</button>
							</div>
						</form>
					</div>
				</div> -->

	<!-- 		<div class="filter-td sort">
					<form>
						<select class="filter-select">
							<option value="">전체</option>
							<option value="">모집중</option>
							<option value="">모집예정</option>
							<option value="">기타</option>
						</select>
					</form>
				</div> 
			</div>
		</div>
	</div> -->

	<div class="container">
		<div class="row filter">
			<div class="col-lg-12">
			<!--  <div class="filter-td" onclick="filterModalOpen();">
					<div class="inner-tr">
						<div class="inner-td">조건</div>
						<div class="inner-td">지역</div>
					</div>
					<div class="caret"></div>
				</div>
				-->	
				<button class="w3-button w3-white w3-border w3-round-large" onclick="filterModalOpen();">필터</button>
			</div>
		</div>
	</div>
	



	<div id="status"></div>




	<Br>
	<Br>
	<Br>
	<Br>
	<Br>
	<Br>


	<!--//////////////////////// footer ////////////////////////////-->
	<c:import url="/WEB-INF/views/include/footer.jsp" />

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>

</body>
</html>