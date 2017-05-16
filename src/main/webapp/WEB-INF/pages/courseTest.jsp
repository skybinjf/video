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
				  <li>
				    <a href="course_courseScan?courseId=${request.course.courseId }">章节</a>
				  </li>
				  <li><a href="comment_courseComment?courseId=${request.course.courseId }">评论</a></li>
				  <!-- <li><a href="#">打分</a></li> -->
				  <li><a href="annex_downloadPage?courseId=${request.course.courseId }">下载资料</a></li>
				  <li class="active"><a href="annex_testPage?courseId=${request.course.courseId }">测试</a></li>
				</ul>
				
				<div class="form-horizontal">
				  <div class="control-group">
				  <span class="user" hidden><s:property value="#session.user.userName"/></span>
				    <s:iterator value="#request.testList" var="t" status="index">
				    	<s:if test="#index.last">
				    		<span class="titleNum" hidden><s:property value="#index.count"/></span>	
				    	</s:if>
						<div>
							<span><s:property value="#index.index + 1"/>. <s:property value="#t.testName"/> </span>
							<div class="item">
								<label class="radio">
								 	<input type="radio" name='item<s:property value="#index.index + 1"/>' id="itemA" value="A" />
								    A. <s:property value="#t.itemA"/>
								</label>
								<label class="radio">
									<input type="radio" name='item<s:property value="#index.index + 1"/>' id="itemB" value="B" />
									B. <s:property value="#t.itemB"/>
								</label>
								<label class="radio">
								    <input type="radio" name='item<s:property value="#index.index + 1"/>' id="itemC" value="C" />
								    C. <s:property value="#t.itemC"/>
								</label>
								<label class="radio">
								    <input type="radio" name='item<s:property value="#index.index + 1"/>' id="itemB" value="D" />
								    D. <s:property value="#t.itemD"/>
								</label>
								<!-- 答案 -->
								<div class="text-error answer" hidden>
									<div>
										答案：<s:property value="#t.answer"/>
									</div>
									<div>
										详解：<span><s:property value="#t.detail"/>
									</div>
								</div>
							</div>
						</div>
					</s:iterator>
				  </div>
				  <div class="control-group">
				    <div class="controls">
				      <button class="btn" onclick="return submitTest()">查看结果</button>
				    </div>
				  </div>
				</div>
			</div>
		</div>
	</div>

<script type="text/javascript">
	function submitTest(){
		var user = $(".user").text();
		if(user == null || user == ""){
			alert("对不起，登陆后才能测试！");
			return false;
		}
		$(".answer").removeAttr("hidden");
	}
</script>
</body>
</html>