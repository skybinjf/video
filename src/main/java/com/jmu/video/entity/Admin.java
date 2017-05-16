package com.jmu.video.entity;

public class Admin {
	
	private Integer adminId;
	private User user;
	
	public Integer getAdminId() {
		return adminId;
	}
	public void setAdminId(Integer adminId) {
		this.adminId = adminId;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	@Override
	public String toString() {
		return "Admin [adminId=" + adminId + ", user=" + user + "]";
	}

}
