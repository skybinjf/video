package com.jmu.video.entity;

import java.util.Date;

/**
 * 课程评价和打分类
 *
 * @author Sky
 * @date 2017年5月2日 上午10:17:55
 */
public class Comment {
	
	private Integer commentId;
	private String content; //评价内容
	private Integer mark; //给课程打分
	private Date commentDate;
	
	private User user;
	private Course course;
	
	public Comment() {
		super();
	}
	
	public Comment(String content, Date commentDate, User user, Course course) {
		super();
		this.content = content;
		this.commentDate = commentDate;
		this.user = user;
		this.course = course;
	}

	public Comment(String content, User user, Course course) {
		super();
		this.content = content;
		this.user = user;
		this.course = course;
	}
	public Integer getCommentId() {
		return commentId;
	}
	public void setCommentId(Integer commentId) {
		this.commentId = commentId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Integer getMark() {
		return mark;
	}
	public void setMark(Integer mark) {
		this.mark = mark;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Course getCourse() {
		return course;
	}
	public void setCourse(Course course) {
		this.course = course;
	}
	public Date getCommentDate() {
		return commentDate;
	}
	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}
	
}
