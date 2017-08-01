<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.gms.web.util.Clock" %>
<!doctype html>
<html lang="ko">
<head>
	<meta charset="UTF-8" />
<title>BOARD DELETE</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/board.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
<div id="wrapper">
<a href="../index.jsp"><img src="../img/homebutton.jpg" alt="" /></a>
<h1 id="title">게시판</h1>
<%=new Clock().getNow() %>  <!--expression 전환  -->
<a id="go_main" href="../index.jsp">메인으로 가기</a><br />
<hr />
