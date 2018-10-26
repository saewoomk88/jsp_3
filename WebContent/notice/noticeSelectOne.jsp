<%@page import="java.util.List"%>
<%@page import="com.iu.file.FileDAO"%>
<%@page import="com.iu.file.FileDTO"%>
<%@page import="com.iu.board.BoardDTO"%>
<%@page import="com.iu.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	request.setCharacterEncoding("UTF-8");
    	response.setCharacterEncoding("UTF-8");
    int num = Integer.parseInt(request.getParameter("num"));
    NoticeDAO noticeDAO = new NoticeDAO();
    BoardDTO boardDTO=noticeDAO.selectOne(num);
    FileDAO fileDAO = new FileDAO();
    FileDTO fileDTO = new FileDTO();
    fileDTO.setNum(num);
    fileDTO.setKind("N");
    List<FileDTO> ar = fileDAO.selectList(fileDTO);
    
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
	<div class="row"></div>
	<h1>Title : <%=boardDTO.getTitle() %></h1>
	<h1>Writer : <%=boardDTO.getWriter() %></h1>
	<h1>Contents : <%=boardDTO.getContents() %></h1>
	<% for(FileDTO file : ar){ %>
	
	<h3><a href="../upload/<%=file.getFname()%>"><%=file.getOname() %></a></h3>
	<%} %>
</div>

<div class="container-fluid">
	<a href="./noticeList.jsp" class="btn btn-info">List</a>
	<a href="./noticeUpdate.jsp" class="btn btn-info">Update</a>
	<a href="./noticeDelete.jsp"class="btn btn-info">Delete</a>
</div>


<jsp:include page="../temp/footer.jsp"></jsp:include>
</body>
</html>