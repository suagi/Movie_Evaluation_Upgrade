<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="view" value="${param.rp }"/>
<c:choose>
	<c:when test="${view eq null || view eq '' }">
		<c:set var="jsp" value="common/20_main.jsp"/>
	</c:when>
		<c:when test="${view eq 'logout' }">
		<c:set var="jsp" value="user/logoutAction.jsp"/>
	</c:when>
	<c:when test="${view eq 'movie' }">
		<c:set var="jsp" value="movie/movie.jsp"/>
	</c:when>
</c:choose>
<jsp:include page="views/common/10_header.jsp"></jsp:include>
<jsp:include page="views/${jsp }"></jsp:include>
<jsp:include page="views/common/90_footer.jsp"></jsp:include>
