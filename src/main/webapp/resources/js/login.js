// 네이버 아이디 로그인 설정
var naver_id_login = new naver_id_login("4XJQVjfPiPo3e5Xe23hL",
		"http://127.0.0.1:8080/net/user/snslogin/");
naver_id_login.setDomain(".127.0.0.1:8080/net/");
var state = naver_id_login.getUniqState();

naver_id_login.setButton("green", 3, 48);

naver_id_login.setDomain("YOUR_SERVICE_URL");
naver_id_login.setState(state);
naver_id_login.init_naver_id_login();

// 페이스북 api 설정
window.fbAsyncInit = function() {
	FB.init({
		appId : '824595201040077',
		autoLogAppEvents : true,
		xfbml : true,
		version : 'v2.10'
	});
	FB.AppEvents.logPageView();
};

(function(d, s, id) {
	var js, fjs = d.getElementsByTagName(s)[0];
	if (d.getElementById(id)) {
		return;
	}
	js = d.createElement(s);
	js.id = id;
	js.src = "//connect.facebook.net/en_US/sdk.js";
	fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));

// 페이스북 로그인 정보 가져오기
function getUserData(access_token) {
	FB.api('/me', {
		fields : 'name,email,gender,birthday'
	}, function(data) {
		console.log("fblogin");
		$.ajax({
			url : "/net/api/snslogin",
			type : "post",
			data : "name=" + data.name + "&email=" + data.email + "&gender="
					+ data.gender + "&birthday=" + data.birthday + "&token="
					+ data.id + "&sns=fb",
			// $.ajax({
			// url : "/net/user/snslogin",
			// type : "post",
			// data : data+"&sns=fb",
			success : function(response) {
				console.log("success");
				parent.window.location.href = "/net/main2/";
				if (response.result === "fail") {
					console.error("dddd" + response.message);
					return;
				}
			},
			error : function(jqXHR, status, e) {
				console.log(jqXHR);
				console.error(status);
				console.error(e);
			}

		});
	});
}

/* 네이버 버튼 hover */
$("#naverLogin").hover(
		function() {
			$("#naverlogo").css("background-image",
					'url("/net/resources/images/logo-hover.png")');
			$("#naverlogo").css("background-size", 'cover');
		},
		function() {
			$("#naverlogo").css("background-image",
					'url("/net/resources/images/logo.png")');
			$("#naverlogo").css("background-size", 'cover');
		})

/**
 * 20170905 허규준 로그인
 */

var emptyPasswdMsg = "비밀번호를 입력해주세요";
var emptyEmailMsg = "이메일을 입력해주세요";
var regEmailMsg = "이메일 형식이 아닙니다";
var loginFailMsg = "로그인 정보가 틀립니다";
var emailRegExp = /[0-9a-zA-Z][_0-9a-zA-Z-]*@[_0-9a-zA-Z-]+(\.[_0-9a-zA-Z-]+){1,2}$/;

$(function() {

	var date = new Date();
	$("#birthy").attr("placeholder", date.getFullYear());

	$("#email").on('keypress', function() {
		$("#emailMsg").empty();
	})
	$("#pwd").on('keypress', function() {
		$("#passwdMsg").empty();
	})

	$(document).on(
			'mouseover',
			'.naverlogin',
			function(event) {

				$(this).find("#naverLogo").css("background-image",
						'url("/net/resources/images/logo-hover.png")');
				$(this).find("#naverLogo").css("background-size", 'cover');
				$(this).find(".btn-social").css('background-color', '#1BAA25');
			});

	$(document).on(
			'mouseout',
			'.naverlogin',
			function(event) {

				$(this).find("#naverLogo").css("background-image",
						'url("/net/resources/images/logo.png")');
				$(this).find("#naverLogo").css("background-size", 'cover');
				$(this).find(".btn-social").css('background-color', '#1EC800');
			});

	// 페이스북 로그인 버튼 클릭 시 토큰을 이용한 사용자 정보 가져와서 통신

	document.getElementById('loginBtn').addEventListener('click', function() {
		// do the login
		FB.login(function(response) {
			if (response.authResponse) {
				access_token = response.authResponse.accessToken; // get
																	// access
				// token
				user_id = response.authResponse.userID; // get FB UID
				console.log('access_token = ' + access_token);
				console.log('user_id = ' + user_id);
				getUserData(access_token);
			}
		}, {
			scope : 'email,public_profile,user_birthday',
			return_scopes : true
		});

	}, false);

})

$('#facebookLogin').click(function() {
	$('#loginBtn').click();
})

$('#main-naverlogin').click(function() {
	console.log("dddddd");
	$('#naverLoginBtn').click();
})

$('#main-facebooklogin').click(function() {
	$('#loginBtn').click();
})

var login = function() {

	var email = $("#email").val();
	var pwd = $("#pwd").val();

	if (pwd === '') {
		$("#passwdMsg").text(emptyPasswdMsg);
		$("#pwd").focus();
		event.preventDefault();
	}
	if (email === '') {
		$("#emailMsg").text(emptyEmailMsg);
		$("#email").focus();
		event.preventDefault();
	}

	if (email != '' && !email.match(emailRegExp)) {
		$("#emailMsg").text(regEmailMsg);
		$("#email").focus();
		event.preventDefault();
	}
	if (email != '' && pwd != '' && email.match(emailRegExp)) {
		$.ajax({
			url : "/net/api/checklogin",
			type : "post",
			data : "iden=" + email + "&pw=" + pwd,

			success : function(response) {

				console.log(typeof (response.data), response.data)

				if (response.data === true) {

					$.ajax({
						url : "/net/api/setsession",
						type : "post",
						data : "iden=" + email + "&pw=" + pwd,

						success : function(response) {

							// if(response.data.infoYn == 'N'){

							// parent.window.location.href = "/net/user/mbinfo";

							// }else{

							/* 로그인 메인 화면 url 변경 */
							parent.window.location.href = "/net/main2/";

							// }

							console.log("세션성공")
						},
						error : function(jqXHR, status, e) {
							console.log(jqXHR);
							console.error(status);
							console.error(e);
						}

					});
					event.preventDefault();
				} else if (response.data === false) {
					$("#loginMsg").text(loginFailMsg);
					event.preventDefault();
				}

			},

			error : function(jqXHR, status, e) {
				console.log(jqXHR);
				console.error(status);
				console.error(e);
			}

		});
		event.preventDefault();

	}
}
