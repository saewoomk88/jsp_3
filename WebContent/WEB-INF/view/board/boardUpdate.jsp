
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
  
<!DOCTYPE html>
<html lang="en">
<head>
  <!-- Theme Made By www.w3schools.com - No Copyright -->
  <title>Bootstrap Theme Company Page</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <c:import url="../../../temp/bootstrap.jsp"></c:import>
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">

<c:import url="../../../temp/header.jsp"></c:import>

<div class="container">
<div class="row">
	<h1>${board}Update</h1>
</div>
  <h2>Vertical (basic) form</h2>
  <form action="${board}Update.do" method="post" enctype="multipart/form-data">
   <input type="hidden" name="num" value="${dto.num}">
   <div class="form-group">
   	
      <label for="title">Title:</label>
      <input type="text" multiple class="form-control" id="title" placeholder="Enter title" name="title" value="${dto.title}">
    </div>
  	<div class="form-group">
      <label for="writer">Writer:</label>
      <input type="text" class="form-control" id="writer" placeholder="Enter writer" name="writer" value="${dto.writer}" disabled="disabled">
    </div>
 	<div class="form-group">
      <label for="contents">Contents:</label>
      <textarea rows="20" cols="" class="form-control" name="contents" >${dto.contents}</textarea>
    </div>
    <c:forEach items="${files}" var="file">
    <div class="form-group">
      <label for="file">File:</label>
      <input type="file" value="${file.oname}" class="form-control" id="file" name="f1">
    </div>
    </c:forEach>
    
    
    	<button type="submit" class="btn btn-default">Write</button>
  </form>
</div>

<c:import url="../../../temp/footer.jsp"></c:import>

</body>
</html>
