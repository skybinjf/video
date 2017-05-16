<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@include file="header.jsp"%>
<%@include file="footer.jsp"%>
<title>课程测试</title>
<style type="text/css">
	.item{
		margin-left: 20px;
	}
</style>
</head>
<body>
	<!-- 上，课程详细信息 -->
	<div class="container course">
		<h3><s:property value="#request.course.courseName"/></h3>
		<div>
			<p class="muted">简介：<s:property value="#request.course.intro"/></p>
		</div>
		<div>
			<span class="text-warning">时长：<s:property value="#request.course.period"/></span>  
			<span class="text-success">分类：<s:property value="#request.course.classify"/></span>
		</div>
	</div>
	<!-- 下，内容和教师 -->
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="offset3 span7">
				<ul class="nav nav-tabs">
				  <li class="active">
				    <a href="course_courseScan?courseId=${request.course.courseId }">章节</a>
				  </li>
				  <li><a href="comment_courseComment?courseId=${request.course.courseId }">评论</a></li>
				  <!-- <li><a href="#">打分</a></li> -->
				  <li><a href="annex_downloadPage?courseId=${request.course.courseId }">下载资料</a></li>
				  <li><a href="annex_testPage?courseId=${request.course.courseId }">测试</a></li>
				</ul>
				
				<form class="form-horizontal" action="annex_submitTest">
				  <div class="control-group">
				    <label class="control-label" for="inputEmail">Email</label>
				    <div class="controls">
				      <input type="text" id="inputEmail" placeholder="Email">
				    </div>
				  </div>
				  <div class="control-group">
				    <div class="controls">
				      <button type="submit" class="btn">提交</button>
				    </div>
				  </div>
				</form>
				
			</div>
		</div>
	</div>

</body>
</html>