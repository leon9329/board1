<%@page import="board1.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%request.setCharacterEncoding("utf-8");%>

<jsp:useBean id="board" class="board1.BoardDataBean"></jsp:useBean>
<jsp:setProperty property="*" name="board"/>

<%
	
	board.setIp(request.getRemoteAddr());
	BoardDBBean manager=BoardDBBean.getInstance();
	int result=manager.reply(board);
	
	if(result==1){
%>	
	<script>
		alert("댓글작성 성공");
		location.href="list.jsp";
	</script>
	
<%	}else{%>
	<script>
		alert("댓글작성 실패")
		history.go(-1);
	</script>		
<%	}%>