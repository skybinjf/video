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

	function submitGrade(){
		var user = $(".user").text();
		if(user == null || user == ""){
			alert("对不起，登陆后才能评分！");
			return false;
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
			<label class="text-warning">时长：<s:property value="#request.course.period"/></label>
			<label class="text-success">分类：<s:property value="#request.course.classify"/></label>
			<label class="text-info">浏览人数：<s:property value="#request.course.clickNum"/></label>
		</div>
	</div>
	<!-- 下，内容和教师 -->
	<div class="container-fluid">
		<div class="row-fluid">
			<!-- 下左，章节和视频 -->
			<div class="offset3 span7">
				<ul class="nav nav-tabs">
				  <li>
				    <a href="course_courseScan?courseId=${request.course.courseId }">章节</a>
				  </li>
				  <li class="active"><a href="comment_courseComment?courseId=${request.course.courseId }">评论</a></li>
				  <!-- <li><a href="#">打分</a></li> -->
				  <li><a href="annex_downloadPage?courseId=${request.course.courseId }">下载资料</a></li>
				  <li><a href="annex_testPage?courseId=${request.course.courseId }">测试</a></li>
				</ul>
				<!-- 用户评论 -->
				<div>
					<span class="user" hidden><s:property value="#session.user.userName"/></span>
					<form action="annex_submitGrade" method="post">
						<input name="userName" value='<s:property value="#session.user.userName"/>' hidden />
						<input name="courseId" value='<s:property value="#request.course.courseId"/>' hidden />
						<select name="grade">
						    <option value="0">0</option>
						    <option value="1">1</option>
						    <option value="2">2</option>
						    <option value="3">3</option>
						    <option value="4">4</option>
						    <option value="5">5</option>
						    <option value="6">6</option>
						    <option value="7">7</option>
						    <option value="8" selected="selected">8</option>
						    <option value="9">9</option>
						    <option value="10">10</option>
						</select>

						<div>
							<input type="submit" value="提交" class="btn btn-info" onclick="return submitGrade()"/>
						</div>
					</form>
				</div>	
				
			</div>
		</div>
	</div>

</body>
</html>