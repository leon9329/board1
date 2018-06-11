<%@page import="board1.BoardDBBean"%>
<%@page import="board1.BoardDataBean"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%
	request.setCharacterEncoding("utf-8");
	String email=request.getParameter("email");
%>

<%-- <jsp:useBean id="board" class="board1.BoardDataBean"></jsp:useBean>
<jsp:setProperty property="*" name="board"/> --%>


email : <%=email %>
<%
	

	//ip는 property에 없으므로 따로 넣어준다.
	//board.setIp(request.getRemoteAddr());
	
	
	//BoardDBBean manager = BoardDBBean.getInstance();
	
	//데이터 삽입	
	//int result=manager.insert(board);
	
	
	//if(result==1){
%>
<%-- 	<script>
		alert("등록 완료");
		location.href="list.jsp";
	</script>
		
<%}else{%>
	<script>
		alert("등록 실패");
		history.go(-1);
	</script>
	
		
<%}%> --%>
