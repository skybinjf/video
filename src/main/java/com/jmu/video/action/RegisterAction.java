package com.jmu.video.action;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.jmu.video.entity.User;
import com.jmu.video.service.UserService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
/**
 * 用户注册处理类
 *
 * @author Sky
 * @date 2017年3月20日 上午11:05:26
 */
public class RegisterAction extends ActionSupport implements ModelDriven<User> {
	
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(RegisterAction.class);
	
	private User user = new User();
	private UserService userService;
	private String inputCode; //输入的验证码
	
	public String execute(){
		
		ActionContext context = ActionContext.getContext();
		Map<String, Object> session = context.getSession();
		
		log.info("inputCode: " + inputCode);
		User findUser = userService.findUserByName(user.getUserName());
		if(findUser != null){
			//已经存在该用户
			log.info("已经存在该用户！");
			return "fail";
		}else{
			if(checkCode(inputCode)){
				int userId = userService.saveUser(user);
				log.info("保存用户成功！用户ID为：" + userId);
				session.put("user", user);
				return "success";
	        }else{
	        	log.info("验证码出错！");
	        	return "input";
	        }
		}
		
	}
	
	 /**
     * 验证验证码是否正确
     * @return true or false
     */
    public boolean checkCode(String inputCode)
    {
        HttpSession session = ServletActionContext.getRequest().getSession();
        String sessioncode = (String)session.getAttribute("checkCode");
        
        if(!inputCode.equals(sessioncode))
        {
            this.addActionError("输入的验证码不正确，请重新输入！");
            return false;
        }
        return true;
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

	public String getInputCode() {
		return inputCode;
	}

	public void setInputCode(String inputCode) {
		this.inputCode = inputCode;
	}
	
}
