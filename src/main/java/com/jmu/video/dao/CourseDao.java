package com.jmu.video.dao;

import java.util.List;

import org.springframework.orm.hibernate4.support.HibernateDaoSupport;

import com.jmu.video.entity.Chapter;
import com.jmu.video.entity.Course;
import com.jmu.video.entity.Video;

public class CourseDao extends HibernateDaoSupport {

	public Course findCourseByName(String courseName) {
		String hql = "from Course c where c.courseName = ?";
		List<Course> courses =  (List<Course>) this.getHibernateTemplate().find(hql, courseName);
		if(courses.size() > 0){
			return courses.get(0);
		}
		return null;
	}

	public int addCourse(Course course) {
		return (Integer) this.getHibernateTemplate().save(course);
	}
	
	public List<Course> findAllCoursesByTeacherId(Integer teacherId){
		String hql = "from Course c where c.teacher.teacherId = ?";
		List<Course> courses = (List<Course>) this.getHibernateTemplate().find(hql, teacherId);
		if(courses.size() > 0){
			return courses;
		}
		return null;
	}

	public void saveChapter(Chapter chapter) {
		this.getHibernateTemplate().save(chapter);
	}

	public List<Chapter> findAllChapters(Integer courseId) {
		String hql = "from Chapter c where c.course.courseId = ?";
		List<Chapter> chapters = (List<Chapter>) this.getHibernateTemplate().find(hql, courseId);
		if(chapters.size() > 0){
			return chapters;
		}
		return null;
	}

	public Chapter findChapterByName(String chapterName) {
		String hql = "from Chapter c where c.chapterName = ?";
		List<Chapter> chapter = (List<Chapter>) this.getHibernateTemplate().find(hql, chapterName);
		if(chapter.size() > 0){
			return chapter.get(0);
		}
		return null;
	}

	public void saveVideo(Video video) {
		this.getHibernateTemplate().save(video);
	}

	public Video findVideoByNameAndChapterId(String videoName, Integer chapterId) {
		String hql = "from Video v where v.title =? and v.chapter.chapterId = ?";
		List<Video> video = (List<Video>) this.getHibernateTemplate().find(hql, videoName, chapterId);
		if(video.size() > 0){
			return video.get(0);
		}
		return null;
	}

	public List<Video> findVideosByChapterId(Integer chapterId) {
		String hql = "from Video v where v.chapter.chapterId = ?";
		List<Video> videos = (List<Video>) this.getHibernateTemplate().find(hql, chapterId);
		if(videos.size() > 0){
			return videos;
		}
		return null;
	}

	public Course findCourseById(Integer courseId) {
		String hql = "from Course c where c.courseId = ?";
		List<Course> courses = (List<Course>) this.getHibernateTemplate().find(hql, courseId);
		if(courses.size() > 0){
			return courses.get(0);
		}
		return null;
	}

	public void updateCourse(Course findCourse) {
		this.getHibernateTemplate().update(findCourse);
	}

	public Chapter findChapterById(Integer chapterId) {
		String hql = "from Chapter c where c.chapterId = ?";
		List<Chapter> chapters = (List<Chapter>) this.getHibernateTemplate().find(hql, chapterId);
		if(chapters.size() > 0){
			return chapters.get(0);
		}
		return null;
	}

	public void updateChapter(Chapter findChapter) {
		this.getHibernateTemplate().update(findChapter);
	}

	public Video findVideoById(Integer videoId) {
		String hql = "from Video v where v.videoId = ?";
		List<Video> videos = (List<Video>) this.getHibernateTemplate().find(hql, videoId);
		if(videos.size() > 0){
			return videos.get(0);
		}
		return null;
	}

	public void updateVideo(Video video) {
		this.getHibernateTemplate().update(video);
	}

	public void deleteCourse(Course c) {
		this.getHibernateTemplate().delete(c);
	}

	public void deleteChapter(Chapter c) {
		this.getHibernateTemplate().delete(c);
	}

	public void deleteVideo(Video v) {
		this.getHibernateTemplate().delete(v);
	}

	public List<Course> findAllCourses() {
		String hql = "from Course";
		List<Course> courses= (List<Course>) this.getHibernateTemplate().find(hql);
		if(courses.size() > 0){
			return courses;
		}
		return null;
	}

	public Video findVideoByChapterId(Integer chapterId) {
		String hql = "from Video v where v.chapter.chapterId = ? ";
		List<Video> videoList = (List<Video>) this.getHibernateTemplate().find(hql, chapterId);
		if(videoList.size() > 0){
			return videoList.get(0);
		}
		return null;
	}

	public List<Course> findAllCoursesByClassify(String classify, String courseStatus) {
		String hql = "from Course c where c.classify = ? and c.status = ? ";
		List<Course> courseList = (List<Course>) this.getHibernateTemplate().find(hql, classify, courseStatus);
		if(courseList.size() > 0){
			return courseList;
		}
		return null;
	}

	public List<Course> findAllCoursesByStatus(String status) {
		String hql = "from Course c where c.status = ? ";
		List<Course> courseList = (List<Course>) this.getHibernateTemplate().find(hql, status);
		if(courseList.size() > 0){
			return courseList;
		}
		return null;
	}




}
