<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../../../temp/bootstrap.jsp"></c:import>
</head>
<body>
<c:import url="../../../temp/header.jsp"></c:import>

<div class="container-fluid">
   <form action="memberJoin.do" method="post" enctype="multipart/form-data">
   <div class="form-group">
      <label for="id">ID:</label>
      <input type="text" multiple class="form-control" id="id" placeholder="Enter id" name="id">
    </div>
  	<div class="form-group">
      <label for="pw">PW:</label>
      <input type="password" class="form-control" id="pw" placeholder="Enter pw">
    </div>
    <div class="form-group">
      <label for="pw">PW:</label>
      <input type="password" class="form-control" id="pw" placeholder="Enter pw" name="pw">
    </div>
 	<div class="form-group">
      <label for="name">NAME:</label>
      <input type="text" class="form-control" id="name" placeholder="Enter name" name="name">
    </div>
    <div class="form-group">
      <label for="name">Email:</label>
      <input type="email" class="form-control" id="email" placeholder="Enter name" name="email">
    </div>
    <div class="form-group">
      <label for="name">Kind:</label>
      <input type="text" class="form-control" id="kind" placeholder="Enter name" name="kind">
    </div>
    <div class="form-group">
      <label for="name">ClassMate:</label>
      <input type="text" class="form-control" id="kind" placeholder="Enter name" name="classmate">
    </div>
    
    <div class="form-group">
      <label for="file">File:</label>
      <input type="file" class="form-control" id="file" name="f1">
    </div>
     
    
    	<button type="submit" class="btn btn-default">submit</button>
  </form>
</div>

<c:import url="../../../temp/footer.jsp"></c:import>

</body>
</html>