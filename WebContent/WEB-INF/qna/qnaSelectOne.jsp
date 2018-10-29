<%@page import="com.iu.qna.QnaDTO"%>
<%@page import="com.iu.qna.QnaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

    
    <%
    	int num = Integer.parseInt(request.getParameter("num"));
    	QnaDAO qnaDAO = new QnaDAO();
    	QnaDTO qnaDTO =qnaDAO.selectOne(num);
    	
    	
    %>
  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../temp/bootstrap.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../temp/header.jsp"></jsp:include>
	<div class="container-fluid">
		<div class="row">
			<table class="table table-hover">
				<tr>
					<td>Title</td><td><%=qnaDTO.getTitle() %></td>
				</tr>
				<tr>
					<td>Writer</td><td><%=qnaDTO.getTitle() %></td>
				</tr>
				<tr>
					<td>Contents</td><td><%=qnaDTO.getTitle() %></td>
				</tr>
			</table>
			
			<a href="./qnaList.jsp" class="btn btn-default">List</a>
			<a href="./qnaUpdate.jsp?num=<%=qnaDTO.getNum() %>" class="btn btn-default">Update</a>
			<a href="./qnaDelete.jsp?num=<%=qnaDTO.getNum() %>" class="btn btn-default">Delete</a>
			<a href="./qnaReplyForm.jsp?num=<%=qnaDTO.getNum() %>" class="btn btn-default">Reply</a>
		</div>
	</div>




<jsp:include page="../temp/footer.jsp"></jsp:include>	

</body>
</html>