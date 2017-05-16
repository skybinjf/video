package com.jmu.video.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * 用户实体类
 *
 * @author Sky
 * @date 2017年3月20日 上午10:39:48
 */
public class User {
	
	private Integer userId;
	private String userName;
	private String password;
	private String sex;
	private String email;
	private String address;
	private String phone; 
	private String vocation; //职业
	private String status; //状态
	private String intro; //简介
	private String school;
	private String img;
	
	private Set<Teacher> teachers = new HashSet<Teacher>();
	
	public Set<Teacher> getTeachers() {
		return teachers;
	}
	public void setTeachers(Set<Teacher> teachers) {
		this.teachers = teachers;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getVocation() {
		return vocation;
	}
	public void setVocation(String vocation) {
		this.vocation = vocation;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public String getSchool() {
		return school;
	}
	public void setSchool(String school) {
		this.school = school;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	@Override
	public String toString() {
		return "User [userId=" + userId + ", userName=" + userName
				+ ", password=" + password + ", sex=" + sex + ", email="
				+ email + ", address=" + address + ", phone=" + phone
				+ ", vocation=" + vocation + ", status=" + status + ", intro="
				+ intro + ", school=" + school + ", img=" + img + ", teachers="
				+ teachers + "]";
	}
	
}
