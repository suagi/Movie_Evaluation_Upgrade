<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="comment.CommentDAO"%>
<%@ page import="comment.CommentVO"%>
<%@ page import="java.io.PrintWriter"%>
<% request.setCharacterEncoding("utf-8"); %>
<%
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	int movieID = 0;
	if (request.getParameter("movieID") != null) {
	movieID = Integer.parseInt(request.getParameter("movieID"));
	}
	int commentID = 0;
	if (request.getParameter("commentID") != null) {
		commentID = Integer.parseInt(request.getParameter("commentID"));
	}
	
	CommentDAO commentDAO = new CommentDAO();
	int result = commentDAO.delete(commentID);
	if (result == -1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('삭제에 실패했습니다.')");
		script.println("history.back()");
		script.println("</script>");
	} else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href='movieDetail.jsp?movieID="+movieID+"'");
		script.println("</script>");
}
%>