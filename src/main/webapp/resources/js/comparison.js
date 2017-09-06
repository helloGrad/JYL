var chkCnt = 0;// 체크 카운트 0으로 초기화
var chkMaxCnt = 3; // 체크될 최대 갯수 설정

var comlist = [];


function chk(chkObj) {
	var chk = chkObj.checked; // 체크박스 선택 true/false;
	var name = chkObj.name; // 체크박스 이름
	var value = chkObj.value;

	var len = document.getElementsByName(name).length; // 체크박스 총갯수

	if (chk == true) { // 선택이면 1증가

		chkCnt = chkCnt + 1;
		comlist.push(value);
		// alert(comlist);
	} else { // 취소면 1감소
		chkCnt = chkCnt - 1;
		comlist.pop();
		// alert(comlist);
	}
	if (chkCnt > chkMaxCnt) {
		alert("3개초과입니다.");
		chkObj.checked = false;
		chkCnt = chkMaxCnt;// 3개로 초기화;
		comlist.pop();

	} else {
		for (var i = 0; i < len; i++) {
			if (document.getElementsByName(name)[i].disabled == true) {
				document.getElementsByName(name)[i].disabled = false;
			}
		}
	}
}

var modalOpen = function() {

	var objs = document.getElementsByClassName("remove-ok");
	console.log(objs);
	
	for (var i = objs.length; i > 0; i--) { 
		var obj = objs[i-1];
		obj.parentNode.removeChild(obj);
	}
	
	console.log("modal");
	var modal = document.getElementById('myModal');
	var span = document.getElementsByClassName("close")[0];

	modal.style.display = "block";

	span.onclick = function() {
		modal.style.display = "none";		
	}
	window.onclick = function(event) {
		if (event.target == modal) {
			modal.style.display = "none";
		}
	}
}

//var ynCheck = function(data, dataNm){
//	
//	if(data==='Y'){
//		document.getElementById(dataNm).innerHTML += "<td class='remove-ok'><i class='glyphicon glyphicon-ok'></i></td>";
//	}
//	else if(data==='N'){
//		document.getElementById(dataNm).innerHTML += "<td class='remove-ok'><i class='glyphicon glyphicon-minus'></i></td>";
//	}
//}

var modalSetdata=function(list){
	
	for(var i=0; i<list.length ;i++){
		
		console.log("i="+i);
		document.getElementById("tdName").innerHTML +=	"<td class='remove-ok'><div class='w3-round w3-teal lead'"
			+ "id='lab-name'>"+list[i].orgnzNm.replace(/\n/g,"<br>")+"</div></td>";
		//bk
		if(list[i].bk21EorgnzSuprtYn=='Y'){
			document.getElementById("tdbk21EorgnzSuprtYn").innerHTML +=	"<td class='remove-ok'><i class='glyphicon glyphicon-ok'></i></td>";
		}
		else if(list[i].bk21EorgnzSuprtYn=='N'){
			document.getElementById("tdbk21EorgnzSuprtYn").innerHTML +=	"<td class='remove-ok'><i class='glyphicon glyphicon-minus'></i></td>";
		}
		
		//
		if(list[i].tuitionSuprtYn=='Y'){
			document.getElementById("tdtuitionSuprtYn").innerHTML += "<td class='remove-ok'><i class='glyphicon glyphicon-ok'></i></td>";
		}
		else if(list[i].tuitionSuprtYn=='N'){
			document.getElementById("tdtuitionSuprtYn").innerHTML += "<td class='remove-ok'><i class='glyphicon glyphicon-minus'></i></td>";
		}
		
		//
		if(list[i].lvncSuprtYn=='Y'){
			document.getElementById("tdlvncSuprtYn").innerHTML += "<td class='remove-ok'><i class='glyphicon glyphicon-ok'></i></td>";
		}
		else if(list[i].lvncSuprtYn=='N'){
			document.getElementById("tdlvncSuprtYn").innerHTML += "<td class='remove-ok'><i class='glyphicon glyphicon-minus'></i></td>";
		}
		
		//
		if(list[i].incetSuprtYn=='Y'){
			document.getElementById("tdincetSuprtYn").innerHTML += "<td class='remove-ok'><i class='glyphicon glyphicon-ok'></i></td>";
		}
		else if(list[i].incetSuprtYn=='N'){
			document.getElementById("tdincetSuprtYn").innerHTML += "<td class='remove-ok'><i class='glyphicon glyphicon-minus'></i></td>";
		}
		
		//
		if(list[i].dormSuprtYn=='Y'){
			document.getElementById("tddormSuprtYn").innerHTML += "<td class='remove-ok'><i class='glyphicon glyphicon-ok'></i></td>";
		}
		else if(list[i].dormSuprtYn=='N'){
			document.getElementById("tddormSuprtYn").innerHTML += "<td class='remove-ok'><i class='glyphicon glyphicon-minus'></i></td>";
		}
		
		//
		if(list[i].internYn=='Y'){
			document.getElementById("tdinternYn").innerHTML += "<td class='remove-ok'><i class='glyphicon glyphicon-ok'></i></td>";
		}
		else if(list[i].internYn=='N'){
			document.getElementById("tdinternYn").innerHTML += "<td class='remove-ok'><i class='glyphicon glyphicon-minus'></i></td>";
		}
		
		//
		if(list[i].lrstyJoingYn=='Y'){
			document.getElementById("tdlrstyJoingYn").innerHTML += "<td class='remove-ok'><i class='glyphicon glyphicon-ok'></i></td>";
		}
		else if(list[i].lrstyJoingYn=='N'){
			document.getElementById("tdlrstyJoingYn").innerHTML += "<td class='remove-ok'><i class='glyphicon glyphicon-minus'></i></td>";
		}
		
		//
		if(list[i].lrstyJoingfeeSuprtYn=='Y'){
			document.getElementById("tdlrstyJoingfeeSuprtYn").innerHTML += "<td class='remove-ok'><i class='glyphicon glyphicon-ok'></i></td>";
		}
		else if(list[i].lrstyJoingfeeSuprtYn=='N'){
			document.getElementById("tdlrstyJoingfeeSuprtYn").innerHTML += "<td class='remove-ok'><i class='glyphicon glyphicon-minus'></i></td>";
		}
		
		//
		if(list[i].resrchTaskJoingYn=='Y'){
			document.getElementById("tdresrchTaskJoingYn").innerHTML += "<td class='remove-ok'><i class='glyphicon glyphicon-ok'></i></td>";
		}
		else if(list[i].resrchTaskJoingYn=='N'){
			document.getElementById("tdresrchTaskJoingYn").innerHTML += "<td class='remove-ok'><i class='glyphicon glyphicon-minus'></i></td>";
		}
		
		//
		if(list[i].stdtrOpptySuprtYn=='Y'){
			document.getElementById("tdstdtrOpptySuprtYn").innerHTML += "<td class='remove-ok'><i class='glyphicon glyphicon-ok'></i></td>";
		}
		else if(list[i].stdtrOpptySuprtYn=='N'){
			document.getElementById("tdstdtrOpptySuprtYn").innerHTML += "<td class='remove-ok'><i class='glyphicon glyphicon-minus'></i></td>";
		}
		
		//
		if(list[i].eduPgmJoingSuprtYn=='Y'){
			document.getElementById("tdeduPgmJoingSuprtYn").innerHTML += "<td class='remove-ok'><i class='glyphicon glyphicon-ok'></i></td>";
		}
		else if(list[i].eduPgmJoingSuprtYn=='N'){
			document.getElementById("tdeduPgmJoingSuprtYn").innerHTML += "<td class='remove-ok'><i class='glyphicon glyphicon-minus'></i></td>";
		}
		
	}
	
}

function comparinsert() {
	
	event.preventDefault();

	jQuery.ajaxSettings.traditional = true;

	console.log(JSON.stringify(comlist));
	modalOpen();
	
	$.ajax({
		url : "/net/noti/api/lab",
		type : "post",
		data : {
			comlist : comlist
		},

		success : function(response) {

			if (response.result === "fail") {

				console.error(response.message);
				return;
			}
	
			
			console.log(response.data);
			console.log(response.data.length);
			modalSetdata(response.data);

		},
		error : function(jqXHR, status, e) {
			console.log("에러입니다");
			console.error(status + " : " + e);
			console.log(jqXHR);
		}
	});
	

	

}
