<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../common/common_head.jsp"/>
 <div id="container">
			  <form id="update_value" action="<%=request.getContextPath()%>/member/service_update.jsp" method="get">
				<table id="member_detail_tab">
					<tr>
						<td colspan="2" rowspan="3" ><img src="<%=request.getContextPath()%>/resources/img/default.jpg" id="member_img" alt="" /></td>
						<td class="member_detail_td">이름</td>
						<td class="member_detail_td"><input type="text" name="name" value=""/></td>
					</tr>
					<tr>
						<td class="member_detail_td">ID</td>
						<td class="member_detail_td"></td>
					</tr>
					<tr>
						<td class="member_detail_td">주민번호</td>
						<td class="member_detail_td"></td>
					</tr>
					<tr>
						<td>전화</td>
						<td colspan="3"></td>
					</tr>
					<tr>
						<td>Email</td>
						<td colspan="3"></td>
					</tr>
					<tr>
						<td>주소</td>
						<td colspan="3"></td>
					</tr>
					<tr>
						<td>major</td>
						<td colspan="3"></td>
					</tr>
					<tr>
						<td>subject</td>
						<td colspan="3"></td>
					</tr>
				</table>
				<input id="confirm_button"  type="submit" value="수정" />
				<input id="confirm_button"  type="button" onclick="javascript:cancel()" value="취소" />
				<input type="hidden" name="id" value="<%=request.getParameter("id")%>" />
				</form>
	   </div>
	<br /><br /><br /><br />
	
	<jsp:include page="../common/footer.jsp"/>
	