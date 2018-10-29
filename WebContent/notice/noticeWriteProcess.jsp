

<%@page import="com.iu.file.FileDAO"%>
<%@page import="com.iu.file.FileDTO"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.iu.notice.NoticeDTO"%>
<%@page import="com.iu.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	String path=request.getServletContext().getRealPath("upload");
	System.out.println(path);
	int max = 1024*1024*10;
	MultipartRequest multi = new MultipartRequest(request, path, max, "UTF-8", new DefaultFileRenamePolicy());
	//path 경로에 파일 업로드 긑
	NoticeDTO nDto = new NoticeDTO();
	nDto.setTitle(multi.getParameter("title"));
	nDto.setContents(multi.getParameter("contents"));
	nDto.setWriter(multi.getParameter("writer"));
	
	//파일의 정보
	FileDTO f1 = new FileDTO();
	f1.setFname(multi.getFilesystemName("f1"));
	f1.setOname(multi.getOriginalFileName("f1"));
	
	FileDTO f2 = new FileDTO();
	f2.setFname(multi.getFilesystemName("f2"));
	f2.setOname(multi.getOriginalFileName("f2"));
	
	
		/* File f = multi.getFile("f1");
	Enumeration e = multi.getFileNames();//파라미터 */
		
	NoticeDAO noticeDAO = new NoticeDAO();
	int num = noticeDAO.getNum();
	nDto.setNum(num);
	int result = noticeDAO.insert(nDto);
	
	f1.setNum(num);
	f2.setNum(num);
	f1.setKind("N");
	f2.setKind("N");
	
	FileDAO fileDAO = new FileDAO();
	fileDAO.insert(f1);
	fileDAO.insert(f2);
	
	
	
	String s= "Fail";
	
	if(result>0){
		s = "Success";
	}
	request.setAttribute("message", s);
	request.setAttribute("path", "./noticeList.jsp");
	
	RequestDispatcher view = request.getRequestDispatcher("../common/result.jsp");
	view.forward(request, response); 
	
	
	//redirect
	//response.sendRedirect("../index.jsp");
	
	
%>    
    
<!DOCTYPE html>
<html lang="en">
<head>
  <!-- Theme Made By www.w3schools.com - No Copyright -->
  <title>Bootstrap Theme Company Page</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
</head>

</body>
</html>