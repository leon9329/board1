<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="color.jsp"%>

<html>
<head>
	<title>게시판</title>
	<link href="style.css" rel="stylesheet" type="text/css">
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="check.js"></script>
</head>   

<%
	int ref=Integer.parseInt(request.getParameter("ref"));
	int re_step=Integer.parseInt(request.getParameter("re_step"));
	int re_level=Integer.parseInt(request.getParameter("re_level"));
	int num=Integer.parseInt(request.getParameter("num"));


%>

<body bgcolor="<%=bodyback_c%>">  
<center><b>댓글쓰기</b>
<br>
<form method="post" name="writeform" action="replyPro.jsp">

<table width="430" border="1" cellspacing="0" cellpadding="0"  bgcolor="<%=bodyback_c%>" align="center">
<input type="hidden" name=ref value="<%=ref%>">
<input type="hidden" name=re_step value="<%=re_step%>">
<input type="hidden" name=re_level value="<%=re_level%>">
<input type="hidden" name=num value="<%=num%>">

   <tr>
    <td  width="100"  bgcolor="<%=value_c%>" align="center">이 름</td>
    <td  width="330">
       <input type="text" size="10" maxlength="10" id="writer" name="writer" autofocus></td>
  </tr>
  <tr>
    <td  width="100"  bgcolor="<%=value_c%>" align="center" >제 목</td>
    <td  width="330">    
       <%if(request.getParameter("num")==null){%> <!--  원문 -->
       <input type="text" size="40" maxlength="50" id="subject" name="subject" ></td>
	<%}else{%>									<!-- 답글 -->
	   <input type="text" size="40" maxlength="50" id="subject" name="subject" value="[답변]"></td>
	<%}%>	
  </tr>
  <tr>
    <td  width="100"  bgcolor="<%=value_c%>" align="center">Email</td>
    <td  width="330">
       <input type="text" size="40" maxlength="30" id="email" name="email" ></td>
  </tr>
  <tr>
    <td  width="100"  bgcolor="<%=value_c%>" align="center" >내 용</td>
    <td  width="330" >
     <textarea id="content" name="content" rows="13" cols="40"></textarea> </td>
  </tr>
  <tr>
    <td  width="100"  bgcolor="<%=value_c%>" align="center" >비밀번호</td>
    <td  width="330" >
     <input type="password" size="8" maxlength="12" id="passwd" name="passwd"> 
	 </td>
  </tr>
<tr>      
 <td colspan=2 bgcolor="<%=value_c%>" align="center"> 
  <input type="submit" value="댓글작성">  
  <input type="reset" value="다시작성">
  <input type="button" value="목록보기" OnClick="window.location='list.jsp'">
</td></tr></table>    
   
</form>      
</body>
</html>
