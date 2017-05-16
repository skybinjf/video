package com.jmu.video.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.jmu.video.dao.UserDao;
import com.jmu.video.entity.Admin;
import com.jmu.video.entity.Teacher;
import com.jmu.video.entity.User;
import com.jmu.video.service.UserService;

/**
 * 业务层 UserService类
 *
 * @author Sky
 * @date 2017年3月20日 上午11:03:57
 */
@Transactional
public class UserServiceImpl implements UserService {
	
	private static final Logger log = LoggerFactory.getLogger(UserServiceImpl.class);
	private UserDao userDao;

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	
	@Override
	public User findUserByName(String userName) {
		log.info("userService....");
		return userDao.findUserByName(userName);
	}

	@Override
	public int saveUser(User user) {
		user.setVocation("student");
		user.setStatus("学生");
		return userDao.saveUser(user);
	}

	public void updateUser(User user) {
		if(user != null){
			log.info("UserServiceImpl updateUser..." + user.getUserName());
			User findUser = userDao.findUserById(user.getUserId());
			findUser.setUserName(user.getUserName());
			findUser.setSex(user.getSex());
			findUser.setEmail(user.getEmail());
			findUser.setAddress(user.getAddress());
			findUser.setPhone(user.getPhone());
			findUser.setVocation(user.getVocation());
			findUser.setIntro(user.getIntro());
			userDao.updateUser(findUser);
		}
	}

	@Override
	public void updatePassword(User user) {
		if(user != null){
			log.info("UserServiceImpl updatePassword..." + user.toString());
			User findUser = userDao.findUserById(user.getUserId());
			findUser.setPassword(user.getPassword());
			userDao.updateUser(findUser);
		}
	}

	public Teacher findTeacherById(Integer userId) {
		return userDao.findTeacherById(userId);
	}

	public Admin findAdminById(Integer userId) {
		return userDao.findAdminById(userId);
	}

	public List<Teacher> findAllTeachers() {
		return userDao.findAllTeachers();
	}

	@Override
	public void deleteTeacher(Teacher teacher) {
		userDao.deleteTeacher(teacher);
	}

	public User findUserById(Integer userId) {
		return userDao.findUserById(userId);
	}

	@Override
	public void deleteUser(User findUser) {
		userDao.deleteUser(findUser);
	}

	@Override
	public Teacher findTeacherByTeacherId(Integer teacherId) {
		return userDao.findTeacherByTeacherId(teacherId);
	}

	public void saveTeacher(Teacher teacher) {
		userDao.saveTeacher(teacher);
	}

	@Override
	public void saveTeacher(User user) {
		userDao.saveUser(user);
		User user1 = userDao.findUserByName(user.getUserName());
		user1.setVocation("teacher");
		Teacher teacher = new Teacher();
		teacher.setUser(user1);
		userDao.saveTeacher(teacher);
	}

}
