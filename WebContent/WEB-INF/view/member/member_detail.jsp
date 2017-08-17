<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../common/common_head.jsp"/>
<div id="container">
		<table id="member_detail_tab">
			<tr>
				<td colspan="2" rowspan="3" ><img src="<%=request.getContextPath()%>/resources/img/default.jpg" id="member_img" alt="" /></td>
				<td class="member_detail_td">이름</td>
				<td class="member_detail_td"></td>
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
				<td>major</td>
				<td colspan="3"></td>
			</tr>
			<tr>
				<td>Registered date</td>
				<td colspan="3"></td>
			</tr>
		</table>
		<button id="list_button" onclick="javascript:goList()" >목록</button>
		<button id="update_button" onclick="javascript:goUpdate()">수정</button>
		
	   </div>
	
	<br /><br /><br /><br />
	
	<jsp:include page="../common/footer.jsp"/>