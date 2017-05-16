package com.jmu.video.entity;

import java.util.Date;

/**
 * 留言和提问类
 *
 * @author Sky
 * @date 2017年5月2日 上午10:16:40
 */
public class SubMessage {

	private Integer subMessageId;
	private String content; 
	private Date messageDate;
	private String status;
	private String fromWho; //留言者
	private String toWho;//接收者
	
	private Message message;
	
	public String getFromWho() {
		return fromWho;
	}
	public void setFromWho(String fromWho) {
		this.fromWho = fromWho;
	}
	public String getToWho() {
		return toWho;
	}
	public void setToWho(String toWho) {
		this.toWho = toWho;
	}
	public Integer getSubMessageId() {
		return subMessageId;
	}
	public void setSubMessageId(Integer subMessageId) {
		this.subMessageId = subMessageId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	public Date getMessageDate() {
		return messageDate;
	}
	public void setMessageDate(Date messageDate) {
		this.messageDate = messageDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Message getMessage() {
		return message;
	}
	public void setMessage(Message message) {
		this.message = message;
	}
}
