
<%@page import="com.iu.qna.QnaDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.iu.qna.QnaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    
   
	
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
            
  <h2>QNA LIST</h2>
  
  <div>
		<form class="form-inline" action="./qnaList.jsp">
	    <div class="form-group">
	    	<div class="form-group">
			  <label for="sel1">Select list:</label>
			  <select class="form-control" id="sel1" name="kind">
			    <option>ID</option>
			    <option>NAME</option>
			  </select>
			</div>
	      <input type="text" class="form-control" id="search" placeholder="Enter search" name="search">
	    </div>
	    <button type="submit" class="btn btn-default">Submit</button>
	  </form>
	</div>
	
  <table class="table table-hover">
    <thead>
      <tr>
    	<th>NUM</th>
        <th>SUBJECT</th>
        <th>ID</th>
        <th>DATE</th>
        <th>HIT</th>
      </tr>
    </thead>
    <tbody>
    
  <%for(QnaDTO qnaDTO:ar){ %>
      <tr class="active">
        <td><%=qnaDTO.getNum() %></td>
        <td><a href="./qnaSelectOne.jsp?num=<%=qnaDTO.getNum() %>">
        <%for(int i=0;i<qnaDTO.getDepth();i++){ %>
        --
        <%} %>
        <%=qnaDTO.getTitle() %></a></td>
        <td><%=qnaDTO.getWriter()%></td>
        <td><%=qnaDTO.getReg_date() %></td>
       	<td><%=qnaDTO.getHit() %></td>
      </tr>
      <%} %>
    </tbody>
  </table>
      
	</div>
</div>
 <div class="container">
   <div class="row">
	  <ul class="pagination">
	  	<li><a href="./qnaList.jsp?curPage=<%=1%>&kind=<%=kind%>&search=<%=search%>"><span class="glyphicon glyphicon-backward"></span></a></li>
	  <%if(curBlock>1){ %>
	  	<li><a href="./qnaList.jsp?curPage=<%=startNum-1%>&kind=<%=kind%>&search=<%=search%>"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
	   <%} %> 
	    <%for(int i=startNum;i<=lastNum;i++){ %>
	    	<li><a href="./qnaList.jsp?curPage=<%=i%>&kind=<%=kind%>&search=<%=search%>"><%=i %></a></li>
	    <%} %>
	    <%if(curBlock !=totalBlock){ %>
	    <li><a href="./qnaList.jsp?curPage=<%=lastNum+1%>&kind=<%=kind%>&search=<%=search%>"><span class="glyphicon glyphicon-chevron-right"></span></a></li>
	  	<%} %>
	  	<li><a href="./qnaList.jsp?curPage=<%=totalPage%>&kind=<%=kind%>&search=<%=search%>"><span class="glyphicon glyphicon-forward"></span></a></li>
	  </ul>
   </div>
   <%-- <%
   	MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
   %> --%>
   <div class="row">
 <%--   <%if(memberDTO !=null){ %>
   	<h3><%= memberDTO.getId() %>님 환영합니다.</h3> --%>
   	
 <%--   <%}else{ %> --%>
   	<a href="./qnaWriteForm.jsp" class="btn btn-default">Write</a>
   
   	<%-- <%} %> --%>
   </div>
                  
</div>
	
<jsp:include page="../../temp/footer.jsp"></jsp:include>	

</body>
</html>