package egovframework.komea.bbs.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import egovframework.komea.bbs.service.KomeaBoardService;
import egovframework.komea.bbs.service.KomeabbsVO;
import egovframework.komeaweb.com.FileUtils;

@Service("komeaBoardService")
public class KomeaBoardServiceImpl implements KomeaBoardService {
 
    @Resource(name = "komeaBoardMapper")
    private KomeaBoardMapper komeaBoardMapper;
    
    @Override
    public List<KomeabbsVO> SelectKomeaMainList(KomeabbsVO bbsVO) throws Exception {
        return komeaBoardMapper.SelectKomeaMainList(bbsVO);
    }
 
    @Override
    public List<KomeabbsVO> SelectKomeaList(KomeabbsVO bbsVO) throws Exception {
        return komeaBoardMapper.SelectKomeaList(bbsVO);
    }
 
    @Override
    public int SelectKomeaListTotCnt(KomeabbsVO bbsVO) throws Exception {
        return komeaBoardMapper.SelectKomeaListTotCnt(bbsVO);
    }
    
    @Override
    public KomeabbsVO SelectKomeaView(KomeabbsVO bbsVO) throws Exception {
        return komeaBoardMapper.SelectKomeaView(bbsVO);
    }
    
    @Override
    public KomeabbsVO SelectKomeaFileInfo(KomeabbsVO bbsVO) throws Exception {
        return komeaBoardMapper.SelectKomeaFileInfo(bbsVO);
    }
    
    @Transactional
    @Override
    public void UpdateKomeaFileDownCnt(KomeabbsVO bbsVO) throws Exception {
    	komeaBoardMapper.UpdateKomeaFileDownCnt(bbsVO);
    }
    
    @Override
    public List<KomeabbsVO> SelectKomeaFileList(KomeabbsVO bbsVO) throws Exception {
        return komeaBoardMapper.SelectKomeaFileList(bbsVO);
    }
    
    @Override
    public List<KomeabbsVO> SelectKomeaPreNextList(KomeabbsVO bbsVO) throws Exception {
        return komeaBoardMapper.SelectKomeaPreNextList(bbsVO);
    }
    
    @Transactional
    @Override
    public void UpdateKomeaBoardCnt(KomeabbsVO bbsVO) throws Exception {
    	komeaBoardMapper.UpdateKomeaBoardCnt(bbsVO);
    }
    
    @Transactional
    @Override
    public void InsertKomeaBoard(KomeabbsVO bbsVO, HttpServletRequest request) throws Exception {
    	komeaBoardMapper.InsertKomeaBoard(bbsVO);

        List<Map<String,Object>> list = FileUtils.komeaFileUpload(bbsVO, request);

        for(int i=0, size=list.size(); i<size; i++){
        	komeaBoardMapper.InsertKomeaUploadFile(list.get(i));
        }
    }
    
    @Transactional
    @Override
    public void DeleteBoardFile(KomeabbsVO bbsVO) throws Exception {
    	komeaBoardMapper.DeleteBoardFile(bbsVO);
    }
    
    @Transactional
    @Override
    public void UpdateKomeaBoard(KomeabbsVO bbsVO, HttpServletRequest request) throws Exception {
    	komeaBoardMapper.UpdateKomeaBoard(bbsVO);
    	//komeaBoardMapper.UpdateKomeaDeleteFile(bbsVO);
        
        List<Map<String,Object>> list = FileUtils.komeaFileUpload(bbsVO, request);

        for(int i=0, size=list.size(); i<size; i++){
        	komeaBoardMapper.InsertKomeaUploadFile(list.get(i));
        }
    }
    
    @Transactional
    @Override
    public void DeleteKomeaBoard(KomeabbsVO bbsVO, HttpServletRequest request) throws Exception {
    	komeaBoardMapper.DeleteKomeaBoard(bbsVO);
    	komeaBoardMapper.UpdateKomeaDeleteFile(bbsVO);
    }
    
    @Transactional
    @Override
    public void UpdateKomeaDeleteFileIdx(KomeabbsVO bbsVO) throws Exception {
    	//FileUtils.FileDelete(bbsVO.getfSnm());
    	komeaBoardMapper.UpdateKomeaDeleteFileIdx(bbsVO);
    }
    
    @Override
    public List<KomeabbsVO> SelectBbsList(KomeabbsVO bbsVO) throws Exception {
        return komeaBoardMapper.SelectBbsList(bbsVO);
    }
 
    @Override
    public int SelectBbsListTotCnt(KomeabbsVO bbsVO) throws Exception {
        return komeaBoardMapper.SelectBbsListTotCnt(bbsVO);
    }
    
    @Override
    public KomeabbsVO SelectBbsView(KomeabbsVO bbsVO) throws Exception {
        return komeaBoardMapper.SelectBbsView(bbsVO);
    }    
    
    @Override
    public List<KomeabbsVO> SelectQnaList(KomeabbsVO bbsVO) throws Exception {
        return komeaBoardMapper.SelectQnaList(bbsVO);
    }
 
    @Override
    public int SelectQnaListTotCnt(KomeabbsVO bbsVO) throws Exception {
        return komeaBoardMapper.SelectQnaListTotCnt(bbsVO);
    }
    
    @Override
    public KomeabbsVO SelectQnaView(KomeabbsVO bbsVO) throws Exception {
        return komeaBoardMapper.SelectQnaView(bbsVO);
    }
    
    @Transactional
    @Override
    public void InsertQnaBoard(KomeabbsVO bbsVO) throws Exception {
    	komeaBoardMapper.InsertQnaBoard(bbsVO);
    }
    
    @Transactional
    @Override
    public void InsertQnaReplyBoard(KomeabbsVO bbsVO) throws Exception {
    	komeaBoardMapper.InsertQnaReplyBoard(bbsVO);
    }
    
    @Transactional
    @Override
    public void UpdateQnaBoard(KomeabbsVO bbsVO) throws Exception {
    	komeaBoardMapper.UpdateQnaBoard(bbsVO);
    }
    
    @Transactional
    @Override
    public void DeleteQnaBoard(KomeabbsVO bbsVO) throws Exception {
    	komeaBoardMapper.DeleteQnaBoard(bbsVO);
    }    
    
    @Override
    public int SelectQnaReplyTotCnt(KomeabbsVO bbsVO) throws Exception {
        return komeaBoardMapper.SelectQnaReplyTotCnt(bbsVO);
    }
    
    @Override
    public int SelectLogTotCnt(KomeabbsVO bbsVO) throws Exception {
        return komeaBoardMapper.SelectLogTotCnt(bbsVO);
    }
    
    @Override
    public int SelectVisitTotCnt(KomeabbsVO bbsVO) throws Exception {
        return komeaBoardMapper.SelectVisitTotCnt(bbsVO);
    }
    
    @Transactional
    @Override
    public void InsertLogCnt(KomeabbsVO bbsVO) throws Exception {
    	komeaBoardMapper.InsertLogCnt(bbsVO);
    }
    
    @Transactional
    @Override
    public void UpdateLogCnt(KomeabbsVO bbsVO) throws Exception {
    	komeaBoardMapper.UpdateLogCnt(bbsVO);
    }
}
