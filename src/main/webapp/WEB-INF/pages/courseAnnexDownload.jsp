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
<title>课程学习</title>
<style type="text/css">
	.course{
		margin-bottom: 20px;
	}
	.videoTitle{
		margin-left: 20px;
	}
	.lead{
		margin-bottom: 0;
	}
	.hero-unit{
		padding-left: 20px;
		padding-top: 20px;
	}
	
</style>
<script type="text/javascript">

	function submitComment(){
		var user = $(".user").text();
		if(user == null || user == ""){
			alert("对不起，登陆后才能评论！");
		}
	}
	
</script>
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
			<!-- 下左，章节和视频 -->
			<div class="offset3 span7">
				<ul class="nav nav-tabs">
				  <li class="active">
				    <a href="course_courseScan?courseId=${request.course.courseId }">章节</a>
				  </li>
				  <li><a href="comment_courseComment?courseId=${request.course.courseId }">评论</a></li>
				  <!-- <li><a href="#">打分</a></li> -->
				  <li class="active"><a href="annex_downloadPage?courseId=${request.course.courseId }">下载资料</a></li>
				  <li><a href="annex_testPage?courseId=${request.course.courseId }">测试</a></li>
				</ul>
				<!-- 下载资料 -->
				<div>
					<span class="user" hidden><s:property value="#session.user.userName"/></span>
					<s:iterator value="#request.annexList" var="list">
						<div>
							<a href='annex_download?fileName=<s:property value="#list.uploadFileName"/>'>下载 <s:property value="#list.uploadFileName"/> </a>
						</div>
					</s:iterator>
				</div>	
			</div>
		</div>
	</div>

</body>
</html>