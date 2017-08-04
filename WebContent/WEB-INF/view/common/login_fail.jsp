<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../member/member_head.jsp" %>
<div id="container">
	<img src="<%=request.getContextPath()%>/resources/img/login.png" alt="" /><br />
	<mark style="color: red;">*ID는 숫자포함 8자 이내</mark><br />
	<mark style="color: red;">잘못된 비밀번호 입니다. 다시 로그인 해주세요 </mark><br />
<form id="login_box" action="<%=request.getContextPath()%>/common.do" method="get">
	<span id="login_id">ID</span>
	<input type="text" placeholder="ID" name="id"/>
	<br />
	<span id="login_pass">PASSWORD</span>
	<input type="text" placeholder="PASSWORD" name="pass" /><br />
	<input type="submit" value="LOGIN" />
	<input type="hidden" name="id" value="id" />
	<input type="hidden" name="pass" value="pass" />
	<input type="hidden" name="action" value="login" />
	<input type="hidden" name="page" value="main" />
</form>	
	<input type="reset" value="CANCEL" />
</div>
<%@ include file="../common/footer.jsp" %>