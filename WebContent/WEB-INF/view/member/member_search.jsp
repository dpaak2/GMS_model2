<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<h1>${reqestScope.search} 의 검색 결과</h1>
<jsp:include page="../common/common_head.jsp"/>

<div class="row">
  <div class="col-lg-4">
    <div class="input-group">
      <input type="text" class="form-control" placeholder="Search for..." id="searchName" name="searchName">
      <span class="input-group-btn">
        <button id="search_button" class="btn btn-default" type="submit" onclick="searchName()">SEARCH</button>
      </span>
    </div><!-- /input-group -->
  </div><!-- /.col-lg-6 -->
</div><!-- /.row -->
<div style="height: 40; width: 300px;"></div>



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
		<td style="width: 10%;">${i.num}</td>
		<td style="width: 10%;">${i.id}</td>
		<td style="width: 10%;"><a onclick="detailStudent('${i.id}')">${i.name}</a></td>
		<td style="width: 20%;">${i.email}</td>
		<td style="width: 10%;">${i.title}</td>
		<td style="width: 10%;">${i.phone}</td>
		<td style="width: 15%;">${i.regdate}</td>
		<td style="width: 15%;"><a onclick="updateStudent('${i.id}')">수정</a>
		/
		<a onclick="deleteStudent('${i.id}')">삭제</a></td>

	</tr>
	</c:forEach>
</table>
	<nav aria-label="Page navigation" style="width:450px; margin: 0 auto;">
	  <ul class="pagination">
	  <c:if test="${requestScope.prevBlock gt 0 }">
	   <li><a onclick="list('member','member_list','1')"><span class="glyphicon glyphicon-step-backward " aria-hidden="true"></span></a></li>
	    <li>
	      <a onclick="list('member','member_list','${requestScope.startPage-1}')" aria-label="Previous">
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
		      <li><a onclick="list('member','member_list','${i.index}')">${i.index}</a></li>
			  </c:otherwise>
		</c:choose>
	    </c:forEach>
	    
    <!-- Next -->
      <c:if test="${requestScope.nextBlock le requestScope.theNumberOfPages}">       
         <li><a onclick="list('member', 'member_list', '${requestScope.endPage+1}')" href="#" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
         <li><a onclick="list('member', 'member_list', '${requestScope.theNumberOfPages}')" href="#">
         <span class="glyphicon glyphicon-fast-forward" aria-hidden="true"></span></a></li>
      </c:if>
	   
	  </ul>
	</nav>
</div>
