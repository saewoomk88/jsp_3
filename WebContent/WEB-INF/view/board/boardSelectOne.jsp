<%@page import="java.util.List"%>
<%@page import="com.iu.file.FileDAO"%>
<%@page import="com.iu.file.FileDTO"%>
<%@page import="com.iu.board.BoardDTO"%>
<%@page import="com.iu.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../../../temp/bootstrap.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../../../temp/header.jsp"></jsp:include>
<div class="container-fluid">
	<div class="row"></div>
	<h1>${requestScope.board}View</h1>
	<h1>Title : ${dto.title}</h1>
	<h1>Writer : ${requestScope.dto.writer}</h1>
	<h1>Contents : ${requestScope.dto.contents}</h1>
	
	
	<h3><a href="../upload/<%=file.getFname()%>"><%=file.getOname() %></a></h3>
	<%}%>
</div>

<div class="container-fluid">
	<a href="./${requestScope.board}List.do" class="btn btn-info">List</a>
	<a href="./${requestScope.board}Update.do?num=${dto.num}" class="btn btn-info">Update</a>
	<a href="./${requestScope.board}Delete.do?num=${dto.num}"class="btn btn-info">Delete</a>
</div>


<jsp:include page="../../../temp/footer.jsp"></jsp:include>
</body>
</html>