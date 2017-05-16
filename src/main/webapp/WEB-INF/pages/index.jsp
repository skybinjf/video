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
<link rel="stylesheet" type="text/css" href="css/index.css"/>
<%@include file="header.jsp"%>
<%@include file="footer.jsp"%>
<title>首页</title>
<style type="text/css">
	/* 设置距离下面的版权 */
	.bottom{
		margin-bottom: 50px;
	}
</style>
</head>
<body>
	<div class="container bottom">
		<div id="myCarousel" class="carousel slide">
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner">
				<div class="active item">
					<img alt="" src="image/java.jpg">
					<div class="carousel-caption">
						<h3>java入门</h3>
						<p>欢迎来到精彩的Java编程世界！Java语言已经成为当前软件开发行业中主流的开发语言。本课程将介绍Java环境搭建、工具使用、基础语法。带领大家一步一步的踏入Java达人殿堂！Let’s go!</p>
					</div>
				</div>
				<div class="item">
					<img alt="" src="image/php.jpg">
					<div class="carousel-caption">
						<h3>PHP基础入门</h3>
						<p>作为当今主流的开发语言，PHP集简单、免费、高效等荣誉于一身，但是，想学习她还是要脚踏实地地从基础语法开始，当然，对于将来要在Web开发领域叱咤风云的你来说，跟HTML和CSS还有一些不得不说的故事。</p>
					</div>
				</div>
				<div class="item">
					<img alt="" src="image/struts2.jpg">
					<div class="carousel-caption">
						<h3>struts2深入浅出</h3>
						<p>Struts2是当前流行的Java Web框架！本门课程首先介绍Strust2的基本概念和发展历史，然后从一个案例入手，带领小伙伴们对Struts2有一个全面的了解。接着有对Struts2进行了更深入的讲解。相信通过本课程的学习，小伙伴们一定能够有所收获。</p>
					</div>
				</div>
			</div>
			<a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
			<a class="carousel-control right" href="#myCarousel"
				data-slide="next">&rsaquo;</a>
		</div>
		
		<s:iterator value="#request.courses" var="c">
			<div class="media">
				<a class="pull-left" href="course_courseScan?courseId=${courseId }"> 
					<video width="200" height="120" poster="image/test8.jpg"> <!-- Firefox --> 
						<source src='video/<s:property value="#c.uploadFileName" />' type='<s:property value="#c.uploadContentType" />' /> <!-- 如果浏览器不支持video标签，则使用flash --> 
						<!-- <source src="video/02.ogg" type="video/ogg" />  --><!-- Safari/Chrome--> 
						<embed src="http://blip.tv/play/gcMVgcmBAgA%2Em4v" type="application/x-shockwave-flash" width="1024" height="798"
							allowscriptaccess="always" allowfullscreen="true">
						</embed> 
					</video>
				</a>
				<div class="media-body">
					<h4 class="media-heading"><s:property value="%{courseName}" /></h4>
					<p><s:property value="%{intro}" /></p>
				</div>
			</div>
		</s:iterator>
		
		<div class="media">
			<a class="pull-left" href="#"> 
				<video width="200" height="120"> <!-- Firefox --> 
					<source src="video/03.mp4" type="video/mp4" /> <!-- 如果浏览器不支持video标签，则使用flash --> 
					<source src="video/03.ogg" type="video/ogg" /> <!-- Safari/Chrome--> 
					<embed src="http://blip.tv/play/gcMVgcmBAgA%2Em4v" type="application/x-shockwave-flash" width="1024" height="798"
						allowscriptaccess="always" allowfullscreen="true">
					</embed> 
				</video>
			</a>
			<div class="media-body">
				<h4 class="media-heading">计算机操作系统</h4>
				<p>1946年第一台计算机面世之后，科学家与工程师们一直致力于让计算机更好地为人类工作，一代又一代操作系统因此应运而生。操作系统是计算机系统的灵魂，它管理计算机系统的资源，提供友善的人机互动，对于每一位计算机用户来说，认知和理解操作系统非常重要。</p>
			</div>
		</div>
		
	</div>
</body>
</html>