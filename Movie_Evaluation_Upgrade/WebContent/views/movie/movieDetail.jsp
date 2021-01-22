<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="content.MovieVO"%>
<%@ page import="content.MovieDAO"%>
<%@ page import="comment.CommentVO"%>
<%@ page import="comment.CommentDAO"%>
<%@ page import="java.util.ArrayList"%>
<%	
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	int movieID = 0;
	if (request.getParameter("movieID") != null) {
	movieID = Integer.parseInt(request.getParameter("movieID"));
	}
	if (movieID == 0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글입니다.')");
		script.println("location.href = 'movie.jsp'");
		script.println("</script>");
	}
	if (userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 해주세요.')");
		script.println("location.href = 'index.jsp'");
		script.println("</script>");
	}
	MovieVO movieVO = new MovieDAO().getMovieVO(movieID);
%>
<header class="masthead"
	style="background-image: url('thumbnail/<%=movieVO.getMovieThumbnail()%>')">
	<div class="overlay"></div>
	<div class="container">
		<div class="row">
			<div class="col-lg-8 col-md-10 mx-auto">
				<div class="site-heading">
					<h1><%=movieVO.getMovieTitle()%></h1>
				</div>
			</div>
		</div>
	</div>
</header>
<main class="main-content">
	<div class="container">
		<div class="page">
			<div class="content">
				<div class="row">
					<div class="col-md-6">
						<figure class="movie-poster">
							<div>
							<iframe width="100%" height="288" src="<%=movieVO.getMovieShow()%>"
							frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen>
							</iframe>
							</div>
						</figure>
					</div>
					<div class="col-md-6">
						<ul class="movie-meta">
							<li><strong>Rating:</strong> <%=movieVO.getMovieRating()%></li>
							<li><strong>Length:</strong> <%=movieVO.getMovieLength()%></li>
							<li><strong>Premiere:</strong> <%=movieVO.getMoviePremiere()%></li>
						</ul>
						<ul class="starring">
							<li><strong>Directors:</strong> <%=movieVO.getMovieDirector()%></li>
							<li><strong>Actors:</strong> <%=movieVO.getMovieActor()%></li>
						</ul>
						<div class="movie-summary">
							<p><%=movieVO.getMovieContent().replaceAll(" ", "&nbsp;")
							.replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("/n", "<br>")%></p>
						</div>
					</div>
				</div>
				<br>
				<hr>
				<br>
				<form method="post"
					action="commentAction.jsp?movieID=<%=movieID%>&userID =<%=userID%>">
					<div class="form-group">
						<label>Comment</label>
						<textarea name="movieComment" class="form-control"
							maxlength="2048" style="height: 80px;"></textarea>
					</div>
					<div class="form-row">
						<div class="form-group col-sm-2 ml-auto">
							<select name="commentRating" class="form-control">
								<option value="5" selected>★★★★★</option>
								<option value="4">★★★★</option>
								<option value="3">★★★</option>
								<option value="2">★★</option>
								<option value="1">★</option>
							</select>
						</div>
						<div class="form-group">
							&nbsp;
							<button type="submit" class="btn btn-secondary ml-auto">Write</button>
							&nbsp;
						</div>
					</div>
				</form>
				<%
				CommentDAO commentDAO = new CommentDAO();
				ArrayList<CommentVO> list = commentDAO.getList(movieID);
				if (list.size() > 0) {
					for (int i = 0; i < list.size(); i++) {
				%>
				<div class="card bg-light mt-3">
					<div class="card-body">
						<p class="card-text">
							<strong><%=list.get(i).getUserID()%></strong>
						</p>
						<p class="card-text"><%=list.get(i).getMovieComment().replaceAll(" ", "&nbsp;")
							.replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("/n", "<br>")%></p>
						<div class="row">
							<div class="col-9 text-left">
								<p class="post-meta">
									<small><%=list.get(i).getCommentDate().substring(0, 11) + " " 
											+ list.get(i).getCommentDate().substring(11, 13) + ":"
											+ list.get(i).getCommentDate().substring(14, 16)%>&nbsp;&nbsp;&nbsp;
											<span style="color: tomato;">
											<% 
											for (int j = 0; j < list.get(i).getCommentRating(); j++) {
											%>
												★
											<% 
												}
											%>
											</span>
									</small>
								</p>
							</div>
							<%
								if (userID.equals("KING") || list.get(i).getUserID().equals(userID)) {
							%>
							<div class="col-3 text-right">
								<a onclick="return confirm('삭제하시겠습니까?')"
									href="delComment.jsp?movieID=<%= list.get(i).getMovieID()%>&commentID=<%= list.get(i).getCommentID()%>"><small>삭제</small></a>
							</div>
							<% 
								}
							%>
						</div>
					</div>
				</div>
				<%
					}
				%>
				<%				
					}
				%>
			</div>
		</div>
	</div>
</main>