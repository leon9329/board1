<%@page import="board1.BoardDataBean"%>
<%@page import="board1.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	int num=Integer.parseInt(request.getParameter("num"));
	String passwd=request.getParameter("passwd");
	
	BoardDBBean manager=BoardDBBean.getInstance();
	BoardDataBean old=manager.getContent(num);
	
	if(old.getPasswd().equals(passwd)){
		manager.delete(num);

%>		
	<script>
		alert("삭제되었습니다.");
		location.href="list.jsp";
	
	</script>
<% 	}else{%>
	<script>
		alert("비밀번호가 일치하지 않습니다.");
		history.go(-1);
	</script>
		
<%	}%>


