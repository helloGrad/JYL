var filterModalOpen = function() {
	var modal = document.getElementById('filter');

	modal.style.display = "block";
	
	console.log("filter modal : "+modal);

	window.onclick = function(event) {
		if (event.target == modal) {
			modal.style.display = "none";
		}
	}

}


var filterModalOpen2 = function() {
	var modal = document.getElementById('filter2');

	modal.style.display = "block";
	
	console.log("filter modal : "+modal);

	window.onclick = function(event) {
		if (event.target == modal) {
			modal.style.display = "none";
		}
	}

}

$( function() {
	$("#slider-range-max").slider({
		range : "max",
		min : 1,
		max : 1000,
		value : 100,
		slide : function(event, ui) {
			$("#amount").val(ui.value + "만 원");
		}
	});
	$("#amount").val($("#slider-range-max").slider("value") + "만 원");
	
	
	$(document).ready(function() {
		$(".close").click(function() {
			$("#filter").css({
				"display" : "none"
			});
		});
	});

	$(document).keydown(function(e) {

		var modal = document.getElementById('filter');
		if (e.keyCode == 27) {

			modal.style.display = "none";
		}
	});
});


function changeClass(obj) {
	
	if ($("#" + obj.value).hasClass("on-filter-check")) {
		$("#" + obj.value).removeClass("on-filter-check")
	} else {
		$("#" + obj.value).addClass("on-filter-check");
	}
}

