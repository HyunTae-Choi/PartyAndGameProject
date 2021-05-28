<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ page trimDirectiveWhitespaces="true" %>

<div id="info_div">
	<div id="info_div_1">
		<p><span style="font-weight: 700;" id="login_m_id">${loginSession.m_Name}</span> 님 안녕하세요.</p>
		<span>누적 결제금액 : 0원</span>
	</div>
	<div id="info_div_2">
		<p>포인트</p>
		<span>&nbsp1000포인트</span>
	</div>
	<div id="info_div_2">
		<p>쿠폰</p>
		<span>&nbsp0장</span>
	</div>
</div>

		

