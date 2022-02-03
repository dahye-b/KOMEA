package egovframework.komeaweb.com.service;

import egovframework.example.cmmn.SampleDefaultVO;

public class CodeVO extends SampleDefaultVO {
	private static final long serialVersionUID = 1L;

	private String cdDec;
	private String cdItem;
	private String cdKor;
	private String cdRef1;
	private String cdRef2;
	private String cdRef3;
	private int numRef1;
	private int numRef2;
	private int numRef3;
	private int sortOrder;
	private String useYn;
	private String remarks;
	
	public String getCdDec() {
		return cdDec;
	}
	public void setCdDec(String cdDec) {
		this.cdDec = cdDec;
	}
	public String getCdItem() {
		return cdItem;
	}
	public void setCdItem(String cdItem) {
		this.cdItem = cdItem;
	}
	public String getCdKor() {
		return cdKor;
	}
	public void setCdKor(String cdKor) {
		this.cdKor = cdKor;
	}
	public String getCdRef1() {
		return cdRef1;
	}
	public void setCdRef1(String cdRef1) {
		this.cdRef1 = cdRef1;
	}
	public String getCdRef2() {
		return cdRef2;
	}
	public void setCdRef2(String cdRef2) {
		this.cdRef2 = cdRef2;
	}
	public String getCdRef3() {
		return cdRef3;
	}
	public void setCdRef3(String cdRef3) {
		this.cdRef3 = cdRef3;
	}
	public int getNumRef1() {
		return numRef1;
	}
	public void setNumRef1(int numRef1) {
		this.numRef1 = numRef1;
	}
	public int getNumRef2() {
		return numRef2;
	}
	public void setNumRef2(int numRef2) {
		this.numRef2 = numRef2;
	}
	public int getNumRef3() {
		return numRef3;
	}
	public void setNumRef3(int numRef3) {
		this.numRef3 = numRef3;
	}
	public int getSortOrder() {
		return sortOrder;
	}
	public void setSortOrder(int sortOrder) {
		this.sortOrder = sortOrder;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	
	
}