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
		alert("�����Ǿ����ϴ�.");
		location.href="list.jsp";
	
	</script>
<% 	}else{%>
	<script>
		alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
		history.go(-1);
	</script>
		
<%	}%>


