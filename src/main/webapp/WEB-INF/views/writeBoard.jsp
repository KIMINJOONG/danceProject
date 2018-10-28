<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/core-js/2.4.1/core.js"></script>
<script src="resources/dist/sweetalert2.all.min.js"></script>

<link rel="stylesheet" href="resources/bootstrap-3.3.2-dist/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="resources/dist/sweetalert2.css">
<link rel="stylesheet" href="resources/bootstrap-3.3.2-dist/bootstrap/css/bootstrap-theme.min.css">


<script src="resources/bootstrap-3.3.2-dist/bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="resources/css/mainCss.css">
<script type="text/javascript">

jQuery(document).ready(function() {
	
	jQuery("#write_ajax").click(function() {
		var boardVo = {
				boardSeq : document.getElementById("boardSeq").value
			  , subject : document.getElementById("subject").value
			  , contents : document.getElementById("contents").value
		}
		jQuery.ajax({
			 type: "POST"
		   , url : "write.do"
		   , data : boardVo
		   , success : function(data) {
			   console.log(data);
			   var okMessage = data.okMessage;
			   swal(okMessage,' ','success');
		   }
		   , error : function(error) {
			   alert(error);
		   }
		});	
	});
	
});

</script>
<style>
    ul, li {
        list-style: none;
    }
    div {
        display: inline-block;
    }
</style>
<body>
   <div id="board">
       <div>
           <ul>
               <li>
                   <label for="subject">
                       	제목
                   </label>
                   <div>
                       <input type="text" style="width: 478px; height: 27px; " id="subject" name="subject"/>
                       <input type="hidden" id="boardSeq" value="-1" />
                   </div>
                   
               </li>
               <li>
                   	내용
               </li>
               <li>
                   <div>
                       <textarea style="width: 708px; height: 400px;" id="contents" name="contents"></textarea>
                   </div>
               </li>
           </ul>
           <ul>
               <li style="text-align: right">
                   <div>
                       <a id="write_ajax">등록</a>
                   </div>
                   <div>
                       <button>취소</button>
                   </div>
               </li>
           </ul>
       </div>
   </div>
</body>
</html>