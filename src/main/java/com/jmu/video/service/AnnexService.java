package com.jmu.video.service;

import java.util.List;

import com.jmu.video.entity.Annex;
import com.jmu.video.entity.Message;
import com.jmu.video.entity.SubMessage;
import com.jmu.video.entity.Test;

public interface AnnexService {
	/**
	 * 保存课件
	 * @param a
	 */
	void saveAnnex(Annex a);

	Annex findAnnexByCourseId(Integer courseId);

	List<Annex> findAllAnnexByCourseId(Integer courseId);

	void saveTest(Test test);

	List<Test> findAllTestByCourseId(Integer courseId);

	void saveMessage(Message message);

	List<Message> findAllMessageByToWho(String toWho);

	void deleteMessage(Message message);

	Message findMessageById(Integer messageId);

	void saveSubMessage(SubMessage subMessage);

	List<SubMessage> findAllSubMessageByMessageId(Integer messageId);

	void updateMessage(Message m);

	List<SubMessage> findAllSubMessageByUserName(String userName);

	List<Message> findAllMessageByFromWhoName(String userName);



}
