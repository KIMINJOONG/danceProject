<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/core-js/2.4.1/core.js"></script>
<script src="resources/dist/sweetalert2.all.min.js"></script>

<link rel="stylesheet" href="resources/bootstrap-3.3.2-dist/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="resources/dist/sweetalert2.css">
<link rel="stylesheet" href="resources/bootstrap-3.3.2-dist/bootstrap/css/bootstrap-theme.min.css">


<script src="resources/bootstrap-3.3.2-dist/bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="resources/css/mainCss.css">
<script>
var id = '<%= session.getAttribute("ID")%>';
var isLogin = 0;
var msg = "";
jQuery(document).ready(function() {
	jQuery("#login_ajax").click(function() {
		var memberVo = {
				  id : document.getElementById("loginId").value
				, pw : document.getElementById("loginPw").value
		};
		jQuery.ajax({
			  type: "POST"
			, url : "login.do"
			, data : memberVo
			, success : function(data){
				isLogin = data.isLogin;
				if(isLogin == 1) {
					swal('로그인 되었습니다.',' ','success');
					window.location.reload();
					
				} else {
					swal(
							  '아이디 혹은 비밀번호가 틀렸습니다.',
							  '다시확인해주세요',
							  'error'
						);
				}
			}
			, error: function(error){
				alert(error);
			}
		});
	});
	
	jQuery("#logOut").click(function() {
		jQuery.ajax({
			  type: "POST"
			, url : "logout.do"
			, success : function(data) {
				msg = data.msg;
				swal(msg,' ','success');
				window.location.reload();
			}
			, error: function(error) {
				alert(error);
			}
		})
	});
});

function idCheck(){
	var id = document.getElementById("joinFormId").value;
	alert("입력하신 id는 " + id + "입니다.");
}
/* function pwCheck() {
	var pw = document.getElementById("joinFormPw").value;
	var pw2 = document.getElementById("joinFormPw2").value;
	if (pw == pw2) {
	}
} */
function submitJoinForm() {
	document.getElementById("joinForm").submit();	
}
/* function login() {
	document.getElementById("loginForm").submit();
} */
</script>
</head>
<body>
    <!-- 회원가입모달시작 -->
<div class="modal fade" id="joinModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		<h4 class="modal-title"><b>회원가입</b></h4>
      </div>
      <form action="join.do" method="post" name="joinForm" id="joinForm">
      <div class="modal-body">
        <div class="container-fluid">
        	<div class="row">
				<div class="col-md-4 joinModal">
					<p>아이디</p>
				</div>
		        <div class="col-md-4">
		        	<input type="text" class="joinModalInput" name="id"/>
		        </div>
		        <div class="col-md-4" align="left">
		        	<button type="button" class="btn btn-default btn-sm" onclick="idCheck();">중복확인</button>
		        </div>
	    	</div>
	    	<div class="row" style="margin-top: 5px;">
		        <div class="col-md-4 joinModal">비밀번호</div>
		        <div class="col-md-7">
		        	<input type="password" class="joinModalInput" name="pw"/>
		        </div>
	    	</div>
	    	<div class="row" style="margin-top: 5px;">
		        <div class="col-md-4 joinModal">비밀번호 확인</div>
		        <div class="col-md-7">
		        	<input type="password" class="joinModalInput" id="joinFormPw2" onkeyup="pwCheck();"/>
		        </div>
	    	</div>
        	<div class="row" style="margin-top: 5px;">
		        <div class="col-md-4 joinModal">
		        	<p>이름</p>
		        </div>
		        <div class="col-md-7">
		        	<input type="text" class="joinModalInput" name="name"/>
		        </div>
	    	</div>
	    	<div class="row" style="margin-top: 5px;">
				<div class="col-md-4 joinModal">
					<p>유형</p>
				</div>
		        <div class="col-md-7">
		        	<input type="radio" name="division" value="1" id="dancer" /><label for="dancer">댄서</label>
		        	<input type="radio" style="margin-left: 3px;" name="division" id="client"/><label for="client">클라이언트</label>
		        </div>
	    	</div>
        </div>
      </div>
      </form>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
		<button type="button" class="btn btn-primary" onclick="submitJoinForm();">가입</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div>  

<!-- 회원가입 모달 끝 -->
	<!-- 로그인 모달 시작 -->
<div class="modal fade" id="loginModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title"><b>로그인</b></h4>
      </div>
      <form action="login.do" method="post" id="loginForm" name="loginForm">
      <div class="modal-body">
        <div class="container-fluid">
        	<div class="row">
		        <div class="col-md-4 loginModal">
		        	<p>아이디</p>
		        </div>
		        <div class="col-md-8">
		        	<input type="text" name="id" id="loginId"/>
		        </div>
	    	</div>
	    	<div class="row" style="margin-top: 5px;">
		        <div class="col-md-4 loginModal">
		        	<p>비밀번호</p>
		        </div>
		        <div class="col-md-8">
		        	<input type="password" name="pw" id="loginPw"/>
		        </div>
	    	</div>
        </div>
      </div>
      </form>
      <div class="modal-footer">
      	<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary" id="login_ajax">로그인</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div> 
<!-- 로그인 모달 끝 -->
    <div class="row" id="joinAndLogin">
    	<div class="col-md-offset-8 col-md-1">
    	<%if(session.getAttribute("ID") != null) { %>
    		<p><%=session.getAttribute("ID") %>님 환영합니다.</p><a id="logOut">로그아웃</a>
    	<%} else {%>
    		<a href="#loginModal" data-toggle="modal">로그인</a>
   		</div>
   		<div class="col-md-1">
			<a href= "#joinModal" data-toggle="modal">회원가입</a>
        </div>
    	<%} %>
    </div>
    <div class="row" id="topMenu">
    	<div class="col-md-offset-4 col-md-2">
    		<p><a href="gesi.do">댄스팀</a></p>
    	</div>
    	<div class="col-md-2">
    		<p>리쿠르팅</p>
    	</div>
    </div>