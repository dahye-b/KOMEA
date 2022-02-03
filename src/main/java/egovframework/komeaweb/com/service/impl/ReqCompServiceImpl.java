package egovframework.komeaweb.com.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import egovframework.komeaweb.com.ShowFileUtils;
import egovframework.komeaweb.com.service.ReqCompService;
import egovframework.komeaweb.com.service.ShowVO;

@Service("reqCompService")
public class ReqCompServiceImpl implements ReqCompService {

	@Resource(name="reqCompMapper")
	private ReqCompMapper reqCompMapper;

	/** 전시상담포털 > MyDesk > 사업참여관리 */
	@Override
	public List<ShowVO> SelectReqBizList(ShowVO showVO) throws Exception{
		return reqCompMapper.SelectReqBizList(showVO);
	}
	
	@Override
	public int SelectReqBizListTotCnt(ShowVO showVO) throws Exception{
		return reqCompMapper.SelectReqBizListTotCnt(showVO);
	}
	
	@Override
	public ShowVO SelectCnsltCompReq(ShowVO showVO) throws Exception {
		return reqCompMapper.SelectCnsltCompReq(showVO);
	}
	
	@Override
	public ShowVO SelectExbiCompReq(ShowVO showVO) throws Exception {
		return reqCompMapper.SelectExbiCompReq(showVO);
	}
	
	@Transactional
	@Override
	public void UpdateReqBizExbiInfo(ShowVO showVO, HttpServletRequest request) throws Exception {
		reqCompMapper.UpdateReqBizExbiInfo(showVO);
	}
	
	@Transactional
	@Override
	public void UpdateReqBizCnsltInfo(ShowVO showVO, HttpServletRequest request) throws Exception {
		reqCompMapper.UpdateReqBizCnsltInfo(showVO);
	}
	
	@Override
	public ShowVO SelectCnsltResearchResult(ShowVO showVO) throws Exception {
		return reqCompMapper.SelectCnsltResearchResult(showVO);
	}
	
	/** 전시상담포털 > MyDesk > 참여입찰관리 */
	@Override
	public List<ShowVO> SelectReqBiddingList(ShowVO showVO) throws Exception{
		return reqCompMapper.SelectReqBiddingList(showVO);
	}
	
	@Override
	public int SelectReqBiddingListTotCnt(ShowVO showVO) throws Exception{
		return reqCompMapper.SelectReqBiddingListTotCnt(showVO);
	}
	
	@Override
	public ShowVO SelectReqBiddingInfo(ShowVO showVO) throws Exception {
		return reqCompMapper.SelectReqBiddingInfo(showVO);
	}
	
	@Override
	public ShowVO SelectBiddingResultInfo(ShowVO showVO) throws Exception {
		return reqCompMapper.SelectBiddingResultInfo(showVO);
	}
	
	@Transactional
	@Override
	public void InsertReqBiddingResultFile(ShowVO showVO, HttpServletRequest request) throws Exception {
		reqCompMapper.InsertBiddingResultInfo(showVO);
		List<Map<String,Object>> list = ShowFileUtils.BiddingResultFileUpload(showVO, request);

		for(int i=0, size=list.size(); i<size; i++){
			reqCompMapper.UpdateBiddingResultInfoFile(list.get(i));
		}
	}
	
	  @Transactional
	  @Override
	  public void DeleteBiddingResultInfoFile(ShowVO showVO) throws Exception {
		  reqCompMapper.DeleteBiddingResultInfoFile(showVO);
	  }
}
