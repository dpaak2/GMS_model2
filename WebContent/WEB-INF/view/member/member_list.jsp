<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../common/common_head.jsp"/>
<div id="container">
<!--id, pw, ssn,name,regedate,email,major,subject-->
<table id="member_list_tab">
	<tr>
		<th style="width: 10%;">NO</th>
		<th style="width: 10%;">ID</th>
		<th style="width: 10%;">NAME</th>
		<th style="width: 20%;">EMAIL</th>
		<th style="width: 10%;">SUBJECT</th>
		<th style="width: 10%;">PHONE NO</th>
		<th style="width: 15%;">REGDATE</th>
		<th style="width: 15%;">수정/삭제</th>
	</tr>
	<c:forEach var="i" items="${requestScope.list}">
	<tr>
		<td>${i.num}</td>
		<td>${i.id}</td>
		<td>${i.name}</td>
		<td>${i.email}</td>
		<td>${i.title}</td>
		<td>${i.phone}</td>
		<td>${i.regdate}</td>
		<td><button>delete</button></td>

	</tr>
	</c:forEach>
</table>
	<nav aria-label="Page navigation" style="width:450px; margin: 0 auto;">
	  <ul class="pagination">
	  <c:if test="${requestScope.prevBlock gt 0 }">
	   <li><a href="#"><span class="glyphicon glyphicon-step-backward " aria-hidden="true"></span></a></li>
	    <li>
	      <a href="#" aria-label="Previous">
	        <span aria-hidden="true">&laquo;</span>
	      </a>
	    </li>
	    </c:if>
	    <c:forEach varStatus="i" begin="${requestScope.startPage}" end="${requestScope.endPage}" step="1">
	      <c:choose>
		    <c:when test="${i.index eq requestScope.pageNumber}">
	       <li class="active"><a href="#">${i.index}</a></li>
		    </c:when>
		      <c:otherwise>
		      <li><a onclick="list('member','member_list',${i.index})">${i.index}</a></li>
			  </c:otherwise>
		</c:choose>
	    </c:forEach>
	    
	  <c:if test="${requsetScope.nextBlock le requestScope.theNumberOfPages}">
	     <li>
	      <a href="#" aria-label="Next">
	        <span aria-hidden="true">&raquo;</span>
	      </a>
	    </li>
	     <li><a href="#"><span class="glyphicon glyphicon-step-forward" aria-hidden="true"></span></a></li>
	    </c:if>
	    
	  </ul>
	</nav>
</div>
<jsp:include page="../common/footer.jsp"/>

${i.index}






