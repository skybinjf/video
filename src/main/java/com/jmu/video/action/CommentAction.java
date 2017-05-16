package com.jmu.video.action;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.jmu.video.entity.Comment;
import com.jmu.video.entity.Course;
import com.jmu.video.entity.User;
import com.jmu.video.service.CommentService;
import com.jmu.video.service.CourseService;
import com.jmu.video.service.UserService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class CommentAction extends ActionSupport {

	private String content; //评论内容
	private String userName;
	private String courseId;
	
	private CommentService commentService;
	private CourseService courseService;
	private UserService userService;
	
	ActionContext context = ActionContext.getContext();
	Map<String, Object> session = context.getSession();
	Map<String, Object> request = (Map<String, Object>) context.get("request");
	
	/**
	 * 提交评论，思路：获取评论内容和用户名，然后进行保存
	 * @return
	 */
	public String submitComment(){
		if((userName != null && !"".equals(userName)) && (courseId != null && !"".equals(courseId)) 
				&& content != null && !"".equals(content)){
			User u = userService.findUserByName(userName);
			Course c = courseService.findCourseById(new Integer(courseId));
//			Comment comment =  new Comment(content, u, c);
			Comment comment =  new Comment(content, new Date(), u, c);
			commentService.saveComment(comment);
		}
		return "submitCommentSucc";
	}
	/**
	 * 跳转到课程评论页面，首先要把已有评论显示出来
	 * @return
	 */
	public String courseComment(){
		HttpServletRequest httpServletRequest = ServletActionContext.getRequest();
		String courseId = httpServletRequest.getParameter("courseId");
		
		Course c = courseService.findCourseById(new Integer(courseId));
		request.put("course", c);
//		request.put("courseId", courseId);
		List<Comment> commentList = commentService.findAllCommentsByCourseId(new Integer(courseId));
		request.put("commentList", commentList);
		return "courseComment";
	}
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public void setCommentService(CommentService commentService) {
		this.commentService = commentService;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public void setCourseService(CourseService courseService) {
		this.courseService = courseService;
	}
	public String getCourseId() {
		return courseId;
	}
	public void setCourseId(String courseId) {
		this.courseId = courseId;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
}
