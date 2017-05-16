package com.jmu.video.service;

import java.util.List;

import javax.transaction.Transactional;

import com.jmu.video.entity.Admin;
import com.jmu.video.entity.Teacher;
import com.jmu.video.entity.User;

/**
 * 业务层 UserService 接口
 *
 * @author Sky
 * @date 2017年3月20日 上午11:04:33
 */
@Transactional
public interface UserService {

	User findUserByName(String userName);

	int saveUser(User user);

	void updateUser(User user);

	void updatePassword(User user);

	Teacher findTeacherById(Integer userId);

	Admin findAdminById(Integer userId);

	List<Teacher> findAllTeachers();

	void deleteTeacher(Teacher teacher);

	User findUserById(Integer userId);

	void deleteUser(User findUser);

	Teacher findTeacherByTeacherId(Integer integer);

	void saveTeacher(Teacher teacher);

	void saveTeacher(User user);

}
