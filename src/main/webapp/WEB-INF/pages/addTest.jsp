<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
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
<link rel="stylesheet" type="text/css" href="css/leftMenu.css" />
<title>个人信息</title>

<style type="text/css">
	label .error{
		color : red;
	}
</style>
	
<script type="text/javascript">
	var validator;
	$(document).ready(function() {
		
		/* $.validator.setDefaults({
			debug : true
		}); */
	
		validator = $("#addTestForm").validate({
			rules : {
				testName : {
					required : true,
					minlength : 2,
					maxlength : 200
				},
				itemA : {
					required : true,
					minlength : 1,
					maxlength : 200
				},
				itemB : {
					required : true,
					minlength : 1,
					maxlength : 200
				},
				itemC : {
					required : true,
					minlength : 1,
					maxlength : 200
				},
				itemD : {
					required : true,
					minlength : 1,
					maxlength : 200
				},
			},
			messages : {
				testName : {
					required : "必须填写测试题目!",
					minlength : "测试题目最小为2位",
					maxlength : "测试题目最大为200位",
					rangelength : "测试题目应该在2-200位",
					remote : "测试题目不存在"
				},
				itemA : {
					required : "必须填写选项A",
					minlength : "选项A最小为1位",
					maxlength : "选项A最大为200位"
				},
				itemB : {
					required : "必须填写选项B",
					minlength : "选项B最小为1位",
					maxlength : "选项B最大为200位"
				},
				itemC : {
					required : "必须填写选项C",
					minlength : "选项C最小为1位",
					maxlength : "选项C最大为200位"
				},
				itemD : {
					required : "必须填写选项D",
					minlength : "选项D最小为1位",
					maxlength : "选项D最大为200位"
				}
			},
			/* submitHandler : function(form) {
				console.log($(form).serialize());
			} */
		});
	
	});
</script>

</head>
<body>
	<div class="leftMenu">
		<div class="accordion" id="accordion2">
			<div class="accordion-group">
				<div class="accordion-heading">
					<a class="accordion-toggle" data-toggle="collapse"
						data-parent="#accordion2" href="#collapseOne"> <span>个人中心</span>
					</a>
				</div>
				<div id="collapseOne" class="accordion-body collapse in">
					<div class="accordion-inner">
						<a href="teacherUpdate"><span>修改个人信息</span></a>
					</div>
					<div class="accordion-inner">
						<a href="teacherUpdatePassword"><span>修改密码</span></a>
					</div>
				</div>
			</div>
			<div class="accordion-group">
				<div class="accordion-heading">
					<a class="accordion-toggle" data-toggle="collapse"
						data-parent="#accordion2" href="#collapseTwo"> <span>课程管理</span>
					</a>
				</div>
				<div id="collapseTwo" class="accordion-body collapse">
					<div class="accordion-inner">
						<a href="course_scanMyCourse"><span>查看课程</span></a>
					</div>
					<div class="accordion-inner">
						<a href="addCourse"><span>添加课程</span></a>
					</div>
					<div class="accordion-inner">
						<a href="annex_uploadAnnexPage"><span>上传课件</span></a>
					</div>
					<div class="accordion-inner">
						<a href="annex_addTestPage"><span>添加测试</span></a>
					</div>
					<div class="accordion-inner">
						<a href="annex_teacherScanMessage"><span>学生留言</span></a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="rightContent">
		<div class="container">
			<p class="lead">添加测试</p>
			<form class="form-horizontal" action="annex_saveTest" id="addTestForm" method="post">
			  <div class="control-group">
				<label class="control-label">课程</label>
				<div class="controls">
					<select name="courseName">
						<s:iterator value="#request.courseList" var="c">
							<option value="<s:property value="%{courseName}" />"><s:property value="%{courseName}" /></option>
						</s:iterator>
					</select>
				</div>
			  </div>
			  <div class="control-group">
			    <label class="control-label" for="testName">测试题目</label>
			    <div class="controls">
			      <textarea rows="4" name="testName" id="testName" placeholder="如：下列哪个不是战国的人物？"></textarea>
			    </div>
			  </div>
			  <div class="control-group">
			    <label class="control-label" for="itemA">选项A</label>
			    <div class="controls">
			      <input type="text" id="itemA" name="itemA" placeholder="如：秦始王">
			    </div>
			  </div>
			  <div class="control-group">
			    <label class="control-label" for="itemB">选项B</label>
			    <div class="controls">
			      <input type="text" id="itemB" name="itemB" placeholder="如：诸葛亮">
			    </div>
			  </div>
			  <div class="control-group">
			    <label class="control-label" for="itemC">选项C</label>
			    <div class="controls">
			      <input type="text" id="itemC" name="itemC" placeholder="如：刘邦">
			    </div>
			  </div>
			  <div class="control-group">
			    <label class="control-label" for="itemD">选项D</label>
			    <div class="controls">
			      <input type="text" id="itemD" name="itemD" placeholder="如：关羽">
			    </div>
			  </div>
			  <div class="control-group">
			    <label class="control-label" for="answer">答案</label>
			    <div class="controls">
			      <select name="answer" id="answer">
				    <option value="A">A</option>
				    <option value="B">B</option>
				    <option value="C">C</option>
				    <option value="D">D</option>
				    </select>
			    </div>
			  </div>
			  <div class="control-group">
			    <label class="control-label" for="detail">答案详情</label>
			    <div class="controls">
			      <textarea rows="4" name="detail" id="detail" placeholder="如：秦始王是秦朝王帝，不是战国人物！"></textarea>
			    </div>
			  </div>
			  <div class="control-group">
			    <div class="controls">
			      <button type="submit" class="btn">添加</button>
			    </div>
			  </div>
			</form>
		</div>
	</div>
</body>
</html>