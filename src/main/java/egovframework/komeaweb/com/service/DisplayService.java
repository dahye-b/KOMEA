package egovframework.komeaweb.com.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.request.NativeWebRequest;

public interface DisplayService {
	
	 public List<ShowVO> SelectKomeaMainExbiList(ShowVO showVO) throws Exception;
	 
	 public ShowVO SelectKomeaMainExbiInfo(ShowVO showVO) throws Exception;

	 public ShowVO SelectKomeaMainCnsltInfo(ShowVO showVO) throws Exception;

	  /** 전시상담포털 > 마린엑스포 > 지난행사보기 */
	  public List<ShowVO> SelectYearWorkList(ShowVO showVO) throws Exception;
	  
	  public int SelectYearWorkListTotCnt(ShowVO showVO) throws Exception;
	  
	  public List<ShowVO> SelectShowWorkList(ShowVO showVO) throws Exception;
	  
	  public int SelectShowWorkListTotCnt(ShowVO showVO) throws Exception;

	  public ShowVO ExbiRegistInfo(ShowVO showVO) throws Exception;

	  public ShowVO CnsltexhbRegistInfo(ShowVO showVO) throws Exception;
	  
	  public List<ShowVO> SelectBuyerList1(ShowVO showVO) throws Exception;
	  
	  public ShowVO SelectBuyerInfo1(ShowVO showVO) throws Exception;

	  /** 전시상담포털 > 마린엑스포 > 해외 바이어 소개 */
	  public List<ShowVO> SelectBuyerList(ShowVO showVO) throws Exception;
	  
	  public int SelectBuyerListTotCnt(ShowVO showVO) throws Exception;
	  
	  public List<ShowVO> SelectBuyerResultAccList(ShowVO showVO) throws Exception;
	  
	  public ShowVO  SelectBuyerResultAccSum(ShowVO showVO) throws Exception;

	  /** 전시상담포털 > 마린엑스포 > 회원사 목록 */
	  public List<ShowVO> SelectCompanyList(ShowVO showVO) throws Exception;
	  
	  public int SelectCompanyListTotCnt(ShowVO showVO) throws Exception;
	  
	  public List<ShowVO> SelectCompResultAccList(ShowVO showVO) throws Exception;
	  
	  public ShowVO SelectCompResultAccSum(ShowVO showVO) throws Exception;
	  
	  public ShowVO SelectCompanyInfo(ShowVO showVO) throws Exception;
	  
	  
	  public List<ShowVO> SelectExbiOrCnsltBiddingResultList(ShowVO showVO) throws Exception;
	  
	  public List<ShowVO> SelectExbiWinCompanyList(ShowVO showVO) throws Exception;
	  
	  public List<ShowVO> SelectCnsltexhbWinCompanyList(ShowVO showVO) throws Exception;
	  
	  
	  /** 전시상담포털 > 전시행사 > 전시행사 목록 */
	  public List<ShowVO> SelectExbiList(ShowVO showVO) throws Exception;
	  
	  public int SelectExbiListTotCnt(ShowVO showVO) throws Exception;
	  
	  @Transactional
	  public void InsertRequestExbiInfo(ShowVO showVO, HttpServletRequest request) throws Exception;
	  
	  @Transactional
	  public void DeleteExbiReqstFileInfo(ShowVO showVO) throws Exception;
	  
	  /** 전시상담포털 > 상담행사 > 상담행사 목록 */
	  public List<ShowVO> SelectCnsltList(ShowVO showVO) throws Exception;
	  
	  public int SelectCnsltListTotCnt(ShowVO showVO) throws Exception;
	  
	  @Transactional
	  public void InsertRequestCnsltInfo(ShowVO showVO, NativeWebRequest webRequest, HttpServletRequest request) throws Exception;
	  
	  @Transactional
	  public void DeleteCnsltexhbReqstFileInfo(ShowVO showVO) throws Exception;
	  
	  public List<ShowVO> SelectPreferBuyerList(ShowVO showVO) throws Exception;
	  
	  
	  
	  
	  /** 전시상담포털 > MyDesk > 지원사업관리 목록 */
	  public List<ShowVO> SelectExbiAndCnsltList(ShowVO showVO) throws Exception;
	  
	  public int SelectExbiAndCnsltListTotCnt(ShowVO showVO) throws Exception;
	  
	  @Transactional
	  public void UpdateProgressStatus(ShowVO showVO) throws Exception;
	  
	  @Transactional
	  public void DeleteExbiBusiness(ShowVO showVO) throws Exception;
	  
	  @Transactional
	  public void DeleteCnsltBusiness(ShowVO showVO) throws Exception;
	  
	  public ShowVO ExbiRegistInfoEdit(ShowVO showVO) throws Exception;
	  
	  public ShowVO CnsltexhbRegistInfoEdit(ShowVO showVO) throws Exception;
	  
	  @Transactional
	  public void InsertSuppBizManageExbi(ShowVO showVO, HttpServletRequest request) throws Exception;
	  
	  @Transactional
	  public void UpdateSuppBizManageExbi(ShowVO showVO, HttpServletRequest request) throws Exception;
	  
	  @Transactional
	  public void DeleteSuppBizManageExbiFile(ShowVO showVO) throws Exception;
	  
	  @Transactional
	  public void InsertSuppBizManageCnslt(ShowVO showVO, HttpServletRequest request) throws Exception;
	  
	  @Transactional
	  public void UpdateSuppBizManageCnslt(ShowVO showVO, HttpServletRequest request) throws Exception;
	  
	  @Transactional
	  public void DeleteSuppBizManageCnsltFile(ShowVO showVO) throws Exception;
	  
	  public ShowVO SelectExbiByMove(ShowVO showVO) throws Exception;
	  
	  public ShowVO SelectCnsltByMove(ShowVO showVO) throws Exception;
	  
	  /** 전시상담포털 > MyDesk > 참여신청업체 목록 */
	  public List<ShowVO> SelectExbiReqCompanyList(ShowVO showVO) throws Exception;
	  
	  public int SelectExbiReqCompanyListTotCnt(ShowVO showVO) throws Exception;
	  
	  public List<ShowVO> SelectCnsltReqCompanyList(ShowVO showVO) throws Exception;
	  
	  public int SelectCnsltReqCompanyListTotCnt(ShowVO showVO) throws Exception;
	  
	  @Transactional
	  public void UpdateSlctnYn(ShowVO showVO) throws Exception;
	  
	  @Transactional
	  public void UpdateWinCmpl(ShowVO showVO) throws Exception;
	  
	  /** 전시상담포털 > MyDesk > 입찰신청관리 목록 */
	  public List<ShowVO> SelectReqBiddingOthersList(ShowVO showVO) throws Exception;
	  
	  public int SelectReqBiddingOthersListTotCnt(ShowVO showVO) throws Exception;
	  
	  public List<ShowVO> SelectBiddingStatus(ShowVO showVO) throws Exception;
	  
	  @Transactional
	  public void UpdateBiddingStatus(ShowVO showVO) throws Exception;
	  
	  @Transactional
	  public void UpdateBiddingResultComplete(ShowVO showVO) throws Exception;
	  
	  public List<ShowVO> SelectBiddingStatusCompanyList(ShowVO showVO) throws Exception;

	  
	  /** 전시상담포털 > MyDesk > 우수기업선정관리 목록 */
	  public List<ShowVO> SelectReqBestCompOthersList(ShowVO showVO) throws Exception;
	  
	  public int SelectReqBestCompOthersListTotCnt(ShowVO showVO) throws Exception;
	  
	  @Transactional
	  public void UpdateWinnerStatus(ShowVO showVO) throws Exception;
	  
	  @Transactional
	  public void UpdateWinnerReqstInfo(ShowVO showVO) throws Exception;
	  
	  @Transactional
	  public void DeleteBestCompanyRequest(ShowVO showVO) throws Exception;
	  
	  @Transactional
	  public void UpdateBestCompResultComplete(ShowVO showVO) throws Exception;
	  
	  public List<ShowVO> SelectBestCompStatus(ShowVO showVO) throws Exception;
	  
	  public List<ShowVO> SelectBestCompStatusCompanyList(ShowVO showVO) throws Exception;
	  
	  
	  /** 전시상담포털 > 정보마당 > 게시판 목록 */
	  public List<ShowVO> SelectBoardList(ShowVO showVO) throws Exception;
	  
	  public int SelectBoardListTotCnt(ShowVO showVO) throws Exception;
	  
	  public ShowVO SelectBoardView(ShowVO showVO) throws Exception;
	  
	  public ShowVO SelectEventNm(ShowVO showVO) throws Exception;
	  
	  //public List<ShowVO> SelectFileList(ShowVO showVO) throws Exception;
		
	  public List<ShowVO> SelectBoardPreNextList(ShowVO showVO) throws Exception;
		
	  @Transactional
	  public void UpdateViewCnt(ShowVO showVO) throws Exception;
	  
	  @Transactional
	  public void InsertBoard(ShowVO showVO, HttpServletRequest request) throws Exception;
	  
	  @Transactional
	  public void UpdateBoard(ShowVO showVO, HttpServletRequest request) throws Exception;
	  
	  @Transactional
	  public void DeleteBoard(ShowVO showVO, HttpServletRequest request) throws Exception;
	  
	  public ShowVO SelectExbiPreReguestInfo(ShowVO showVO) throws Exception;
	  
	  public ShowVO SelectCnsltPreReguestInfo(ShowVO showVO) throws Exception;
	  
	  public ShowVO SelectBiddingPreReguestInfo(ShowVO showVO) throws Exception;
	  
	  public ShowVO SelectWinnerPreReguestInfo(ShowVO showVO) throws Exception;
	  
	  public ShowVO SelectLoginUser(ShowVO showVO) throws Exception;
	  
	  public ShowVO SelectExbiCompReq(ShowVO showVO) throws Exception;
	  
	  public ShowVO SelectCnsltCompReq(ShowVO showVO) throws Exception;
	  
	  public ShowVO SelectMberInfo(ShowVO showVO) throws Exception;
	  
	  @Transactional
	  public void InsertBiddingReqstInfo(ShowVO showVO, HttpServletRequest request) throws Exception;

	  @Transactional
	  public void DeleteBiddingReqstInfo(ShowVO showVO) throws Exception;
	  
	  @Transactional
	  public void InsertBestCompanyReqstInfo(ShowVO showVO, HttpServletRequest request) throws Exception;
	  
	  @Transactional
	  public void DeleteBestCompanyReqstInfo(ShowVO showVO) throws Exception;
	  
	  
	  
	  
	  
	  
	  /** 전시상담포털 > 콤보박스 */
	  public List<ShowVO> SelectPreCombo0(ShowVO showVO) throws Exception;
	  
	  public List<ShowVO> SelectPreCombo1(ShowVO showVO) throws Exception;
	  
	  public List<ShowVO> SelectRedyExbiCombo(ShowVO showVO) throws Exception;
	  
	  public List<ShowVO> SelectRedyCnsltCombo(ShowVO showVO) throws Exception;
	  
	  public List<ShowVO> SelectBiddingCombo(ShowVO showVO) throws Exception;
	  
	  public List<ShowVO> SelectBestCompCombo(ShowVO showVO) throws Exception;
	  
	  public List<ShowVO> CodeBookList(String cdDec) throws Exception;
	  
	  public List<ShowVO> LocComboList(ShowVO showVO) throws Exception;
	  
	  public List<ShowVO> YearComboList(ShowVO showVO) throws Exception;
	  
	  public List<ShowVO> SelectRedyEventCombo(ShowVO showVO) throws Exception;
}
