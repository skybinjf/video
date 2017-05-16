package com.jmu.video.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import com.jmu.video.dao.AnnexDao;
import com.jmu.video.entity.Annex;
import com.jmu.video.entity.Message;
import com.jmu.video.entity.SubMessage;
import com.jmu.video.entity.Test;
import com.jmu.video.service.AnnexService;

@Transactional
public class AnnexServiceImpl implements AnnexService {

	private AnnexDao annexDao;

	public void setAnnexDao(AnnexDao annexDao) {
		this.annexDao = annexDao;
	}

	@Override
	public void saveAnnex(Annex a) {
		annexDao.saveAnnex(a);
	}

	@Override
	public Annex findAnnexByCourseId(Integer courseId) {
		return annexDao.findAnnexByCourseId(courseId);
	}

	@Override
	public List<Annex> findAllAnnexByCourseId(Integer courseId) {
		return annexDao.findAllAnnexByCourseId(courseId);
	}

	public void saveTest(Test test) {
		annexDao.saveTest(test);
	}

	@Override
	public List<Test> findAllTestByCourseId(Integer courseId) {
		return annexDao.findAllTestByCourseId(courseId);
	}

	@Override
	public void saveMessage(Message message) {
		annexDao.saveMessage(message);
	}

	@Override
	public List<Message> findAllMessageByToWho(String toWho) {
		return annexDao.findAllMessageByToWho(toWho);
	}


	@Override
	public void deleteMessage(Message message) {
		annexDao.deleteMessage(message);
	}

	@Override
	public Message findMessageById(Integer messageId) {
		return annexDao.findMessageById(messageId);
	}

	@Override
	public void saveSubMessage(SubMessage subMessage) {
		annexDao.saveSubMessage(subMessage);
	}

	@Override
	public List<SubMessage> findAllSubMessageByMessageId(Integer messageId) {
		return annexDao.findAllSubMessageByMessageId(messageId);
	}

	@Override
	public void updateMessage(Message m) {
		annexDao.updateMessage(m);
	}

	@Override
	public List<SubMessage> findAllSubMessageByUserName(String userName) {
		return annexDao.findAllSubMessageByUserName(userName);
	}

	@Override
	public List<Message> findAllMessageByFromWhoName(String userName) {
		return annexDao.findAllMessageByFromWhoName(userName);
	}


	
}
