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
					<form action="comment_submitComment" method="post">
						<input name="userName" value='<s:property value="#session.user.userName"/>' hidden />
						<input name="courseId" value='<s:property value="#request.courseId"/>' hidden />
						<div>
							<label class="lead"><s:property value="#session.user.userName"/></label>
							<textarea rows="4" class="span5" name="content"></textarea>
						</div>
						<div>
							<input type="submit" value="提交" class="btn btn-info" onclick="return submitComment()"/>
						</div>
					</form>
				</div>	
				
				<!-- 显示已有评论 -->
				<div class="hero-unit">
					<s:iterator value="#request.commentList" var="c">
						<div>
						  <label class="lead text-info"><s:property value="#c.user.userName"/> </label>
						  <label>
						   	 <s:property value="#c.content"/>
						  </label>
						  <label class="muted">评论时间: <s:date name="#c.commentDate" format="yyyy年MM月dd日 hh时mm分" />
						  </label>
						</div>
					</s:iterator>
					<!-- <div>
					  <label class="lead">Winner</label>
					  <label>
					   	 计算机网络，是指将地理位置不同的具有独立功能的多台计算机及其外部设备，通过通信线路连接起来，在网络操作系统，网络管理软件及网络通信协议的管理和协调下，实现资源共享和[1]  信息传递的计算机系统。
					  </label>
					</div>
					<div>
					  <label class="lead">Sky</label>
					  <label>
					   	 最简单的计算机网络就只有两台计算机和连接它们的一条链路，即两个节点和一条链路。
					  </label>
					</div> -->
				</div>
			</div>
		</div>
	</div>

</body>
</html>