<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="color.jsp"%>

<%
	int num = Integer.parseInt(request.getParameter("num"));
%>

<html>
<head>
	<title>글 삭제</title>
	<link href="style.css" rel="stylesheet" type="text/css">
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="check.js"></script>
</head>   

<body bgcolor="<%=bodyback_c%>">  
<center><b>글삭제</b>
<br>
<form method="post" name="deleteform" action="deletePro.jsp">
 <input type="hidden" name="num" value="<%=num %>">

<table width="200" border="1" cellspacing="0" cellpadding="0"  bgcolor="<%=bodyback_c%>" align="center">
  <tr>
    <td  width="100"  bgcolor="<%=value_c%>" align="center" >비밀번호</td>
    <td  width="330" >
     <input type="password" size="12" maxlength="12" id="passwd" name="passwd"> 
	 </td>
  </tr>
<tr>      
 <td colspan=2 bgcolor="<%=value_c%>" align="center"> 
  <input type="submit" value="글삭제" >  
  <input type="button" value="목록" OnClick="window.location='list.jsp'">
</td></tr></table>   
 
   
</form>  
</center>    
</body>
</html>
