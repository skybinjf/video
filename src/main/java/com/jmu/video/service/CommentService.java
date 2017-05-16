package com.jmu.video.service;

import java.util.List;

import com.jmu.video.entity.Comment;

public interface CommentService {
	/**
	 * 根据课程的ID来查找课程所有的评论
	 * @param integer
	 * @return
	 */
	List<Comment> findAllCommentsByCourseId(Integer courseId);
	
	/**
	 * 保存评论
	 * @param comment
	 */
	void saveComment(Comment comment);

	
}
