package com.jmu.video.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.jmu.video.entity.Chapter;
import com.jmu.video.entity.Course;
import com.jmu.video.entity.Teacher;
import com.jmu.video.entity.Video;
import com.jmu.video.service.CourseService;
import com.jmu.video.service.UserService;
import com.jmu.video.util.ComparatorChapter;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class CourseAction extends ActionSupport implements ModelDriven<Course> {
	
	private Course course = new Course();
	private CourseService courseService;
	private UserService userService;
	Course findCourse = course;
	
	private String chapterName;  //添加章节的章节名
	private String title; //视频标题
	private File upload;
	private String uploadContentType; //上传文件类型
	private String uploadFileName; //上传文件名
	private String savePath;
	boolean flag = true; //上传视频和章节时判断是否为空
	
	ActionContext context = ActionContext.getContext();
	Map<String, Object> session = context.getSession();
	Map<String, Object> request = (Map<String, Object>) context.get("request");
	
	Teacher teacher = (Teacher) session.get("teacher");
	
	public String videoPlay(){
		HttpServletRequest httpServletRequest = ServletActionContext.getRequest();
		String videoId = httpServletRequest.getParameter("videoId");
		Video v = courseService.findVideoById(new Integer(videoId));
		request.put("video", v);
		return "videoPlay";
	}
	
	/**
	 * 分类，查找的是分类的课程并且已经审核通过的
	 * @return
	 */
	public String classify(){
		HttpServletRequest httpServletRequest = ServletActionContext.getRequest();
		String classify = httpServletRequest.getParameter("flag");
		List<Course> courseList = courseService.findAllCoursesByClassify(classify);
		request.put("courses", courseList);
		return "classify";
	}
	
	/**
	 * 查找该课程并返回该课程的详细页面
	 * @return
	 */
	public String courseScan(){
		HttpServletRequest httpServletRequest = ServletActionContext.getRequest();
		String courseId = httpServletRequest.getParameter("courseId");
		Course course1 = courseService.findCourseById(new Integer(courseId));
		request.put("course", course1);
		
		Integer teacherId = course1.getTeacher().getTeacherId();
		Teacher teacher1 = userService.findTeacherByTeacherId(teacherId);
		request.put("teacher", teacher1);
		
		List<Chapter> chapters = courseService.findAllChapters(new Integer(courseId));
		//对list集合进行排序
//		ComparatorChapter comparatorChapter = new ComparatorChapter();
//		Collections.sort(chapters, comparatorChapter);
		request.put("chapters", chapters);
		
		List<Video> videoList = new ArrayList<Video>();
		Video v;
		
		for(Chapter c : chapters){
			v = courseService.findVideoByChapterId(c.getChapterId());
			videoList.add(v);
		}
		request.put("videos", videoList);
		System.out.println("course:" + course1);
		return "courseScanSuccess";
	}
	
	/**
	 * 添加课程
	 * @return
	 */
	public String addCourse(){
		findCourse = courseService.findCourseByName(course.getCourseName());
		if(findCourse != null){
			System.out.println("已存在该课程！");
			return "addCourse";
		}else {
			int CourseId = courseService.addCourse(course, teacher);
		}
		return "addCourseSuccess";
	}
	
	public String findAllCourses(){
		List<Course> courses = courseService.findAllCourses();
		request.put("courses", courses);
		return "findAllCoursesSuccess";
	}
	
	public String findAllCoursesByStatus(){
		HttpServletRequest httpServletRequest = ServletActionContext.getRequest();
		String status = httpServletRequest.getParameter("status");
//		System.out.println("status:" + status);
		List<Course> courses = courseService.findAllCoursesByStatus(status);
		request.put("courses", courses);
		return "findAllCoursesByStatus";
	}
	
	public String checkCourse(){
		HttpServletRequest httpServletRequest = ServletActionContext.getRequest();
		String courseId = httpServletRequest.getParameter("courseId");
		System.out.println("courseID:" + courseId);
		courseService.checkCourse(new Integer(courseId));
		return "checkCourseSuccess";
	}
	
	/**
	 * 根据教师的ID查找该教师的所有课程
	 * @return List<Course>
	 */
	public String findAllCoursesByTeacherId(){
		List<Course> courses = courseService.findAllCoursesByTeacherId(teacher.getTeacherId());
		request.put("courses", courses);
		return "findAllCoursesByTeacherIdSuccess";
	}
	
	/**
	 * 显示章节的详情
	 * @return
	 */
	public String chapterDetail(){
		HttpServletRequest httpServletRequest = ServletActionContext.getRequest();
		String courseId = httpServletRequest.getParameter("courseId");
//		System.out.println("courseId:" + courseId);
		List<Chapter> chapters = courseService.findAllChapters(new Integer(courseId));
		request.put("chapters", chapters);
		return "chapterDetailSuccess";
	}
	/**
	 * 因为教师页面和管理员页面左侧菜单不一样，所以设置了两个方法来返回不同的结果来跳转到不同的详情页面
	 * @return
	 */
	public String adminChapterDetail(){
		HttpServletRequest httpServletRequest = ServletActionContext.getRequest();
		String courseId = httpServletRequest.getParameter("courseId");
		List<Chapter> chapters = courseService.findAllChapters(new Integer(courseId));
		request.put("chapters", chapters);
		return "adminChapterDetailSuccess";
	}
	
	/**
	 * 显示视频详情
	 * @return
	 */
	public String videoDetail(){
		HttpServletRequest httpServletRequest = ServletActionContext.getRequest();
		String chapterId = httpServletRequest.getParameter("chapterId");
//		System.out.println("chapterID:" + chapterId);
		List<Video> videos = courseService.findVideosByChapterId(new Integer(chapterId));
//		System.out.println(videos.toString());
		request.put("videos", videos);
		return "videoDetailSuccess";
	}
	
	/**
	 * 因为教师页面和管理员页面左侧菜单不一样，所以设置了两个方法来返回不同的结果来跳转到不同的详情页面
	 * @return
	 */
	public String adminVideo(){
		HttpServletRequest httpServletRequest = ServletActionContext.getRequest();
		String chapterId = httpServletRequest.getParameter("chapterId");
		List<Video> videos = courseService.findVideosByChapterId(new Integer(chapterId));
		request.put("videos", videos);
		return "adminVideoSuccess";
	}
	
	/**
	 * 修改页面并回显数据
	 * @return
	 */
	public String editCourse(){
		HttpServletRequest httpServletRequest = ServletActionContext.getRequest();
		String courseId = httpServletRequest.getParameter("courseId");
//		System.out.println("courseID:" + courseId);
		Course course2 = courseService.findCourseById(new Integer(courseId));
		request.put("course", course2);
		return "editCourseSuccess";
	}
	
	/**
	 * 更新课程
	 * @return
	 */
	public String updateCourse(){
//		System.out.println("course:" + course);
		HttpServletRequest httpServletRequest = ServletActionContext.getRequest();
		String courseId = httpServletRequest.getParameter("courseId");
		
		Course findCourse = courseService.findCourseById(new Integer(courseId));
		findCourse.setCourseName(course.getCourseName());
		findCourse.setPeriod(course.getPeriod());
		findCourse.setClassify(course.getClassify());
		findCourse.setIntro(course.getIntro());
		findCourse.setRemark(course.getRemark());
		courseService.updateCourse(findCourse);
		System.out.println("更新课程成功！");
		return "updateCourseSuccess";
	}
	/**
	 * 编辑章节页面，并回显数据
	 * @return
	 */
	public String editChapter(){
		HttpServletRequest httpServletRequest = ServletActionContext.getRequest();
		String chapterId = httpServletRequest.getParameter("chapterId");
		Chapter findChapter = courseService.findChapterById(new Integer(chapterId));
		request.put("chapter", findChapter);
		return "editChapterSuccess";
	}
	
	public String updateChapter(){
		HttpServletRequest httpServletRequest = ServletActionContext.getRequest();
		String chapterId = httpServletRequest.getParameter("chapterId");

		Chapter findChapter = courseService.findChapterById(new Integer(chapterId));
		findChapter.setChapterName(chapterName);
		courseService.updateChapter(findChapter);
		
		return "updateChapterSuccess";
	}
	
	public String editVideo(){
		HttpServletRequest httpServletRequest = ServletActionContext.getRequest();
		String videoId = httpServletRequest.getParameter("videoId");
		Video findVideo = courseService.findVideoById(new Integer(videoId));
		request.put("video", findVideo);
		return "editVideoSuccess";
	}
	
	public String updateVideo(){
		HttpServletRequest httpServletRequest = ServletActionContext.getRequest();
		String videoId = httpServletRequest.getParameter("videoId");
		
		Video findVideo = courseService.findVideoById(new Integer(videoId));
		findVideo.setTitle(title);
		findVideo.setUploadContentType(uploadContentType);
		findVideo.setUploadFileName(uploadFileName);
		
		courseService.updateVideo(findVideo);
		uploadVideo();
		return "updateVideoSuccess";
	}
	
	public String deleteCourse(){
		HttpServletRequest httpServletRequest = ServletActionContext.getRequest();
		String courseId = httpServletRequest.getParameter("courseId");
		Course c = new Course();
		c.setCourseId(new Integer(courseId));
		courseService.deleteCourse(c);
		return "deleteSuccess";
	}
	public String deleteChapter(){
		HttpServletRequest httpServletRequest = ServletActionContext.getRequest();
		String chapterId = httpServletRequest.getParameter("chapterId");
		Chapter c = new Chapter();
		c.setChapterId(new Integer(chapterId));
		courseService.deleteChapter(c);
		
		return "deleteSuccess";
	}
	public String deleteVideo(){
		HttpServletRequest httpServletRequest = ServletActionContext.getRequest();
		String videoId = httpServletRequest.getParameter("videoId");
		Video v = new Video();
		v.setVideoId(new Integer(videoId));
		courseService.deleteVideo(v);
		return "deleteSuccess";
	}
	
	/*public String addChapter(){
		//获取前台select中的值
		HttpServletRequest httpServletRequest = ServletActionContext.getRequest();
		String courseName = (String) httpServletRequest.getAttribute("courseName");
		
		System.out.println("课程：" + courseName);
		System.out.println("章节：" + chapterName);
		System.out.println("视频名：" + videoName);
		
		//根据前台的课程名来查找课程对象
		Course course1 = courseService.findCourseByName(courseName); 
		Chapter chapter = new Chapter(chapterName, course1);
		courseService.saveChapter(chapter);
		
		return "addChapterSuccess";
	}*/
	
	public String upload(){
		Chapter chapter = addChapter(); //添加章节
		if(flag){
			addVideo(chapter);
			if(flag){
				return "uploadSuccess";
			}else{
				return "uploadFail";
			}
		}else{
			return "uploadFail";
		}
	}
	/**
	 * 上传文件
	 */
	private void uploadVideo(){
		try {
			String path = ServletActionContext.getServletContext().getRealPath("/video"); //相对路径
			String absolutePath = "E:\\workspace\\video\\src\\main\\webapp\\video";
//			FileOutputStream fos  = new FileOutputStream(path + "\\" + uploadFileName);
			FileOutputStream fos  = new FileOutputStream(absolutePath + "\\" + uploadFileName);
			FileInputStream fis = new FileInputStream(getUpload());
			byte[] buffer = new byte[1024*1024*10];
			int len = 0;
			while ((len = fis.read(buffer)) > 0) {
				fos.write(buffer, 0, len);
			}
		} catch (FileNotFoundException e) {
			addActionError("文件上传出错！");
			flag = false;
			e.printStackTrace();
		} catch (IOException e) {
			flag = false;
			e.printStackTrace();
		}
	}
	
	private void addVideo(Chapter chapter) {
		uploadVideo();
		
		Video video = new Video(title, getSavePath(), uploadContentType, uploadFileName, chapter);
		//根据视频标题和章节的ID来确定对象，防止重复提交
		Video video1 = courseService.findVideoByNameAndChapterId(title, chapter.getChapterId());
		if(video1 != null){
			System.out.println("已经存在该视频！");
			flag = false;
		}else {
			courseService.saveVideo(video);
		}
	}
	
	private Chapter addChapter() {
		// 获取前台select中的值
		HttpServletRequest httpServletRequest = ServletActionContext.getRequest();
		String courseName = (String) httpServletRequest.getAttribute("courseName");
		
		//根据前台的课程名来查找课程对象
		Course course1 = courseService.findCourseByName(courseName); 
		Chapter chapter = new Chapter(chapterName, course1);
		Chapter chapter1 = courseService.findChapterByName(chapter.getChapterName());
		if(chapter1 != null){
			System.out.println("已存在该课程的章节！");
			flag = false;
			
		}else{
			courseService.saveChapter(chapter);
		}
		return chapter;
	}
	/**
	 * 教师查看我的课程
	 * @return
	 */
	public String scanMyCourse(){
		Teacher teacher = (Teacher) session.get("teacher");
		List<Course> courses = courseService.findAllCoursesByTeacherId(teacher.getTeacherId());
		if(courses != null){
			request.put("courses", courses);
			return "scanMyCourseSuccess";
		}
		return "fail";
	}
	
	/*public String findAllChapters(){
		Course course1 = courseService.findCourseByName("javaEE");
		if(course1 != null){
			List<Chapter> chapters = courseService.findAllChapters(course1.getCourseId());
			request.put("chapters", chapters);
		}
		return "findChapterSuccess";
	} */

	public void setCourseService(CourseService courseService) {
		this.courseService = courseService; 
	}

	@Override
	public Course getModel() {
		return course;
	}
	
	public String getChapterName() {
		return chapterName;
	}
	public void setChapterName(String chapterName) {
		this.chapterName = chapterName;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public File getUpload() {
		return upload;
	}
	public void setUpload(File upload) {
		this.upload = upload;
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
	public String getSavePath() {
		return ServletActionContext.getServletContext().getRealPath(savePath);
	}
	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
}
