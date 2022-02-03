package egovframework.komea.bbs.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.komea.bbs.service.KomeabbsVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("komeaBoardMapper")
public interface KomeaBoardMapper {
	
	public List<KomeabbsVO> SelectKomeaMainList(KomeabbsVO bbsVO) throws Exception;
	 
	public List<KomeabbsVO> SelectKomeaList(KomeabbsVO bbsVO) throws Exception;
	    
	public int SelectKomeaListTotCnt(KomeabbsVO bbsVO) throws Exception;

	public KomeabbsVO SelectKomeaView(KomeabbsVO bbsVO) throws Exception;
	
	public KomeabbsVO SelectKomeaFileInfo(KomeabbsVO bbsVO) throws Exception;
	
	public void UpdateKomeaFileDownCnt(KomeabbsVO bbsVO) throws Exception;
	
	public List<KomeabbsVO> SelectKomeaFileList(KomeabbsVO bbsVO) throws Exception;
	
	public List<KomeabbsVO> SelectKomeaPreNextList(KomeabbsVO bbsVO) throws Exception;
	
	public void UpdateKomeaBoardCnt(KomeabbsVO bbsVO) throws Exception;
	
	public void InsertKomeaBoard(KomeabbsVO bbsVO) throws Exception;
	
	public void DeleteBoardFile(KomeabbsVO bbsVO) throws Exception;
	
	public void InsertKomeaUploadFile(Map<String, Object> map) throws Exception;
	
	public void UpdateKomeaBoard(KomeabbsVO bbsVO) throws Exception;
	
	public void UpdateKomeaDeleteFile(KomeabbsVO bbsVO) throws Exception;
	
	public void UpdateKomeaDeleteFileIdx(KomeabbsVO bbsVO) throws Exception;
	
	public void DeleteKomeaBoard(KomeabbsVO bbsVO) throws Exception;
	
	public List<KomeabbsVO> SelectBbsList(KomeabbsVO bbsVO) throws Exception;
    
	public int SelectBbsListTotCnt(KomeabbsVO bbsVO) throws Exception;

	public KomeabbsVO SelectBbsView(KomeabbsVO bbsVO) throws Exception;
	
	public List<KomeabbsVO> SelectQnaList(KomeabbsVO bbsVO) throws Exception;
    
	public int SelectQnaListTotCnt(KomeabbsVO bbsVO) throws Exception;

	public KomeabbsVO SelectQnaView(KomeabbsVO bbsVO) throws Exception;
	
	public void InsertQnaBoard(KomeabbsVO bbsVO) throws Exception;
	
	public void InsertQnaReplyBoard(KomeabbsVO bbsVO) throws Exception;
	
	public void UpdateQnaBoard(KomeabbsVO bbsVO) throws Exception;
	
	public void DeleteQnaBoard(KomeabbsVO bbsVO) throws Exception;
	
	public int SelectQnaReplyTotCnt(KomeabbsVO bbsVO) throws Exception;
	
	public int SelectLogTotCnt(KomeabbsVO bbsVO) throws Exception;
	
	public int SelectVisitTotCnt(KomeabbsVO bbsVO) throws Exception;
	
	public void InsertLogCnt(KomeabbsVO bbsVO) throws Exception;
	
	public void UpdateLogCnt(KomeabbsVO bbsVO) throws Exception;
}
