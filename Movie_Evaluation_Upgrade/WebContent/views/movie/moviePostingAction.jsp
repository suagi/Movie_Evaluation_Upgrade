<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="content.MovieDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="movie" class="content.MovieVO" scope="page" />
<jsp:setProperty name="movie" property="movieThumbnail" />
<jsp:setProperty name="movie" property="movieTitle" />
<jsp:setProperty name="movie" property="movieLength" />
<jsp:setProperty name="movie" property="moviePremiere" />
<jsp:setProperty name="movie" property="movieDirector" />
<jsp:setProperty name="movie" property="movieActor" />
<jsp:setProperty name="movie" property="movieContent" />
<jsp:setProperty name="movie" property="movieShow" />
<%
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	if (userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 해주세요.')");
		script.println("location.href = 'index.jsp'");
		script.println("</script>");
	} else {
		if (movie.getMovieTitle() == null || movie.getMovieContent() == null  
			|| movie.getMovieActor() == null || movie.getMovieDirector() == null || movie.getMovieLength() == null
			|| movie.getMoviePremiere() == null || movie.getMovieShow() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('공란이 존재합니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			MovieDAO movieDAO = new MovieDAO();
			int result = movieDAO.posting(movie.getMovieThumbnail(), movie.getMovieTitle(), movie.getMovieLength(), 
				movie.getMoviePremiere(), movie.getMovieDirector(), movie.getMovieActor(), movie.getMovieContent(),
				userID, movie.getMovieShow());
		if (result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('작성에 실패했습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = '../../index.jsp?rp=movie'");
			script.println("</script>");
		}
	}
}
%>