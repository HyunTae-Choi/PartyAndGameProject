<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<div id="logo">
	<a href="/" class="logo">Party&amp;Game</a>
</div>
<div id="header_menu">
	<ul>
		<li><a href="${contextPath}/admin/manage/booking" id="manage_btn" class="menu_li">MANAGE</a></li>
		<li><a href="${contextPath}/admin/service/notice" id="service_btn" class="menu_li">SERVICE</a></li>
	</ul>
</div>
<div id="member">
	<ul>
		<c:choose>
			<c:when test="${loginSession.m_Id == 'admin'}">	
				<li><a href="${pageContext.request.contextPath}/login/logout"><button class="member_li" id="logout" >Logout</button></a></li>
				<li><a href="${pageContext.request.contextPath}/admin/manage/booking"><button class="member_li" id="go_adminPage">Admin</button></a></li>		
			</c:when>
		</c:choose>
	</ul>	
	
	<input type="hidden" value="${loginSession.m_Id}" id="m_id_session" >
</div>
