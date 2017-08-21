<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">GMS</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a onclick="moveTo('common','main')"><span class="glyphicon glyphicon-home"> &nbsp;HOME</span></a></li>
      <li class="dropdown">
      <a href="" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
        aria-expanded="flase">학생관리 </a> 
       <ul id="navbar_ul_stu">
       	<li><a>학생추가</a></li>
       	<li><a>학생 목록</a></li>
       	<li><a>학생 조회</a></li>
       	<li></li>
       	<li><a>학생삭제</a></li>
       </ul>
      </li>
       <li class="dropdown">
      <a href="" class="dropdown-toggle" data-toggle="dropdown"
       role="button" aria-haspopup="true" 
       aria-expanded="flase">성적관리 </a>
          <ul id="navbar_ul_grade">
       	<li><a>성적추가</a></li>
       	<li><a oncancel="">성적 목록</a></li>
       	<li><a oncancel="">성적 조회</a></li>
       	<li role="separator" class="divider"></li>
       	<li><a oncancel="">성적 삭제</a></li>
       </ul>
      </li>
       <li class="dropdown">
      <a href="" class="dropdown-toggle" data-toggle="dropdown"
       role="button" aria-haspopup="true" 
       aria-expanded="flase">게시판 관리 </a>
          <ul id="navbar_ul_board">
       	<li><a>게시판 추가</a></li>
       	<li><a>게시판 목록</a></li>
       	<li><a>게시판 조회</a></li>
       	<li role="separator" class="divider"></li>
       	<li><a oncancel="">게시판 삭제</a></li>
       </ul>
      </li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li style="font-weight:bold;color: white ">${sessionScope.user.name}</li>
      <li><a id="logout" ><span class="glyphicon glyphicon-user"></span>Logout</a></li>
      <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    </ul>
  </div>
</nav>
<script>


function moveTo(dir,action,page){
	location.href="${ctx}/"+dir+".do?action="+action+"&page="+page;
}

function moveTo(dir,page){
	location.href="${ctx}/"+dir+".do?action=move&page="+page;
}
function deleteTarget(target){
	prompt(target+'의 ID?');
}

function list(dir,page,pageNumber){
	location.href="${ctx}/"+dir+".do?action=list&page="+page+"&pageNumber="+pageNumber;
}

function mainLoad(){
	var u1=document.getElementById("main_ul_stu");
	var u2=document.getElementById("main_ul_grade");
	var u3=document.getElementById("main_ul_board");
	u1.setAttribute("class","list-group");
	u2.setAttribute("class","list-group");
	u3.setAttribute("class","list-group");
	var u1c=u1.children;
	var u2c=u2.children;
	var u3c=u3.children;
	var i;
	for(i=0;i<u1c.length;i++){
		u1c[i].setAttribute("class","list-group-item");
	}
	for(i=0;i<u2c.length;i++){
		u2c[i].setAttribute("class","list-group-item");
	}
	for(i=0;i<u3c.length;i++){
		u3c[i].setAttribute("class","list-group-item");
	}
	u1c[0].setAttribute("onclick","moveTo('member','member_add')");
	u1c[1].setAttribute("onclick","list('member','member_list','1')");
	u1c[2].setAttribute("onclick","moveTo('member','member_detail')");
	u1c[3].setAttribute("onclick","moveTo('member','member_update')");
	u1c[4].setAttribute("onclick","deleteTarget('member')");

	u2c[0].setAttribute("onclick","moveTo('grade','grade_add')");
	u2c[1].setAttribute("onclick","list('grade','grade_list','1')");
	u2c[2].setAttribute("onclick","moveTo('grade','member_detail')");
	u2c[3].setAttribute("onclick","moveTo('grade','grade_update')");
	u2c[4].setAttribute("onclick","deleteTarget('grade')");

	u3c[0].setAttribute("onclick","moveTo('board','board_write')");
	u3c[1].setAttribute("onclick","list('board','board_list','1')");
	u3c[2].setAttribute("onclick","moveTo('board','board_detail')");
	u3c[3].setAttribute("onclick","moveTo('board','board_update')");
	u3c[4].setAttribute("onclick","deleteTarget('board')");
}

window.onload=navbarLoad();
function navbarLoad(){
	var u1=document.getElementById("navbar_ul_stu");
	var u2=document.getElementById("navbar_ul_grade");
	var u3=document.getElementById("navbar_ul_board");
	u1.setAttribute("class","dropdown-menu");
	u2.setAttribute("class","dropdown-menu");
	u3.setAttribute("class","dropdown-menu");
	var u1c=u1.children;
	var u2c=u2.children;
	var u3c=u3.children;
	
	u1c[0].setAttribute("onclick","moveTo('member','member_add')");
	u1c[1].setAttribute("onclick","list('member','member_list')");
	u1c[2].setAttribute("onclick","moveTo('member','member_detail')");
	u1c[3].setAttribute("role","separator");
	u1c[3].setAttribute("class","divider");
	u1c[4].setAttribute("onclick","deleteTarget('member')");
	
	u2c[0].setAttribute("onclick","moveTo('grade','grade_add')");
	u2c[1].setAttribute("onclick","list('grade','grade_list')");
	u2c[2].setAttribute("onclick","moveTo('grade','grade_detail')");
	u2c[3].setAttribute("onclick","moveTo('grade','grade_update')");
	u2c[4].setAttribute("onclick","deleteTarget('grade')");
	
	var logout= document.getElementById("logout");
	logout.setAttribute("style","color:white");
	logout.setAttribute("onclick","logout('common','index')");
	}


</script>