package egovframework.komeaweb.com.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import egovframework.komeaweb.com.FileUtils;
import egovframework.komeaweb.com.service.MberService;
import egovframework.komeaweb.com.service.MberVO;

@Service("mberService")
public class MberServiceImpl implements MberService {
 
    @Resource(name = "mberMapper")
    private MberMapper mberMapper;
    
    @Override
    public MberVO SelectMber(MberVO mberVO) throws Exception {
        return mberMapper.SelectMber(mberVO);
    }
    
    @Transactional
    @Override
    public void UpdateLevel(MberVO mberVO) throws Exception {
    	mberMapper.UpdateLevel(mberVO);
    }
 
    @Override
    public List<MberVO> SelectMberList(MberVO mberVO) throws Exception {
        return mberMapper.SelectMberList(mberVO);
    }
 
    @Override
    public int SelectMberListTotCnt(MberVO mberVO) throws Exception {
        return mberMapper.SelectMberListTotCnt(mberVO);
    }
    
    @Override
    public int userIdCheck(MberVO mberVO) throws Exception {
        return mberMapper.userIdCheck(mberVO);
    }
    
    @Transactional
    @Override
    public void InsertMber(MberVO mberVO, HttpServletRequest request) throws Exception {
    	mberMapper.InsertMber(mberVO);
    	System.out.println("@@ id : "+mberVO.getId());

    	List<Map<String,Object>> list = FileUtils.mberFileUpload(mberVO.getMberCd(), request);
        for(int i=0, size=list.size(); i<size; i++){
        	mberMapper.UpdateMberUploadFile(list.get(i));
        }
    	
    	//KomeaSendEmail.sendMessage("qeg355@bareuntech.co.kr");
    }
    
    @Override
    public MberVO SelectMberView(MberVO mberVO) throws Exception {
        return mberMapper.SelectMberView(mberVO);
    }
    
    @Override
    public List<MberVO> SelectMberPointView(MberVO mberVO) throws Exception {
        return mberMapper.SelectMberPointView(mberVO);
    }
    
    @Transactional
    @Override
    public void UpdateMberConfm(MberVO mberVO) throws Exception {
    	mberMapper.UpdateMberConfm(mberVO);
    }
    
    @Transactional
    @Override
    public void UpdateUnionCompYn(MberVO mberVO) throws Exception {
    	mberMapper.UpdateUnionCompYn(mberVO);
    }
    
    @Transactional
    @Override
    public void UpdateMber(MberVO mberVO, HttpServletRequest request) throws Exception {
    	mberMapper.UpdateMber(mberVO);
    	
    	List<Map<String,Object>> list = FileUtils.mberFileUpload(mberVO.getMberCd(), request);
        for(int i=0, size=list.size(); i<size; i++){
        	mberMapper.UpdateMberUploadFile(list.get(i));
        }

        //FileUtils.mberFileUpload(mberVO, request);
        //komeaBoardMapper.InsertKomeaUploadFile(list.get(i));
    }
    
    @Transactional
    @Override
    public void updateMemberPass(MberVO mberVO) throws Exception {
    	mberMapper.updateMemberPass(mberVO);
    }
    
    @Transactional
    @Override
    public void DeleteMber(MberVO mberVO, HttpServletRequest request) throws Exception {
    	mberMapper.DeleteMber(mberVO);

        //FileUtils.mberFileUpload(mberVO, request);
        //komeaBoardMapper.InsertKomeaUploadFile(list.get(i));
    }
    
    @Override
    public List<MberVO> CompPointList(MberVO mberVO) throws Exception {
        return mberMapper.CompPointList(mberVO);
    }
 
    @Override
    public int CompPointListSum(MberVO mberVO) throws Exception {
        return mberMapper.CompPointListSum(mberVO);
    }
    
    @Override
    public MberVO MberPwCheck(MberVO mberVO) throws Exception {
        return mberMapper.MberPwCheck(mberVO);
    }
    
    @Transactional
    @Override
    public void DeleteMberUploadFile(MberVO mberVO) throws Exception {
    	mberMapper.DeleteMberUploadFile(mberVO);
    }
}
