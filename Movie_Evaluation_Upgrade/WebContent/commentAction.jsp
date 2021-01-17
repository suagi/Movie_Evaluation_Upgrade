<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="comment.CommentDAO" %>
<%@ page import="content.MovieVO" %>
<%@ page import="content.MovieDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="comment" class="comment.CommentVO" scope="page" />
<jsp:setProperty name="comment" property="movieComment" />
<jsp:setProperty name="comment" property="commentRating" />
<%
	int movieID = 0;
	String userID = null;
	if (request.getParameter("movieID") != null) {
		movieID = Integer.parseInt(request.getParameter("movieID"));
	}
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	if (userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 해주세요.')");
		script.println("location.href='movie.jsp'");
		script.println("</script>");
	} else { 
		if (comment.getMovieComment() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('코멘트를 작성해주세요.')");
			script.println("history.back()");
			script.println("</script>");
		} else if (comment.getCommentRating() == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('별점을 선택해주세요.')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			CommentDAO commentDAO = new CommentDAO();
			int result = commentDAO.comment(movieID, comment.getMovieComment(), userID, comment.getCommentRating());
			if (result == -1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('코멘트 작성에 실패했습니다.')");
				//script.println("history.back()");
				script.println("</script>");
			} else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href='movieDetail.jsp?movieID="+movieID+"'");
				script.println("</script>");
			}
		}
	}
%>