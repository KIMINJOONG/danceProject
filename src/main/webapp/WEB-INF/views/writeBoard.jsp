<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
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
                       <button onclick="insertBoard();">등록</button>
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