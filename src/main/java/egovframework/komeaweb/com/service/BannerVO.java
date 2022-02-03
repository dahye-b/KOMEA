package egovframework.komeaweb.com.service;

import egovframework.example.cmmn.SampleDefaultVO;

public class BannerVO extends SampleDefaultVO {
	private static final long serialVersionUID = 1L;

	private int bannerNo;
	private String bannerDesc;
	private int bannerSort;
	private String bannerFile;
	private String bannerUseYn;
	private String bannerLink;
	private String bannerGb;
	private String bannerFilePath;
	  
	public int getBannerNo() {
		return bannerNo;
	}
	public void setBannerNo(int bannerNo) {
		this.bannerNo = bannerNo;
	}
	public String getBannerDesc() {
		return bannerDesc;
	}
	public void setBannerDesc(String bannerDesc) {
		this.bannerDesc = bannerDesc;
	}
	public int getBannerSort() {
		return bannerSort;
	}
	public void setBannerSort(int bannerSort) {
		this.bannerSort = bannerSort;
	}
	public String getBannerFile() {
		return bannerFile;
	}
	public void setBannerFile(String bannerFile) {
		this.bannerFile = bannerFile;
	}
	public String getBannerUseYn() {
		return bannerUseYn;
	}
	public void setBannerUseYn(String bannerUseYn) {
		this.bannerUseYn = bannerUseYn;
	}
	public String getBannerLink() {
		return bannerLink;
	}
	public void setBannerLink(String bannerLink) {
		this.bannerLink = bannerLink;
	}
	public String getBannerGb() {
		return bannerGb;
	}
	public void setBannerGb(String bannerGb) {
		this.bannerGb = bannerGb;
	}
	public String getBannerFilePath() {
		return bannerFilePath;
	}
	public void setBannerFilePath(String bannerFilePath) {
		this.bannerFilePath = bannerFilePath;
	}
}