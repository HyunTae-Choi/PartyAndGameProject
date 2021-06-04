<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page trimDirectiveWhitespaces="true" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<div class="member_table_div">
	<%-- memberList Table--%>
	<div class="membet_table_top">
		<span style="margin-right: 10px;">회원 수: ${pvo.totalCnt}명</span>
		<select onchange="memberTableChange(this)" id="memberListDropDown">
			<option value="total">전체회원</option>
			<option value="enable">유효회원</option>
			<option value="disable">탈퇴/비활성 회원</option>
		</select>
	</div>
	<table class="memberListTable" >
		<caption>회원 리스트</caption>
			<tr>
				<th>회원<br>번호</th>
				<th>ID</th>
				<th>이름</th>
				<th>생년월일</th>
				<th>성별</th>
				<th>Email</th>
				<th>전화번호</th>
				<th>가입일</th>
				<th>예약<br>횟수</th>
				<th>회원<br>상태</th>
				<th>회원<br>비활성화<br>/복구</th>
			</tr>
			<c:choose>
				<c:when test="${not empty memberList}" >
					<c:forEach var="member" items="${memberList}" varStatus="status">	
						<tr>
							<td>${member.m_Number}</td>					
							<td>${member.m_Id}</td>
							<td>${member.m_Name}</td>
							<td>${member.m_Birth}</td>
							<td>${member.m_Gender}</td>
							<td>${member.m_Email}</td>
							<td>${member.m_Phone}</td>
							<td><fmt:formatDate value="${member.m_Date}" pattern="yy.MM.dd"/></td>
							<td>${member.reservedNum}</td>
							
							<c:if test="${member.m_Availabled == '1'}">
								<td>유효</td>
								<td><button onclick="memberDisable(${member.m_Number},'${member.m_Id}')" class="memberStatusChangeBtn" style="color: #980000;">비활성화</button></td>
							</c:if>
							
							<c:if test="${member.m_Availabled == '0'}">
								<td><span style="color:#CC3D3D;">탈퇴</span></td>
								<td><button onclick="memberEnable(${member.m_Number},'${member.m_Id}', '탈퇴')" class="memberStatusChangeBtn">복구</button></td>
							</c:if>
							
							<c:if test="${member.m_Availabled == '-1'}">
								<td><span style="color: #980000;">비활성</span></td>
								<td><button onclick="memberEnable(${member.m_Number},'${member.m_Id}', '비활성')" class="memberStatusChangeBtn">복구</button></td>
							</c:if>
													
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="11">등록된 회원이 존재하지 않습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
	</table>
	
	<div id="table_bottom" style="max-width: 100%; height: 50px; line-height: 50px; margin-top:5px;">
		
		<%-- 페이징--%>		
		<c:if test="${pvo.totalCnt != null }">			
			<div id="pagination-container">			
				<ul id="pagination">
					<%-- 페이지 생성 반복문 section으로 반복문 범위 지정--%>
					<c:forEach var="pageNum" begin="${pvo.section*10-9}" end="${pvo.section*10}" step="1">
						
						<%-- section이 2 이상일 경우, pre표시 --%>
						<c:if test="${pvo.section >= 2 && pageNum == (pvo.section*10-9)}">
							<li><a href="${contextPath}/${adminMemberTablePath}=${(pvo.section-1)*10}"><</a></li>
						</c:if>
													
						<c:choose>
							<%-- page와 pageNum이 같은 경우, 페이지 번호를 강조하여 현재 페이지임을 표기 --%>			
							<c:when test="${pageNum == pvo.page}">
								<li id="active"><a href="${contextPath}/${adminMemberTablePath}=${pageNum}">${pageNum}</a></li>				
							</c:when>
							
							<%-- 현재 페이지가(pageNum) maxPage 이하이면 페이지 번호 생성 --%>
							<c:when test="${pvo.maxPage >= pageNum }">
								<li><a href="${contextPath}/${adminMemberTablePath}=${pageNum}">${pageNum}</a></li>										
							</c:when>					
						</c:choose>						
				
						<%-- next표시 --%>
						<c:if test="${pvo.maxSection > pvo.section && pageNum == pvo.section*10}">
							<li><a href="${contextPath}/${adminMemberTablePath}=${pvo.section*10+1}">></a>
						</c:if>					
					</c:forEach>	
				</ul>
			</div>				
		</c:if>
	</div>
</div>	
<script>
$(function(){
	// dropboxSelect
	$("#memberListDropDown").val('${memberCategory}').prop("selected", true);
});

</script>

	




		

