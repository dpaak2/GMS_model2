<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>학생 관리</title>
<link rel="stylesheet" href="${css}/common.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
<div id="wrapper">
<header>
<a href="../index.jsp"><img src="${img}/homebutton.jpg" alt="" /></a>
<h1 id="title">학생관리</h1>
<a id="go_main" href="../index.jsp">메인으로 가기</a><br />
<a id="go_main" href="${ctx}/WEB-INF/view/common/main.jsp">메인으로 이동</a><br />
<hr />
</header>
<div id="container">
	<img src="${img}/login.png" alt="" /><br />
	<mark style="color: red;">*ID는 숫자포함 8자 이내</mark><br />
<form id="login_box" method="get">
	<span id="login_id">ID</span>
	<input type="text" placeholder="ID"  id="input_id" name="input_id"/>
	<br />
	<span id="login_pass">PASSWORD</span>
	<input type="text" id="input_pass" placeholder="PASSWORD" name="input_pass" /><br />
	<input type="submit" value="LOGIN" onclick="loginAlert()" />
	<input type="hidden" name="action" value="login" />
	<input type="hidden" name="page" value="main" />
</form>	
	<input type="reset" value="CANCEL" />
</div>
<footer >
		<div>
			<p>Posted by: hayun kim</p>
			<p>Contact information: <a href="mailto:someone@example.com">
			someone@hanbit.com</a>.</p>
			</div>
		</footer>
	</div>
	<script>
	
	function loginAlert(){
		  var input_id =document.getElementById('input_id').value;
		  var input_pass =document.getElementById('input_pass').value;
		 if(input_id===""){
			 alert('ID를 입력해 주세요 ');
			 return false;
		 }
		 if(input_pass===""){
			 alert('password 를 입력해 주세요 ');
			 return false;
		 }
		 var form= document.getElementById('login_box');
		 form.action="${ctx}/common.do";
		 form.method="post";
		 return true;
	}
	</script>
</body>
</html>