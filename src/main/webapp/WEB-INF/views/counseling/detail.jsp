<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
pageContext.setAttribute("newLine", "\n");
%>


                   
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
            padding-top: 80px;
        }
        .question {
            font-size : 1.5em;
            font-weight: bold;
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
        p {
            line-height: 170%;
        }

		.disabled {
   		pointer-events: none;
   		cursor: default;
		}

		.winter { border:7px solid #dddddd; 
					background-color: yellow;}

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




<script type="text/javascript">
//박가혜 2017-08-24

	var list = [];
	var counselingPrnts = JSON.parse('${jsoncounselingPrnts}');
	var existLike = JSON.parse('${jsonexistLike}');
	var counselingReply = JSON.parse('${jsoncounselingReply}');

	$(function() {
		
		var authUser= $("#authUser").val();
		var replysize = $("#replysize").val();

		var type = "${type}";
		
		var existLikelist = []; 
		
		//<c:forEach items="${existLike}" var="item">
		//existLikelist.push("${item}");
		//</c:forEach>
		
		
	

	


		if (replysize == 0) { //첫답변 구분

			if (type === 'prnts') {

				div_hide();
			}

		} else {

			div_hide();
		}
		
		

		for( var i=0; i<existLike.length; i++){
			
			
			if(existLike[i].wrtbtNo == counselingPrnts[0].wrtbtNo){
			
				
				//$("a").attr("like", "like"+existLike[i].wrtbtNo).removeAttr('href');

				var link ="like"+existLike[i].wrtbtNo+"like";
				
				console.log(link);
				list.push(link);
				
				
				//$('.'+link).attr('disabled',false);
				
				$('.'+link).addClass("winter");
			
				
			}
			
			
		}
		
		
		console.log(existLike);
		console.log(counselingReply);
	
			
			for( var i=0; i<counselingReply.length; i++){
				
				for( var j=0; j<existLike.length; j++){
				
				if(existLike[j].wrtbtNo == counselingReply[i].wrtbtNo){
			
				
					//$("a").attr("like", "like"+existLike[i].wrtbtNo).removeAttr('href');
	
					var link ="like"+existLike[j].wrtbtNo+"like";

					var dislink ="like"+existLike[j].wrtbtNo+"dislike";
					console.log(link);
					list.push(link);
					
					console.log(dislink);
					list.push(dislink);
					
					$('.'+link).addClass("winter");
					$('.'+dislink).addClass("winter");
					
				
				}
			}
			
			
		}
		
		
		

		$(document).ready(function() {

			$("#myBtn").click(function() {
				
				
				if(authUser === null || authUser===''){
					
		    		
		    		location.href='${pageContext.request.contextPath }/user/login';
					
					
				}else{
					
					var con = document.getElementById("reply-form");

					if (con.style.display == 'none') {
						con.style.display = 'block';
					} else {
						con.style.display = 'none';
					}

				}

			});

		});

	})

	//보이기
	function div_show() {

		document.getElementById("reply-form").style.display = "block";

	}

	//숨기기
	function div_hide() {
		document.getElementById("reply-form").style.display = "none";
	}

	//박가혜 2017-08-24
	function counselingreplyinsert() {

		event.preventDefault();

		var authUser= $("#authUser").val();
		if(authUser === null || authUser===''){
			
    		location.href='${pageContext.request.contextPath }/user/login';
			return;
			
		}
		
		var prntsWrtbtNo=$("#prntsWrtbtNo").val();
		var wrtbtText = $("#wrtbtText").val();
		var writrInfoOpngYn = $("input[type=radio][name=writrInfoOpngYn]:checked").val();
		
		
		var bbsNo = $("#bbsNo").val();

		var replylist = {
			prntsWrtbtNo : prntsWrtbtNo,
			wrtbtText : wrtbtText,
			writrInfoOpngYn : writrInfoOpngYn,
			bbsNo : bbsNo
		};

		//폼종료
		div_hide();


		// ajax 통신 

		jQuery.ajaxSettings.traditional = true;

		//alert(JSON.stringify(replylist));
	

		$.ajax({
			url : "${pageContext.request.contextPath }/counseling/api/replywrite",
			type : "post",
			dataType : "json", // 받아야되는 데이터 타입 
			data : JSON.stringify(replylist),
			//{comlist : comlist},
			contentType : 'application/json; charset=utf-8', //json 타입으로 데이터를 보낼때 사용함 

			success : function(response) {

				if (response.result === "fail") {

					console.error(response.message);
					return;
				}

				console.log("성공입니다");
				location.reload();
				//console.log(response.data);
				//response.data.contextpath = "${pageContext.request.contextPath}/noti/api/lab";

			},
			error : function(jqXHR, status, e) {
				console.log("에러입니다");
				console.error(status + " : " + e);
				console.log(jqXHR);
			}
		});

	}
	
	
	//박가혜 2017-08-25
	function likeupdate(num, value) {

	

		var authUser= $("#authUser").val();
		if(authUser === null || authUser===''){
			
    		location.href='${pageContext.request.contextPath }/user/login';
			return;
			
		}
	
		console.log(num+" "+value+" 사용자id :"+authUser);
	
		
		var likevalue = {
				wrtbtNo : num,
				mbNo : authUser,
				infroDstnct : value
			};
		
		
		$.ajax({
			url : "${pageContext.request.contextPath }/counseling/api/likeadd",
			type : "post",
			dataType : "json", // 받아야되는 데이터 타입 
			data : JSON.stringify(likevalue),
			contentType : 'application/json; charset=utf-8', //json 타입으로 데이터를 보낼때 사용함 

			success : function(response) {

				if (response.result === "fail") {

					console.error(response.message);
					return;
				}

				console.log("성공입니다");
				//location.reload();
				console.log(response.data);
				
				if(value == 'like'){

					console.log("공감버튼");
					
					 
					 var check=0;
					 var result;
					 
					 for( var i=0; i<counselingReply.length; i++){
						 
						 if(num== counselingReply[i].wrtbtNo){ //답변일경우
							 
							 check=1;
							 
						 }
						 
					 }
					 
					 if(check ==1){ //답변인 경우 up
						 
							for( var i=0; i<existLike.length; i++){
								if(num== counselingReply[i].wrtbtNo){
									
									result = existLike[i].infoDstnct;
								}
								
								
							}
							
							//if(result == 'like'){
						 
						 
						 	$(".like"+num+"like").html("<a class='like"+response.data.wrtbtNo+"like' onclick='likeupdate("+response.data.wrtbtNo+",'like')' value='like'> Up <span class='w3-badge w3-white'>"+response.data.rcmdCo+"</span></a>");
							 if($(".like"+num+"dislike").hasClass("winter") === true) {
								 $(".like"+num+"dislike").removeClass("winter");
								 $(".like"+num+"like").removeClass("winter");
								}else{
									
									 $(".like"+num+"dislike").addClass("winter");
									 $(".like"+num+"like").addClass("winter");
								}		
						
							//}
						 
					 }else{ //답변이 아닌경우
					 	$(".like"+num+"like").html("<a class='like"+response.data.wrtbtNo+"like' onclick='likeupdate("+response.data.wrtbtNo+",'like')' value='like'> 공감 <span class='w3-badge w3-white'>"+response.data.rcmdCo+"</span></a>");
	
					 	 if($(".like"+num+"like").hasClass("winter") === true) {
							 $(".like"+num+"like").removeClass("winter");
							}else{
								
								 $(".like"+num+"like").addClass("winter");
							}

						}

						
                     
					
				}else{
					console.log("비공감버튼");
					
					for( var i=0; i<existLike.length; i++){
						if(num== counselingReply[i].wrtbtNo){
							
							result = existLike[i].infoDstnct;
						}
						
						
					}
					
					//if(result == 'dislike'){
						
						 $(".like"+num+"dislike").html("<a class='like"+response.data.wrtbtNo+"dislike' onclick='likeupdate("+response.data.wrtbtNo+",'dislike')' value='dislike'> Down <span class='w3-badge w3-white'>"+response.data.ncmdCo+"</span></a>");

						 if($(".like"+num+"dislike").hasClass("winter") === true) {
							 $(".like"+num+"dislike").removeClass("winter");
							 $(".like"+num+"like").removeClass("winter");
							}else{
								
								 $(".like"+num+"dislike").addClass("winter");
								 $(".like"+num+"like").addClass("winter");
							}	
				//	}
					
						
					
				}
				//response.data.contextpath = "${pageContext.request.contextPath}/noti/api/lab";

			},
			error : function(jqXHR, status, e) {
				console.log("에러입니다");
				console.error(status + " : " + e);
				console.log(jqXHR);
			}
		});
		
		

	
	

	

	}
</script>






<body>
<!-- /////////////////////////////// Header ///////////////////////-->


<c:import url="/WEB-INF/views/include/header.jsp" />
	
	
<div class="container">
    <div class="row">
        <!--///////// 질문 및 답변 /////////-->
        <div class="col-lg-8">
            <!--////// 제목 및 작성자 정보 //////-->
            <div class="w3-card-4 w3-margin w3-topbar w3-border-red">

                <div class="w3-container">
                    <h3><b>${counselingPrnts.wrtbtTitle }</b></h3>

                </div>

                <div class="w3-container">
                <h6>
                <c:if test="${counselingPrnts.writrInfoOpngYn =='Y' }"	>
                
                
                <c:choose>
 
					 <c:when test="${counselingPrnts.birdt == null and counselingPrnts.agrg == null}">
				              없음
				    </c:when>
 					
				    <c:when test="${counselingPrnts.birdt == null}">
				       ${counselingPrnts.agrg }대,컴퓨터공학과
				    </c:when>
				 
				    <c:when test="${counselingPrnts.agrg == null }">
				        ${counselingPrnts.birdt }대,컴퓨터공학과
				    </c:when>
				 
				    <c:otherwise>
				        아무것도 아닌 사람 입니다.
				    </c:otherwise>
 
				</c:choose>

                </c:if>
                
                
                <c:if test="${counselingPrnts.writrInfoOpngYn =='N' }"	>
                                      비공개
                </c:if>
                    <span class="w3-opacity">• ${counselingPrnts.avlblBeginDt }에 작성</span></h6>
               </div>

                <div class="w3-container">
                    <p>
                    ${fn:replace(counselingPrnts.wrtbtText, newLine,"<br>") }
                    </p>
                </div>

                <div class="w3-container interest">#유학 #외국 #컴퓨터
                </div>

                <div class="w3-container">
                    <div class="w3-button w3-padding-small w3-white w3-border w3-border-white w3-round-large disabled">
                        조회수 <span class="w3-badge w3-white">${counselingPrnts.findCo }</span>
                    </div>
                    
                   
					 
					 	 
                   		 <div class="w3-button w3-padding-small w3-white w3-border w3-border-white w3-round-large">
                      	<a class="like${counselingPrnts.wrtbtNo }like" onclick="likeupdate(${counselingPrnts.wrtbtNo },'like')" value="like"> 공감 <span class="w3-badge w3-white">${counselingPrnts.rcmdCo }</span></a>
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

            <div class="w3-container">

                    <h4><b>답변</b> <span class="w3-badge w3-white">${fn:length(counselingReplyList)}</span></h4>
                    <input type="hidden" id="replysize" name="replysize" value="${fn:length(counselingReplyList)}">
                    
                    <div id="myBtn" class="btn btn-danger web-volunteer" >답변하기</div>
                   
                <hr>
            </div>

            <!--/////// 답변 ///////-->
            
            
            <div class="w3-card-4 w3-margin w3-topbar w3-border-lightgray" id="reply-form">
              
			
				 <form class="reply-form" id="reply-form" name="reply-form" onsubmit="counselingreplyinsert();">
				 
					<input type="hidden" id="authUser" name="authUser" value="${authUser.mbNo }">
					<input type="hidden" id="prntsWrtbtNo" name="prntsWrtbtNo" value="${counselingPrnts.wrtbtNo }">
					답변 등록 <input type="hidden" id="bbsNo" name="bbsNo" value="1"> <br>
					내용 : <textarea class="form-control" onkeydown="resize(this)" onkeyup="resize(this)" id="wrtbtText" name="wrtbtText"></textarea>
					
					작성자정보공개여부 : <input type="radio" id="writrInfoOpngYn" name="writrInfoOpngYn" value="Y" checked="checked" />Y 
									<input type="radio" id="writrInfoOpngYn" name="writrInfoOpngYn" value="N" /> N <br>
				

					<button type="submit" class="form-control">입력</button>
				</form>
			</div>
            
            
            
            
            <c:forEach items="${counselingReplyList}" var="counselingReplyList" varStatus="status">
            	
            	
            	 <c:if test="${status.index == 0 }"	>
            
            <div class="w3-card-4 w3-margin w3-topbar w3-border-green">
                <!--//// 답변자 정보 //// -->
                <div class="w3-container">
                    <br>
                    <img src="images/portfolio/1.jpg" alt="Avatar" class="w3-left w3-circle w3-margin-right" style="width:4em; height: 4em;">
                    
                    <c:if test="${counselingReplyList.writrInfoOpngYn =='Y' }"	>
                	<p><span class="w3-large w3-margin-right">${counselingReplyList.nknm}</span>
                 	 <span class="w3-medium w3-opacity">컴퓨터공학과</span>
                 	  </p>
                	</c:if>
                
                
               		 <c:if test="${counselingReplyList.writrInfoOpngYn =='N' }"	>
                      <p><span class="w3-large w3-margin-right">비공개</span></p>
               		 </c:if>
                    
                    
                  
                <h6>
                    <span class="w3-small w3-opacity">${counselingReplyList.avlblBeginDt}에 답변</span></h6>
                </div>

                <br>

                <!--//// 답변 내용 //// -->
                <div class="w3-container">
                    <p>${fn:replace(counselingReplyList.wrtbtText, newLine,"<br>") } </p> 
                </div>

                <div class="w3-container">
                
                 <div class="w3-button w3-padding-small w3-white w3-border w3-border-white w3-round-large">
                  <a class="like${counselingReplyList.wrtbtNo }like" onclick="likeupdate(${counselingReplyList.wrtbtNo },'like')" value="like" >  Up <span class="w3-badge w3-white">${counselingReplyList.rcmdCo }</span></a>
                  </div>
                   
                       
                    <div class="w3-button w3-padding-small w3-white w3-border w3-border-white w3-round-large">
                     <a class="like${counselingReplyList.wrtbtNo }dislike" onclick="likeupdate(${counselingReplyList.wrtbtNo },'dislike')" value="dislike">  Down <span class="w3-badge w3-white">${counselingReplyList.ncmdCo }</span></a>
                    </div>



                    <div class="dropup option">
                        <button class="w3-button w3-padding w3-padding w3-round-large" type="button" data-toggle="dropdown">
                            <i class="glyphicon glyphicon-option-horizontal"></i>
                        </button>
                        <ul class="dropdown-menu">
                            <li><a href="#">신고하기</a></li>
                        </ul>
                    </div>
                </div>
                <br>
            </div>

  			</c:if>
  			
  			<c:if test="${status.index != 0 }"	>
  			
            <div class="w3-card-4 w3-margin w3-topbar w3-border-lightgray">
                <!--//// 답변자 정보 //// -->
                <div class="w3-container">
                    <br>
                    <img src="http://placehold.it/40x40" alt="Avatar" class="w3-left w3-circle w3-margin-right" style="width:4em; height: 4em;">
                    
                    
                    <c:if test="${counselingReplyList.writrInfoOpngYn =='Y' }"	>
                	<p><span class="w3-large w3-margin-right">${counselingReplyList.nknm}</span>
                 	 <span class="w3-medium w3-opacity">컴퓨터공학과</span>
                 	  </p>
                	</c:if>
                
                
               		 <c:if test="${counselingReplyList.writrInfoOpngYn =='N' }"	>
                      <p><span class="w3-large w3-margin-right">비공개</span></p>
               		 </c:if>
               		 
               		 
                    <h6>
                        <span class="w3-small w3-opacity">${counselingReplyList.avlblBeginDt}에 답변</span></h6>
                </div>

                <br>

                <div class="w3-container">
                    <p>${counselingReplyList.wrtbtText} </p>
                </div>
                
                

                <div class="w3-container">
                    <div class="w3-button w3-padding-small w3-white w3-border w3-border-white w3-round-large">
                  <a class="like${counselingReplyList.wrtbtNo }like" onclick="likeupdate(${counselingReplyList.wrtbtNo },'like')" value="like">  Up <span class="w3-badge w3-white">${counselingReplyList.rcmdCo }</span></a>
                  </div>
                   
                       
                    <div class="w3-button w3-padding-small w3-white w3-border w3-border-white w3-round-large">
                     <a class="like${counselingReplyList.wrtbtNo }dislike" onclick="likeupdate(${counselingReplyList.wrtbtNo },'dislike')" value="dislike">  Down <span class="w3-badge w3-white">${counselingReplyList.ncmdCo }</span></a>
                    </div>
                    <div class="dropup option">
                        <button class="w3-button w3-padding w3-padding w3-round-large" type="button" data-toggle="dropdown">
                            <i class="glyphicon glyphicon-option-horizontal"></i>
                        </button>
                        <ul class="dropdown-menu">
                            <li><a href="#">신고하기</a></li>
                        </ul>
                    </div>
                </div>
                <br>
            </div>

			</c:if>	
		
			</c:forEach>
			
			
			
			 
			
			
			
			
			
     
        </div>

        <!--///////// 유사한 질문 /////////-->
        <div class="col-lg-4">
            <div class="w3-card-2 w3-margin">
                <div class="w3-container">
                <h5>Related Questions</h5>
                    <div class="interest">#유학 #외국 #컴퓨터
                    </div>
                </div>
                <br>
                <ul class="w3-ul">
                    <li><a href="">What are things about 5-star hotels that they do not want you to know?</a> </li>
                    <li><a href="">전문대 석사</a> </li>
                    <li><a href="">전문대 졸업을햇는데 학사학위 안따고 그냥 바로 석사 따도대나오??</a> </li>
                    <li><a href="">전문대 졸업을햇는데 학사학위 안따고 그냥 바로 석사 따도대나오??</a> </li>
                    <li><a href="">수능 접수하는 기간에 따라 학교배정 받는 것도 달라지나요?</a> </li>
                    <li><a href="">의대생 생활 (의대생 분들만 답변해 주셨으면 좋겠습니다) </a> </li>
                    <li><a href="">한국장학재단 농어촌융자금 등록금 납부</a> </li>

                </ul>

                <br>
            </div>
        </div>
    </div>
</div>

<!--//////////////////////// footer ////////////////////////////-->
<footer>
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