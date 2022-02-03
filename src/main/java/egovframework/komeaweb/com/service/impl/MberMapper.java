package egovframework.komeaweb.com.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.komeaweb.com.service.MberVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("mberMapper")
public interface MberMapper {
	
	public MberVO SelectMber(MberVO mberVO) throws Exception;
	
	public void UpdateLevel(MberVO mberVO) throws Exception;
	
	public List<MberVO> SelectMberList(MberVO mberVO) throws Exception;
    
	public int SelectMberListTotCnt(MberVO mberVO) throws Exception;
	
	public int userIdCheck(MberVO mberVO) throws Exception;
	
	public void InsertMber(MberVO mberVO) throws Exception;
	
	public void UpdateMberUploadFile(Map<String, Object> map) throws Exception;
	
	public MberVO SelectMberView(MberVO mberVO) throws Exception;
	
	public List<MberVO> SelectMberPointView(MberVO mberVO) throws Exception;
	
	public void UpdateMberConfm(MberVO mberVO) throws Exception;
	
	public void UpdateUnionCompYn(MberVO mberVO) throws Exception;
	
	public void UpdateMber(MberVO mberVO) throws Exception;
	
	public void updateMemberPass(MberVO mberVO) throws Exception;
	
	public void DeleteMber(MberVO mberVO) throws Exception;
	
	public List<MberVO> CompPointList(MberVO mberVO) throws Exception;
    
	public int CompPointListSum(MberVO mberVO) throws Exception;
	
	public MberVO MberPwCheck(MberVO mberVO) throws Exception;
	
	public void DeleteMberUploadFile(MberVO mberVO) throws Exception;
}
