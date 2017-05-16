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
					<table class="table table-hover">
						<caption class="lead">留言板</caption>
						  <thead>
						    <tr>
						      <th class="span1">状态</th>
						      <th class="span2">发送者</th>
						      <th class="span5">留言内容</th>
						      <th class="span2">留言时间</th>
						      <th class="span2">操作</th>
						    </tr>
						  </thead>
						  <tbody>
						  	<s:iterator value="#request.messageList" var="m" status="index">
						      <tr>
						      	<s:if test='#m.status == "未读"'>
									<td class="text-error"><s:property value="#m.status"/></td>	      	
						      	</s:if>
						        <s:else>
						        	<td><s:property value="#m.status"/></td>
						        </s:else>
						        <td><label class=""><s:property value="#m.fromWho"/></label></td>
						        <td><s:property value="#m.content"/></td>
						        <td><label class="muted"><s:date name="#m.messageDate" format="yyyy年MM月dd日" /></td>
						        <td>
								  <a href="annex_deleteMessage?messageId=${messageId }"><small>删除</small></a>
								  <!-- <a href="annex_teacherRevert">回复</a> -->
								  <a href='#message<s:property value="#index.index"/>' role="button" class="" data-toggle="modal"><small>回复</small></a>
								 <%--  <a href="annex_revertMessage?messageId=${messageId }" onclick="return revert()">回复</a> --%>
								  <a href="annex_subMessageDetail?messageId=${messageId }"><small>详情</small></a>
								  
								  <!-- form action="annex_teacherRevert" method="post" id="loginForm"> -->
								  <form action="annex_revertMessage" method="post" id="loginForm">
									<!-- Modal -->
									<div id="message<s:property value="#index.index"/>" class="modal hide fade" tabindex="-1" role="dialog"
										aria-labelledby="myModalLabel" aria-hidden="true">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal"
												aria-hidden="true">×</button>
											<h3 id="myModalLabel" class="text-center">留言回复</h3>
										</div>
										<div class="modal-body text-center">
											<div>
												<input type="hidden" name="toWho" value='<s:property value="#m.fromWho"/>' />
												<input type="hidden" name="fromWho" value='<s:property value="#m.toWho"/>' />
												<input type="hidden" name="messageId" value='<s:property value="#m.messageId"/>' />
												
												<textarea rows="4" name="message" class="span5 message" placeholder='回复<s:property value="#m.fromWho"/>'></textarea>
											</div>
										</div>
										<div class="modal-footer">
											<button class="btn" data-dismiss="modal" aria-hidden="true">取消</button>
											<input type="submit" value="发送" class="btn btn-primary" />
										</div>
									</div>
								</form>
								
							    </td>
						      </tr>
						    </s:iterator>
						  </tbody>
					</table>	
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function revert(){
			var a = prompt("请输入回复内容");
			var message = $(".message").val(a);
			alert(message);
			
		}
	</script>
</body>
</html>