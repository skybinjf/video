package com.jmu.video.service;

import java.util.List;

import com.jmu.video.entity.Course;

public interface IndexService {

	List<Course> findAllCoursesByStatus(String status);

}
