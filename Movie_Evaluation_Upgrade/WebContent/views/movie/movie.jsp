<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="content.MovieDAO"%>
<%@ page import="content.MovieVO"%>
<%@ page import="java.util.ArrayList"%>
<%
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	int pageNumber = 1;
	if (request.getParameter("pageNumber") != null) {
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}
	if (userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 해주세요.')");
		script.println("location.href = 'index.jsp'");
		script.println("</script>");
	}
%>
<header class="masthead" style="background-image: url('img/home-bg.jpg')">
<div class="overlay"></div>
    <div class="container">
   		<div class="row">
    		<div class="col-lg-8 col-md-10 mx-auto">
    		<div class="site-heading">
    			<h1>JSP Portfolio</h1>
    			<span class="subheading">Movie Evaluation</span>
    		</div>
    		</div>
    	</div>
	</div>
</header>
  <section class="featured spad">
        <div class="container">
		<form method="get" action="./index.jsp" class="form-inline mt-3">
			<select name="lectureDivide" class="form-control mx-1 mt-2">
				<option value="All">All</option>
				<option value="Title">Title</option>
				<option value="Director">Director</option>
			</select> <input type="text" name="search" class="form-control mx-1 mt-2">
			<button type="submit" class="btn btn-secondary mx-1 mt-2">Search</button>
			<c:choose>
				<c:when test="${userID eq 'KING' }">
					<a class="btn btn-secondary ml-auto mx-1 mt-2"
						href="views/movie/moviePosting.jsp">Posting</a>
				</c:when>
			</c:choose>
		</form>
		<hr>
            <div class="row">
                <div class="col-lg-12">
                    <div class="post-title">
                        <h2>All Movie</h2>
                    </div>
                </div>
            </div>
		<div class="row featured__filter">
			<%
				/* CommentDAO commentDAO = new CommentDAO();
				int commentCnt = 0; */
				MovieDAO movieDAO = new MovieDAO();
				ArrayList<MovieVO> list = movieDAO.getList(pageNumber);
				for (int i = 0; i < list.size(); i++) {
			%>
			<div class="col-lg-3 col-md-4 col-sm-6 mix vegetables fastfood">
				<div class="featured__item">
					<div class="featured__item__pic set-bg"
						data-setbg="img/featured/feature-2.jpg">
						<ul class="featured__item__pic__hover">
						</ul>
					</div>
					<div class="featured__item__text">
						<h6>
							<a href="index.jsp?rp=detail?movieID=<%= list.get(i).getMovieID() %>"><%= list.get(i).getMovieTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("/n", "<br>") %></a>
						</h6>
					</div>
				</div>
			</div>
			<%
				}
			%>
		</div>
		<hr>
    		<%
				if (pageNumber != 1) {
			%>
				<a href = "movie.jsp?pageNumber=<%=pageNumber - 1 %>" class="btn btn-secondary btn-arrow-left">next</a>
			<% 
				} if (movieDAO.nextPage(pageNumber + 1)) {
			%>
				<a href = "movie.jsp?pageNumber=<%=pageNumber + 1 %>" class="btn btn-secondary btn-arrow-left">prev</a>
			<%
				}
			%>
	</div>
    </section>