<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ page trimDirectiveWhitespaces="true" %>

<div id="info_div">
	<div id="info_div_1">
		<p><span style="font-weight: 700;" id="login_m_id">${loginSession.m_Name}</span> 님 안녕하세요.</p>
	</div>
	<div id="info_div_2">
		<p>마일리지</p>
		<span><fmt:formatNumber value="${mvo.m_Mileage}"  groupingUsed="true" />마일리지</span>
	</div>
</div>

		

