<%@page import="board1.BoardDataBean"%>
<%@page import="board1.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="board" class="board1.BoardDataBean"></jsp:useBean>
<jsp:setProperty property="*" name="board"/>

<%
	BoardDBBean manager=BoardDBBean.getInstance();
	BoardDataBean old=manager.getContent(board.getNum());
	
	if(board.getPasswd().equals(old.getPasswd())){
		manager.update(board);
%>
	<script>
		alert("수정되었습니다.");
		location.href="content.jsp?num=<%=board.getNum()%>";
	
	</script>	
<% 	}else{%>
	<script>
		alert("비밀번호가 일치하지 않습니다.");
		history.go(-1);
	</script>	
		
<%	}%>


