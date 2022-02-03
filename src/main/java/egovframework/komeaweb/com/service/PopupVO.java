package egovframework.komeaweb.com.service;

import egovframework.example.cmmn.SampleDefaultVO;

public class PopupVO extends SampleDefaultVO {
	private static final long serialVersionUID = 1L;

	private int popupNo;
	private String subject;
	private String startDt;
	private String endDt;
	private int width;
	private int height; 
	private String contents;
	private String description;
	private String openYn;
	private String deleteYn;
	private String insertUserDt;
	private String insertUserId;
	private String updateUserDt;
	private String updateUserId;
	
	public int getPopupNo() {
		return popupNo;
	}
	public void setPopupNo(int popupNo) {
		this.popupNo = popupNo;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getStartDt() {
		return startDt;
	}
	public void setStartDt(String startDt) {
		this.startDt = startDt;
	}
	public String getEndDt() {
		return endDt;
	}
	public void setEndDt(String endDt) {
		this.endDt = endDt;
	}
	public int getWidth() {
		return width;
	}
	public void setWidth(int width) {
		this.width = width;
	}
	public int getHeight() {
		return height;
	}
	public void setHeight(int height) {
		this.height = height;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getOpenYn() {
		return openYn;
	}
	public void setOpenYn(String openYn) {
		this.openYn = openYn;
	}
	public String getDeleteYn() {
		return deleteYn;
	}
	public void setDeleteYn(String deleteYn) {
		this.deleteYn = deleteYn;
	}
	public String getInsertUserDt() {
		return insertUserDt;
	}
	public void setInsertUserDt(String insertUserDt) {
		this.insertUserDt = insertUserDt;
	}
	public String getInsertUserId() {
		return insertUserId;
	}
	public void setInsertUserId(String insertUserId) {
		this.insertUserId = insertUserId;
	}
	public String getUpdateUserDt() {
		return updateUserDt;
	}
	public void setUpdateUserDt(String updateUserDt) {
		this.updateUserDt = updateUserDt;
	}
	public String getUpdateUserId() {
		return updateUserId;
	}
	public void setUpdateUserId(String updateUserId) {
		this.updateUserId = updateUserId;
	}
	
}