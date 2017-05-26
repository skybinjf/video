package com.jmu.video.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import com.jmu.video.dao.CourseDao;
import com.jmu.video.entity.Chapter;
import com.jmu.video.entity.Course;
import com.jmu.video.entity.Teacher;
import com.jmu.video.entity.User;
import com.jmu.video.entity.Video;
import com.jmu.video.service.CourseService;
import com.opensymphony.xwork2.ActionContext;
@Transactional
public class CourseServiceImpl implements CourseService {

	private CourseDao courseDao;
	
	public void setCourseDao(CourseDao courseDao) {
		this.courseDao = courseDao;
	}

	public Course findCourseByName(String courseName) {
		return courseDao.findCourseByName(courseName);
	}

	public int addCourse(Course course, Teacher teacher) {
		course.setTeacher(teacher);
		course.setStatus("未审核");
		course.setUploadDate(new Date());
		return courseDao.addCourse(course);
	}

	@Override
	public List<Course> findAllCoursesByTeacherId(Integer teacherId) {
		return courseDao.findAllCoursesByTeacherId(teacherId);
	}

	@Override
	public void saveChapter(Chapter chapter) {
		courseDao.saveChapter(chapter);
		
	}

	@Override
	public List<Chapter> findAllChapters(Integer courseId) {
		return courseDao.findAllChapters(courseId);
	}

	@Override
	public Chapter findChapterByName(String chapterName) {
		return courseDao.findChapterByName(chapterName);
	}

	@Override
	public void saveVideo(Video video) {
		courseDao.saveVideo(video);
	}

	@Override
	public Video findVideoByNameAndChapterId(String videoName, Integer chapterId) {
		return courseDao.findVideoByNameAndChapterId(videoName, chapterId);
	}

	@Override
	public List<Video> findVideosByChapterId(Integer chapterId) {
		return courseDao.findVideosByChapterId(chapterId);
	}

	@Override
	public Course findCourseById(Integer courseId) {
		return courseDao.findCourseById(courseId);
	}

	@Override
	public void updateCourse(Course findCourse) {
		courseDao.updateCourse(findCourse);
	}

	@Override
	public Chapter findChapterById(Integer chapterId) {
		return courseDao.findChapterById(chapterId);
	}

	@Override
	public void updateChapter(Chapter findChapter) {
		courseDao.updateChapter(findChapter);
	}

	@Override
	public Video findVideoById(Integer videoId) {
		return courseDao.findVideoById(videoId);
	}

	@Override
	public void updateVideo(Video video) {
		courseDao.updateVideo(video);
	}

	@Override
	public void deleteCourse(Course c) {
		courseDao.deleteCourse(c);
	}

	@Override
	public void deleteChapter(Chapter c) {
		courseDao.deleteChapter(c);
	}

	@Override
	public void deleteVideo(Video v) {
		courseDao.deleteVideo(v);
	}

	@Override
	public List<Course> findAllCourses() {
		return courseDao.findAllCourses();
	}

	@Override
	public void checkCourse(Integer courseId) {
		Course course = courseDao.findCourseById(courseId);
		course.setStatus("通过");
		courseDao.updateCourse(course);
	}

	@Override
	public Video findVideoByChapterId(Integer chapterId) {
		return courseDao.findVideoByChapterId(chapterId);
	}

	@Override
	public List<Course> findAllCoursesByClassify(String classify) {
		String courseStatus = "通过"; 
		if("economy".equals(classify)){
			classify = "经济";
		}else if("literature".equals(classify)){
			classify = "文学";
		}else if("technology".equals(classify)){
			classify = "科技";
		}else if("medicine".equals(classify)){
			classify = "医学";
		}else if("enginee".equals(classify)){
			classify = "理工";
		}else if("foreign".equals(classify)){
			classify = "外语";
		}else if("psychology".equals(classify)){
			classify = "心理";
		}else if("history".equals(classify)){
			classify = "历史";
		}
		return courseDao.findAllCoursesByClassify(classify, courseStatus);
	}

	@Override
	public List<Course> findAllCoursesByStatus(String status) {
		if("check".equals(status)){
			status = "未审核";
		}
		if("checked".equals(status)){
			status = "通过";
		}
		return courseDao.findAllCoursesByStatus(status);
	}

	@Override
	public List<Course> commendCourse(Course course) {
		return courseDao.commendCourse(course);
	}

}
