<%@page import="com.iu.qna.QnaDTO"%>
<%@page import="com.iu.qna.QnaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../temp/bootstrap.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../temp/header.jsp"></jsp:include>
<!-- 작성자, 타이틀, 내용
	qnaWriteProcess.jsp -->
<div class="container-fluid">
  
  <form action="qnaWriteProcess.jsp" method="post">
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
    	<button type="submit" class="btn btn-default">Write</button>
  </form>
</div>


<jsp:include page="../temp/footer.jsp"></jsp:include>	

</body>
</html>