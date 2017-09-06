<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>

	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
 
    <title>상담실</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
    <link href="${pageContext.request.contextPath}/resources/css/higrad-signup.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
    <style>
        body {
            padding-top: 70px;
        }
        .remove-btn {
            float : right;
        }

        .web-volunteer {
            font-size: 1.5em;
        }
        .info {
            border-top: 1px solid lightgray;
        }
        .interest {
            color : gray;
        }
        .option {
            float : right;
        }
        
 		a:visited { color: gray; text-decoration: none;}


    </style>
    
</head>



<style> textarea {width:300px; overflow:visible} </style>


<script>

//박가혜 2017-08-23

    function resize(obj) {
      obj.style.height = "1px";
      obj.style.height = (20+obj.scrollHeight)+"px";
    }
</script>

<style>

/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 100px; /* Location of the box */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.8); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
    background-color: #fefefe;
    margin: auto;
    padding: 20px;
    border: 1px solid #888;
    width: 80%;
}

/* The Close Button */
.close {
    color: #aaaaaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer;
}


</style>

<script type="text/javascript">
//박가혜 2017-08-23
$(function() {
	
	var authUser= $("#authUser").val();
	
	
	  $(document).ready(function() {
	 
	    $("#myBtn").click(function() {
	    	
	    	if(authUser === null || authUser===''){
				
	    		
	    		location.href='${pageContext.request.contextPath }/user/login';
				
				
			}else{
				
				 $("#myModal").css({
				        "display": "block"
				 });
				
			}

	    
	    });
	 
	    $(".close").click(function() {
	      $("#myModal").css({
	        "display": "none"
	      });
	    });
	 
	    $("html").click(function(event) {
	      if (event.target.id === "myModal") {
	        $("#myModal").css({
	          "display": "none"
	        });
	      }
	    });
	 
	  });
	 
	})
	

	

	//박가혜 2017-08-23
	function counselinginsert() {
	
	
	
		
		event.preventDefault();
		
	
		
		var wrtbtTitle= $("#wrtbtTitle").val();
		var wrtbtText= $("#wrtbtText").val();
		var writrInfoOpngYn= $("input[type=radio][name=writrInfoOpngYn]:checked").val();
		
		var conslBbsDstnct= $("#conslBbsDstnct").val();
		var bbsNo= $("#bbsNo").val();
	

		var counselinglist = {
				wrtbtTitle: wrtbtTitle,
				wrtbtText: wrtbtText,
				writrInfoOpngYn: writrInfoOpngYn,
				conslBbsDstnct: conslBbsDstnct,
				bbsNo: bbsNo
				};
		
		
		//모달 종료 
		 $("#myModal").css({
		        "display": "none"
		      });
		
		 location.reload(); 
	
		// ajax 통신 
		
		jQuery.ajaxSettings.traditional = true;
		
		//console.log(JSON.stringify(counselinglist));
		
		$.ajax( {
			url : "${pageContext.request.contextPath }/counseling/api/write",
			type: "post",
			dataType: "json", // 받아야되는 데이터 타입 
			data: JSON.stringify(counselinglist),
			//{comlist : comlist},
			contentType: 'application/json; charset=utf-8', //json 타입으로 데이터를 보낼때 사용함 
			
			
			
			success: function(response){

				
					if(response.result === "fail"){
						
						
						console.error(response.message);
						return;
					}
					
					console.log("성공입니다");
					//console.log(response.data);
					//response.data.contextpath = "${pageContext.request.contextPath}/noti/api/lab";
			
				
			},
			error: function( jqXHR, status, e ){
				console.log("에러입니다");
				console.error( status + " : " + e );
				console.log(jqXHR);
			}
			} );
		
		
		
	}
	
	

</script>



<body>
<!-- /////////////////////////////// Header ///////////////////////-->


<c:import url="/WEB-INF/views/include/header.jsp" />
	
	
<div class="container">
    <!-- ///// filter (대분류) //////-->


    <!-- ////// filter ///////-->
    <div class="row">
        <div class="col-lg-3">
        	    분야
            <a href="*" class="remove-btn">EDIT</a>

            <hr>
            <div class="well well-sm">
                <i class="glyphicon glyphicon-tag"></i> 즐겨찾기
            </div>
            <div class="well well-sm">
                <i class="glyphicon glyphicon-tag"></i> 답변을 기다리는 중 ...
            </div>
            <div class="well well-sm">
                <i class="glyphicon glyphicon-tag"></i> 데이터베이스
                <a href=""> <i class="glyphicon glyphicon-remove remove-btn"></i></a>
            </div>
            <div class="well well-sm">
                <i class="glyphicon glyphicon-tag"></i> 인공지능
                <a href=""> <i class="glyphicon glyphicon-remove remove-btn"></i></a>
            </div>
            <div class="well well-sm">
                <i class="glyphicon glyphicon-tag"></i> 빅 데이터
                <a href=""> <i class="glyphicon glyphicon-remove remove-btn"></i></a>
            </div>
            <div class="well well-sm">
                <i class="glyphicon glyphicon-tag"></i> 컴퓨터
                <a href=""> <i class="glyphicon glyphicon-remove remove-btn"></i></a>
            </div>
        </div>



    <div class="col-lg-9">
    
		 <!-- Trigger/Open The Modal -->
		
		<div class="w3-container">
            <div id="myBtn" class="btn btn-danger web-volunteer">질문하기</div>
            <div class="dropdown option">
                <button class="w3-button w3-padding w3-padding w3-round-large" type="button" data-toggle="dropdown">
                    <i class="glyphicon glyphicon-option-horizontal"></i>
                </button>
                <ul class="dropdown-menu">
                    <li><a href="#">조회순</a></li>
                    <li><a href="#">공감순</a></li>
                    <li><a href="#">최신순</a></li>
                </ul>
            </div>
            
            
           
           <!-- The Modal -->
		<div id="myModal" class="modal">
				
			<!-- Modal content -->
			<div id="modal-content" class="modal-content">
				 <span class="close">×</span>
				 
				 
				 
				 <form class="counseling-form" id="counseling-form" name="counseling-form" onsubmit="counselinginsert();">
				 
					<input type="hidden" id="authUser" name="authUser" value="${authUser.mbNo }">
					진로게시판 입력<input type="hidden" id="bbsNo" name="bbsNo" value="1">
					제목 : <input type="text" class="form-control" id="wrtbtTitle" name="wrtbtTitle">
					내용 : <textarea class="form-control" onkeydown="resize(this)" onkeyup="resize(this)" id="wrtbtText" name="wrtbtText"></textarea>
					
					작성자정보공개여부 : <input type="radio" id="writrInfoOpngYn" name="writrInfoOpngYn" value="Y" checked="checked" />Y 
									<input type="radio" id="writrInfoOpngYn" name="writrInfoOpngYn" value="N" />N <br>
					상담구분 : <select
						name="conslBbsDstnct" id="conslBbsDstnct">
						<option value=""> 상담구분</option>
						<option value="일반상담">일반상담</option>
						<option value="연구실상담">연구실상담</option>
						</select> 
					

					<button type="submit" class="form-control">입력</button>
				</form>
				 
				 
			 </div>
				
		</div>
            
            
       </div>
		
				
		
    

        <!--////// 질문과 답변 시작 ///////////-->

        	<c:set var="listcount" value="${fn:length(counselingList)}"/>
        	
        	<c:forEach items="${counselingList }" var="counselingList" varStatus="status">
			
			
					<c:if test="${counselingList.count == 0 }"	>
						
						     <div class="w3-card-2 w3-margin">
						     
						            <div class="w3-container interest">#화학, #생물학, #화학공학
						            </div>
						            <div class="w3-container">
						                <h4><b><a  href="${pageContext.servletContext.contextPath }/counseling/detail?no=${counselingList.wrtbtNo}&type=prnts">${counselingList.wrtbtTitle }</a></b></h4>
						                
						                
						            </div>
						
						            <div class="w3-container">
						
						                <div class="w3-button w3-padding-small w3-white w3-border w3-border-white w3-round-large">
						                <a  href="${pageContext.servletContext.contextPath }/counseling/detail?no=${counselingList.wrtbtNo}&type=reply">답변하기</a>
						                </div>
						                <div class="dropup option">
						                    <button class="w3-button w3-padding w3-padding w3-round-large" type="button" data-toggle="dropdown">
						                        <i class="glyphicon glyphicon-option-horizontal"></i>
						                    </button>
						                    <ul class="dropdown-menu">
						                        <li><a href="#">익명으로 답변하기</a></li>
						                        <li><a href="#">스크랩하기</a></li>
						                        <li><a href="#">신고하기</a></li>
						                    </ul>
						                </div>
						            </div>
						            <br>
						        </div>

					</c:if>
					<c:if test="${counselingList.count != 0 }"	>
					
					   <div class="w3-card-2 w3-margin">
					
					   <div class="w3-container interest">#유학 #외국 #컴퓨터
			            </div>
			            <div class="w3-container">
			                <h4><b><a href="${pageContext.servletContext.contextPath }/counseling/detail?no=${counselingList.wrtbtNo}&type=prnts">${counselingList.wrtbtTitle }</a></b></h4>
			
			            </div>
			            <div class="w3-container">
			                <h6>${replyList[status.index].nknm }
			                    <span class="w3-opacity">${replyList[status.index].avlblBeginDt }에 답변</span></h6>
			                <p> <a  href="${pageContext.servletContext.contextPath }/counseling/detail?no=${counselingList.wrtbtNo}&type=prnts">${replyList[status.index].wrtbtText }</a></p>
			                
			               
			            </div>
			
			            <div class="w3-container">
			                <div class="w3-button w3-padding-small w3-white w3-border w3-border-white w3-round-large">
			                answers<span class="w3-badge w3-white">${counselingList.count }</span>
			                </div>
			                <div class="w3-button w3-padding-small w3-white w3-border w3-border-white w3-round-large">
			                    Up <span class="w3-badge w3-white">${counselingList.rcmdCo }</span>
			                </div>
			                <div class="w3-button w3-padding-small w3-white w3-border w3-border-white w3-round-large">
			                    Down <span class="badge">${counselingList.ncmdCo }</span>
			                </div>
			                <div class="dropup option">
			                    <button class="w3-button w3-padding w3-padding w3-round-large" type="button" data-toggle="dropdown">
			                    <i class="glyphicon glyphicon-option-horizontal"></i>
			                    </button>
			                    <ul class="dropdown-menu">
			                        <li><a href="#">익명으로 답변하기</a></li>
			                        <li><a href="#">스크랩하기</a></li>
			                        <li><a href="#">신고하기</a></li>
			                    </ul>
			                </div>
			            </div>
			            <Br>
			        </div>
					
				
				</c:if>
				
			</c:forEach>
        
         
        


    </div>


    </div>
</div>

<footer>
    <!--//////////////////////// footer ////////////////////////////-->
    <div class="container text-center">
        <hr />
        <div class="row">
            <div class="col-lg-12">
                <div class="col-md-3">
                    <ul class="nav nav-pills nav-stacked">
                        <li><a href="#">About us</a></li>
                        <li><a href="#">Blog</a></li>
                    </ul>
                </div>
                <div class="col-md-3">
                    <ul class="nav nav-pills nav-stacked">
                        <li><a href="#">Product for Mac</a></li>
                        <li><a href="#">Product for Windows</a></li>
                    </ul>
                </div>
                <div class="col-md-3">
                    <ul class="nav nav-pills nav-stacked">
                        <li><a href="#">Web analytics</a></li>
                        <li><a href="#">Presentations</a></li>
                    </ul>
                </div>
                <div class="col-md-3">
                    <ul class="nav nav-pills nav-stacked">
                        <li><a href="#">Product Help</a></li>
                        <li><a href="#">Developer API</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <hr>

    </div>


    <div class="footer-bottom">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                    <div class="copyright">
                        © 2015, Webenlance, All rights reserved
                    </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                    <div class="design">
                        <a href="#">Franchisee </a> |<a target="_blank" href="http://www.webenlance.com">Web Design & Development by Webenlance</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

</footer>

</body>
</html>