package com.jmu.video.entity;

public class Video {
	private Integer videoId;
	private String title;
	private String path; //视频路径
	private String uploadContentType; //视频类型
	private String uploadFileName; //文件名
	
	private Chapter chapter;
	
	public Integer getVideoId() {
		return videoId;
	}
	public void setVideoId(Integer videoId) {
		this.videoId = videoId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public Chapter getChapter() {
		return chapter;
	}
	public void setChapter(Chapter chapter) {
		this.chapter = chapter;
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
	public Video() {
		super();
	}
	public Video(String title, String path, String uploadContentType,
			String uploadFileName, Chapter chapter) {
		super();
		this.title = title;
		this.path = path;
		this.uploadContentType = uploadContentType;
		this.uploadFileName = uploadFileName;
		this.chapter = chapter;
	}
}
