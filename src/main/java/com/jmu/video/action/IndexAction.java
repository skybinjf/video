package com.jmu.video.action;

import java.util.List;
import java.util.Map;

import com.jmu.video.entity.Course;
import com.jmu.video.service.IndexService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class IndexAction extends ActionSupport {
	
	private IndexService indexService;
	
	ActionContext context = ActionContext.getContext();
	Map<String, Object> request = (Map<String, Object>) context.get("request");
	
	public void setIndexService(IndexService indexService) {
		this.indexService = indexService;
	}

	public String execute(){
		System.out.println("indexAction....");
		//查找所有已经审核通过的课程
		List<Course> courses = indexService.findAllCoursesByStatus("通过");
		request.put("courses", courses);
		
		return "index";
	}

}
