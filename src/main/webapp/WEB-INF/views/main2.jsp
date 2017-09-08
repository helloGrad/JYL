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
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
/*	$(function() {
		$("#slider-range").slider(
				{
					range : true,
					min : 100,
					max : 1000,
					values : [ 200, 700 ],
					slide : function(event, ui) {
						$("#amount").val(
								ui.values[0] + " 만 원 - " + ui.values[1]
										+ " 만 원");
					}
				});
		$("#amount").val(
				$("#slider-range").slider("values", 0) + " 만 원 - "
						+ $("#slider-range").slider("values", 1) + " 만 원");
	});*/
	
	 $( function() {
		    $( "#slider-range-max" ).slider({
		      range: "max",
		      min: 1,
		      max: 1000,
		      value: 100,
		      slide: function( event, ui ) {
		        $( "#amount" ).val( ui.value +"만 원");
		      }
		    });
		    $( "#amount" ).val( $( "#slider-range-max" ).slider( "value" )+"만 원" );
		  } );
	function changeClass(obj) {
		
		if($("#" + obj.value).hasClass("on-filter")){
			$("#" + obj.value).removeClass("on-filter")
		}
		else{
			$("#" + obj.value).addClass("on-filter");	
		}
		
	}
</script>
</head>
<body>
	<c:import url="/WEB-INF/views/include/header.jsp" />
	<div class="container">

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
											<li class="dropdown-li"><label for="ar0" class="ar-item" id="전체"><input
													type="checkbox" class="filter-check" id="ar0" name=""
													value="전체" onclick="changeClass(this);">전체</label> <label for="ar1" class="ar-item" id="AR00001"><input
													type="checkbox" class="filter-check" id="ar1" name=""
													value="AR00001" onclick="changeClass(this);">서울</label> <label for="ar2" class="ar-item" id="AR00002"><input
													type="checkbox" class="btn-primary" id="ar2" name=""
													value="AR00002" onclick="changeClass(this);">세종</label> <label for="ar3" class="ar-item" id="AR00003"><input
													type="checkbox" class="filter-check" id="ar3" name=""
													value="AR00003" onclick="changeClass(this);">인천</label> <label for="ar4" class="ar-item" id="AR00004"><input
													type="checkbox" class="filter-check" id="ar4" name=""
													value="AR00004" onclick="changeClass(this);">대전</label> <label for="ar5" class="ar-item" id="AR00005"><input
													type="checkbox" class="filter-check" id="ar5" name=""
													value="AR00005" onclick="changeClass(this);">대구</label> <label for="ar6" class="ar-item" id="AR00006"><input
													type="checkbox" class="filter-check" id="ar6" name=""
													value="AR00006" onclick="changeClass(this);">부산</label> <label for="ar7" class="ar-item" id="AR00007"><input
													type="checkbox" class="filter-check" id="ar7" name=""
													value="AR00007" onclick="changeClass(this);">울산</label> <label for="ar8" class="ar-item" id="AR00008"><input
													type="checkbox" class="filter-check" id="ar8" name=""
													value="AR00008" onclick="changeClass(this);">광주</label> <label for="ar9" class="ar-item" id="AR00009"><input
													type="checkbox" class="filter-check" id="ar9" name=""
													value="AR00009" onclick="changeClass(this);">경기</label> <label for="ar10" class="ar-item" id="AR00010"><input
													type="checkbox" class="filter-check" id="ar10" name=""
													value="AR00010" onclick="changeClass(this);">충북</label> <label for="ar11" class="ar-item" id="AR00011"><input
													type="checkbox" class="filter-check" id="ar11" name=""
													value="AR00011" onclick="changeClass(this);">충남</label> <label for="ar12" class="ar-item" id="AR00012"><input
													type="checkbox" class="filter-check" id="ar12" name=""
													value="AR00012" onclick="changeClass(this);">강원</label> <label for="ar13" class="ar-item" id="AR00013"><input
													type="checkbox" class="filter-check" id="ar13" name=""
													value="AR00013" onclick="changeClass(this);">경북</label> <label for="ar14" class="ar-item" id="AR00014"><input
													type="checkbox" class="filter-check" id="ar14" name=""
													value="AR00014" onclick="changeClass(this);">경남</label> <label for="ar15" class="ar-item" id="AR00015"><input
													type="checkbox" class="filter-check" id="ar15" name=""
													value="AR00015" onclick="changeClass(this);">전북</label> <label for="ar16" class="ar-item" id="AR00016"><input
													type="checkbox" class="filter-check" id="ar16" name=""
													value="AR00016" onclick="changeClass(this);">전남</label> <label for="ar17" class="ar-item" id="AR00017"><input
													type="checkbox" class="filter-check" id="ar17" name=""
													value="AR00017" onclick="changeClass(this);">제주</label><label for="ar18" class="ar-item" id="AR00018"><input
													type="checkbox" class="filter-check" id="ar18" name=""
													value="AR00018" onclick="changeClass(this);">국외</label></li>
													
										</ul>
									</form>
								</div>
							</td>
							<td>
								<div class="dropdown">
									<div id="filter" data-toggle="dropdown">
										Filter
										<div class="caret"></div>
									</div>
									<form class="dropdown-menu" id="second-filter">
										<ul class="dropdown-ul">
											<li class="dropdown-li"><h5>학위</h5> <label for="de1"
												id="DE00001" class="de-item"><input type="checkbox"
													name="" value="DE00001" id="de1"
													onclick="changeClass(this);">석사</label> <label for="de2"
												class="de-item" id="DE00002"><input type="checkbox" name=""
													id="de2" value="DE00002" onclick="changeClass(this);">박사</label>
												<label for="de3" class="de-item" id="DE00003"><input
													type="checkbox" name="" id="de3" value="DE00003"
													onclick="changeClass(this);">석박사</label></li>
											<li class="dropdown-li">
												<p>
													<label for="amount"><h5>등록금</h5></label>
												</p> <input type="text" id="amount" readonly
												style="border: 0; color: #6D6D6D; font-weight: bold;">
												<div id="slider-range-max"></div>
											</li>
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