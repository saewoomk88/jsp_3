
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	String board = (String)request.getAttribute("board");
    %>
<!DOCTYPE html>
<html lang="en">
<head>
  <!-- Theme Made By www.w3schools.com - No Copyright -->
  <title>Bootstrap Theme Company Page</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <jsp:include page="../../../temp/bootstrap.jsp"></jsp:include>
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">

<jsp:include page="../../../temp/header.jsp"></jsp:include>

<div class="container">
  <h2>Vertical (basic) form</h2>
  <form action="<%=board %>Write.do" method="post" enctype="multipart/form-data">
   <div class="form-group">
      <label for="title">Title:</label>
      <input type="text" multiple class="form-control" id="title" placeholder="Enter title" name="title">
    </div>
  	<div class="form-group">
      <label for="writer">Writer:</label>
      <input type="text" class="form-control" id="writer" placeholder="Enter writer" name="writer">
    </div>
 	<div class="form-group">
      <label for="contents">Contents:</label>
      <textarea rows="20" cols="" class="form-control" name="contents" ></textarea>
    </div>
    <div class="form-group">
      <label for="file">File:</label>
      <input type="file" class="form-control" id="file" name="f1">
    </div>
     <div class="form-group">
      <label for="file">File:</label>
      <input type="file" class="form-control" id="file" name="f2">
    </div>
    
    	<button type="submit" class="btn btn-default">Write</button>
  </form>
</div>


</body>
</html>
