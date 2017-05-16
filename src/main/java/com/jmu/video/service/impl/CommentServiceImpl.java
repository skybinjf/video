package com.jmu.video.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import com.jmu.video.dao.CommentDao;
import com.jmu.video.entity.Comment;
import com.jmu.video.service.CommentService;
@Transactional
public class CommentServiceImpl implements CommentService {

	private CommentDao commentDao;

	public void setCommentDao(CommentDao commentDao) {
		this.commentDao = commentDao;
	}

	@Override
	public List<Comment> findAllCommentsByCourseId(Integer courseId) {
		return commentDao.findAllCommentsByCourseId(courseId);
	}

	@Override
	public void saveComment(Comment comment) {
		commentDao.saveComment(comment);
	}

	
}
