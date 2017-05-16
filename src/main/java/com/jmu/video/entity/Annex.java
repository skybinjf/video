package com.jmu.video.entity;
/**
 * 课程附件（资料）类
 *
 * @author Sky
 * @date 2017年5月2日 上午10:28:52
 */
public class Annex {
	
	private Integer annex;
	private String path; //附件路径
	private String uploadContentType; //附件类型
	private String uploadFileName; //附件名称
	
	private Course course;

	public Integer getAnnex() {
		return annex;
	}
	public void setAnnex(Integer annex) {
		this.annex = annex;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getUploadContentType() {
		return uploadContentType;
	}
	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}
	public String getUploadFileName() {
		return uploadFileName;
	}
	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}
	public Course getCourse() {
		return course;
	}
	public void setCourse(Course course) {
		this.course = course;
	}
	
}
