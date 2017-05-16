package com.jmu.video.dao;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;

import com.jmu.video.entity.Admin;
import com.jmu.video.entity.Teacher;
import com.jmu.video.entity.User;

/**
 * dao类
 *
 * @author Sky
 * @date 2017年3月20日 上午11:03:37
 */
public class UserDao extends HibernateDaoSupport {
	
	private static final Logger log = LoggerFactory.getLogger(UserDao.class);
	
	public User findUserById(int id){
		String hql = "from User u where u.userId = ?";
		List<User> users = (List<User>) this.getHibernateTemplate().find(hql, id);
		if(users.size() > 0){
			return users.get(0);
		}
		return null;
	}

	public User findUserByName(String userName) {
		log.info("findUserByName...");
		String hql = "from User u where u.userName=?";
		List<User> users = (List<User>) this.getHibernateTemplate().find(hql, userName);
		if(users.size() > 0){
			return users.get(0);
		}
		return null;
	}
	public int saveUser(User user){
		log.info("saveUser...");
		return (Integer) this.getHibernateTemplate().save(user);
	}
	public void updateUser(User user) {
		log.info("userDao updateUser..." + user);
		this.getHibernateTemplate().update(user);
	}

	public Teacher findTeacherById(Integer userId) {
		String hql = "from Teacher t where t.user.userId = ?";
		List<Teacher> teachers = (List<Teacher>) this.getHibernateTemplate().find(hql, userId);
		if(teachers.size() > 0){
			return teachers.get(0);
		}
		return null;
	}

	public Admin findAdminById(Integer userId) {
		String hql = "from Admin a where a.user.userId = ?";
		List<Admin> admins = (List<Admin>) this.getHibernateTemplate().find(hql, userId);
		if(admins.size() > 0){
			return admins.get(0);
		}
		return null;
	}

	public List<Teacher> findAllTeachers() {
		String hql = "from Teacher t left join fetch t.user";
		List<Teacher> teachers = (List<Teacher>) this.getHibernateTemplate().find(hql);
		if(teachers.size() > 0){
			return teachers;
		}
		return null;
	}

	public void deleteTeacher(Teacher teacher) {
		this.getHibernateTemplate().delete(teacher);
		
	}

	public void deleteUser(User user) {
		this.getHibernateTemplate().delete(user);
	}

	public Teacher findTeacherByTeacherId(Integer teacherId) {
		String hql = "from Teacher t where t.teacherId = ?";
		List<Teacher> teachers = (List<Teacher>) this.getHibernateTemplate().find(hql, teacherId);
		if(teachers.size() > 0){
			return teachers.get(0);
		}
		return null;
	}

	public void saveTeacher(Teacher teacher) {
		this.getHibernateTemplate().save(teacher);
	}



}
