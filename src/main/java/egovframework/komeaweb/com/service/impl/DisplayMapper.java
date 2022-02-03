 package egovframework.komeaweb.com.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.komeaweb.com.service.ShowVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("displayMapper")
public interface  DisplayMapper {
	
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
	  
	  public ShowVO SelectBuyerResultAccSum(ShowVO showVO) throws Exception;

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
	  
	  public ShowVO SelectExbiReqstInfo(ShowVO showVO) throws Exception;
	  
	  public void InsertExbiReqstInfo(ShowVO showVO) throws Exception;
	  
	  public void InsertExbiReqstFileInfo(ShowVO showVO) throws Exception;
	  
	  public void DeleteExbiReqstFileInfo(ShowVO showVO) throws Exception;
	  
	  public void UpdateExbiReqstInfo(ShowVO showVO) throws Exception;
	  
	  public void UpdateExbiReqstFileInfo(Map<String, Object> map) throws Exception;
	  
	  /** 전시상담포털 > 상담행사 > 상담행사 목록 */
	  public List<ShowVO> SelectCnsltList(ShowVO showVO) throws Exception;
	  
	  public int SelectCnsltListTotCnt(ShowVO showVO) throws Exception;
	  
	  public ShowVO SelectCnsltexhbReqstInfo(ShowVO showVO) throws Exception;
	  
	  public void InsertCnsltexhbReqstInfo(ShowVO showVO) throws Exception;
	  
	  public void InsertCnsltexhbReqstFileInfo(ShowVO showVO) throws Exception;
	  
	  public void DeleteCnsltexhbReqstFileInfo(ShowVO showVO) throws Exception;
	  
	  public void UpdateCnsltexhbReqstInfo(ShowVO showVO) throws Exception;
	  
	  public void UpdateCnsltexhbReqstFileInfo(Map<String, Object> map) throws Exception;
	  
	  public void InsertPreferBuyerInfo(ShowVO showVO) throws Exception;
	  
	  public List<ShowVO> SelectPreferBuyerList(ShowVO showVO) throws Exception;
	  
	  /** 전시상담포털 > MyDesk > 지원사업관리 목록 */
	  public List<ShowVO> SelectExbiAndCnsltList(ShowVO showVO) throws Exception;
	  
	  public int SelectExbiAndCnsltListTotCnt(ShowVO showVO) throws Exception;
	  
	  public void UpdateProgressStatus(ShowVO showVO) throws Exception;
	  
	  public void DeleteExbiInfoFile(ShowVO showVO) throws Exception;
	  
	  public void DeleteExbi(ShowVO showVO) throws Exception;
	  
	  public void DeleteCnsltFile(ShowVO showVO) throws Exception;
	  
	  public void DeleteCnslt(ShowVO showVO) throws Exception;	  
	  
	  public ShowVO ExbiRegistInfoEdit(ShowVO showVO) throws Exception;
	  
	  public ShowVO CnsltexhbRegistInfoEdit(ShowVO showVO) throws Exception;
	  
	  public void InsertSuppBizManageExbi(ShowVO showVO) throws Exception;
	  
	  public void InsertSuppBizManageExbiFile(ShowVO showVO) throws Exception;
	  
	  public void UpdateSuppBizManageExbi(ShowVO showVO) throws Exception;
	  
	  public void UpdateSuppBizManageExbiFile(Map<String, Object> map) throws Exception;
	  
	  public void DeleteSuppBizManageExbiFile(ShowVO showVO) throws Exception;
	  
	  public void InsertSuppBizManageCnslt(ShowVO showVO) throws Exception;
	  
	  public void InsertSuppBizManageCnsltFile(ShowVO showVO) throws Exception;
	  
	  public void UpdateSuppBizManageCnslt(ShowVO showVO) throws Exception;
	  
	  public void UpdateSuppBizManageCnsltFile(Map<String, Object> map) throws Exception;
	  
	  public void DeleteSuppBizManageCnsltFile(ShowVO showVO) throws Exception;
	  
	  public ShowVO SelectExbiByMove(ShowVO showVO) throws Exception;
	  
	  public ShowVO SelectCnsltByMove(ShowVO showVO) throws Exception;
	  
	  /** 전시상담포털 > MyDesk > 참여신청업체 목록 */
	  public List<ShowVO> SelectExbiReqCompanyList(ShowVO showVO) throws Exception;
	  
	  public int SelectExbiReqCompanyListTotCnt(ShowVO showVO) throws Exception;
	  
	  public List<ShowVO> SelectCnsltReqCompanyList(ShowVO showVO) throws Exception;
	  
	  public int SelectCnsltReqCompanyListTotCnt(ShowVO showVO) throws Exception;
	  
	  public void UpdateSlctnYn(ShowVO showVO) throws Exception;
	  
	  public void UpdateWinCmpl(ShowVO showVO) throws Exception;
	  
	  /** 전시상담포털 > MyDesk > 입찰신청관리 목록 */
	  public List<ShowVO> SelectReqBiddingOthersList(ShowVO showVO) throws Exception;
	  
	  public int SelectReqBiddingOthersListTotCnt(ShowVO showVO) throws Exception;
	  
	  public List<ShowVO> SelectBiddingStatus(ShowVO showVO) throws Exception;
	  
	  public void UpdateBiddingStatus(ShowVO showVO) throws Exception;
	  
	  public void UpdateBiddingResultComplete(ShowVO showVO) throws Exception;
	  
	  public List<ShowVO> SelectBiddingStatusCompanyList(ShowVO showVO) throws Exception;
	  
	  /** 전시상담포털 > MyDesk > 우수기업선정관리 목록 */
	  public List<ShowVO> SelectReqBestCompOthersList(ShowVO showVO) throws Exception;
	  
	  public int SelectReqBestCompOthersListTotCnt(ShowVO showVO) throws Exception;
	  
	  public void UpdateWinnerStatus(ShowVO showVO) throws Exception;
	  
	  public void UpdateWinnerReqstInfo(ShowVO showVO) throws Exception;
	  
	  public void DeleteBestCompanyRequest(ShowVO showVO) throws Exception;
	  
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
	  
	  public void UpdateViewCnt(ShowVO showVO) throws Exception;
	  
	  public void InsertBoard(ShowVO showVO) throws Exception;
	  
	  public void UpdateBoardFile(Map<String, Object> map) throws Exception;
	  
	  public void UpdateBoard(ShowVO showVO) throws Exception;
	  
	  public void DeleteBoard(ShowVO showVO) throws Exception;
	  
	  public ShowVO SelectExbiPreReguestInfo(ShowVO showVO) throws Exception;
	  
	  public ShowVO SelectCnsltPreReguestInfo(ShowVO showVO) throws Exception;
	  
	  public ShowVO SelectBiddingPreReguestInfo(ShowVO showVO) throws Exception;
	  
	  public ShowVO SelectWinnerPreReguestInfo(ShowVO showVO) throws Exception;
	  
	  public ShowVO SelectLoginUser(ShowVO showVO) throws Exception;
	  
	  public ShowVO SelectExbiCompReq(ShowVO showVO) throws Exception;
	  
	  public ShowVO SelectCnsltCompReq(ShowVO showVO) throws Exception;
	  
	  public ShowVO SelectMberInfo(ShowVO showVO) throws Exception;
	  
	  public ShowVO SelectBiddingReqstInfo(ShowVO showVO) throws Exception;
	  
	  public void UpdateShowMberInfo(ShowVO showVO) throws Exception;
	  
	  public void InsertBiddingReqstInfo(ShowVO showVO) throws Exception;
	  
	  public void DeleteBiddingReqstInfo(ShowVO showVO) throws Exception;
	  
	  public void UpdateBiddingReqstInfo(Map<String, Object> map) throws Exception;
	  
	  public ShowVO SelectBestCompanyReqstInfo(ShowVO showVO) throws Exception;
	  
	  public void InsertBestCompanyReqstInfo(ShowVO showVO) throws Exception;
	  
	  public void DeleteBestCompanyReqstInfo(ShowVO showVO) throws Exception;
	  
	  public void UpdateBestCompanyReqstInfo(Map<String, Object> map) throws Exception;
	  

	  
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
