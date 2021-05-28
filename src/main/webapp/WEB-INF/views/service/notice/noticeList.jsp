<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ page trimDirectiveWhitespaces="true" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>


<div class="${changeAdminPage}notice_common_div">

<div id="notice_table_div">
	<table>
		<caption><a href="${contextPath}/notice">공지 사항</a></caption>
		<tr>
			<th width="10%">NO</th>
			<th width="65%">제목</th>
			<th width="15%">작성일</th>
			<th width="10%">조회</th>
		</tr>
		<c:choose>
			<c:when test="${not empty noticeList && empty changeAdminPage}" >
				<c:forEach var="notice" items="${noticeList}" varStatus="status"><tr>
						<td>${notice.n_No}</td>
						<td class="notice_title"><a href="${contextPath}/notice/view?notice_no=${notice.n_No}">${notice.n_Title}</a></td>
						<td><fmt:formatDate value="${notice.n_Date}"/></td>
						<td>${notice.n_Hit}</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:when test="${not empty noticeList && changeAdminPage eq 'admin_' }" >
				<c:forEach var="notice" items="${noticeList}" varStatus="status"><tr>
						<td>${notice.n_No}</td>
						<td class="notice_title"><a href="${contextPath}/admin/service/notice/view?notice_no=${notice.n_No}">${notice.n_Title}</a></td>
						<td><fmt:formatDate value="${notice.n_Date}"/></td>
						<td>${notice.n_Hit}</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="4">등록된 게시물이 존재하지 않습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>
		
	</table>
	</div>
	<div id="notice_table_bottom">
		<c:if test="${loginSession.m_Id == 'admin'}">
		<!-- admin으로 로그인할 경우에만 출력 -->
			<button class="common_btn" id="${changeAdminPage}notice_writeform">글쓰기</button>
		</c:if>
	</div>
	
	
	<div id="pagination-container">	
	<c:choose>
		<%-- 일반 공지사항 출력, admin_menu는 tiles를 선택하기 위한 parameter --%>
		<c:when test="${not empty noticeList && empty changeAdminPage}">
			<c:if test="${pvo.totalCnt != null }">
				<ul id="pagination">
					
					<%-- 페이지 생성 반복문 section으로 반복문 범위 지정--%>
					<c:forEach var="pageNum" begin="${pvo.section*10-9}" end="${pvo.section*10}" step="1">
						
						<%-- section이 2 이상일 경우, pre표시 --%>
						<c:if test="${pvo.section >= 2 && pageNum == (pvo.section*10-9)}">
							<li><a href="${contextPath}/notice?page=${(pvo.section-1)*10}"><</a></li>
						</c:if>
													
						<c:choose>
							<%-- page와 pageNum이 같은 경우, 페이지 번호를 강조하여 현재 페이지임을 표기 --%>			
							<c:when test="${pageNum == pvo.page}">
								<li id="active"><a href="${contextPath}/notice?page=${pageNum}">${pageNum}</a></li>				
							</c:when>
							
							<%-- 현재 페이지가(pageNum) maxPage 이하이면 페이지 번호 생성 --%>
							<c:when test="${pvo.maxPage >= pageNum }">
								<li><a href="${contextPath}/notice?page=${pageNum}">${pageNum}</a></li>										
							</c:when>					
						</c:choose>						
				
						<%-- next표시 --%>
						<c:if test="${pvo.maxSection > pvo.section && pageNum == pvo.section*10}">
							<li><a href="${contextPath}/notice?page=${pvo.section*10+1}">></a>
						</c:if>					
					</c:forEach>	
				</ul>				
			</c:if>
		</c:when>
		
		<%-- admin page에서의 공지사항 출력, admin_menu는 tiles를 선택하기 위한 parameter --%>
		<c:when test="${not empty noticeList  && changeAdminPage eq 'admin_' }">
			<c:if test="${pvo.totalCnt != null }">
				<ul id="pagination">
					
					<%-- 페이지 생성 반복문 section으로 반복문 범위 지정--%>
					<c:forEach var="pageNum" begin="${pvo.section*10-9}" end="${pvo.section*10}" step="1">
						
						<%-- section이 2 이상일 경우, pre표시 --%>
						<c:if test="${pvo.section >= 2 && pageNum == (pvo.section*10-9)}">
							<li><a href="${contextPath}/admin/service/notice?page=${(pvo.section-1)*10}"><</a></li>
						</c:if>
													
						<c:choose>
							<%-- page와 pageNum이 같은 경우, 페이지 번호를 강조하여 현재 페이지임을 표기 --%>			
							<c:when test="${pageNum == pvo.page}">
								<li id="active"><a href="${contextPath}/admin/service/notice?page=${pageNum}">${pageNum}</a></li>				
							</c:when>
							
							<%-- 현재 페이지가(pageNum) maxPage 이하이면 페이지 번호 생성 --%>
							<c:when test="${pvo.maxPage >= pageNum }">
								<li><a href="${contextPath}/admin/service/notice?page=${pageNum}">${pageNum}</a></li>										
							</c:when>					
						</c:choose>						
				
						<%-- next표시 --%>
						<c:if test="${pvo.maxSection > pvo.section && pageNum == pvo.section*10}">
							<li><a href="${contextPath}/admin/service/notice?page=${pvo.section*10+1}">></a>
						</c:if>					
					</c:forEach>	
				</ul>				
			</c:if>
		</c:when>		
	</c:choose>

	</div>
</div>	




		

