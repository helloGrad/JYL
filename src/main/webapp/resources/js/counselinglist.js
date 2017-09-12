
	/* 자동 스크롤링 */

	var isEnd = false;

	var listItemTemplate = new EJS(
			{
				url : "/net/resources/js/ejs-template/counseling-list-item.ejs"
			});
	var listTemplate = new EJS(
			{
				url : "/net/resources/js/ejs-template/counseling-list.ejs"
			});

	$(window).scroll(function() {
		var $window = $(this);
		var scrollTop = $window.scrollTop();
		var windowHeight = $window.height();
		var documentHeight = $(document).height();

		//scrollbar thumb가 바닥전 10px까지 왔을 때...
		if (scrollTop + windowHeight + 5 > documentHeight) {
			fetchList();
		}
	});

	var render = function(vo, mode) {
		//상용 app에서는 template library를 사용한다 ex)ejs, leaf 
/*		var html = "<li data-no='"+vo.no+"'>" + "<strong>" + vo.name
				+ "</strong>" + "<p>" + vo.message.replace(/\n/gi, "<br>")
				+ "</p>" + //g는 global로 전체 개행에 적용 
				"<a href='#dialog-delete-form' data-no='"+ vo.no +"'>삭제</a>"
				+ "</li>";*/
				
		var html = listItemTemplate.render(vo);

		if (mode === true) {
			console.log('222')
			$("#list-guestbook").prepend(html);
		} else {
			console.log('111')
			$("#list-guestbook").append(html);
		}

	}


	var fetchList = function() {
		if (isEnd === true) {
			return;
		}
		
		var rownum = $(".rownum");
		
		var startNo =  $("#counseling-list .w3-card-2:last-child").find('input').val() || 0;//false이면(startNo값이 null이면) 0을 실행
		console.log('last',$("#counseling-list .w3-card-2:last-child").find('input').val())
		console.log("-------->" + startNo);
		
		console.log($("#counseling-list.w3-card-2 input").last().data("value"));

		$.ajax({
			url : "/net/counseling/api/list?sno=" + startNo,
			type : "get",
			dataType : "json",
			data : "",
			success : function(response) {
				console.log(response);

				//console.log(response.data[0].rownum);

				if (response.result === "fail") {
					console.warn(response.message);
					return;
				}
				//detect end
				if (response.data.length < 5) {
					isEnd = true;
				}
				//rendering
				$.each(response.data, function(index, vo) {
					render(vo);
				});

				var html = listTemplate.render(response);
				$("#counseling-list").append(html);
				//	$("#counseling-list").hello();
			},
			error : function(jqXHR, status, e) {
				console.error(status + " : " + e);
			}
		});
		
	}

	fetchList();