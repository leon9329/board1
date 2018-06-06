<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<%@page import="board1.BoardDBBean"%>
<%@page import="board1.BoardDataBean"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	
<%request.setCharacterEncoding("utf-8"); %>

<%
	//한 화면에 출력할 데이터 갯수(기본변수 1)
	int page_size=10;

	String pageNum=request.getParameter("page");
	if(pageNum == null){
		pageNum = "1";
	}
	//현제 페이지 번호(기본변수 2)
	int currentPage=Integer.parseInt(pageNum);
	int startRow=(currentPage-1)*page_size+1;
	int endRow=currentPage*page_size;
	// startRow: 각 page데이터를 추출할 시작 번호 
		// endRow: 각 page데이터를 추출할 끝 번호 
		//  1page : startRow=1,  endRow=10;	
		//  2page : startRow=11, endRow=20;	
		//  3page : startRow=21, endRow=30;	

	
	//데이터 갯수(기본변수 3)
	int count=0;
	BoardDBBean manager=BoardDBBean.getInstance();
	count=manager.getCount();
	List<BoardDataBean> list=null;
	
	if(count>0){
		list=manager.getList(startRow,endRow);
	}

%>
<%
	if(count==0){
		out.println("저장된 글이 없습니다.");
	}else{
%>	

	

<%-- count:<%=count%><br>
list:<%=list %><br> --%>
<table border=1 align="center" width=700>
	<caption>목록</caption>
	<p align="center">
	<a href="writeForm.jsp">글쓰기</a>
	</p>
	<tr>
		<th>번호</th>
		<th>이름</th>
		<th>이메일</th>
		<th>제목</th>
		<th>조회수</th>
		<th>등록일</th>
		<th>ip</th>
	</tr>
	<%
		//각 페이지에 출력될 시작번호
		int number=count-(currentPage-1)*page_size;
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		
		for(int i=0; i<list.size(); i++){
			BoardDataBean board=list.get(i);
	
	%>
	<tr><td><%=number-- %></td>
		<td><%=board.getWriter() %></td>
		<td><%=board.getEmail() %></td>
		<td><%=board.getSubject() %></td>
		<td><%=board.getReadcount() %></td>
		<td><%=board.getReg_date() %></td>
		<td><%=board.getIp() %></td>
	</tr>
	<%}%>
</table>
<%} %>

<!-- 페이지 처리 -->
<center>
<%
	if(count>0){
		//pageCount:총 개수	
		int pageCount = (count/page_size)+((count%page_size)==0 ? 0 : 1);

		int startPage = ((currentPage-1)/10)*10+1;
		int endPage = startPage+10-1;
		
		//가장 마지막 블럭에는 endPage값을 pageCount로 설정
		if(endPage > pageCount){
			endPage=pageCount;
		}
%>	
<!-- 이전 블럭으로 이동 -->
<%
	if(startPage>10){
%>		
		<a href="list.jsp?page=<%=startPage-10 %>">[이전]</a>
<%	}%>
<%
	//페이지 링크
	for(int i=startPage; i<=endPage; i++){
		if(i == currentPage){
%>	
			[<%=i %>]

<% 		}else{%>
			
			<a href="list.jsp?page=<%=i%>">[<%=i%>]</a>
		
<% 		}		
	}	
%>
	<!-- 다음 블럭으로 이동	 -->

<% 	if(endPage < pageCount){%>		
	
	<a href="list.jsp?page=<%=startPage+10%>">[다음]</a>
	<%} %>
	

<%}%>
</center>
	

