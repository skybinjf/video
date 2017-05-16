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
<title>查看留言</title>
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
			<!-- <p class="lead">留言板</p> -->
			<div>
				<div class="hero-unit">
					<div>
					  <s:iterator value="#request.subMessageList" var="s" status="index">
					  	<s:if test="#index.index == 0">
					 	  <div>
					 	  	<span class="text-error"><s:property value="#s.fromWho"/>:</span>
					 	  	<span><s:property value="#s.message.content"/></span>
					 	  	<label class="muted"><s:date name="#s.messageDate" format="yyyy年MM月dd日" />
					 	  	 <a href="#message" role="button" class="" data-toggle="modal">回复</a>
					 	  </div>
					 	</s:if>
					 	  <div>
					 	  	<span class="text-warning"><s:property value="#s.fromWho"/></span>
					 	  	<span>回复</span>
					 	  	<span class="text-info"><s:property value="#s.toWho"/>:</span>
					 	  	<span><s:property value="#s.content"/></span>
					 	  	<label class="muted"><s:date name="#s.messageDate" format="yyyy年MM月dd日" />
					 	  </div>
					 	  <form action="annex_revertMessage" method="post" id="loginForm">
							<!-- Modal -->
							<div id="message" class="modal hide fade" tabindex="-1" role="dialog"
								aria-labelledby="myModalLabel" aria-hidden="true">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">×</button>
									<h3 id="myModalLabel" class="text-center">留言回复</h3>
								</div>
								<div class="modal-body text-center">
									<div>
										<input type="hidden" name="fromWho" value='<s:property value="#s.toWho"/>' />
										<input type="hidden" name="toWho" value='<s:property value="#s.fromWho"/>' />
										<input type="hidden" name="messageId" value='<s:property value="#s.message.messageId"/>' />
										
										<textarea rows="4" name="message" class="span5" placeholder='回复<s:property value="#s.fromWho"/>'></textarea>
									</div>
								</div>
								<div class="modal-footer">
									<button class="btn" data-dismiss="modal" aria-hidden="true">取消</button>
									<input type="submit" value="发送" class="btn btn-primary" />
								</div>
							</div>
						</form>
				 	  </s:iterator><!-- end subMessageList -->
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>