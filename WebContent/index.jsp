<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<img src="${img}/loading.gif" alt="" />
<script>
   alert('로그인');
   location.href="${ctx}/common.do?action=move&page=index";
</script>