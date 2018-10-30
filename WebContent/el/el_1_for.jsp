<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	request.setAttribute("start", 1);
	request.setAttribute("end", 5);
	
	ArrayList<Integer>ar = new ArrayList<>();
	ar.add(100);
	ar.add(200);
	ar.add(300);
	request.setAttribute("ar", ar);
	
	
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<c:forEach begin="1" end="10" var="i" >
		<h1>${i}</h1>
	</c:forEach>
	
	<c:forEach begin="${start }" end="${end }" var="c" step="2" >
		<h1>${c}</h1>
	</c:forEach>
	<hr>
	<%-- <c:forEach begin="${end }" end="${start }" var="c" step="1" >
		<h1>${c}</h1>
	</c:forEach> --%>
	
	<% for(int i=0;i<ar.size();i++){} %>
	<% for(Integer num : ar){} %>
	<c:forEach items="${ar}" var="i" varStatus="v">
		<h3>${i}</h3>
		<h3>${v.count}</h3>
		<h3>${v.index}</h3>
		<h3>${v.first}</h3>
		<h3>${v.last}</h3>
		<h3>${v.begin}</h3>
		<h3>${v.end}</h3>
		<h3>${v.step}</h3>
	</c:forEach>
	
	<!-- count : 1부터 순서
		index ; 0부터 순서
		first : 첫번째인지 여부 (true, false)
		last : 마지막인지 여부 (true, false)
		begin : 시작번호를 출력
		end : 마지막번호 출력
		step : 증가값
		 -->
</body>
</html>