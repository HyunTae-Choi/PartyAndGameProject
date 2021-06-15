<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page trimDirectiveWhitespaces="true" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<div id="question_table_div">

	<table>
		<caption>문의 내역 조회</caption>
		<tr>
			<th width="100px;">문의번호</th>
			<th width="474px;">제목</th>
			<th width="150px;">작성자</th>
			<th width="170px;">등록일</th>
			<th width="100px;">답변여부</th>
		</tr>
			<c:choose>
				<c:when test="${not empty questionList}" >
					<c:forEach var="question" items="${questionList}">
						<tr>
							<td>${question.q_No}</td>
							<td class="question_title" style="text-align: left;"><a href="${contextPath}/admin/service/question/view?question_no=${question.q_No}">${question.q_Title}</a></td>
							<td>${question.memberVO.m_Name}<span style="padding-left: 5px; color: #626262">(${question.m_Id})</span></td>
							<td><fmt:formatDate value="${question.q_Date}" pattern="yyyy-MM-dd"/></td>
							
							<c:if test="${question.q_Reply_Check =='답변대기'}">
								<td style="color: red;">${question.q_Reply_Check}</td>
							</c:if>
							<c:if test="${question.q_Reply_Check =='답변완료'}">
								<td>${question.q_Reply_Check}</td>
							</c:if>			
							
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

	
	<div id="table_bottom" style="max-width: 100%; height: 50px; line-height: 50px; margin-top:5px;">
		
		<c:if test="${pvo.totalCnt != null }">		
			<div id="pagination-container" style="margin-left: 60px">			
				<ul id="pagination">
					<%-- 페이지 생성 반복문 section으로 반복문 범위 지정--%>
					<c:forEach var="pageNum" begin="${pvo.section*10-9}" end="${pvo.section*10}" step="1">
						
						<%-- section이 2 이상일 경우, pre표시 --%>
						<c:if test="${pvo.section >= 2 && pageNum == (pvo.section*10-9)}">
							<li><a href="${contextPath}/admin/service/question?page=${(pvo.section-1)*10}">&lt;</a></li>
						</c:if>
													
						<c:choose>
							<%-- page와 pageNum이 같은 경우, 페이지 번호를 강조하여 현재 페이지임을 표기 --%>			
							<c:when test="${pageNum == pvo.page}">
								<li id="active"><a href="${contextPath}/admin/service/question?page=${pageNum}">${pageNum}</a></li>				
							</c:when>
							
							<%-- 현재 페이지가(pageNum) maxPage 이하이면 페이지 번호 생성 --%>
							<c:when test="${pvo.maxPage >= pageNum }">
								<li><a href="${contextPath}/admin/service/question?page=${pageNum}">${pageNum}</a></li>										
							</c:when>					
						</c:choose>						
				
						<%-- next표시 --%>
						<c:if test="${pvo.maxSection > pvo.section && pageNum == pvo.section*10}">
							<li><a href="${contextPath}/admin/service/question?page=${pvo.section*10+1}">&gt;</a>
						</c:if>					
					</c:forEach>
				</ul>
			</div>	
		</c:if>
		
	</div>		
	
</div>
		

