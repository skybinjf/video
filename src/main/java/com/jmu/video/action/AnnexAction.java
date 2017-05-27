package com.jmu.video.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.jmu.video.entity.Annex;
import com.jmu.video.entity.Course;
import com.jmu.video.entity.Message;
import com.jmu.video.entity.SubMessage;
import com.jmu.video.entity.Teacher;
import com.jmu.video.entity.Test;
import com.jmu.video.entity.User;
import com.jmu.video.service.AnnexService;
import com.jmu.video.service.CourseService;
import com.jmu.video.service.UserService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
/**
 * 附加的action，实现课件上传下载，添加测试和学生留言等action
 *
 * @author Sky
 * @date 2017年5月3日 下午8:45:51
 */
public class AnnexAction extends ActionSupport implements ModelDriven<Test> {
	
	//---------------课件上传下载Begin---------------
	private File upload;
	private String uploadContentType; //上传文件类型
	private String uploadFileName; //上传文件名
	private String savePath;
	private String courseName;
	
	private String inputPath; //文件下载
	private String fileName; //文件下载名
	//---------------课件上传下载End---------------
	
	////////////////////////////////////////////
	
	//---------------课程测试Begin---------------
	private Test test = new Test();
	private int titleNum; //获取测试题目个数
	//---------------课程测试End---------------
	
	////////////////////////////////////////////
	
	//---------------留言Begin---------------
	private String message;
	private String fromWho;
	private String toWho;
	private String messageId;
	//---------------留言End-----------------
	
	private AnnexService annexService;
	private CourseAction courseAction;
	private CourseService courseService;
	private UserService userService;
	
	
	private Integer grade; //课程评分
	
	
	ActionContext context = ActionContext.getContext();
	Map<String, Object> session = context.getSession();
	Map<String, Object> request = (Map<String, Object>) context.get("request");
	
	/*
	 * ------------------------以下是课程评分------------------------
	 */
	
	public String gradePage(){
		HttpServletRequest httpServletRequest = ServletActionContext.getRequest();
		String courseId = httpServletRequest.getParameter("courseId");
		Course c = courseService.findCourseById(new Integer(courseId));
		request.put("course", c);
		return "gradePage";
	}
	
	public String submitGrade(){
		HttpServletRequest httpServletRequest = ServletActionContext.getRequest();
		String courseId = httpServletRequest.getParameter("courseId");
		Course c = courseService.findCourseById(new Integer(courseId));
		System.out.println(grade);
		
		return "submitGrade";
	}
	
	/*
	 * ------------------------以下是留言------------------------
	 */
	
	public String studentScanSubMessage(){
		User u = (User) session.get("user");
		if(u != null){
			List<SubMessage> subMessageList = annexService.findAllSubMessageByUserName(u.getUserName());
			List<Message> messageList = annexService.findAllMessageByFromWhoName(u.getUserName());
			request.put("subMessageList", subMessageList);
			request.put("messageList", messageList);
		}
		return "studentScanSubMessage";
	}
	
	public String revertMessage(){
		Message m = annexService.findMessageById(new Integer(messageId));
		SubMessage s = new SubMessage();
		s.setContent(message);
		s.setFromWho(fromWho);
		s.setMessageDate(new Date());
		s.setToWho(toWho);
		s.setMessage(m);
		s.setStatus("已读");
		annexService.saveSubMessage(s);
		return "revertMessageSuccess";
	}
	
	public String subMessageDetail(){
		HttpServletRequest httpServletRequest = ServletActionContext.getRequest();
		String messageId = httpServletRequest.getParameter("messageId");
		Message m = annexService.findMessageById(new Integer(messageId));
		m.setStatus("已读");
		annexService.updateMessage(m);
		List<SubMessage> subMessageList = annexService.findAllSubMessageByMessageId(new Integer(messageId));
		request.put("subMessageList", subMessageList);
		return "subMessageDetail";
	}
	
	/**
	 * 教师查看自己的留言信息
	 * @return
	 */
	public String teacherScanMessage(){
		Teacher t = (Teacher) session.get("teacher");
		if(t != null && !"".equals(t)){
			//根据接收者来查找所有留言
			List<Message> messageList = annexService.findAllMessageByToWho(t.getUser().getUserName());
			request.put("messageList", messageList);
		}
		return "teacherScanMessage";
	}
	
	/**
	 * 教师回复留言
	 * @return
	 */
	public String teacherRevert(){
		Message m = annexService.findMessageById(new Integer(messageId));
		
		Teacher t = (Teacher) session.get("teacher");
		fromWho = t.getUser().getUserName();
		
		SubMessage subMessage = new SubMessage();
		subMessage.setContent(message);
		subMessage.setFromWho(fromWho);
		subMessage.setMessage(m);
		subMessage.setStatus("已读");
		subMessage.setToWho(toWho);
		subMessage.setMessageDate(new Date());
		annexService.saveSubMessage(subMessage);
		
		return "teacherRevertSuccess";
	}
	
	public String deleteMessage(){
		HttpServletRequest httpServletRequest = ServletActionContext.getRequest();
		String messageId = httpServletRequest.getParameter("messageId");
		
		Message m = new Message();
		m.setMessageId(new Integer(messageId));
		annexService.deleteMessage(m);
		
		return "deleteMessageSuccess";
	}
	
	/**
	 * 给教师留言
	 * @return
	 */
	public String sendMessageToTeacher(){
		User u = (User) session.get("user");
		if(u != null){
			fromWho = u.getUserName();
			Message m = new Message();
			m.setContent(message);
			m.setFromWho(fromWho);
			m.setMessageDate(new Date());
			m.setStatus("未读");
			m.setToWho(toWho);
			annexService.saveMessage(m);
		}
		
		return "sendMessageToTeacherSuccess";
	}
	
	/*
	 * ------------------------以下是课程测试------------------------
	 */
	public String addTestPage(){
		Teacher t = (Teacher) session.get("teacher");
		List<Course> courseList = courseService.findAllCoursesByTeacherId(t.getTeacherId());
		request.put("courseList", courseList);
		
		return "addTestPage";
	}
	
	public String saveTest(){
		Course c = courseService.findCourseByName(courseName);
		test.setCourse(c);
		annexService.saveTest(test);
		return "saveTestSuccess";
	}
	
	public String testPage(){
		HttpServletRequest httpServletRequest = ServletActionContext.getRequest();
		String courseId = httpServletRequest.getParameter("courseId");
		Course c = courseService.findCourseById(new Integer(courseId));
		request.put("course", c);
		List<Test> testList = annexService.findAllTestByCourseId(new Integer(courseId));
		request.put("testList", testList);
		return "testPage";
	}
	
	
	/*
	 * ------------------------以下是课件上传下载------------------------
	 */
	
	public String download(){
		User u = (User) session.get("user");
		if(u != null){
			return "success";
		}
		request.put("tip", "登陆后才能下载！");
		return "input";
	}
	
	/**
	 * 跳转到下载页面，把课程和课程相关的文件显示出来。
	 * @return
	 */
	public String downloadPage(){
		HttpServletRequest httpServletRequest = ServletActionContext.getRequest();
		String courseId = httpServletRequest.getParameter("courseId");
		
		Course c = courseService.findCourseById(new Integer(courseId));
		List<Annex> annexList = annexService.findAllAnnexByCourseId(new Integer(courseId));
//		Annex a = annexService.findAnnexByCourseId(new Integer(courseId));
		/*if(a != null){
			
		}*/
		request.put("course", c);
		request.put("annexList", annexList);
		
		return "courseAnnexDownload";
	}
	
	/**
	 * 跳转到上传的页面，并把课程request到页面中
	 * @return
	 */
	public String uploadAnnexPage(){
		courseAction.findAllCoursesByTeacherId();
		return "uploadAnnexPage";
	}
	
	public String uploadAnnex(){
		Course c = courseService.findCourseByName(courseName);
		try {
			uploadFile();
		} catch (Exception e) {
			addActionError("上传文件出错！");
			e.printStackTrace();
		}
		Annex a = new Annex();
		a.setCourse(c);
		a.setPath(getSavePath());
		a.setUploadContentType(uploadContentType);
		a.setUploadFileName(uploadFileName);
		annexService.saveAnnex(a);
		return "uploadSuccess";
	}
	
	/**
	 * 上传文件
	 * @throws Exception
	 */
	private void uploadFile() throws Exception{
		String path = ServletActionContext.getServletContext().getRealPath("/annex"); //相对路径
		String absolutePath = "E:\\GitHub\\video\\video\\src\\main\\webapp\\annex";
//		FileOutputStream fos  = new FileOutputStream(path + "\\" + uploadFileName);
		
		FileOutputStream fos  = new FileOutputStream(absolutePath + "\\" + uploadFileName);
		FileInputStream fis = new FileInputStream(getUpload());
		byte[] buffer = new byte[1024*1024*10];
		int len = 0;
		while ((len = fis.read(buffer)) > 0) {
			fos.write(buffer, 0, len);
		}
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	public void setAnnexService(AnnexService annexService) {
		this.annexService = annexService;
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
	public void setCourseAction(CourseAction courseAction) {
		this.courseAction = courseAction;
	}
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	public CourseService getCourseService() {
		return courseService;
	}
	public void setCourseService(CourseService courseService) {
		this.courseService = courseService;
	}

	public String getInputPath() {
		return inputPath;
	}
	public void setInputPath(String inputPath) {
		this.inputPath = inputPath + "/" + fileName;
	}

	//文件下载
	public InputStream getTargetFile() throws IOException{
//		String path = ServletActionContext.getServletContext().getRealPath("/image");
//		String filePath = path + "\\" +fileName;
//		File file = new File(filePath);
//		return FileUtils.openInputStream(file);
		//根据文件的路径获取流信息
		return ServletActionContext.getServletContext().getResourceAsStream(inputPath);
	}
	public String getFileName() {
		try {
			return new String(fileName.getBytes(), "ISO8859-1");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return null;
		}
	}
	public void setFileName(String fileName) {
		try {
			this.fileName =  new String(fileName.getBytes("ISO8859-1"), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}

	@Override
	public Test getModel() {
		return test;
	}

	public int getTitleNum() {
		return titleNum;
	}
	public void setTitleNum(int titleNum) {
		this.titleNum = titleNum;
	}

	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getFromWho() {
		return fromWho;
	}
	public void setFromWho(String fromWho) {
		this.fromWho = fromWho;
	}
	public String getToWho() {
		return toWho;
	}
	public void setToWho(String toWho) {
		this.toWho = toWho;
	}
	public String getMessageId() {
		return messageId;
	}
	public void setMessageId(String messageId) {
		this.messageId = messageId;
	}
	public Integer getGrade() {
		return grade;
	}
	public void setGrade(Integer grade) {
		this.grade = grade;
	}
	
	
}
