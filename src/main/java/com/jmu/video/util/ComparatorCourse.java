package com.jmu.video.util;

import java.util.Comparator;

import com.jmu.video.entity.Course;

public class ComparatorCourse implements Comparator<Course> {

	@Override
	public int compare(Course o1, Course o2) {
		int flag = o2.getClickNum().compareTo(o1.getClickNum());
		if(flag == 0){
			return o1.getCourseId().compareTo(o2.getCourseId());
		}else {
			return flag;
		}
	}
	

}
