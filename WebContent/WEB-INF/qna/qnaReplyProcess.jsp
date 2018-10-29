<%@page import="com.iu.qna.QnaDTO"%>
<%@page import="com.iu.qna.QnaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="qnaDTO" class="com.iu.qna.QnaDTO"></jsp:useBean>
    <jsp:setProperty property="*" name="qnaDTO"/>
    <%
    	//num, title, writer, contents
    	
    	//부모글 조회
    	QnaDAO qnaDAO = new QnaDAO();
    	QnaDTO parent = qnaDAO.selectOne(qnaDTO.getNum());
    	//stepUpdate
    	int result = qnaDAO.stepUpdate(parent);
    	//reply
    	qnaDTO.setRef(parent.getRef());
    	qnaDTO.setStep(parent.getStep()+1);
    	qnaDTO.setDepth(parent.getDepth()+1);
    	result = qnaDAO.reply(qnaDTO);
    	
    	
    %>
    <%if(result>0){
    	response.sendRedirect("./qnaList.jsp");
    }else{
    	request.setAttribute("message", "Reply Fail");
    	request.setAttribute("path", "./qnaList.jsp");
    	
    	RequestDispatcher view = request.getRequestDispatcher("../common/result.jsp");
    	view.forward(request, response);
    } %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>