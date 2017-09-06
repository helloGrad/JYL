<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript">
	$(function() {

		var userid = $("#userid").val();
		var inforlist = $("#inforlist").val();

		$('input:hidden[name="ch0"]').each(function() {

			var oldvalue = this.value;

			$('input:checkbox[name="ch1"]').each(function() {

				if (oldvalue == this.value) { //값 비교
					this.checked = true; //checked 처리
				}

			});

		});

		$("#information_modify")
				.submit(
						function(event) {

							event.preventDefault();

							var info = [];

							$('input:checkbox[name="ch1"]').each(function() {

								if (this.checked == true) {

									infor.push(this.value);

								}

							});
							for (var i = 0; i < infor.length; i++) {
								// alert(infor[i]); 
							}

							if (info.length === 0) {

								alert("맞춤정보를 선택하지 않았습니다. ");
								return false;

							}

							jQuery.ajaxSettings.traditional = true;

							console.log(info);

							$
									.ajax({
										url : "${pageContext.request.contextPath}/user/mbinfo/modify",
										type : "post",
										data : {info : info},
										success : function(response) {
											if (response.result === "fail") {
												console.error(response.message);
												return;
											}
											parent.window.location.href = "${pageContext.request.contextPath}/user/mbinfo";
										},
										error : function(jqXHR, status, e) {
											console.error(status + " : " + e);
										}
									});
						});
	});
</script>


<body>

	<c:import url="/WEB-INF/views/include/header.jsp" />
	<Br>
	<h2>맞춤정보입니다.</h2>
	<br>


	<c:choose>
		<c:when test='${fn:length(informationlist)>0 }'>
			<h2>내가 선택한 맞춤정보</h2>

			<form id=informationlist name=informationlist>
				<c:forEach items="${informationlist }" var="vo" varStatus="status">
					<input type="hidden" id="CD_ID" name=ch0 value="${vo.cdId }" />
					<input type="text" id="CD_DSTNCT" name=ch2 value="${vo.cdDstnct }" />
					<input type="text" id="CD_NM" name=ch3 value="${vo.cdNm }" />
					<br>
				</c:forEach>
				<input type="hidden" name="inforlist" id="inforlist"
					value="${informationlist }" />
			</form>
			<br>
			<h2>맞춤정보수정하기</h2>
			<br>
			<form class="usermadeinfor_form" id="information_modify"
				name="information_modify" method="post">

				<c:forEach items="${Codelist }" var="vo" varStatus="status">
					<div>
						<input type="hidden" name="cnt" value="1" /> <a>${vo.cdDstnct }</a>
						<input type="checkbox" id="ch${vo.cdId }" name="ch1" value="${vo.cdId }" />${vo.cdNm } <br>
					</div>
				</c:forEach>

				<input type="hidden" name="userid" id="userid" value="${authUser.mbNo }" />
				<button type="submit" value="맞춤정보수정하기">맞춤정보수정하기</button>
			</form>

		</c:when>

		<c:otherwise>
			<form class="usermadeinfor_form" id="usermadeinfor_form" name="usermadeinfor_form" method="post" 
			action="${pageContext.servletContext.contextPath }/user/mbinfo?check=N">
				

				<c:forEach items="${Codelist }" var="vo" varStatus="status">
					<div>
						<input type="hidden" name="cnt" value="1" /> 
						<a>${vo.cdDstnct }</a>
						<input type="checkbox" id="ch${vo.cdId }" name="ch1" value="${vo.cdId }" />
						${vo.cdNm } 
						<br>
					</div>
				</c:forEach>
				<button type="submit" id="mbinfo">맞춤정보등록하기</button>
				
				
			</form>
			<c:choose>		
			<c:when test='${check == "0" }'>
			<form class="usermadeinfor_form" id="usermadeinfor_form" name="usermadeinfor_form" method="post" 
			action="${pageContext.servletContext.contextPath }/user/mbinfo?check=Y">
				

			
				<button type="submit" id="mbinfo">건너뛰기(다시는보지않겠습니다)</button>
				
				
			</form>
			</c:when>
			</c:choose>
		</c:otherwise>
	</c:choose>
	<c:import url="/WEB-INF/views/include/footer.jsp" />
</body>
</html>