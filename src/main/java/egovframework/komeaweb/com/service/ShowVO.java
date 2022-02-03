package egovframework.komeaweb.com.service;

import egovframework.komeaweb.com.service.MberVO;

public class ShowVO  extends MberVO {

	private static final long serialVersionUID = 1L;

	/* EXBI_REQST_INFO */
	private String insttMberCd;
	private String exbiCd;
	private String entrprsMberCd;
	private String chargerNm;
	private String chargerDept;
	private String chargerOfcps;
	private String chargerDirectTlphon;
	private String chargerFax;
	private String chargerEmail;
	private float capl;
	private String salamtStdyy1;
	private String salamtStdyy2;
	private float salamt1;
	private float salamt2;
	private String xportAcmsltStdyy1;
	private String xportAcmsltStdyy2;
	private String xportAcmsltStdyy3;
	private float xportAcmsltAmount1;
	private float xportAcmsltAmount2;
	private float xportAcmsltAmount3;
	private float reqstSpceCo;
	private float sptCnsltGoalCo;
	private float sptCnsltGoalAmount;
	private float sptPlanGoalCo;
	private float sptPlanGoalAmount;
	private float afterCntrctPosblGoalCo;
	private float afterCntrctPosblGoalAmount;
	private float samenssExbiPartcptnCo;
	private String mfrcDspyPrduct;
	private String agreYn;
	private String slctnYn;
	private String reqstSttus;
	private String insertUserId;
	private String updateUserDt;
	private String updateUserId;
	private String insertUserDt;



	/* EXBI_REGIST_INFO */
	private String exbiNm;
	private String opmtBeginDe;
	private String opmtClosDe;
	private String opmtPlace;
	private String opmtCycle;
	private String partcptSumry;
	private String partcptReqstMth;
	private String sportCn;
	private String rceptBeginDe;
	private String rceptClosDe;
	private float coPayamt1;
	private float coPayamt2;
	private String partcptInclsMatter;
	private String rcpmnyAcnut;
	private String dpstr;
	private String chargerTlphon;
	private float spceByMg;
	private String progrsSttus;
	private String preExbiCd;
	private String homepage;
	private String korPartcptScale;
	private String totalCounselResult;
	private String etcResult;
	private String resultViewYn;
	private String noticeItems;
	private String exbiNmEng;
	private String exbiChargerDept;
	private String exbiChargerOfcps;
	private String spceByUnit;
	private String supportOrganNm;
	private String mainInsttNm;
	private String oldYn;
	private int totalPartcptScale;
	private int totalPartcptCnt;
	private int totalPartcptPeople;
	private int cnsltCnt;
	private float cnsltMoney;
	private int contractCnt;
	private float contractMoney;
	private int korPartcptCompCnt;
	private int korPartcptSpceCnt;
	private float korPartcptScaleNum;
	private String placeInfo;
	private String selectCmpl;



	/* EXBI_REQST_FILE_INFO */
	private String bsnmRsctftFileNm;
	private String bsnmRsctftFilePath;
	private String xportAcmsltFileNm;
	private String xportAcmsltFilePath;
	private String partcptAmountFileNm;
	private String partcptAmountFilePath;
	private String etcAtchFileNm;
	private String etcAtchFilePath;
	
	
	/* CNSLTEXHB_REQST_INFO */
	private String cnsltexhbCd;
	private String aditPrduct;
	private String aditPrductEng;
	private float matchingCnt;



	/* CNSLTEXHB_REGIST_INFO */
	private String cnsltexhbGb;
	private String eventNm;
	private String eventBeginDe;
	private String eventClosDe;
	private String place;
	private String suprtInstt;
	private String mainCn;
	private String slctnAt;
	private String preCnsltexhbCd;
	private String matchingCmplYn;
	private String mngeInstt;
	private float prevYearCnsltSum;
	private int prevYearCompEnter;
	private String cnsltChargerDept;
	private String cnsltChargerOfcps;
	private int domPrevYearCompEnter;
	private String resultEtc;
	private float cntrctPrtnAfterAmtSum;
	private float cnsltAmtSum;




	/* CNSLTEXHB_REQST_FILE_INFO */
	private String bsnmRsctftFileCours;
	private String prductCatlFileNm1;
	private String prductCatlFileCours1;
	private String prductCatlFileNm2;
	private String prductCatlFileCours2;
	private String basicProductFileNm;
	private String basicProductFileCours;
	private String addProductFileNm;
	private String addProductFileCours;
	private String etcFileNm;
	private String etcFileCours;



	/* BBS_CM */
	private String bbsTy;
	private String wrter;
	private String writngDe;
	private String sj;
	private String cn;
	private float rdcnt;
	private String atchFileNm;
	private String atchFileCours;
	private String writngTm;
	private String etc1;
	private String etc2;
	private String etc3;
	private String etc4;
	private String etc5;
	private String atchFileNm2;
	private String atchFileCours2;
	private String atchFileNm3;
	private String atchFileCours3;
	private String eventGb;
	private String eventCd;


	/* BIDDING_RESULT_INFO */
	private String registNo;
	private int bbscttNo;
	private String mberCd;
	private String resultFileNm1;
	private String resultFilePath1;
	private String resultFileNm2;
	private String resultFilePath2;
	private String remarks;



	/* BUYER_DB_INFO */
	private String entrpsNm;
	private String nationNm;
	private String gb;
	private String adres;
	private String cttpc;
	private String fax;
	private String email;
	private String hmpg;
	private String mainSrvc;
	private float emplyCo;
	private String chargerCttpc;
	private String partcptnEvent;
	private String hopeGoods;
	private float yearSales;
	private String buyerIntro;
	private float employeeCn;
	private String rprsntv;
	private String gbEtcDesc;
	private String interestItem;
	private String deleteYn;
	private String catalFileNm1;
	private String catalFilePath1;




	/* BUYER_LSN_INFO */
	private String buyerCd;
	private String attendeeNm1;
	private String attendeeTlphon1;
	private String attendeeFax1;
	private String attendeeEmail1;
	private String attendeeNm2;
	private String attendeeTlphon2;
	private String attendeeFax2;
	private String attendeeEmail2;
	private String buyerAttchFileNm1;
	private String buyerAttchFileCours1;
	private String buyerAttchFileNm2;
	private String buyerAttchFileCours2;
	
	
	private String gubun;
	private String year;
	
	/* CNSLTEXHB_RSLT_INFO */
	private String cnsltPrduct;
	private float cnsltAmt;
	private float cntrctAmt;
	private float cntrctPrtnBeforeAmt;
	private float cntrctPrtnAfterAmt;
	private String cmplGubun;
	
	private String code;
	private String fromDate;
	private String closeDate;
	private String name;
	
	/* EXBI_REGIST_FILE_INFO */
	private String exbiPhotoFileNm1;
	private String exbiPhotoFilePath1;
	private String exbiPhotoFileNm2;
	private String exbiPhotoFilePath2;
	private String exbiPhotoFileNm3;
	private String exbiPhotoFilePath3;
	private String opmtAcmsltImageFileNm;
	private String opmtAcmsltImageFilePath;
	private String opmtAcmsltDocFileNm;
	private String opmtAcmsltDocFilePath;
	private String partcptAcmsltDocFileNm;
	private String partcptAcmsltDocFilePath;
	private String opmtAcmsltImageFileNm2;
	private String opmtAcmsltImageFilePath2;
	private String opmtAcmsltImageFileNm3;
	private String opmtAcmsltImageFilePath3;
	private String opmtAcmsltImageFileNm4;
	private String opmtAcmsltImageFilePath4;
	private String attcheFileNm;
	private String attcheFilePath2;
	private String attcheFileNm2;
	private String attcheFilePath;
	private String partcptAcmImageFilePath2;
	private String partcptAcmImageFileNm3;
	private String partcptAcmImageFilePath3;
	private String partcptAcmImageFileNm4;
	private String partcptAcmImageFilePath4;
	private String partcptAcmImageFileNm2;
	private String partcptAcmImageFilePath1;
	private String partcptAcmImageFileNm1;
	private String attcheFileNm3;
	private String attcheFilePath3;
	private String floorPlanFileNm;
	private String floorPlanPath;
	
	private String entrpsNmIndex;
	private float acCnsltAmt;
	private float acCntrctAmt;
	private float acCnsltAmtSum;
	private float acCntrctAmtSum;
	
	private String progrsSttusNm;
	private String progrsSttusCls;
	
	private String boardName;
	private String boardFilePath;
	
	private String data;
	private String label;
	private String cmpl;
	
	private String hmpgUrl;
	private String registDate;
	private String progressStatus;
	private String winnerStatus;
	
	private String cnsltexhbPhotoFileNm1;
	private String cnsltexhbPhotoFileCours1;
	private String cnsltexhbPhotoFileNm2;
	private String cnsltexhbPhotoFileCours2;
	private String cnsltexhbPhotoFileNm3;
	private String cnsltexhbPhotoFileCours3;
	private String cnsltexhbAttchFileNm1;
	private String cnsltexhbAttchFileCours1;
	private String cnsltexhbPhotoFileNm4;
	private String cnsltexhbPhotoFileCours4;
	private String cnsltexhbAttchFileNm2;
	private String cnsltexhbAttchFileCours2;
	private String cnsltexhbAttchFileNm3;
	private String cnsltexhbAttchFileCours3;
	
	private String wrterNm;
	private String cdItem;
	
	private String biddingStatus;
	private String corNum;
	private String workCnt;
	private String faLocplc;
	private String faPostCode1;
	private String faPostCode2;
	private String faWorkCnt;
	private String applyFileNm;
	private String applyFilePath;
	private String mainProductFileNm;
	private String mainProductFilePath;
	private String rsctftFileNm;
	private String rsctftFilePath;
	private String careerFileNm;
	private String careerFilePath;
	private String agreeFileNm;
	private String agreeFilePath;
	private String productDetailGb;
	private String mapngYn;
	
	private String filePath;
	private int rnum;
	private String toDate;
	private String biddingStatusNm;
	private String slctnTypeNm;
	private String buttonStat;
	private String slctnTypeCss;
	private String slctnType;
	private String biddingFileNm;
	private String biddingFilePath;
	private String etcFilePath;
	
	
	public String getInsttMberCd() {
		return insttMberCd;
	}
	public void setInsttMberCd(String insttMberCd) {
		this.insttMberCd = insttMberCd;
	}
	public String getExbiCd() {
		return exbiCd;
	}
	public void setExbiCd(String exbiCd) {
		this.exbiCd = exbiCd;
	}
	public String getEntrprsMberCd() {
		return entrprsMberCd;
	}
	public void setEntrprsMberCd(String entrprsMberCd) {
		this.entrprsMberCd = entrprsMberCd;
	}
	public String getChargerNm() {
		return chargerNm;
	}
	public void setChargerNm(String chargerNm) {
		this.chargerNm = chargerNm;
	}
	public String getChargerDept() {
		return chargerDept;
	}
	public void setChargerDept(String chargerDept) {
		this.chargerDept = chargerDept;
	}
	public String getChargerOfcps() {
		return chargerOfcps;
	}
	public void setChargerOfcps(String chargerOfcps) {
		this.chargerOfcps = chargerOfcps;
	}
	public String getChargerDirectTlphon() {
		return chargerDirectTlphon;
	}
	public void setChargerDirectTlphon(String chargerDirectTlphon) {
		this.chargerDirectTlphon = chargerDirectTlphon;
	}
	public String getChargerFax() {
		return chargerFax;
	}
	public void setChargerFax(String chargerFax) {
		this.chargerFax = chargerFax;
	}
	public String getChargerEmail() {
		return chargerEmail;
	}
	public void setChargerEmail(String chargerEmail) {
		this.chargerEmail = chargerEmail;
	}
	public float getCapl() {
		return capl;
	}
	public void setCapl(float capl) {
		this.capl = capl;
	}
	public String getSalamtStdyy1() {
		return salamtStdyy1;
	}
	public void setSalamtStdyy1(String salamtStdyy1) {
		this.salamtStdyy1 = salamtStdyy1;
	}
	public String getSalamtStdyy2() {
		return salamtStdyy2;
	}
	public void setSalamtStdyy2(String salamtStdyy2) {
		this.salamtStdyy2 = salamtStdyy2;
	}
	public float getSalamt1() {
		return salamt1;
	}
	public void setSalamt1(float salamt1) {
		this.salamt1 = salamt1;
	}
	public float getSalamt2() {
		return salamt2;
	}
	public void setSalamt2(float salamt2) {
		this.salamt2 = salamt2;
	}
	public String getXportAcmsltStdyy1() {
		return xportAcmsltStdyy1;
	}
	public void setXportAcmsltStdyy1(String xportAcmsltStdyy1) {
		this.xportAcmsltStdyy1 = xportAcmsltStdyy1;
	}
	public String getXportAcmsltStdyy2() {
		return xportAcmsltStdyy2;
	}
	public void setXportAcmsltStdyy2(String xportAcmsltStdyy2) {
		this.xportAcmsltStdyy2 = xportAcmsltStdyy2;
	}
	public String getXportAcmsltStdyy3() {
		return xportAcmsltStdyy3;
	}
	public void setXportAcmsltStdyy3(String xportAcmsltStdyy3) {
		this.xportAcmsltStdyy3 = xportAcmsltStdyy3;
	}
	public float getXportAcmsltAmount1() {
		return xportAcmsltAmount1;
	}
	public void setXportAcmsltAmount1(float xportAcmsltAmount1) {
		this.xportAcmsltAmount1 = xportAcmsltAmount1;
	}
	public float getXportAcmsltAmount2() {
		return xportAcmsltAmount2;
	}
	public void setXportAcmsltAmount2(float xportAcmsltAmount2) {
		this.xportAcmsltAmount2 = xportAcmsltAmount2;
	}
	public float getXportAcmsltAmount3() {
		return xportAcmsltAmount3;
	}
	public void setXportAcmsltAmount3(float xportAcmsltAmount3) {
		this.xportAcmsltAmount3 = xportAcmsltAmount3;
	}
	public float getReqstSpceCo() {
		return reqstSpceCo;
	}
	public void setReqstSpceCo(float reqstSpceCo) {
		this.reqstSpceCo = reqstSpceCo;
	}
	public float getSptCnsltGoalCo() {
		return sptCnsltGoalCo;
	}
	public void setSptCnsltGoalCo(float sptCnsltGoalCo) {
		this.sptCnsltGoalCo = sptCnsltGoalCo;
	}
	public float getSptCnsltGoalAmount() {
		return sptCnsltGoalAmount;
	}
	public void setSptCnsltGoalAmount(float sptCnsltGoalAmount) {
		this.sptCnsltGoalAmount = sptCnsltGoalAmount;
	}
	public float getSptPlanGoalCo() {
		return sptPlanGoalCo;
	}
	public void setSptPlanGoalCo(float sptPlanGoalCo) {
		this.sptPlanGoalCo = sptPlanGoalCo;
	}
	public float getSptPlanGoalAmount() {
		return sptPlanGoalAmount;
	}
	public void setSptPlanGoalAmount(float sptPlanGoalAmount) {
		this.sptPlanGoalAmount = sptPlanGoalAmount;
	}
	public float getAfterCntrctPosblGoalCo() {
		return afterCntrctPosblGoalCo;
	}
	public void setAfterCntrctPosblGoalCo(float afterCntrctPosblGoalCo) {
		this.afterCntrctPosblGoalCo = afterCntrctPosblGoalCo;
	}
	public float getAfterCntrctPosblGoalAmount() {
		return afterCntrctPosblGoalAmount;
	}
	public void setAfterCntrctPosblGoalAmount(float afterCntrctPosblGoalAmount) {
		this.afterCntrctPosblGoalAmount = afterCntrctPosblGoalAmount;
	}
	public float getSamenssExbiPartcptnCo() {
		return samenssExbiPartcptnCo;
	}
	public void setSamenssExbiPartcptnCo(float samenssExbiPartcptnCo) {
		this.samenssExbiPartcptnCo = samenssExbiPartcptnCo;
	}
	public String getMfrcDspyPrduct() {
		return mfrcDspyPrduct;
	}
	public void setMfrcDspyPrduct(String mfrcDspyPrduct) {
		this.mfrcDspyPrduct = mfrcDspyPrduct;
	}
	public String getAgreYn() {
		return agreYn;
	}
	public void setAgreYn(String agreYn) {
		this.agreYn = agreYn;
	}
	public String getSlctnYn() {
		return slctnYn;
	}
	public void setSlctnYn(String slctnYn) {
		this.slctnYn = slctnYn;
	}
	public String getReqstSttus() {
		return reqstSttus;
	}
	public void setReqstSttus(String reqstSttus) {
		this.reqstSttus = reqstSttus;
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
	public String getInsertUserDt() {
		return insertUserDt;
	}
	public void setInsertUserDt(String insertUserDt) {
		this.insertUserDt = insertUserDt;
	}
	public String getExbiNm() {
		return exbiNm;
	}
	public void setExbiNm(String exbiNm) {
		this.exbiNm = exbiNm;
	}
	public String getOpmtBeginDe() {
		return opmtBeginDe;
	}
	public void setOpmtBeginDe(String opmtBeginDe) {
		this.opmtBeginDe = opmtBeginDe;
	}
	public String getOpmtClosDe() {
		return opmtClosDe;
	}
	public void setOpmtClosDe(String opmtClosDe) {
		this.opmtClosDe = opmtClosDe;
	}
	public String getOpmtPlace() {
		return opmtPlace;
	}
	public void setOpmtPlace(String opmtPlace) {
		this.opmtPlace = opmtPlace;
	}
	public String getOpmtCycle() {
		return opmtCycle;
	}
	public void setOpmtCycle(String opmtCycle) {
		this.opmtCycle = opmtCycle;
	}
	public String getPartcptSumry() {
		return partcptSumry;
	}
	public void setPartcptSumry(String partcptSumry) {
		this.partcptSumry = partcptSumry;
	}
	public String getPartcptReqstMth() {
		return partcptReqstMth;
	}
	public void setPartcptReqstMth(String partcptReqstMth) {
		this.partcptReqstMth = partcptReqstMth;
	}
	public String getSportCn() {
		return sportCn;
	}
	public void setSportCn(String sportCn) {
		this.sportCn = sportCn;
	}
	public String getRceptBeginDe() {
		return rceptBeginDe;
	}
	public void setRceptBeginDe(String rceptBeginDe) {
		this.rceptBeginDe = rceptBeginDe;
	}
	public String getRceptClosDe() {
		return rceptClosDe;
	}
	public void setRceptClosDe(String rceptClosDe) {
		this.rceptClosDe = rceptClosDe;
	}
	public float getCoPayamt1() {
		return coPayamt1;
	}
	public void setCoPayamt1(float coPayamt1) {
		this.coPayamt1 = coPayamt1;
	}
	public float getCoPayamt2() {
		return coPayamt2;
	}
	public void setCoPayamt2(float coPayamt2) {
		this.coPayamt2 = coPayamt2;
	}
	public String getPartcptInclsMatter() {
		return partcptInclsMatter;
	}
	public void setPartcptInclsMatter(String partcptInclsMatter) {
		this.partcptInclsMatter = partcptInclsMatter;
	}
	public String getRcpmnyAcnut() {
		return rcpmnyAcnut;
	}
	public void setRcpmnyAcnut(String rcpmnyAcnut) {
		this.rcpmnyAcnut = rcpmnyAcnut;
	}
	public String getDpstr() {
		return dpstr;
	}
	public void setDpstr(String dpstr) {
		this.dpstr = dpstr;
	}
	public String getChargerTlphon() {
		return chargerTlphon;
	}
	public void setChargerTlphon(String chargerTlphon) {
		this.chargerTlphon = chargerTlphon;
	}
	public float getSpceByMg() {
		return spceByMg;
	}
	public void setSpceByMg(float spceByMg) {
		this.spceByMg = spceByMg;
	}
	public String getProgrsSttus() {
		return progrsSttus;
	}
	public void setProgrsSttus(String progrsSttus) {
		this.progrsSttus = progrsSttus;
	}
	public String getPreExbiCd() {
		return preExbiCd;
	}
	public void setPreExbiCd(String preExbiCd) {
		this.preExbiCd = preExbiCd;
	}
	public String getHomepage() {
		return homepage;
	}
	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}
	public String getKorPartcptScale() {
		return korPartcptScale;
	}
	public void setKorPartcptScale(String korPartcptScale) {
		this.korPartcptScale = korPartcptScale;
	}
	public String getTotalCounselResult() {
		return totalCounselResult;
	}
	public void setTotalCounselResult(String totalCounselResult) {
		this.totalCounselResult = totalCounselResult;
	}
	public String getEtcResult() {
		return etcResult;
	}
	public void setEtcResult(String etcResult) {
		this.etcResult = etcResult;
	}
	public String getResultViewYn() {
		return resultViewYn;
	}
	public void setResultViewYn(String resultViewYn) {
		this.resultViewYn = resultViewYn;
	}
	public String getNoticeItems() {
		return noticeItems;
	}
	public void setNoticeItems(String noticeItems) {
		this.noticeItems = noticeItems;
	}
	public String getExbiNmEng() {
		return exbiNmEng;
	}
	public void setExbiNmEng(String exbiNmEng) {
		this.exbiNmEng = exbiNmEng;
	}
	public String getExbiChargerDept() {
		return exbiChargerDept;
	}
	public void setExbiChargerDept(String exbiChargerDept) {
		this.exbiChargerDept = exbiChargerDept;
	}
	public String getExbiChargerOfcps() {
		return exbiChargerOfcps;
	}
	public void setExbiChargerOfcps(String exbiChargerOfcps) {
		this.exbiChargerOfcps = exbiChargerOfcps;
	}
	public String getSpceByUnit() {
		return spceByUnit;
	}
	public void setSpceByUnit(String spceByUnit) {
		this.spceByUnit = spceByUnit;
	}
	public String getSupportOrganNm() {
		return supportOrganNm;
	}
	public void setSupportOrganNm(String supportOrganNm) {
		this.supportOrganNm = supportOrganNm;
	}
	public String getMainInsttNm() {
		return mainInsttNm;
	}
	public void setMainInsttNm(String mainInsttNm) {
		this.mainInsttNm = mainInsttNm;
	}
	public String getOldYn() {
		return oldYn;
	}
	public void setOldYn(String oldYn) {
		this.oldYn = oldYn;
	}
	public int getTotalPartcptScale() {
		return totalPartcptScale;
	}
	public void setTotalPartcptScale(int totalPartcptScale) {
		this.totalPartcptScale = totalPartcptScale;
	}
	public int getTotalPartcptCnt() {
		return totalPartcptCnt;
	}
	public void setTotalPartcptCnt(int totalPartcptCnt) {
		this.totalPartcptCnt = totalPartcptCnt;
	}
	public int getTotalPartcptPeople() {
		return totalPartcptPeople;
	}
	public void setTotalPartcptPeople(int totalPartcptPeople) {
		this.totalPartcptPeople = totalPartcptPeople;
	}
	public int getCnsltCnt() {
		return cnsltCnt;
	}
	public void setCnsltCnt(int cnsltCnt) {
		this.cnsltCnt = cnsltCnt;
	}
	public float getCnsltMoney() {
		return cnsltMoney;
	}
	public void setCnsltMoney(float cnsltMoney) {
		this.cnsltMoney = cnsltMoney;
	}
	public int getContractCnt() {
		return contractCnt;
	}
	public void setContractCnt(int contractCnt) {
		this.contractCnt = contractCnt;
	}
	public float getContractMoney() {
		return contractMoney;
	}
	public void setContractMoney(float contractMoney) {
		this.contractMoney = contractMoney;
	}
	public int getKorPartcptCompCnt() {
		return korPartcptCompCnt;
	}
	public void setKorPartcptCompCnt(int korPartcptCompCnt) {
		this.korPartcptCompCnt = korPartcptCompCnt;
	}
	public int getKorPartcptSpceCnt() {
		return korPartcptSpceCnt;
	}
	public void setKorPartcptSpceCnt(int korPartcptSpceCnt) {
		this.korPartcptSpceCnt = korPartcptSpceCnt;
	}
	public float getKorPartcptScaleNum() {
		return korPartcptScaleNum;
	}
	public void setKorPartcptScaleNum(float korPartcptScaleNum) {
		this.korPartcptScaleNum = korPartcptScaleNum;
	}
	public String getPlaceInfo() {
		return placeInfo;
	}
	public void setPlaceInfo(String placeInfo) {
		this.placeInfo = placeInfo;
	}
	public String getSelectCmpl() {
		return selectCmpl;
	}
	public void setSelectCmpl(String selectCmpl) {
		this.selectCmpl = selectCmpl;
	}
	public String getBsnmRsctftFileNm() {
		return bsnmRsctftFileNm;
	}
	public void setBsnmRsctftFileNm(String bsnmRsctftFileNm) {
		this.bsnmRsctftFileNm = bsnmRsctftFileNm;
	}
	public String getBsnmRsctftFilePath() {
		return bsnmRsctftFilePath;
	}
	public void setBsnmRsctftFilePath(String bsnmRsctftFilePath) {
		this.bsnmRsctftFilePath = bsnmRsctftFilePath;
	}
	public String getXportAcmsltFileNm() {
		return xportAcmsltFileNm;
	}
	public void setXportAcmsltFileNm(String xportAcmsltFileNm) {
		this.xportAcmsltFileNm = xportAcmsltFileNm;
	}
	public String getXportAcmsltFilePath() {
		return xportAcmsltFilePath;
	}
	public void setXportAcmsltFilePath(String xportAcmsltFilePath) {
		this.xportAcmsltFilePath = xportAcmsltFilePath;
	}
	public String getPartcptAmountFileNm() {
		return partcptAmountFileNm;
	}
	public void setPartcptAmountFileNm(String partcptAmountFileNm) {
		this.partcptAmountFileNm = partcptAmountFileNm;
	}
	public String getPartcptAmountFilePath() {
		return partcptAmountFilePath;
	}
	public void setPartcptAmountFilePath(String partcptAmountFilePath) {
		this.partcptAmountFilePath = partcptAmountFilePath;
	}
	public String getEtcAtchFileNm() {
		return etcAtchFileNm;
	}
	public void setEtcAtchFileNm(String etcAtchFileNm) {
		this.etcAtchFileNm = etcAtchFileNm;
	}
	public String getEtcAtchFilePath() {
		return etcAtchFilePath;
	}
	public void setEtcAtchFilePath(String etcAtchFilePath) {
		this.etcAtchFilePath = etcAtchFilePath;
	}
	public String getCnsltexhbCd() {
		return cnsltexhbCd;
	}
	public void setCnsltexhbCd(String cnsltexhbCd) {
		this.cnsltexhbCd = cnsltexhbCd;
	}
	public String getAditPrduct() {
		return aditPrduct;
	}
	public void setAditPrduct(String aditPrduct) {
		this.aditPrduct = aditPrduct;
	}
	public String getAditPrductEng() {
		return aditPrductEng;
	}
	public void setAditPrductEng(String aditPrductEng) {
		this.aditPrductEng = aditPrductEng;
	}
	public float getMatchingCnt() {
		return matchingCnt;
	}
	public void setMatchingCnt(float matchingCnt) {
		this.matchingCnt = matchingCnt;
	}
	public String getCnsltexhbGb() {
		return cnsltexhbGb;
	}
	public void setCnsltexhbGb(String cnsltexhbGb) {
		this.cnsltexhbGb = cnsltexhbGb;
	}
	public String getEventNm() {
		return eventNm;
	}
	public void setEventNm(String eventNm) {
		this.eventNm = eventNm;
	}
	public String getEventBeginDe() {
		return eventBeginDe;
	}
	public void setEventBeginDe(String eventBeginDe) {
		this.eventBeginDe = eventBeginDe;
	}
	public String getEventClosDe() {
		return eventClosDe;
	}
	public void setEventClosDe(String eventClosDe) {
		this.eventClosDe = eventClosDe;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public String getSuprtInstt() {
		return suprtInstt;
	}
	public void setSuprtInstt(String suprtInstt) {
		this.suprtInstt = suprtInstt;
	}
	public String getMainCn() {
		return mainCn;
	}
	public void setMainCn(String mainCn) {
		this.mainCn = mainCn;
	}
	public String getSlctnAt() {
		return slctnAt;
	}
	public void setSlctnAt(String slctnAt) {
		this.slctnAt = slctnAt;
	}
	public String getPreCnsltexhbCd() {
		return preCnsltexhbCd;
	}
	public void setPreCnsltexhbCd(String preCnsltexhbCd) {
		this.preCnsltexhbCd = preCnsltexhbCd;
	}
	public String getMatchingCmplYn() {
		return matchingCmplYn;
	}
	public void setMatchingCmplYn(String matchingCmplYn) {
		this.matchingCmplYn = matchingCmplYn;
	}
	public String getMngeInstt() {
		return mngeInstt;
	}
	public void setMngeInstt(String mngeInstt) {
		this.mngeInstt = mngeInstt;
	}
	public float getPrevYearCnsltSum() {
		return prevYearCnsltSum;
	}
	public void setPrevYearCnsltSum(float prevYearCnsltSum) {
		this.prevYearCnsltSum = prevYearCnsltSum;
	}
	public int getPrevYearCompEnter() {
		return prevYearCompEnter;
	}
	public void setPrevYearCompEnter(int prevYearCompEnter) {
		this.prevYearCompEnter = prevYearCompEnter;
	}
	public String getCnsltChargerDept() {
		return cnsltChargerDept;
	}
	public void setCnsltChargerDept(String cnsltChargerDept) {
		this.cnsltChargerDept = cnsltChargerDept;
	}
	public String getCnsltChargerOfcps() {
		return cnsltChargerOfcps;
	}
	public void setCnsltChargerOfcps(String cnsltChargerOfcps) {
		this.cnsltChargerOfcps = cnsltChargerOfcps;
	}
	public int getDomPrevYearCompEnter() {
		return domPrevYearCompEnter;
	}
	public void setDomPrevYearCompEnter(int domPrevYearCompEnter) {
		this.domPrevYearCompEnter = domPrevYearCompEnter;
	}
	public String getResultEtc() {
		return resultEtc;
	}
	public void setResultEtc(String resultEtc) {
		this.resultEtc = resultEtc;
	}
	public float getCntrctPrtnAfterAmtSum() {
		return cntrctPrtnAfterAmtSum;
	}
	public void setCntrctPrtnAfterAmtSum(float cntrctPrtnAfterAmtSum) {
		this.cntrctPrtnAfterAmtSum = cntrctPrtnAfterAmtSum;
	}
	public float getCnsltAmtSum() {
		return cnsltAmtSum;
	}
	public void setCnsltAmtSum(float cnsltAmtSum) {
		this.cnsltAmtSum = cnsltAmtSum;
	}
	public String getBsnmRsctftFileCours() {
		return bsnmRsctftFileCours;
	}
	public void setBsnmRsctftFileCours(String bsnmRsctftFileCours) {
		this.bsnmRsctftFileCours = bsnmRsctftFileCours;
	}
	public String getPrductCatlFileNm1() {
		return prductCatlFileNm1;
	}
	public void setPrductCatlFileNm1(String prductCatlFileNm1) {
		this.prductCatlFileNm1 = prductCatlFileNm1;
	}
	public String getPrductCatlFileCours1() {
		return prductCatlFileCours1;
	}
	public void setPrductCatlFileCours1(String prductCatlFileCours1) {
		this.prductCatlFileCours1 = prductCatlFileCours1;
	}
	public String getPrductCatlFileNm2() {
		return prductCatlFileNm2;
	}
	public void setPrductCatlFileNm2(String prductCatlFileNm2) {
		this.prductCatlFileNm2 = prductCatlFileNm2;
	}
	public String getPrductCatlFileCours2() {
		return prductCatlFileCours2;
	}
	public void setPrductCatlFileCours2(String prductCatlFileCours2) {
		this.prductCatlFileCours2 = prductCatlFileCours2;
	}
	public String getBasicProductFileNm() {
		return basicProductFileNm;
	}
	public void setBasicProductFileNm(String basicProductFileNm) {
		this.basicProductFileNm = basicProductFileNm;
	}
	public String getBasicProductFileCours() {
		return basicProductFileCours;
	}
	public void setBasicProductFileCours(String basicProductFileCours) {
		this.basicProductFileCours = basicProductFileCours;
	}
	public String getAddProductFileNm() {
		return addProductFileNm;
	}
	public void setAddProductFileNm(String addProductFileNm) {
		this.addProductFileNm = addProductFileNm;
	}
	public String getAddProductFileCours() {
		return addProductFileCours;
	}
	public void setAddProductFileCours(String addProductFileCours) {
		this.addProductFileCours = addProductFileCours;
	}
	public String getEtcFileNm() {
		return etcFileNm;
	}
	public void setEtcFileNm(String etcFileNm) {
		this.etcFileNm = etcFileNm;
	}
	public String getEtcFileCours() {
		return etcFileCours;
	}
	public void setEtcFileCours(String etcFileCours) {
		this.etcFileCours = etcFileCours;
	}
	public String getBbsTy() {
		return bbsTy;
	}
	public void setBbsTy(String bbsTy) {
		this.bbsTy = bbsTy;
	}
	public String getWrter() {
		return wrter;
	}
	public void setWrter(String wrter) {
		this.wrter = wrter;
	}
	public String getWritngDe() {
		return writngDe;
	}
	public void setWritngDe(String writngDe) {
		this.writngDe = writngDe;
	}
	public String getSj() {
		return sj;
	}
	public void setSj(String sj) {
		this.sj = sj;
	}
	public String getCn() {
		return cn;
	}
	public void setCn(String cn) {
		this.cn = cn;
	}
	public float getRdcnt() {
		return rdcnt;
	}
	public void setRdcnt(float rdcnt) {
		this.rdcnt = rdcnt;
	}
	public String getAtchFileNm() {
		return atchFileNm;
	}
	public void setAtchFileNm(String atchFileNm) {
		this.atchFileNm = atchFileNm;
	}
	public String getAtchFileCours() {
		return atchFileCours;
	}
	public void setAtchFileCours(String atchFileCours) {
		this.atchFileCours = atchFileCours;
	}
	public String getWritngTm() {
		return writngTm;
	}
	public void setWritngTm(String writngTm) {
		this.writngTm = writngTm;
	}
	public String getEtc1() {
		return etc1;
	}
	public void setEtc1(String etc1) {
		this.etc1 = etc1;
	}
	public String getEtc2() {
		return etc2;
	}
	public void setEtc2(String etc2) {
		this.etc2 = etc2;
	}
	public String getEtc3() {
		return etc3;
	}
	public void setEtc3(String etc3) {
		this.etc3 = etc3;
	}
	public String getEtc4() {
		return etc4;
	}
	public void setEtc4(String etc4) {
		this.etc4 = etc4;
	}
	public String getEtc5() {
		return etc5;
	}
	public void setEtc5(String etc5) {
		this.etc5 = etc5;
	}
	public String getAtchFileNm2() {
		return atchFileNm2;
	}
	public void setAtchFileNm2(String atchFileNm2) {
		this.atchFileNm2 = atchFileNm2;
	}
	public String getAtchFileCours2() {
		return atchFileCours2;
	}
	public void setAtchFileCours2(String atchFileCours2) {
		this.atchFileCours2 = atchFileCours2;
	}
	public String getAtchFileNm3() {
		return atchFileNm3;
	}
	public void setAtchFileNm3(String atchFileNm3) {
		this.atchFileNm3 = atchFileNm3;
	}
	public String getAtchFileCours3() {
		return atchFileCours3;
	}
	public void setAtchFileCours3(String atchFileCours3) {
		this.atchFileCours3 = atchFileCours3;
	}
	public String getEventGb() {
		return eventGb;
	}
	public void setEventGb(String eventGb) {
		this.eventGb = eventGb;
	}
	public String getEventCd() {
		return eventCd;
	}
	public void setEventCd(String eventCd) {
		this.eventCd = eventCd;
	}
	public String getRegistNo() {
		return registNo;
	}
	public void setRegistNo(String registNo) {
		this.registNo = registNo;
	}
	public int getBbscttNo() {
		return bbscttNo;
	}
	public void setBbscttNo(int bbscttNo) {
		this.bbscttNo = bbscttNo;
	}
	public String getMberCd() {
		return mberCd;
	}
	public void setMberCd(String mberCd) {
		this.mberCd = mberCd;
	}
	public String getResultFileNm1() {
		return resultFileNm1;
	}
	public void setResultFileNm1(String resultFileNm1) {
		this.resultFileNm1 = resultFileNm1;
	}
	public String getResultFilePath1() {
		return resultFilePath1;
	}
	public void setResultFilePath1(String resultFilePath1) {
		this.resultFilePath1 = resultFilePath1;
	}
	public String getResultFileNm2() {
		return resultFileNm2;
	}
	public void setResultFileNm2(String resultFileNm2) {
		this.resultFileNm2 = resultFileNm2;
	}
	public String getResultFilePath2() {
		return resultFilePath2;
	}
	public void setResultFilePath2(String resultFilePath2) {
		this.resultFilePath2 = resultFilePath2;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public String getEntrpsNm() {
		return entrpsNm;
	}
	public void setEntrpsNm(String entrpsNm) {
		this.entrpsNm = entrpsNm;
	}
	public String getNationNm() {
		return nationNm;
	}
	public void setNationNm(String nationNm) {
		this.nationNm = nationNm;
	}
	public String getGb() {
		return gb;
	}
	public void setGb(String gb) {
		this.gb = gb;
	}
	public String getAdres() {
		return adres;
	}
	public void setAdres(String adres) {
		this.adres = adres;
	}
	public String getCttpc() {
		return cttpc;
	}
	public void setCttpc(String cttpc) {
		this.cttpc = cttpc;
	}
	public String getFax() {
		return fax;
	}
	public void setFax(String fax) {
		this.fax = fax;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getHmpg() {
		return hmpg;
	}
	public void setHmpg(String hmpg) {
		this.hmpg = hmpg;
	}
	public String getMainSrvc() {
		return mainSrvc;
	}
	public void setMainSrvc(String mainSrvc) {
		this.mainSrvc = mainSrvc;
	}
	public float getEmplyCo() {
		return emplyCo;
	}
	public void setEmplyCo(float emplyCo) {
		this.emplyCo = emplyCo;
	}
	public String getChargerCttpc() {
		return chargerCttpc;
	}
	public void setChargerCttpc(String chargerCttpc) {
		this.chargerCttpc = chargerCttpc;
	}
	public String getPartcptnEvent() {
		return partcptnEvent;
	}
	public void setPartcptnEvent(String partcptnEvent) {
		this.partcptnEvent = partcptnEvent;
	}
	public String getHopeGoods() {
		return hopeGoods;
	}
	public void setHopeGoods(String hopeGoods) {
		this.hopeGoods = hopeGoods;
	}
	public float getYearSales() {
		return yearSales;
	}
	public void setYearSales(float yearSales) {
		this.yearSales = yearSales;
	}
	public String getBuyerIntro() {
		return buyerIntro;
	}
	public void setBuyerIntro(String buyerIntro) {
		this.buyerIntro = buyerIntro;
	}
	public float getEmployeeCn() {
		return employeeCn;
	}
	public void setEmployeeCn(float employeeCn) {
		this.employeeCn = employeeCn;
	}
	public String getRprsntv() {
		return rprsntv;
	}
	public void setRprsntv(String rprsntv) {
		this.rprsntv = rprsntv;
	}
	public String getGbEtcDesc() {
		return gbEtcDesc;
	}
	public void setGbEtcDesc(String gbEtcDesc) {
		this.gbEtcDesc = gbEtcDesc;
	}
	public String getInterestItem() {
		return interestItem;
	}
	public void setInterestItem(String interestItem) {
		this.interestItem = interestItem;
	}
	public String getDeleteYn() {
		return deleteYn;
	}
	public void setDeleteYn(String deleteYn) {
		this.deleteYn = deleteYn;
	}
	public String getCatalFileNm1() {
		return catalFileNm1;
	}
	public void setCatalFileNm1(String catalFileNm1) {
		this.catalFileNm1 = catalFileNm1;
	}
	public String getCatalFilePath1() {
		return catalFilePath1;
	}
	public void setCatalFilePath1(String catalFilePath1) {
		this.catalFilePath1 = catalFilePath1;
	}
	public String getBuyerCd() {
		return buyerCd;
	}
	public void setBuyerCd(String buyerCd) {
		this.buyerCd = buyerCd;
	}
	public String getAttendeeNm1() {
		return attendeeNm1;
	}
	public void setAttendeeNm1(String attendeeNm1) {
		this.attendeeNm1 = attendeeNm1;
	}
	public String getAttendeeTlphon1() {
		return attendeeTlphon1;
	}
	public void setAttendeeTlphon1(String attendeeTlphon1) {
		this.attendeeTlphon1 = attendeeTlphon1;
	}
	public String getAttendeeFax1() {
		return attendeeFax1;
	}
	public void setAttendeeFax1(String attendeeFax1) {
		this.attendeeFax1 = attendeeFax1;
	}
	public String getAttendeeEmail1() {
		return attendeeEmail1;
	}
	public void setAttendeeEmail1(String attendeeEmail1) {
		this.attendeeEmail1 = attendeeEmail1;
	}
	public String getAttendeeNm2() {
		return attendeeNm2;
	}
	public void setAttendeeNm2(String attendeeNm2) {
		this.attendeeNm2 = attendeeNm2;
	}
	public String getAttendeeTlphon2() {
		return attendeeTlphon2;
	}
	public void setAttendeeTlphon2(String attendeeTlphon2) {
		this.attendeeTlphon2 = attendeeTlphon2;
	}
	public String getAttendeeFax2() {
		return attendeeFax2;
	}
	public void setAttendeeFax2(String attendeeFax2) {
		this.attendeeFax2 = attendeeFax2;
	}
	public String getAttendeeEmail2() {
		return attendeeEmail2;
	}
	public void setAttendeeEmail2(String attendeeEmail2) {
		this.attendeeEmail2 = attendeeEmail2;
	}
	public String getBuyerAttchFileNm1() {
		return buyerAttchFileNm1;
	}
	public void setBuyerAttchFileNm1(String buyerAttchFileNm1) {
		this.buyerAttchFileNm1 = buyerAttchFileNm1;
	}
	public String getBuyerAttchFileCours1() {
		return buyerAttchFileCours1;
	}
	public void setBuyerAttchFileCours1(String buyerAttchFileCours1) {
		this.buyerAttchFileCours1 = buyerAttchFileCours1;
	}
	public String getBuyerAttchFileNm2() {
		return buyerAttchFileNm2;
	}
	public void setBuyerAttchFileNm2(String buyerAttchFileNm2) {
		this.buyerAttchFileNm2 = buyerAttchFileNm2;
	}
	public String getBuyerAttchFileCours2() {
		return buyerAttchFileCours2;
	}
	public String getGubun() {
		return gubun;
	}
	public void setGubun(String gubun) {
		this.gubun = gubun;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getCnsltPrduct() {
		return cnsltPrduct;
	}
	public void setCnsltPrduct(String cnsltPrduct) {
		this.cnsltPrduct = cnsltPrduct;
	}
	public float getCnsltAmt() {
		return cnsltAmt;
	}
	public void setCnsltAmt(float cnsltAmt) {
		this.cnsltAmt = cnsltAmt;
	}
	public float getCntrctAmt() {
		return cntrctAmt;
	}
	public void setCntrctAmt(float cntrctAmt) {
		this.cntrctAmt = cntrctAmt;
	}
	public float getCntrctPrtnBeforeAmt() {
		return cntrctPrtnBeforeAmt;
	}
	public void setCntrctPrtnBeforeAmt(float cntrctPrtnBeforeAmt) {
		this.cntrctPrtnBeforeAmt = cntrctPrtnBeforeAmt;
	}
	public float getCntrctPrtnAfterAmt() {
		return cntrctPrtnAfterAmt;
	}
	public void setCntrctPrtnAfterAmt(float cntrctPrtnAfterAmt) {
		this.cntrctPrtnAfterAmt = cntrctPrtnAfterAmt;
	}
	public String getCmplGubun() {
		return cmplGubun;
	}
	public void setCmplGubun(String cmplGubun) {
		this.cmplGubun = cmplGubun;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getFromDate() {
		return fromDate;
	}
	public void setFromDate(String fromDate) {
		this.fromDate = fromDate;
	}
	public String getCloseDate() {
		return closeDate;
	}
	public void setCloseDate(String closeDate) {
		this.closeDate = closeDate;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getExbiPhotoFileNm1() {
		return exbiPhotoFileNm1;
	}
	public void setExbiPhotoFileNm1(String exbiPhotoFileNm1) {
		this.exbiPhotoFileNm1 = exbiPhotoFileNm1;
	}
	public String getExbiPhotoFilePath1() {
		return exbiPhotoFilePath1;
	}
	public void setExbiPhotoFilePath1(String exbiPhotoFilePath1) {
		this.exbiPhotoFilePath1 = exbiPhotoFilePath1;
	}
	public String getExbiPhotoFileNm2() {
		return exbiPhotoFileNm2;
	}
	public void setExbiPhotoFileNm2(String exbiPhotoFileNm2) {
		this.exbiPhotoFileNm2 = exbiPhotoFileNm2;
	}
	public String getExbiPhotoFilePath2() {
		return exbiPhotoFilePath2;
	}
	public void setExbiPhotoFilePath2(String exbiPhotoFilePath2) {
		this.exbiPhotoFilePath2 = exbiPhotoFilePath2;
	}
	public String getExbiPhotoFileNm3() {
		return exbiPhotoFileNm3;
	}
	public void setExbiPhotoFileNm3(String exbiPhotoFileNm3) {
		this.exbiPhotoFileNm3 = exbiPhotoFileNm3;
	}
	public String getExbiPhotoFilePath3() {
		return exbiPhotoFilePath3;
	}
	public void setExbiPhotoFilePath3(String exbiPhotoFilePath3) {
		this.exbiPhotoFilePath3 = exbiPhotoFilePath3;
	}
	public String getOpmtAcmsltImageFileNm() {
		return opmtAcmsltImageFileNm;
	}
	public void setOpmtAcmsltImageFileNm(String opmtAcmsltImageFileNm) {
		this.opmtAcmsltImageFileNm = opmtAcmsltImageFileNm;
	}
	public String getOpmtAcmsltImageFilePath() {
		return opmtAcmsltImageFilePath;
	}
	public void setOpmtAcmsltImageFilePath(String opmtAcmsltImageFilePath) {
		this.opmtAcmsltImageFilePath = opmtAcmsltImageFilePath;
	}
	public String getOpmtAcmsltDocFileNm() {
		return opmtAcmsltDocFileNm;
	}
	public void setOpmtAcmsltDocFileNm(String opmtAcmsltDocFileNm) {
		this.opmtAcmsltDocFileNm = opmtAcmsltDocFileNm;
	}
	public String getOpmtAcmsltDocFilePath() {
		return opmtAcmsltDocFilePath;
	}
	public void setOpmtAcmsltDocFilePath(String opmtAcmsltDocFilePath) {
		this.opmtAcmsltDocFilePath = opmtAcmsltDocFilePath;
	}
	public String getPartcptAcmsltDocFileNm() {
		return partcptAcmsltDocFileNm;
	}
	public void setPartcptAcmsltDocFileNm(String partcptAcmsltDocFileNm) {
		this.partcptAcmsltDocFileNm = partcptAcmsltDocFileNm;
	}
	public String getPartcptAcmsltDocFilePath() {
		return partcptAcmsltDocFilePath;
	}
	public void setPartcptAcmsltDocFilePath(String partcptAcmsltDocFilePath) {
		this.partcptAcmsltDocFilePath = partcptAcmsltDocFilePath;
	}
	public String getOpmtAcmsltImageFileNm2() {
		return opmtAcmsltImageFileNm2;
	}
	public void setOpmtAcmsltImageFileNm2(String opmtAcmsltImageFileNm2) {
		this.opmtAcmsltImageFileNm2 = opmtAcmsltImageFileNm2;
	}
	public String getOpmtAcmsltImageFilePath2() {
		return opmtAcmsltImageFilePath2;
	}
	public void setOpmtAcmsltImageFilePath2(String opmtAcmsltImageFilePath2) {
		this.opmtAcmsltImageFilePath2 = opmtAcmsltImageFilePath2;
	}
	public String getOpmtAcmsltImageFileNm3() {
		return opmtAcmsltImageFileNm3;
	}
	public void setOpmtAcmsltImageFileNm3(String opmtAcmsltImageFileNm3) {
		this.opmtAcmsltImageFileNm3 = opmtAcmsltImageFileNm3;
	}
	public String getOpmtAcmsltImageFilePath3() {
		return opmtAcmsltImageFilePath3;
	}
	public void setOpmtAcmsltImageFilePath3(String opmtAcmsltImageFilePath3) {
		this.opmtAcmsltImageFilePath3 = opmtAcmsltImageFilePath3;
	}
	public String getOpmtAcmsltImageFileNm4() {
		return opmtAcmsltImageFileNm4;
	}
	public void setOpmtAcmsltImageFileNm4(String opmtAcmsltImageFileNm4) {
		this.opmtAcmsltImageFileNm4 = opmtAcmsltImageFileNm4;
	}
	public String getOpmtAcmsltImageFilePath4() {
		return opmtAcmsltImageFilePath4;
	}
	public void setOpmtAcmsltImageFilePath4(String opmtAcmsltImageFilePath4) {
		this.opmtAcmsltImageFilePath4 = opmtAcmsltImageFilePath4;
	}
	public String getAttcheFileNm() {
		return attcheFileNm;
	}
	public void setAttcheFileNm(String attcheFileNm) {
		this.attcheFileNm = attcheFileNm;
	}
	public String getAttcheFilePath2() {
		return attcheFilePath2;
	}
	public void setAttcheFilePath2(String attcheFilePath2) {
		this.attcheFilePath2 = attcheFilePath2;
	}
	public String getAttcheFileNm2() {
		return attcheFileNm2;
	}
	public void setAttcheFileNm2(String attcheFileNm2) {
		this.attcheFileNm2 = attcheFileNm2;
	}
	public String getAttcheFilePath() {
		return attcheFilePath;
	}
	public void setAttcheFilePath(String attcheFilePath) {
		this.attcheFilePath = attcheFilePath;
	}
	public String getPartcptAcmImageFilePath2() {
		return partcptAcmImageFilePath2;
	}
	public void setPartcptAcmImageFilePath2(String partcptAcmImageFilePath2) {
		this.partcptAcmImageFilePath2 = partcptAcmImageFilePath2;
	}
	public String getPartcptAcmImageFileNm3() {
		return partcptAcmImageFileNm3;
	}
	public void setPartcptAcmImageFileNm3(String partcptAcmImageFileNm3) {
		this.partcptAcmImageFileNm3 = partcptAcmImageFileNm3;
	}
	public String getPartcptAcmImageFilePath3() {
		return partcptAcmImageFilePath3;
	}
	public void setPartcptAcmImageFilePath3(String partcptAcmImageFilePath3) {
		this.partcptAcmImageFilePath3 = partcptAcmImageFilePath3;
	}
	public String getPartcptAcmImageFileNm4() {
		return partcptAcmImageFileNm4;
	}
	public void setPartcptAcmImageFileNm4(String partcptAcmImageFileNm4) {
		this.partcptAcmImageFileNm4 = partcptAcmImageFileNm4;
	}
	public String getPartcptAcmImageFilePath4() {
		return partcptAcmImageFilePath4;
	}
	public void setPartcptAcmImageFilePath4(String partcptAcmImageFilePath4) {
		this.partcptAcmImageFilePath4 = partcptAcmImageFilePath4;
	}
	public String getPartcptAcmImageFileNm2() {
		return partcptAcmImageFileNm2;
	}
	public void setPartcptAcmImageFileNm2(String partcptAcmImageFileNm2) {
		this.partcptAcmImageFileNm2 = partcptAcmImageFileNm2;
	}
	public String getPartcptAcmImageFilePath1() {
		return partcptAcmImageFilePath1;
	}
	public void setPartcptAcmImageFilePath1(String partcptAcmImageFilePath1) {
		this.partcptAcmImageFilePath1 = partcptAcmImageFilePath1;
	}
	public String getPartcptAcmImageFileNm1() {
		return partcptAcmImageFileNm1;
	}
	public void setPartcptAcmImageFileNm1(String partcptAcmImageFileNm1) {
		this.partcptAcmImageFileNm1 = partcptAcmImageFileNm1;
	}
	public String getAttcheFileNm3() {
		return attcheFileNm3;
	}
	public void setAttcheFileNm3(String attcheFileNm3) {
		this.attcheFileNm3 = attcheFileNm3;
	}
	public String getAttcheFilePath3() {
		return attcheFilePath3;
	}
	public void setAttcheFilePath3(String attcheFilePath3) {
		this.attcheFilePath3 = attcheFilePath3;
	}
	public String getFloorPlanFileNm() {
		return floorPlanFileNm;
	}
	public void setFloorPlanFileNm(String floorPlanFileNm) {
		this.floorPlanFileNm = floorPlanFileNm;
	}
	public String getFloorPlanPath() {
		return floorPlanPath;
	}
	public void setFloorPlanPath(String floorPlanPath) {
		this.floorPlanPath = floorPlanPath;
	}
	public String getEntrpsNmIndex() {
		return entrpsNmIndex;
	}
	public void setEntrpsNmIndex(String entrpsNmIndex) {
		this.entrpsNmIndex = entrpsNmIndex;
	}
	public float getAcCnsltAmt() {
		return acCnsltAmt;
	}
	public void setAcCnsltAmt(float acCnsltAmt) {
		this.acCnsltAmt = acCnsltAmt;
	}
	public float getAcCntrctAmt() {
		return acCntrctAmt;
	}
	public void setAcCntrctAmt(float acCntrctAmt) {
		this.acCntrctAmt = acCntrctAmt;
	}
	public float getAcCnsltAmtSum() {
		return acCnsltAmtSum;
	}
	public void setAcCnsltAmtSum(float acCnsltAmtSum) {
		this.acCnsltAmtSum = acCnsltAmtSum;
	}
	public float getAcCntrctAmtSum() {
		return acCntrctAmtSum;
	}
	public void setAcCntrctAmtSum(float acCntrctAmtSum) {
		this.acCntrctAmtSum = acCntrctAmtSum;
	}
	public String getProgrsSttusNm() {
		return progrsSttusNm;
	}
	public void setProgrsSttusNm(String progrsSttusNm) {
		this.progrsSttusNm = progrsSttusNm;
	}
	public String getProgrsSttusCls() {
		return progrsSttusCls;
	}
	public void setProgrsSttusCls(String progrsSttusCls) {
		this.progrsSttusCls = progrsSttusCls;
	}
	public String getBoardName() {
		return boardName;
	}
	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}
	public String getBoardFilePath() {
		return boardFilePath;
	}
	public void setBoardFilePath(String boardFilePath) {
		this.boardFilePath = boardFilePath;
	}
	public String getData() {
		return data;
	}
	public void setData(String data) {
		this.data = data;
	}
	public String getLabel() {
		return label;
	}
	public void setLabel(String label) {
		this.label = label;
	}
	public String getCmpl() {
		return cmpl;
	}
	public void setCmpl(String cmpl) {
		this.cmpl = cmpl;
	}
	public String getHmpgUrl() {
		return hmpgUrl;
	}
	public void setHmpgUrl(String hmpgUrl) {
		this.hmpgUrl = hmpgUrl;
	}
	public String getRegistDate() {
		return registDate;
	}
	public void setRegistDate(String registDate) {
		this.registDate = registDate;
	}
	public String getProgressStatus() {
		return progressStatus;
	}
	public void setProgressStatus(String progressStatus) {
		this.progressStatus = progressStatus;
	}
	public String getWinnerStatus() {
		return winnerStatus;
	}
	public void setWinnerStatus(String winnerStatus) {
		this.winnerStatus = winnerStatus;
	}
	public String getCnsltexhbPhotoFileNm1() {
		return cnsltexhbPhotoFileNm1;
	}
	public void setCnsltexhbPhotoFileNm1(String cnsltexhbPhotoFileNm1) {
		this.cnsltexhbPhotoFileNm1 = cnsltexhbPhotoFileNm1;
	}
	public String getCnsltexhbPhotoFileCours1() {
		return cnsltexhbPhotoFileCours1;
	}
	public void setCnsltexhbPhotoFileCours1(String cnsltexhbPhotoFileCours1) {
		this.cnsltexhbPhotoFileCours1 = cnsltexhbPhotoFileCours1;
	}
	public String getCnsltexhbPhotoFileNm2() {
		return cnsltexhbPhotoFileNm2;
	}
	public void setCnsltexhbPhotoFileNm2(String cnsltexhbPhotoFileNm2) {
		this.cnsltexhbPhotoFileNm2 = cnsltexhbPhotoFileNm2;
	}
	public String getCnsltexhbPhotoFileCours2() {
		return cnsltexhbPhotoFileCours2;
	}
	public void setCnsltexhbPhotoFileCours2(String cnsltexhbPhotoFileCours2) {
		this.cnsltexhbPhotoFileCours2 = cnsltexhbPhotoFileCours2;
	}
	public String getCnsltexhbPhotoFileNm3() {
		return cnsltexhbPhotoFileNm3;
	}
	public void setCnsltexhbPhotoFileNm3(String cnsltexhbPhotoFileNm3) {
		this.cnsltexhbPhotoFileNm3 = cnsltexhbPhotoFileNm3;
	}
	public String getCnsltexhbPhotoFileCours3() {
		return cnsltexhbPhotoFileCours3;
	}
	public void setCnsltexhbPhotoFileCours3(String cnsltexhbPhotoFileCours3) {
		this.cnsltexhbPhotoFileCours3 = cnsltexhbPhotoFileCours3;
	}
	public String getCnsltexhbAttchFileNm1() {
		return cnsltexhbAttchFileNm1;
	}
	public void setCnsltexhbAttchFileNm1(String cnsltexhbAttchFileNm1) {
		this.cnsltexhbAttchFileNm1 = cnsltexhbAttchFileNm1;
	}
	public String getCnsltexhbAttchFileCours1() {
		return cnsltexhbAttchFileCours1;
	}
	public void setCnsltexhbAttchFileCours1(String cnsltexhbAttchFileCours1) {
		this.cnsltexhbAttchFileCours1 = cnsltexhbAttchFileCours1;
	}
	public String getCnsltexhbPhotoFileNm4() {
		return cnsltexhbPhotoFileNm4;
	}
	public void setCnsltexhbPhotoFileNm4(String cnsltexhbPhotoFileNm4) {
		this.cnsltexhbPhotoFileNm4 = cnsltexhbPhotoFileNm4;
	}
	public String getCnsltexhbPhotoFileCours4() {
		return cnsltexhbPhotoFileCours4;
	}
	public void setCnsltexhbPhotoFileCours4(String cnsltexhbPhotoFileCours4) {
		this.cnsltexhbPhotoFileCours4 = cnsltexhbPhotoFileCours4;
	}
	public String getCnsltexhbAttchFileNm2() {
		return cnsltexhbAttchFileNm2;
	}
	public void setCnsltexhbAttchFileNm2(String cnsltexhbAttchFileNm2) {
		this.cnsltexhbAttchFileNm2 = cnsltexhbAttchFileNm2;
	}
	public String getCnsltexhbAttchFileCours2() {
		return cnsltexhbAttchFileCours2;
	}
	public void setCnsltexhbAttchFileCours2(String cnsltexhbAttchFileCours2) {
		this.cnsltexhbAttchFileCours2 = cnsltexhbAttchFileCours2;
	}
	public String getCnsltexhbAttchFileNm3() {
		return cnsltexhbAttchFileNm3;
	}
	public void setCnsltexhbAttchFileNm3(String cnsltexhbAttchFileNm3) {
		this.cnsltexhbAttchFileNm3 = cnsltexhbAttchFileNm3;
	}
	public String getCnsltexhbAttchFileCours3() {
		return cnsltexhbAttchFileCours3;
	}
	public void setCnsltexhbAttchFileCours3(String cnsltexhbAttchFileCours3) {
		this.cnsltexhbAttchFileCours3 = cnsltexhbAttchFileCours3;
	}
	public String getWrterNm() {
		return wrterNm;
	}
	public void setWrtetNm(String wrterNm) {
		this.wrterNm = wrterNm;
	}
	public String getCdItem() {
		return cdItem;
	}
	public void setCdItem(String cdItem) {
		this.cdItem = cdItem;
	}
	public String getBiddingStatus() {
		return biddingStatus;
	}
	public void setBiddingStatus(String biddingStatus) {
		this.biddingStatus = biddingStatus;
	}
	public String getCorNum() {
		return corNum;
	}
	public void setCorNum(String corNum) {
		this.corNum = corNum;
	}
	public String getWorkCnt() {
		return workCnt;
	}
	public void setWorkCnt(String workCnt) {
		this.workCnt = workCnt;
	}
	public String getFaLocplc() {
		return faLocplc;
	}
	public void setFaLocplc(String faLocplc) {
		this.faLocplc = faLocplc;
	}
	public String getFaPostCode1() {
		return faPostCode1;
	}
	public void setFaPostCode1(String faPostCode1) {
		this.faPostCode1 = faPostCode1;
	}
	public String getFaPostCode2() {
		return faPostCode2;
	}
	public void setFaPostCode2(String faPostCode2) {
		this.faPostCode2 = faPostCode2;
	}
	public String getFaWorkCnt() {
		return faWorkCnt;
	}
	public void setFaWorkCnt(String faWorkCnt) {
		this.faWorkCnt = faWorkCnt;
	}
	public String getApplyFileNm() {
		return applyFileNm;
	}
	public void setApplyFileNm(String applyFileNm) {
		this.applyFileNm = applyFileNm;
	}
	public String getApplyFilePath() {
		return applyFilePath;
	}
	public void setApplyFilePath(String applyFilePath) {
		this.applyFilePath = applyFilePath;
	}
	public String getMainProductFileNm() {
		return mainProductFileNm;
	}
	public void setMainProductFileNm(String mainProductFileNm) {
		this.mainProductFileNm = mainProductFileNm;
	}
	public String getMainProductFilePath() {
		return mainProductFilePath;
	}
	public void setMainProductFilePath(String mainProductFilePath) {
		this.mainProductFilePath = mainProductFilePath;
	}
	public String getRsctftFileNm() {
		return rsctftFileNm;
	}
	public void setRsctftFileNm(String rsctftFileNm) {
		this.rsctftFileNm = rsctftFileNm;
	}
	public String getRsctftFilePath() {
		return rsctftFilePath;
	}
	public void setRsctftFilePath(String rsctftFilePath) {
		this.rsctftFilePath = rsctftFilePath;
	}
	public String getCareerFileNm() {
		return careerFileNm;
	}
	public void setCareerFileNm(String careerFileNm) {
		this.careerFileNm = careerFileNm;
	}
	public String getCareerFilePath() {
		return careerFilePath;
	}
	public void setCareerFilePath(String careerFilePath) {
		this.careerFilePath = careerFilePath;
	}
	public String getAgreeFileNm() {
		return agreeFileNm;
	}
	public void setAgreeFileNm(String agreeFileNm) {
		this.agreeFileNm = agreeFileNm;
	}
	public String getAgreeFilePath() {
		return agreeFilePath;
	}
	public void setAgreeFilePath(String agreeFilePath) {
		this.agreeFilePath = agreeFilePath;
	}
	public String getProductDetailGb() {
		return productDetailGb;
	}
	public void setProductDetailGb(String productDetailGb) {
		this.productDetailGb = productDetailGb;
	}
	public String getMapngYn() {
		return mapngYn;
	}
	public void setMapngYn(String mapngYn) {
		this.mapngYn = mapngYn;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public String getToDate() {
		return toDate;
	}
	public void setToDate(String toDate) {
		this.toDate = toDate;
	}
	public String getBiddingStatusNm() {
		return biddingStatusNm;
	}
	public void setBiddingStatusNm(String biddingStatusNm) {
		this.biddingStatusNm = biddingStatusNm;
	}
	public String getSlctnTypeNm() {
		return slctnTypeNm;
	}
	public void setSlctnTypeNm(String slctnTypeNm) {
		this.slctnTypeNm = slctnTypeNm;
	}
	public String getButtonStat() {
		return buttonStat;
	}
	public void setButtonStat(String buttonStat) {
		this.buttonStat = buttonStat;
	}
	public String getSlctnTypeCss() {
		return slctnTypeCss;
	}
	public void setSlctnTypeCss(String slctnTypeCss) {
		this.slctnTypeCss = slctnTypeCss;
	}
	public String getSlctnType() {
		return slctnType;
	}
	public void setSlctnType(String slctnType) {
		this.slctnType = slctnType;
	}
	public String getBiddingFileNm() {
		return biddingFileNm;
	}
	public void setBiddingFileNm(String biddingFileNm) {
		this.biddingFileNm = biddingFileNm;
	}
	public String getBiddingFilePath() {
		return biddingFilePath;
	}
	public void setBiddingFilePath(String biddingFilePath) {
		this.biddingFilePath = biddingFilePath;
	}
	public String getEtcFilePath() {
		return etcFilePath;
	}
	public void setEtcFilePath(String etcFilePath) {
		this.etcFilePath = etcFilePath;
	}

}
