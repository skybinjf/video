package com.jmu.video.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.jmu.video.entity.Teacher;
import com.jmu.video.entity.User;
import com.jmu.video.service.UserService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class UserAction extends ActionSupport implements ModelDriven<User> {
	
	private UserService userService;
	private User user = new User();
	
	ActionContext context = ActionContext.getContext();
	Map<String, Object> session = context.getSession();
	Map<String, Object> request = (Map<String, Object>) context.get("request");
	
	public String getBackPassword(){
		
		System.out.println(user);
		
		return "getBackPasswordSuccess";
	}
	
	/**
	 * 修改密码
	 * @return
	 */
	public String updatePassword(){
		if(user != null){
			User findUser = userService.findUserByName(user.getUserName());
			userService.updatePassword(user);
			if("admin".equals(findUser.getVocation())){
				return "updateAdminPasswordSuccess";
			}else if("teacher".equals(findUser.getVocation())){
				return "updateTeacherPasswordSuccess";
			}else{
				return "updateStudentPasswordSuccess";
			}
		}
		return "updatePasswordFail";
	}
	
	/**
	 * 修改个人信息
	 * @return
	 */
	public String updateUser(){
		userService.updateUser(user);
		session.put("user", user);
		if("admin".equals(user.getVocation())){
			return "updateAdminSuccess";
		}else if("teacher".equals(user.getVocation())){
			return "updateTeacherSuccess";
		}else{
			return "updateStudentSuccess";
		}
	}
	
	public String findAllTeachers(){
		List<Teacher> teachers = userService.findAllTeachers();
		request.put("teachers", teachers);
		return "findAllTeachersSuccess";
	}
	/**
	 * 删除教师，因为teacher表和user表有联级，直接删除user即可
	 * @return
	 */
	public String deleteTeacher(){
		HttpServletRequest httpServletRequest = ServletActionContext.getRequest();
		String teacherId = httpServletRequest.getParameter("teacherId");
		
		Teacher findTeacher = userService.findTeacherByTeacherId(new Integer(teacherId));
		Integer userId = findTeacher.getUser().getUserId();
		User findUser = userService.findUserById(userId);
//		userService.deleteTeacher(findTeacher);
		userService.deleteUser(findUser);
		List<Teacher> teachers = userService.findAllTeachers();
		request.put("teachers", teachers);
		
		return "deleteTeacherSuccess";
	}
	
	public String adminAddTeacher(){
		//如果已经存在该用户，则返回"fail"
		User u = userService.findUserByName(user.getUserName());
		if(u != null){
			return "fail";
		}
		userService.saveTeacher(user);
		return "adminAddTeacherSuccess";
	}
	

	/**
	 * 用户跳转action，实现点击右上角的用户名时根据身份的不同跳转到student、teacher或admin的后台页面
	 * @return
	 */
	public String jump(){
		String sign = (String) session.get("sign");
		if("student".equals(sign)){
			return "student";
		}else if("teacher".equals(sign)){
			return "teacher";
		}else {
			return "admin";
		}
	}
	/**
	 * 退出登陆
	 * @return
	 */
	public String logout(){
		session.remove("user");
		return "logoutSuccess";
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	@Override
	public User getModel() {
		return user;
	}
	
}
