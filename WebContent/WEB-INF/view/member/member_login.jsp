<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="member_head.jsp"/>
<div id="container">
	<img src="../img/login.png" alt="" /><br />
	<mark style="color: red;">*ID는 숫자포함 8자 이내</mark><br />
<!-- 	//display: inline-block; -->
<form action="">
	<span id="login_id">ID</span>
	<input type="text" placeholder="ID" />
	<br />
	<span id="login_pass">PASSWORD</span>
	<input type="text" placeholder="PASSWORD" /><br />
	<button id="login-button_submit" onclick="window.location.href='member_detail.jsp'">login</button>
	<button id="login-button_cancle" onclick="window.location.href='../index.jsp'">cancel</button>
</form>	
</div>
<jsp:include page="../common/footer.jsp"/>