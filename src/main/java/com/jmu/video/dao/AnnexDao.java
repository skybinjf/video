package com.jmu.video.dao;

import java.util.List;

import org.springframework.orm.hibernate4.support.HibernateDaoSupport;

import com.jmu.video.entity.Annex;
import com.jmu.video.entity.Message;
import com.jmu.video.entity.SubMessage;
import com.jmu.video.entity.Test;

public class AnnexDao extends HibernateDaoSupport {

	public void saveAnnex(Annex a) {
		this.getHibernateTemplate().save(a);
	}

	public Annex findAnnexByCourseId(Integer courseId) {
		String hql = "from Annex a where a.course.courseId = ?";
		List<Annex> annexList = (List<Annex>) this.getHibernateTemplate().find(hql, courseId);
		if(annexList.size() > 0){
			return annexList.get(0);
		}
		return null;
	}

	public List<Annex> findAllAnnexByCourseId(Integer courseId) {
		String hql = "from Annex a where a.course.courseId = ?";
		List<Annex> annexList = (List<Annex>) this.getHibernateTemplate().find(hql, courseId);
		if(annexList.size() > 0){
			return annexList;
		}
		return null;
	}

	public void saveTest(Test test) {
		this.getHibernateTemplate().save(test);
	}

	public List<Test> findAllTestByCourseId(Integer courseId) {
		String hql = "from Test t where t.course.courseId = ?";
		List<Test> testList = (List<Test>) this.getHibernateTemplate().find(hql, courseId);
		if(testList.size() > 0){
			return testList;
		}
		return null;
	}

	public void saveMessage(Message message) {
		this.getHibernateTemplate().save(message);
	}

	public List<Message> findAllMessageByToWho(String toWho) {
		String hql = "from Message m where m.toWho = ?";
		List<Message> messageList = (List<Message>) this.getHibernateTemplate().find(hql, toWho);
		if(messageList.size() > 0){
			return messageList;
		}
		return null;
	}


	public void deleteMessage(Message message) {
		this.getHibernateTemplate().delete(message);
	}

	public Message findMessageById(Integer messageId) {
		String hql = "from Message m where m.messageId = ?";
		List<Message> messageList = (List<Message>) this.getHibernateTemplate().find(hql, messageId);
		if(messageList.size() > 0){
			return messageList.get(0);
		}
		return null;
	}

	public void saveSubMessage(SubMessage subMessage) {
		this.getHibernateTemplate().save(subMessage);
	}

	public List<SubMessage> findAllSubMessageByMessageId(Integer messageId) {
		String hql = "from SubMessage s where s.message.messageId = ?";
		List<SubMessage> subMessageList = (List<SubMessage>) this.getHibernateTemplate().find(hql, messageId);
		if(subMessageList.size() > 0){
			return subMessageList;
		}
		return null;
	}

	public void updateMessage(Message m) {
		this.getHibernateTemplate().update(m);
	}

	public List<SubMessage> findAllSubMessageByUserName(String userName) {
		String hql = "from SubMessage s where s.toWho = ? or s.fromWho = ?";
		List<SubMessage> subMessageList = (List<SubMessage>) this.getHibernateTemplate().find(hql, userName, userName);
		if(subMessageList.size() > 0){
			return subMessageList;
		}
		return null;
	}

	public List<Message> findAllMessageByFromWhoName(String userName) {
		String hql = "from Message m where m.fromWho = ?";
		List<Message> messageList = (List<Message>) this.getHibernateTemplate().find(hql, userName);
		if(messageList.size() > 0){
			return messageList;
		}
		return null;
	}

	
}
