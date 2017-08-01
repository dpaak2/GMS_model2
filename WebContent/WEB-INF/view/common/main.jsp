<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../member/member_head.jsp" %>
		<div id="container">
		<table id="index-tab" >
			<tr id="index-tab-tr">
				<th><i class="glyphicon glyphicon-user"></i>학생관리</th>
				<th><i class="glyphicon glyphicon-cloud"></i>성적관리</th>
				<th><i class="glyphicon glyphicon-thumbs-up"></i>게시판</th>
			</tr>
			
			<tr>
				<td>
					<ul class="index-ul" class="gms-list-style-none">
						<li><a href="<%=request.getContextPath()%>/member.do?action=move&page=member_add">학생 추가</a></li>
						<li><a href="<%=request.getContextPath()%>/member.do?action=move&page=member_list">학생 목록</a></li>
						<li><a href="<%=request.getContextPath()%>/member.do?action=move&page=member_detail">학생 상세정보</a></li>
						<li><a href="<%=request.getContextPath()%>/member.do?action=move&page=member_update">학생 수정</a></li>
						<li><a href="<%=request.getContextPath()%>/member.do?action=move&page=member_delete">학생 삭제</a></li>
					</ul>
				</td>
				<td>
					 <ul class="index-ul" class="gms-list-style-none index-ul">
						<li><a href="<%=request.getContextPath()%>/grade/grade_add.jsp">성적 입력</a></li>
						<li><a href="<%=request.getContextPath()%>/grade/grade_list.jsp">성적 목록</a></li>
						<li><a href="<%=request.getContextPath()%>/grade/grade_update.jsp">성적 수정</a></li>
						<li><a href="<%=request.getContextPath()%>/grade/grade_delete.jsp">성적 삭제</a></li>
					 </ul>
				</td>
				<td>
					<ul class="index-ul"  class="gms-list-style-none">
					<li><a class="gms-text-deco-none" href="<%=request.getContextPath()%>/board/board_write.jsp">게시글 쓰기</a></li>
					<li><a class="gms-text-deco-none" href="<%=request.getContextPath()%>/board/board_list.jsp">게시글 목록</a></li>
					<li><a href="<%=request.getContextPath()%>/board/board_update.jsp">게시글 수정</a></li>
					<li><a href="<%=request.getContextPath()%>/board/board_delete.jsp">게시글 삭제</a></li>
					<li><a href="<%=request.getContextPath()%>/board/board_delete.jsp">게시글 삭제</a></li>
				</ul>
				</td>
			
			</tr>
		</table>
		</div>
		<hr />
	<%@ include file="footer.jsp"%>	
	
	
