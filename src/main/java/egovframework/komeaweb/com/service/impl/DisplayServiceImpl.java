package egovframework.komeaweb.com.service.impl;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.request.NativeWebRequest;

import egovframework.komeaweb.com.ShowFileUtils;
import egovframework.komeaweb.com.service.DisplayService;
import egovframework.komeaweb.com.service.MberVO;
import egovframework.komeaweb.com.service.ShowVO;


@Service("displayService")
public class DisplayServiceImpl  implements DisplayService {

	  @Resource(name="displayMapper")
	  private DisplayMapper displayMapper;
	  
	  @Override
	  public List<ShowVO> SelectKomeaMainExbiList(ShowVO showVO) throws Exception{
	    return displayMapper.SelectKomeaMainExbiList(showVO);
	  }
	  
	  @Override
	  public ShowVO SelectKomeaMainExbiInfo(ShowVO showVO) throws Exception{
	  return displayMapper.SelectKomeaMainExbiInfo(showVO);
	  }

	  @Override
	  public ShowVO SelectKomeaMainCnsltInfo(ShowVO showVO) throws Exception{
	  return displayMapper.SelectKomeaMainCnsltInfo(showVO);
	  }
	   
	  /** 전시상담포털 > 마린엑스포 > 지난행사보기 */
	  @Override
	  public List<ShowVO> SelectYearWorkList(ShowVO showVO) throws Exception{
	    return displayMapper.SelectYearWorkList(showVO);
	  }

	  @Override
	  public int SelectYearWorkListTotCnt(ShowVO showVO) throws Exception{
	    return displayMapper.SelectYearWorkListTotCnt(showVO);
	  }
	  
	  @Override
	  public List<ShowVO> SelectShowWorkList(ShowVO showVO) throws Exception{
	    return displayMapper.SelectShowWorkList(showVO);
	  }

	  @Override
	  public int SelectShowWorkListTotCnt(ShowVO showVO) throws Exception{
	    return displayMapper.SelectShowWorkListTotCnt(showVO);
	  }

	  @Override
	  public ShowVO ExbiRegistInfo(ShowVO showVO) throws Exception{
	    return displayMapper.ExbiRegistInfo(showVO);
	  }

	  @Override
	  public ShowVO CnsltexhbRegistInfo(ShowVO showVO) throws Exception{
	    return displayMapper.CnsltexhbRegistInfo(showVO);
	  }
	  
	  @Override
	  public List<ShowVO> SelectBuyerList1(ShowVO showVO) throws Exception{
	    return displayMapper.SelectBuyerList1(showVO);
	  }
	  
	  @Override
	  public ShowVO SelectBuyerInfo1(ShowVO showVO) throws Exception{
	    return displayMapper.SelectBuyerInfo1(showVO);
	  }

	  /** 전시상담포털 > 마린엑스포 > 해외 바이어 소개 */
	  @Override
	  public List<ShowVO> SelectBuyerList(ShowVO showVO) throws Exception{
	    return displayMapper.SelectBuyerList(showVO);
	  }

	  @Override
	  public int SelectBuyerListTotCnt(ShowVO showVO) throws Exception{
	    return displayMapper.SelectBuyerListTotCnt(showVO);
	  }
	  
	  @Override
	  public List<ShowVO> SelectBuyerResultAccList(ShowVO showVO) throws Exception{
	    return displayMapper.SelectBuyerResultAccList(showVO);
	  }
	  
	  @Override
	  public ShowVO SelectBuyerResultAccSum(ShowVO showVO) throws Exception{
	    return displayMapper.SelectBuyerResultAccSum(showVO);
	  }

	  /** 전시상담포털 > 마린엑스포 > 회원사 목록 */
	  @Override
	  public List<ShowVO> SelectCompanyList(ShowVO showVO) throws Exception{
	    return displayMapper.SelectCompanyList(showVO);
	  }

	  @Override
	  public int SelectCompanyListTotCnt(ShowVO showVO) throws Exception{
	    return displayMapper.SelectCompanyListTotCnt(showVO);
	  }
	  
	  @Override
	  public List<ShowVO> SelectCompResultAccList(ShowVO showVO) throws Exception{
	    return displayMapper.SelectCompResultAccList(showVO);
	  }
	  
	  @Override
	  public ShowVO SelectCompResultAccSum(ShowVO showVO) throws Exception{
	    return displayMapper.SelectCompResultAccSum(showVO);
	  }
	  
	  @Override
	  public ShowVO SelectCompanyInfo(ShowVO showVO) throws Exception{
	    return displayMapper.SelectCompanyInfo(showVO);
	  }
	  
	  
	  @Override
	  public List<ShowVO> SelectExbiOrCnsltBiddingResultList(ShowVO showVO) throws Exception{
	    return displayMapper.SelectExbiOrCnsltBiddingResultList(showVO);
	  }
	  
	  @Override
	  public List<ShowVO> SelectExbiWinCompanyList(ShowVO showVO) throws Exception{
	    return displayMapper.SelectExbiWinCompanyList(showVO);
	  }
	  
	  @Override
	  public List<ShowVO> SelectCnsltexhbWinCompanyList(ShowVO showVO) throws Exception{
	    return displayMapper.SelectCnsltexhbWinCompanyList(showVO);
	  }
	  
	  
	  /** 전시상담포털 > 전시행사 > 전시행사 목록 */
	  @Override
	  public List<ShowVO> SelectExbiList(ShowVO showVO) throws Exception{
	    return displayMapper.SelectExbiList(showVO);
	  }

	  @Override
	  public int SelectExbiListTotCnt(ShowVO showVO) throws Exception{
	    return displayMapper.SelectExbiListTotCnt(showVO);
	  }
	  
	  @Transactional
	  @Override
	  public void InsertRequestExbiInfo(ShowVO showVO, HttpServletRequest request) throws Exception {
		  
		  System.out.println("@@@@ InsertRequestExbiInfo @@@@");
		  
		  MberVO sessionVO = (MberVO)request.getSession().getAttribute("loginInfo");
		  //Mber_Info테이블 업데이트
		  showVO.setMberCd(sessionVO.getMberCd());
		  displayMapper.UpdateShowMberInfo(showVO);
		  ShowVO exbiReqstInfo = displayMapper.SelectExbiReqstInfo(showVO);
		  
		  System.out.println("@@ exbiReqstInfo : "+exbiReqstInfo);
		 // System.out.println("@@ exbiReqstInfo : "+exbiReqstInfo.getExbiCd());
		  
		  if(exbiReqstInfo == null){
			  System.out.println("전시행사 신청 진입 : InsertRequestExbiInfo");
			  //신규입력
			  showVO.setInsertUserDt(sessionVO.getUpdateUserDt());
			  showVO.setInsertUserId(sessionVO.getId());
			  showVO.setSlctnYn("");
			  showVO.setMberCd(sessionVO.getMberCd());

			  displayMapper.InsertExbiReqstInfo(showVO);//신청테이블 인서트
			  displayMapper.InsertExbiReqstFileInfo(showVO);//신청-파일테이블 필수값 인서트
			  List<Map<String,Object>> list = ShowFileUtils.ExbiRequestFileUpload(showVO, request);

			  for(int i=0, size=list.size(); i<size; i++){
				  displayMapper.UpdateExbiReqstFileInfo(list.get(i));//신청-파일테이블 파일 업로드/업데이트
			  }
		  }else{
			  System.out.println("전시행사 수정 진입 : InsertRequestExbiInfo");
			  //수정
			  showVO.setSlctnYn("");
			  displayMapper.UpdateExbiReqstInfo(showVO);//신청테이블 업데이트
			  List<Map<String,Object>> list = ShowFileUtils.ExbiRequestFileUpload(showVO, request);

			  for(int i=0, size=list.size(); i<size; i++){
				  displayMapper.UpdateExbiReqstFileInfo(list.get(i));//신청-파일테이블 파일 업로드/업데이트
			  }
		  }
	  }
	  
	  @Transactional
	  @Override
	  public void DeleteExbiReqstFileInfo(ShowVO showVO) throws Exception {
		  displayMapper.DeleteExbiReqstFileInfo(showVO);
	  }
	  
	  /** 전시상담포털 > 상담행사 > 상담행사 목록 */
	  @Override
	  public List<ShowVO> SelectCnsltList(ShowVO showVO) throws Exception{
	    return displayMapper.SelectCnsltList(showVO);
	  }

	  @Override
	  public int SelectCnsltListTotCnt(ShowVO showVO) throws Exception{
	    return displayMapper.SelectCnsltListTotCnt(showVO);
	  }
	  
	  @Transactional
	  @Override
	  public void InsertRequestCnsltInfo(ShowVO showVO, NativeWebRequest webRequest, HttpServletRequest request) throws Exception {
		  MberVO sessionVO = (MberVO)request.getSession().getAttribute("loginInfo");
		  //Mber_Info테이블 업데이트
		  showVO.setMberCd(sessionVO.getMberCd());
		  displayMapper.UpdateShowMberInfo(showVO);

		  ShowVO CnsltexhbReqstInfo;
		  CnsltexhbReqstInfo = displayMapper.SelectCnsltexhbReqstInfo(showVO);
		  if(CnsltexhbReqstInfo == null){
			  System.out.println("상담행사 신청 진입 : InsertRequestCnsltInfo");
			  //신규입력
			  showVO.setSlctnYn("");
			  showVO.setMberCd(sessionVO.getMberCd());

			  displayMapper.InsertCnsltexhbReqstInfo(showVO);//신청테이블 인서트
			  displayMapper.InsertCnsltexhbReqstFileInfo(showVO);//신청-파일테이블 필수값 인서트
			  List<Map<String,Object>> list = ShowFileUtils.CnsltRequestFileUpload(showVO, request);

			  for(int i=0, size=list.size(); i<size; i++){
				  displayMapper.UpdateCnsltexhbReqstFileInfo(list.get(i));//신청-파일테이블 파일 업로드/업데이트
			  }
		  }else{
			  System.out.println("상담행사 수정 진입 : InsertRequestCnsltInfo");
			  //수정
			  showVO.setSlctnYn("");
			  displayMapper.UpdateCnsltexhbReqstInfo(showVO);//신청테이블 업데이트
			  List<Map<String,Object>> list = ShowFileUtils.CnsltRequestFileUpload(showVO, request);

			  for(int i=0, size=list.size(); i<size; i++){
				  displayMapper.UpdateCnsltexhbReqstFileInfo(list.get(i));//신청-파일테이블 파일 업로드/업데이트
			  }
		  }
		  System.out.println("상담행사 바이어 진입 : InsertRequestCnsltInfo");
		  //바이어정보 등록
		  Map<String, Object> listMap = new HashMap<String, Object>();
		  request = (HttpServletRequest) webRequest.getNativeRequest();
		  Enumeration<?> enumeration = request.getParameterNames();

		  String key = null;
		  String[] aTmp = null;
		  while(enumeration.hasMoreElements()){
			  key = (String)enumeration.nextElement();
			  aTmp = request.getParameterValues("buyerCd");
		  }
		  String[] aVal1 = aTmp[0].split(",");

		  showVO.setMapngYn("N");
		  for(int i=0; i<aVal1.length; i++){
			  if(aVal1[i] != null){
				  showVO.setBuyerCd(aVal1[i]);
				  displayMapper.InsertPreferBuyerInfo(showVO);
			  }
		  }
	  }
	  
	  @Transactional
	  @Override
	  public void DeleteCnsltexhbReqstFileInfo(ShowVO showVO) throws Exception {
		  displayMapper.DeleteCnsltexhbReqstFileInfo(showVO);
	  }
	  
	  @Override
	  public List<ShowVO> SelectPreferBuyerList(ShowVO showVO) throws Exception{
	    return displayMapper.SelectPreferBuyerList(showVO);
	  }
	  
	  /** 전시상담포털 > MyDesk > 지원사업관리 목록 */
	  @Override
	  public List<ShowVO> SelectExbiAndCnsltList(ShowVO showVO) throws Exception{
	    return displayMapper.SelectExbiAndCnsltList(showVO);
	  }

	  @Override
	  public int SelectExbiAndCnsltListTotCnt(ShowVO showVO) throws Exception{
	    return displayMapper.SelectExbiAndCnsltListTotCnt(showVO);
	  }
	  
	  @Transactional
	  @Override
	  public void UpdateProgressStatus(ShowVO showVO) throws Exception {
		  displayMapper.UpdateProgressStatus(showVO);
	  }
	  
	  @Transactional
	  @Override
	  public void DeleteExbiBusiness(ShowVO showVO) throws Exception {
		  displayMapper.DeleteExbiInfoFile(showVO);
		  displayMapper.DeleteExbi(showVO);
	  }
	  
	  @Transactional
	  @Override
	  public void DeleteCnsltBusiness(ShowVO showVO) throws Exception {
		  displayMapper.DeleteCnsltFile(showVO);
		  displayMapper.DeleteCnslt(showVO);
	  }
	  
	  @Override
	  public ShowVO ExbiRegistInfoEdit(ShowVO showVO) throws Exception{
	    return displayMapper.ExbiRegistInfoEdit(showVO);
	  }
	  
	  @Override
	  public ShowVO CnsltexhbRegistInfoEdit(ShowVO showVO) throws Exception{
	    return displayMapper.CnsltexhbRegistInfoEdit(showVO);
	  }
	  
	  @Transactional
	  @Override
	  public void InsertSuppBizManageExbi(ShowVO showVO, HttpServletRequest request) throws Exception {
		  displayMapper.InsertSuppBizManageExbi(showVO);
		  displayMapper.InsertSuppBizManageExbiFile(showVO);
		  List<Map<String,Object>> list = ShowFileUtils.ExbiFileUpload(showVO, request);

		  for(int i=0, size=list.size(); i<size; i++){
			  displayMapper.UpdateSuppBizManageExbiFile(list.get(i));
		  }
	  }

	  @Transactional
	  @Override
	  public void UpdateSuppBizManageExbi(ShowVO showVO, HttpServletRequest request) throws Exception {
		  displayMapper.UpdateSuppBizManageExbi(showVO);
		  List<Map<String,Object>> list = ShowFileUtils.ExbiFileUpload(showVO, request);

		  for(int i=0, size=list.size(); i<size; i++){
			  displayMapper.UpdateSuppBizManageExbiFile(list.get(i));
		  }
	  }
	  
	  @Transactional
	  @Override
	  public void DeleteSuppBizManageExbiFile(ShowVO showVO) throws Exception {
		  displayMapper.DeleteSuppBizManageExbiFile(showVO);
	  }
	  
	  @Transactional
	  @Override
	  public void InsertSuppBizManageCnslt(ShowVO showVO, HttpServletRequest request) throws Exception {
		  displayMapper.InsertSuppBizManageCnslt(showVO);
		  displayMapper.InsertSuppBizManageCnsltFile(showVO);
		  List<Map<String,Object>> list = ShowFileUtils.CnsltFileUpload(showVO, request);

		  for(int i=0, size=list.size(); i<size; i++){
			  displayMapper.UpdateSuppBizManageCnsltFile(list.get(i));
		  }
	  }

	  @Transactional
	  @Override
	  public void UpdateSuppBizManageCnslt(ShowVO showVO, HttpServletRequest request) throws Exception {
		  displayMapper.UpdateSuppBizManageCnslt(showVO);
		  List<Map<String,Object>> list = ShowFileUtils.CnsltFileUpload(showVO, request);

		  for(int i=0, size=list.size(); i<size; i++){
			  displayMapper.UpdateSuppBizManageCnsltFile(list.get(i));
		  }
	  }
	  
	  @Transactional
	  @Override
	  public void DeleteSuppBizManageCnsltFile(ShowVO showVO) throws Exception {
		  displayMapper.DeleteSuppBizManageCnsltFile(showVO);
	  }
	  
	  @Override
	  public ShowVO SelectExbiByMove(ShowVO showVO) throws Exception{
	    return displayMapper.SelectExbiByMove(showVO);
	  }
	  
	  @Override
	  public ShowVO SelectCnsltByMove(ShowVO showVO) throws Exception{
	    return displayMapper.SelectCnsltByMove(showVO);
	  }
	  
	  /** 전시상담포털 > MyDesk > 참여신청업체 목록 */
	  @Override
	  public List<ShowVO> SelectExbiReqCompanyList(ShowVO showVO) throws Exception{
	    return displayMapper.SelectExbiReqCompanyList(showVO);
	  }

	  @Override
	  public int SelectExbiReqCompanyListTotCnt(ShowVO showVO) throws Exception{
	    return displayMapper.SelectExbiReqCompanyListTotCnt(showVO);
	  } 
	 
	  @Override
	  public List<ShowVO> SelectCnsltReqCompanyList(ShowVO showVO) throws Exception{
	    return displayMapper.SelectCnsltReqCompanyList(showVO);
	  }

	  @Override
	  public int SelectCnsltReqCompanyListTotCnt(ShowVO showVO) throws Exception{
	    return displayMapper.SelectCnsltReqCompanyListTotCnt(showVO);
	  }	  
	  
	  @Transactional
	  @Override
	  public void UpdateSlctnYn(ShowVO showVO) throws Exception {
		  displayMapper.UpdateSlctnYn(showVO);
	  }
	  
	  @Transactional
	  @Override
	  public void UpdateWinCmpl(ShowVO showVO) throws Exception {
		  displayMapper.UpdateWinCmpl(showVO);
	  }
	  
	  /** 전시상담포털 > MyDesk > 입찰신청관리 목록 */
	  @Override
	  public List<ShowVO> SelectReqBiddingOthersList(ShowVO showVO) throws Exception{
	    return displayMapper.SelectReqBiddingOthersList(showVO);
	  }

	  @Override
	  public int SelectReqBiddingOthersListTotCnt(ShowVO showVO) throws Exception{
	    return displayMapper.SelectReqBiddingOthersListTotCnt(showVO);
	  } 
	  
	  @Override
	  public List<ShowVO> SelectBiddingStatus(ShowVO showVO) throws Exception{
	    return displayMapper.SelectBiddingStatus(showVO);
	  }
	  
	  @Transactional
	  @Override
	  public void UpdateBiddingStatus(ShowVO showVO) throws Exception {
		  displayMapper.UpdateBiddingStatus(showVO);
	  }
	  
	  @Transactional
	  @Override
	  public void UpdateBiddingResultComplete(ShowVO showVO) throws Exception {
		  displayMapper.UpdateBiddingResultComplete(showVO);
	  }
	  
	  @Override
	  public List<ShowVO> SelectBiddingStatusCompanyList(ShowVO showVO) throws Exception{
	    return displayMapper.SelectBiddingStatusCompanyList(showVO);
	  }
	  
	  /** 전시상담포털 > MyDesk > 우수기업선정관리 목록 */
	  @Override
	  public List<ShowVO> SelectReqBestCompOthersList(ShowVO showVO) throws Exception{
	    return displayMapper.SelectReqBestCompOthersList(showVO);
	  }

	  @Override
	  public int SelectReqBestCompOthersListTotCnt(ShowVO showVO) throws Exception{
	    return displayMapper.SelectReqBestCompOthersListTotCnt(showVO);
	  } 
	  
	  @Transactional
	  @Override
	  public void UpdateWinnerStatus(ShowVO showVO) throws Exception {
		  displayMapper.UpdateWinnerStatus(showVO);
	  }
	  
	  @Transactional
	  @Override
	  public void UpdateWinnerReqstInfo(ShowVO showVO) throws Exception {
		  displayMapper.UpdateWinnerReqstInfo(showVO);
	  }
	  
	  @Transactional
	  @Override
	  public void DeleteBestCompanyRequest(ShowVO showVO) throws Exception {
		  displayMapper.DeleteBestCompanyRequest(showVO);
	  }
	  
	  @Transactional
	  @Override
	  public void UpdateBestCompResultComplete(ShowVO showVO) throws Exception {
		  displayMapper.UpdateBestCompResultComplete(showVO);
	  }
	  
	  @Override
	  public List<ShowVO> SelectBestCompStatus(ShowVO showVO) throws Exception{
	    return displayMapper.SelectBestCompStatus(showVO);
	  }
	  
	  @Override
	  public List<ShowVO> SelectBestCompStatusCompanyList(ShowVO showVO) throws Exception{
	    return displayMapper.SelectBestCompStatusCompanyList(showVO);
	  }

	  /** 전시상담포털 > 정보마당 > 게시판 목록 */
	  @Override
	  public List<ShowVO> SelectBoardList(ShowVO showVO) throws Exception{
	    return displayMapper.SelectBoardList(showVO);
	  }

	  @Override
	  public int SelectBoardListTotCnt(ShowVO showVO) throws Exception{
	    return displayMapper.SelectBoardListTotCnt(showVO);
	  }
	  
	  @Override
	  public ShowVO SelectBoardView(ShowVO showVO) throws Exception {
	      return displayMapper.SelectBoardView(showVO);
	  }
	  
	  @Override
	  public ShowVO SelectEventNm(ShowVO showVO) throws Exception {
	      return displayMapper.SelectEventNm(showVO);
	  }
	  /*
	  @Override
	  public List<ShowVO> SelectFileList(ShowVO showVO) throws Exception {
	      return displayMapper.SelectFileList(showVO);
	  }
	  */
	  
	  @Override
	  public List<ShowVO> SelectBoardPreNextList(ShowVO showVO) throws Exception {
	      return displayMapper.SelectBoardPreNextList(showVO);
	  }
	  
	  @Transactional
	  @Override
	  public void UpdateViewCnt(ShowVO showVO) throws Exception {
		  displayMapper.UpdateViewCnt(showVO);
	  }
	  
	@Transactional
	@Override
	public void InsertBoard(ShowVO showVO, HttpServletRequest request) throws Exception {
		
		if(showVO.getInsertUserId().equals("")){
			showVO.setInsertUserId("GUEST");
		}
		if(showVO.getWrter().equals("")){
			showVO.setWrter("GUEST");
		}
		
		displayMapper.InsertBoard(showVO);
		  List<Map<String,Object>> list = ShowFileUtils.BbsFileUpload(showVO, request);

		  for(int i=0, size=list.size(); i<size; i++){
			  displayMapper.UpdateBoardFile(list.get(i));
		  }
	}

    @Transactional
    @Override
    public void UpdateBoard(ShowVO showVO, HttpServletRequest request) throws Exception {
    	displayMapper.UpdateBoard(showVO);
		  List<Map<String,Object>> list = ShowFileUtils.BbsFileUpload(showVO, request);

		  for(int i=0, size=list.size(); i<size; i++){
			  displayMapper.UpdateBoardFile(list.get(i));
		  }
    }
    
    @Transactional
    @Override
    public void DeleteBoard(ShowVO showVO, HttpServletRequest request) throws Exception {
    	displayMapper.DeleteBoard(showVO);
    }
    
    @Override
    public ShowVO SelectExbiPreReguestInfo(ShowVO showVO) throws Exception {
    	return displayMapper.SelectExbiPreReguestInfo(showVO);
    }
    
    @Override
    public ShowVO SelectCnsltPreReguestInfo(ShowVO showVO) throws Exception {
    	return displayMapper.SelectCnsltPreReguestInfo(showVO);
    }
    
    @Override
    public ShowVO SelectBiddingPreReguestInfo(ShowVO showVO) throws Exception {
    	return displayMapper.SelectBiddingPreReguestInfo(showVO);
    }
    
    @Override
    public ShowVO SelectWinnerPreReguestInfo(ShowVO showVO) throws Exception {
    	return displayMapper.SelectWinnerPreReguestInfo(showVO);
    }
	  
    @Override
    public ShowVO SelectLoginUser(ShowVO showVO) throws Exception {
    	return displayMapper.SelectLoginUser(showVO);
    }
    
    @Override
    public ShowVO SelectExbiCompReq(ShowVO showVO) throws Exception {
    	return displayMapper.SelectExbiCompReq(showVO);
    }
    
    @Override
    public ShowVO SelectCnsltCompReq(ShowVO showVO) throws Exception {
    	return displayMapper.SelectCnsltCompReq(showVO);
    }
    
    @Override
    public ShowVO SelectMberInfo(ShowVO showVO) throws Exception {
    	return displayMapper.SelectMberInfo(showVO);
    }
    
	@Transactional
	@Override
	public void InsertBiddingReqstInfo(ShowVO showVO, HttpServletRequest request) throws Exception {
		
		MberVO sessionVO = (MberVO)request.getSession().getAttribute("loginInfo");
		//Mber_Info테이블 업데이트
		displayMapper.UpdateShowMberInfo(showVO);
		
		ShowVO BiddingReqstInfo;
		BiddingReqstInfo = displayMapper.SelectBiddingReqstInfo(showVO);
		if(BiddingReqstInfo == null){
			//신규입력
			showVO.setInsertUserDt(sessionVO.getUpdateUserDt());
			showVO.setInsertUserId(sessionVO.getId());
			showVO.setBiddingStatus("0");
			showVO.setMberCd(sessionVO.getMberCd());

			displayMapper.InsertBiddingReqstInfo(showVO);
			List<Map<String,Object>> list = ShowFileUtils.BiddingFileUpload(showVO, request);

			for(int i=0, size=list.size(); i<size; i++){
				displayMapper.UpdateBiddingReqstInfo(list.get(i));
			}
		}else{
			//수정
			showVO.setBiddingStatus("");
			List<Map<String,Object>> list = ShowFileUtils.BiddingFileUpload(showVO, request);

			for(int i=0, size=list.size(); i<size; i++){
				displayMapper.UpdateBiddingReqstInfo(list.get(i));
			}
		}
	}
	
	  @Transactional
	  @Override
	  public void DeleteBiddingReqstInfo(ShowVO showVO) throws Exception {
		  displayMapper.DeleteBiddingReqstInfo(showVO);
	  }
	
	@Transactional
	@Override
	public void InsertBestCompanyReqstInfo(ShowVO showVO, HttpServletRequest request) throws Exception {
		
		MberVO sessionVO = (MberVO)request.getSession().getAttribute("loginInfo");
		ShowVO WinnerReqstInfo;
		WinnerReqstInfo = displayMapper.SelectBestCompanyReqstInfo(showVO);
		if(WinnerReqstInfo == null){
			//신규입력
			showVO.setInsertUserDt(sessionVO.getUpdateUserDt());
			showVO.setInsertUserId(sessionVO.getId());
			showVO.setWinnerStatus("0");
			showVO.setMberCd(sessionVO.getMberCd());

			displayMapper.InsertBestCompanyReqstInfo(showVO);
			List<Map<String,Object>> list = ShowFileUtils.BestCompFileUpload(showVO, request);

			for(int i=0, size=list.size(); i<size; i++){
				displayMapper.UpdateBestCompanyReqstInfo(list.get(i));
			}
		}else{
			//수정
			showVO.setBiddingStatus("");
			List<Map<String,Object>> list = ShowFileUtils.BestCompFileUpload(showVO, request);

			for(int i=0, size=list.size(); i<size; i++){
				displayMapper.UpdateBestCompanyReqstInfo(list.get(i));
			}
		}
	}
	
	@Transactional
	@Override
	public void DeleteBestCompanyReqstInfo(ShowVO showVO) throws Exception {
		displayMapper.DeleteBestCompanyReqstInfo(showVO);
	}
	
    /** 전시상담포털 > 콤보박스 */
    @Override
    public List<ShowVO> SelectPreCombo0(ShowVO showVO) throws Exception{
    	return displayMapper.SelectPreCombo0(showVO);
    }
  
    @Override
    public List<ShowVO> SelectPreCombo1(ShowVO showVO) throws Exception{
    	return displayMapper.SelectPreCombo1(showVO);
    }
  
    @Override
    public List<ShowVO> SelectRedyExbiCombo(ShowVO showVO) throws Exception{
    	return displayMapper.SelectRedyExbiCombo(showVO);
    }
  
    @Override
    public List<ShowVO> SelectRedyCnsltCombo(ShowVO showVO) throws Exception{
    	return displayMapper.SelectRedyCnsltCombo(showVO);
    }
  
    @Override
	public List<ShowVO> SelectBiddingCombo(ShowVO showVO) throws Exception{
    	return displayMapper.SelectBiddingCombo(showVO);
    }
  
    @Override
    public List<ShowVO> SelectBestCompCombo(ShowVO showVO) throws Exception{
    	return displayMapper.SelectBestCompCombo(showVO);
    }
    
    @Override
    public List<ShowVO> CodeBookList(String cdDec) throws Exception{
      return displayMapper.CodeBookList(cdDec);
    }
    
    @Override
    public List<ShowVO> LocComboList(ShowVO showVO) throws Exception{
    	return displayMapper.LocComboList(showVO);
    }
    
    @Override
    public List<ShowVO> YearComboList(ShowVO showVO) throws Exception{
      return displayMapper.YearComboList(showVO);
    }
    
    @Override
    public List<ShowVO> SelectRedyEventCombo(ShowVO showVO) throws Exception{
      return displayMapper.SelectRedyEventCombo(showVO);
    }
}
