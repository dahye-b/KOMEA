package egovframework.komeaweb.com.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.komeaweb.com.service.ShowVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("reqCompMapper")
public interface ReqCompMapper {

	  /** 전시상담포털 > MyDesk > 사업참여관리 */
	  public List<ShowVO> SelectReqBizList(ShowVO showVO) throws Exception;
	  
	  public int SelectReqBizListTotCnt(ShowVO showVO) throws Exception;
	  
	  public ShowVO SelectCnsltCompReq(ShowVO showVO) throws Exception;
	  
	  public ShowVO SelectExbiCompReq(ShowVO showVO) throws Exception;

	  public void UpdateReqBizExbiInfo(ShowVO showVO) throws Exception;
	  
	  public void UpdateReqBizCnsltInfo(ShowVO showVO) throws Exception;
	  
	  public ShowVO SelectCnsltResearchResult(ShowVO showVO) throws Exception;
	  
	  /** 전시상담포털 > MyDesk > 참여입찰관리 */
	  public List<ShowVO> SelectReqBiddingList(ShowVO showVO) throws Exception;
	  
	  public int SelectReqBiddingListTotCnt(ShowVO showVO) throws Exception;
	  
	  public ShowVO SelectReqBiddingInfo(ShowVO showVO) throws Exception;
	  
	  public ShowVO SelectBiddingResultInfo(ShowVO showVO) throws Exception;
	  
	  public void InsertBiddingResultInfo(ShowVO showVO) throws Exception;
	  
	  public void UpdateBiddingResultInfoFile(Map<String, Object> map) throws Exception;
	  
	  public void DeleteBiddingResultInfoFile(ShowVO showVO) throws Exception;
}
