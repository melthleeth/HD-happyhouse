<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root"	value='${pageContext.request.contextPath}'/>

<div class="container" align="right">
	<div class="col-lg-6" align="right">
		${userinfo.username}  <a href="${root}/main.do?action=logout">로그아웃</a>
	</div>
</div>	
