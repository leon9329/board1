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
		alert("�����Ǿ����ϴ�.");
		location.href="content.jsp?num=<%=board.getNum()%>";
	
	</script>	
<% 	}else{%>
	<script>
		alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
		history.go(-1);
	</script>	
		
<%	}%>


