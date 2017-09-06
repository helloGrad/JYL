<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("newLine", "\n");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link href="css/higrad-signup.css" rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/detail.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

</head>
<body>
	<c:import url="/WEB-INF/views/include/header.jsp" />



	<!-- //////////////////////////////////// lab recruit content //////////////////////////////// -->
	<div class="container">
		<div class="row">
			<p class="lead">
				<span class="lab-recruit">${vo.slctnTitle }</span>
			</p>

			<c:choose>
				<c:when test="${vo.slctnEndDt == '9999/12/31' }">

					<p>모집기간 : 수시모집
				</c:when>
				<c:otherwise>

					<p>모집기간 : ${vo.slctnBeginDt }~ ${vo.slctnEndDt }
				</c:otherwise>
			</c:choose>



			</p>

			<hr>
			<!--/////////////////////////// main content ///////////////////////////////////// -->
			<div class=col-lg-8>

				<p class="lead">
					<span class="location"> ▣ 연구실 소개 </span>
				<p class="contents">
				<p>${fn:replace(vo.slctnText, newLine,"<br>") }</p>
				</p>

				<hr>

				<p class="lead">
					<span class="location"> ▣ 주요 연구분야 </span>
				</p>
				<div>
					<p class="contents">${fn:replace(vo.prmryResrchField, newLine,"<br>") }
					</p>

				</div>

				<hr>

				<p class="lead">
					<span class="location"> ▣ 모집대상 </span>
				</p>
				<div>
					<p class="contents">${vo.slctnNops }</p>

				</div>

				<hr>

				<p class="lead">
					<span class="location"> ▣ 지원자격 </span>
				</p>
				<div>
					<p class="contents">${fn:replace(vo.suprtQualf, newLine,"<br>") }
					</p>

				</div>

				<hr>

				<p class="lead">
					<span class="location"> ▣ 제출 서류 </span>
				</p>
				<div>
					<p class="contents">${vo.slsnMth }</p>

				</div>

				<hr>

			</div>
			<!--/////////////////////////// side floating menu//////////////////////////////// -->

			<div class=col-lg-4>
				<div class=well>
					<p class="lead">
						<span class="location"> 모집전공 </span>
					</p>
					<p>화학 , 생물학 , 화학공학 , 생물공학 , 의학일반 , 생화학</p>
				</div>

				<div class="well">
					<p class="lead">지원 내용</p>

					<c:if test="${vo.tuitionSuprtYn == 'Y' }">

						<div class="btn btn-block btn-default">등록금 지원</div>

					</c:if>
					<c:if test="${vo.lvncSuprtYn == 'Y' }">

						<div class="btn btn-block btn-default">생활비 지원</div>

					</c:if>
					<c:if test="${vo.bk21EorgnzSuprtYn == 'Y' }">

						<div class="btn btn-block btn-default">bk 지원</div>

					</c:if>
					<c:if test="${vo.incetSuprtYn == 'Y' }">

						<div class="btn btn-block btn-default">인센티브 지원</div>

					</c:if>
					<c:if test="${vo.lrstyJoingfeeSuprtYn == 'Y' }">

						<div class="btn btn-block btn-default">학회 참가비 지원</div>

					</c:if>
					<c:if test="${vo.dormSuprtYn == 'Y' }">

						<div class="btn btn-block btn-default">기숙사 지원</div>

					</c:if>
					<c:if test="${vo.internYn == 'Y' }">
					
	                 < <div class="btn btn-block btn-default">인턴 지원</div>

					</c:if>
					<c:if test="${vo.lrstyJoingYn == 'Y' }">

						<div class="btn btn-block btn-default">학회 참가 지원</div>
					</c:if>
					<c:if test="${vo.resrchTaskJoingYn == 'Y' }">

						<div class="btn btn-block btn-default">연구 과제 참가 지원</div>

					</c:if>
					<c:if test="${vo.stdtrOpptySuprtYn == 'Y' }">

						<div class="btn btn-block btn-default">연수 기회 지원</div>

					</c:if>
					<c:if test="${vo.eduPgmJoingSuprtYn == 'Y' }">

						<div class="btn btn-block btn-default">교육프로그램 지원</div>

					</c:if>



				</div>

				<div class="well">
					<p class="lead">CONTACT</p>
					<P>담당자 : ${vo.chrgrNm }</P>
					<P>전화번호 :${vo.chrgrTelNo }</P>
					<P>fax :</P>
					<P>email : ${vo.chrgrEmail }</P>

				</div>

				<c:if test="${vo.onlineSuprtYn == 'Y' }">

					<div class=well>
						<div class="btn btn-primary web-volunteer">온라인으로 지원하기</div>
					</div>

				</c:if>


			</div>
		</div>

		<div class="row">
			<!--///////////////////////// 지도 /////////////////////////-->
			<p class="lead">
				<i class="glyphicon glyphicon-map-marker"></i> 찾아오시는 길
				<!--///////////////////////// 대학원 주소 /////////////////////////-->
				<span class="location"> • ${vo.addr }</span> <input id="address"
					type="hidden" value="${vo.addr }">
			</p>
			<div id="map"></div>
			<script>
				function initMap() {
					var geocoder = new google.maps.Geocoder();
					var address = document.getElementById('address').value;
					setCenter(geocoder, address);
				}
				function setCenter(geocoder, address) {
					geocoder
							.geocode(
									{
										'address' : address
									},
									function(results, status) {
										if (status === google.maps.GeocoderStatus.OK) {
											var map = new google.maps.Map(
													document
															.getElementById('map'),
													{
														zoom : 16,
														scrollwheel : false,
														center : results[0].geometry.location
													});
											var marker = new google.maps.Marker(
													{
														position : results[0].geometry.location,
														map : map
													});
										} else {
											alert('Geocode was not successful for the following reason: '
													+ status);
											// return null;
										}
									});
				}
			</script>
			<script async defer
				src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCEl_BNACj7LCF2Hzs2Ft-9-XBf5Z4AZLQ&callback=initMap">
				
			</script>

		</div>
	</div>





	<!--//////////////////////// footer ////////////////////////////-->
	<c:import url="/WEB-INF/views/include/footer.jsp" />
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/detail.js"></script>
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCEl_BNACj7LCF2Hzs2Ft-9-XBf5Z4AZLQ&callback=initMap"></script>

</body>
</html>