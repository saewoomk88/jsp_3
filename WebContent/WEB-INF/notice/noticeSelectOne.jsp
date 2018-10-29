<%@page import="java.util.List"%>
<%@page import="com.iu.file.FileDAO"%>
<%@page import="com.iu.file.FileDTO"%>
<%@page import="com.iu.board.BoardDTO"%>
<%@page import="com.iu.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	BoardDTO boardDTO=(BoardDTO)request.getAttribute("dto");
    	List<FileDTO>ar = (List<FileDTO>)request.getAttribute("files");
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../../temp/bootstrap.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../../temp/header.jsp"></jsp:include>
<div class="container-fluid">
	<div class="row"></div>
	<h1>Title : <%=boardDTO.getTitle() %></h1>
	<h1>Writer : <%=boardDTO.getWriter() %></h1>
	<h1>Contents : <%=boardDTO.getContents() %></h1>
	<% for(FileDTO file : ar){ %>
	
	<h3><a href="../upload/<%=file.getFname()%>"><%=file.getOname() %></a></h3>
	<%} %>
</div>

<div class="container-fluid">
	<a href="./noticeList.do" class="btn btn-info">List</a>
	<a href="./noticeUpdate.do" class="btn btn-info">Update</a>
	<a href="./noticeDelete.do"class="btn btn-info">Delete</a>
</div>


<jsp:include page="../../temp/footer.jsp"></jsp:include>
</body>
</html>