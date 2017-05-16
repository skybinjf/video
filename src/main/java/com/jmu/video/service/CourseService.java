package com.jmu.video.service;

import java.util.List;

import com.jmu.video.entity.Chapter;
import com.jmu.video.entity.Course;
import com.jmu.video.entity.Teacher;
import com.jmu.video.entity.Video;

public interface CourseService {
	/**
	 * 根据课程名查找课程
	 * @param courseName
	 * @return Course
	 */
	Course findCourseByName(String courseName);
	/**
	 * 添加课程
	 * @param course
	 * @param teacher
	 * @return 课程ID
	 */
	int addCourse(Course course, Teacher teacher);
	/**
	 * 查找教师所有的课程
	 * @return List<Course>
	 */
	List<Course> findAllCoursesByTeacherId(Integer teacherId);
	/**
	 * 保存章节
	 * @param chapter
	 */
	void saveChapter(Chapter chapter);
	
	/**
	 * 根据课程的ID来查找章节
	 * @param courseId
	 * @return
	 */
	List<Chapter> findAllChapters(Integer courseId);
	/**
	 * 根据章节的名称来查找章节
	 * @param chapterName
	 * @return
	 */
	Chapter findChapterByName(String chapterName);
	/**
	 * 保存视频
	 * @param video
	 */
	void saveVideo(Video video);
	/**
	 * 根据视频名和章节ID来查找视频
	 * @param videoName
	 * @param chapterId
	 * @return
	 */
	Video findVideoByNameAndChapterId(String videoName, Integer chapterId);
	/**
	 * 通过章节的ID来查找该章节的所有视频
	 * @param integer
	 * @return
	 */
	List<Video> findVideosByChapterId(Integer chapterId);
	/**
	 * 通过章节的ID来查找该章节的一个视频
	 * @param integer
	 * @return
	 */
	Video findVideoByChapterId(Integer chapterId);
	
	Course findCourseById(Integer courseId);
	
	void updateCourse(Course findCourse);
	
	Chapter findChapterById(Integer chapterId);
	
	void updateChapter(Chapter findChapter);
	
	Video findVideoById(Integer videoId);
	
	void updateVideo(Video video);
	
	void deleteCourse(Course c);
	
	void deleteChapter(Chapter c);
	
	void deleteVideo(Video v);
	
	List<Course> findAllCourses();
	/**
	 * 审核课程
	 * @param courseId
	 */
	void checkCourse(Integer courseId);
	/**
	 * 分类查找课程
	 * @param classify
	 * @return
	 */
	List<Course> findAllCoursesByClassify(String classify);
	
	List<Course> findAllCoursesByStatus(String status);
	
}
