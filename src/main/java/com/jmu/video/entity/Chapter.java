package com.jmu.video.entity;
/**
 * 章节类
 *
 * @author Sky
 * @date 2017年4月17日 上午9:34:54
 */
public class Chapter {
	private Integer chapterId;
	private String chapterName;
	private Course course;
	
	public Integer getChapterId() {
		return chapterId;
	}
	public void setChapterId(Integer chapterId) {
		this.chapterId = chapterId;
	}
	public String getChapterName() {
		return chapterName;
	}
	public void setChapterName(String chapterName) {
		this.chapterName = chapterName;
	}
	public Course getCourse() {
		return course;
	}
	public void setCourse(Course course) {
		this.course = course;
	}
	public Chapter(String chapterName, Course course) {
		super();
		this.chapterName = chapterName;
		this.course = course;
	}
	public Chapter() {
		super();
	}
	@Override
	public String toString() {
		return "Chapter [chapterId=" + chapterId + ", chapterName="
				+ chapterName + ", course=" + course + "]";
	}
	
}
