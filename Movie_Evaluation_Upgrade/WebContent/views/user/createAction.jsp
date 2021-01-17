<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.UserVO" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<jsp:setProperty name="user" property="userNick" />
<jsp:setProperty name="user" property="userEmail" />
<%
	if (user.getUserID() == null || user.getUserPassword() == null
		|| user.getUserNick() == null || user.getUserEmail() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('공란이 존재합니다.')");
			script.println("history.back()");
			script.println("</script>");
	} else {
		UserDAO userDAO = new UserDAO();
		int result = userDAO.create(user);
		if (result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 존재하는 아이디입니다.')");
			script.println("history.back()");
			script.println("</script>");
			script.close();
		}
		else {
			session.setAttribute("userID", user.getUserID());
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = '../../index.jsp'");
			script.println("</script>");
			script.close();
		}
	}
%>