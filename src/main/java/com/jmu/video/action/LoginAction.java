package com.jmu.video.action;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.jmu.video.entity.Admin;
import com.jmu.video.entity.Teacher;
import com.jmu.video.entity.User;
import com.jmu.video.service.UserService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
/**
 * 用户登陆处理类
 *
 * @author Sky
 * @date 2017年3月20日 上午11:04:59
 */
public class LoginAction extends ActionSupport implements ModelDriven<User> {
	
	private static final long serialVersionUID = 1L;
	
	private static final Logger log = LoggerFactory.getLogger(ActionSupport.class);
	private User user = new User();
	private UserService userService;
	private String sign;
	User findUser = user;
	
	ActionContext context = ActionContext.getContext();
	Map<String, Object> session = context.getSession();
	
	public String execute(){
		log.info("loginAction...userName:" + user.getUserName());
		log.info("sign:" + sign);
		if(isLoginSuccess()){
			//是老师登陆时，把老师的信息放入到session中
			if("teacher".equals(sign)){
				Teacher teacher = userService.findTeacherById(findUser.getUserId());
				session.put("teacher", teacher);
			}else if("admin".equals(sign)){
				Admin admin = userService.findAdminById(findUser.getUserId());
				session.put("admin", admin);
			}
			session.put("user", findUser);
			session.put("sign", sign);
			return "success";
		}
		return "input";
	}
	
	private boolean isLoginSuccess(){
		findUser = userService.findUserByName(user.getUserName());
		if(findUser == null){
			return false;
		}else {
			if(user.getUserName().equals(findUser.getUserName()) && user.getPassword().equals(findUser.getPassword())
					&& sign.equals(findUser.getVocation())){
				return true;
			}
			return false;
		}
	}

	@Override
	public User getModel() {
		return user;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	public String getSign() {
		return sign;
	}
	public void setSign(String sign) {
		this.sign = sign;
	}
}
