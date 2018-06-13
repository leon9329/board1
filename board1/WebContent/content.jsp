<%@page import="board1.BoardDataBean"%>
<%@page import="board1.BoardDBBean"%>
<%@ page contentType="text/html; charset=utf-8"%>


<%
	request.setCharacterEncoding("utf-8");
%>
<%
	String pageNum = request.getParameter("page");
	String num = request.getParameter("num");
	int contentNum = Integer.parseInt(num);

	BoardDBBean manager = BoardDBBean.getInstance();
	BoardDataBean board = manager.getContent(contentNum);
%>


<html>
<head>
<title>게시글</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="check.js"></script>
</head>

<body>
	<center>
		<b>글 보기</b> <br>
		<form method="post" name="writeform" action="writePro.jsp">

			<table width="430" border="1" cellspacing="0" cellpadding="0" align="center">
				<tr>
					<td>번호</td>
					<td><%=board.getNum()%></td>
					<td>등록일</td>
					<td><%=board.getReg_date()%></td>
				</tr>
				<tr>
					<td>작성자</td>
					<td><%=board.getWriter()%></td>
					<td>조회수</td>
					<td><%=board.getReadcount()%></td>
				</tr>
				<tr>
					<td>제목</td>
					<td colspan="3" align="center"><%=board.getSubject() %></td>
				</tr>
				<tr>
					<td>내용</td>
					<td colspan="3" align="center" height="100"><pre><%=board.getContent() %></pre></td>
				</tr>
				<!-- <tr>
					<td colspan=2 align="center"><input
						type="submit" value="글쓰기"> <input type="reset"
						value="다시작성"> <input type="button" value="목록보기"
						OnClick="window.location='list.jsp'"></td>
				</tr> -->

			</table>

		</form>
		</center>
</body>
</html>
