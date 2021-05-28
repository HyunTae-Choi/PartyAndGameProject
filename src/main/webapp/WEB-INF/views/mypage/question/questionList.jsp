<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page trimDirectiveWhitespaces="true" %>

<div id="question_table_div">
	<table>
		<caption>문의 내역 조회</caption>
		<tr>
			<th width="100px;">문의번호</th>
			<th width="524px;">제목</th>
			<th width="70px;">작성자</th>
			<th width="170px;">등록일</th>
			<th width="100px;">답변여부</th>
		</tr>
		<c:choose>
			<c:when test="${not empty questionList}" >
				<c:forEach var="question" items="${questionList}" varStatus="status"><tr>
						<td>${question.q_No}</td>
						<td class="question_title" style="text-align: left;"><a href="${contextPath}/mypage/question/view?question_no=${question.q_No}">${question.q_Title}</a></td>
						<td>${question.m_Name}</td>
						<td><fmt:formatDate value="${question.q_Date}"/></td>
						<td>${question.q_Reply_Check}</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="5">등록된 문의글이 존재하지 않습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</table>
	<a href="/mypage/question/write"><button id="write_btn">글쓰기</button></a>
	<button id="next_btn">다음</button>
	<button id="prev_btn">이전</button>
</div>
		

