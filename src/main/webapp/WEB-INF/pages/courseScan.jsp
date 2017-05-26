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
	.commendCourse{
		margin-top: 60px;
	}
	.commend{
		margin-left: 20px;
	}
</style>
</head>
<body>
	<!-- 上，课程详细信息 -->
	<div class="container course">
		<div class="">
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
				  <li><a href="annex_downloadPage?courseId=${request.course.courseId }">下载资料</a></li>
				  <li><a href="annex_testPage?courseId=${request.course.courseId }">练习题</a></li>
				  <%-- 
				  <li><a href="annex_gradePage?courseId=${request.course.courseId }">课程评分</a></li>
				   --%>
				</ul>

				<s:iterator id="chapter" value="#request.chapters" status="cIndex" var="c">
					<s:iterator id="video" value="#request.videos" status="vIndex" var="v">
						<s:if test="#cIndex.index == #vIndex.index">
							<h4><s:property value="chapterName"/></h4>
							<a href="course_videoPlay?videoId=${videoId }" class="videoTitle"><s:property value="title"/></a>
						</s:if>
					</s:iterator>
				</s:iterator>
			</div>
			<!-- 下右，教师信息 -->
			<div class="span2">
				<h3 class="lead">教师信息</h3>
				<div>
					<p>教师姓名：<s:property value="#request.teacher.user.userName"/></p>
				</div>
				<div>
					<p>性别：<s:property value="#request.teacher.user.sex"/></p>
				</div>
				<div>
					<p>邮箱：<s:property value="#request.teacher.user.email"/></p>
				</div>
				<div>
					<p>简介：<s:property value="#request.teacher.user.intro"/></p>
				</div>
				<div>
					<p>单位：<s:property value="#request.teacher.unit"/></p>
				</div>
				<form action="annex_sendMessageToTeacher" method="post">
				
					<!-- 隐藏域，传用户和教师的信息到后台 -->
					<input type="hidden" name="toWho" value='<s:property value="#request.teacher.user.userName"/>' />
					<input type="hidden" name="courseId" value='<s:property value="#request.chapters.course.courseId"/>' />
				
					<!-- Button to trigger modal -->
					<a href="#message" role="button" class="btn" data-toggle="modal">给教师留言</a>
 
					<!-- Modal -->
					<div id="message" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					  <div class="modal-header">
					    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					    <h3 id="myModalLabel">给教师留言</h3>
					  </div>
					  <div class="modal-body">
					    <textarea rows="5" name="message" class="span12" placeholder="请输入留言信息"></textarea>
					  </div>
					  <div class="modal-footer">
					    <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
					    <button class="btn btn-primary">留言</button>
					  </div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div class="container commendCourse">
		<h4>相关推荐</h4>
		<div class="commend">
			<s:iterator value="#request.courseList" id="courses">
				<div>
					<h5><a href="course_courseScan?courseId=<s:property value='courseId' /> "><s:property value="courseName" /></a></h5>
				</div>
			</s:iterator>
		</div>
	</div>
</body>
</html>