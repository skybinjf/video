package com.jmu.video.dao;

import java.util.List;

import org.springframework.orm.hibernate4.support.HibernateDaoSupport;

import com.jmu.video.entity.Course;

public class IndexDao extends HibernateDaoSupport {

	public List<Course> findAllCoursesByStatus(String status) {
		String hql = "from Course c where c.status = ?";
		List<Course> courses = (List<Course>) this.getHibernateTemplate().find(hql, status);
		if(courses.size() > 0){
			return courses;
		}
		return null;
	}

	
	
}
