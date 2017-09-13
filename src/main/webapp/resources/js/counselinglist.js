/*
 * 정예린 2017-09-13
 */

var isEnd = false;

var listItemTemplate = new EJS({
	url : "/net/resources/js/ejs-template/counseling-list-item.ejs"
});
var listTemplate = new EJS({
	url : "/net/resources/js/ejs-template/counseling-list.ejs"
});

var fetchList = function() {
	if (isEnd === true) {
		return;
	}

	var startNo = $("#counseling-list .w3-card-2:last-child").find('input').val() || 0;// false이면(startNo값이
	// null이면)
	// 0을
	// 실행
	//console.log('last', $("#counseling-list .w3-card-2:last-child").find('input').val())
	//console.log("-------->" + startNo);


	$.ajax({
		url : "/net/counseling/api/list?sno=" + startNo,
		type : "get",
		dataType : "json",
		data : "",
		success : function(response) {
			//console.log(response);

			// console.log(response.data[0].rownum);

			if (response.result === "fail") {
				console.warn(response.message);
				return;
			}
			// detect end

			if (response.data.length < 5) {
				console.log(response.data.length);
				isEnd = true;
			}
			// rendering
			$.each(response.data, function(index, vo) {
				render(vo);
			});

			var html = listTemplate.render(response);
			// $("#counseling-list").append(html);
			// $("#counseling-list").hello();
			bFetching = false;
		},
		error : function(jqXHR, status, e) {
			console.error(status + " : " + e);
			bFetching = false;
		}
	});

}

var render = function(vo, mode) {

	var html = listItemTemplate.render(vo);

	if (mode === true) {
		$("#counseling-list").prepend(html);
	} else {
		$("#counseling-list").append(html);
	}

}

var bFetching = false;

$(function() {

	$(window).scroll(function() {
		var $window = $(this);
		var scrollTop = $window.scrollTop();
		var windowHeight = $window.height();
		var documentHeight = $(document).height();

		if (scrollTop + windowHeight + 10 > documentHeight) {
			if (!bFetching) {
				bFetching = true;
				fetchList();
			}
		}
	});

	fetchList();
})
