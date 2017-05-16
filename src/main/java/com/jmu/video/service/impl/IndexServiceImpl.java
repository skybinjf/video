package com.jmu.video.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import com.jmu.video.dao.IndexDao;
import com.jmu.video.entity.Course;
import com.jmu.video.service.IndexService;

@Transactional
public class IndexServiceImpl implements IndexService {

	private IndexDao indexDao;

	public void setIndexDao(IndexDao indexDao) {
		this.indexDao = indexDao;
	}

	@Override
	public List<Course> findAllCoursesByStatus(String status) {
		return indexDao.findAllCoursesByStatus(status);
	}
	
}
