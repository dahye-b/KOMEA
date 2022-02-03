package egovframework.komeaweb.com.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.transaction.annotation.Transactional;

public interface ReqCompService {
	
	  /** 전시상담포털 > MyDesk > 사업참여관리 */
	  public List<ShowVO> SelectReqBizList(ShowVO showVO) throws Exception;
	  
	  public int SelectReqBizListTotCnt(ShowVO showVO) throws Exception;
	  
	  public ShowVO SelectCnsltCompReq(ShowVO showVO) throws Exception;
	  
	  public ShowVO SelectExbiCompReq(ShowVO showVO) throws Exception;
	  
	  @Transactional
	  public void UpdateReqBizExbiInfo(ShowVO showVO, HttpServletRequest request) throws Exception;
	  
	  @Transactional
	  public void UpdateReqBizCnsltInfo(ShowVO showVO, HttpServletRequest request) throws Exception;
	  
	  public ShowVO SelectCnsltResearchResult(ShowVO showVO) throws Exception;
	  
	  /** 전시상담포털 > MyDesk > 참여입찰관리 */
	  public List<ShowVO> SelectReqBiddingList(ShowVO showVO) throws Exception;
	  
	  public int SelectReqBiddingListTotCnt(ShowVO showVO) throws Exception;
	  
	  public ShowVO SelectReqBiddingInfo(ShowVO showVO) throws Exception;
	  
	  public ShowVO SelectBiddingResultInfo(ShowVO showVO) throws Exception;
	  
	  @Transactional
	  public void InsertReqBiddingResultFile(ShowVO showVO, HttpServletRequest request) throws Exception;
	  
	  @Transactional
	  public void DeleteBiddingResultInfoFile(ShowVO showVO) throws Exception;
}
