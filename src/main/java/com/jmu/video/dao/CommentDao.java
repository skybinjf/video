package com.jmu.video.dao;

import java.util.List;

import org.springframework.orm.hibernate4.support.HibernateDaoSupport;

import com.jmu.video.entity.Comment;

public class CommentDao extends HibernateDaoSupport {

	public List<Comment> findAllCommentsByCourseId(Integer courseId) {
		String hql = "from Comment c where c.course.courseId = ?";
		List<Comment> commentList = (List<Comment>) this.getHibernateTemplate().find(hql, courseId);
		if(commentList.size() > 0){
			return commentList;
		}
		return null;
	}

	public void saveComment(Comment comment) {
		this.getHibernateTemplate().save(comment);
	}


}
