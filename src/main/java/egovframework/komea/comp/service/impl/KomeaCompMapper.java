package egovframework.komea.comp.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.komea.comp.service.KomeaCompVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("komeaCompMapper")
public interface KomeaCompMapper {
	
	public List<KomeaCompVO> SelectCompList(KomeaCompVO compVO) throws Exception;
    
	public int SelectCompListTotCnt(KomeaCompVO compVO) throws Exception;

	public KomeaCompVO SelectCompView(KomeaCompVO compVO) throws Exception;
	
	public void InsertComp(KomeaCompVO compVO) throws Exception;
	
	public void DeleteComp(KomeaCompVO compVO) throws Exception;
	
	public void DeleteCompId(KomeaCompVO compVO) throws Exception;
	
	public void InsertMberComp(KomeaCompVO compVO) throws Exception;
	
	public void UpdateCompArea(KomeaCompVO compVO) throws Exception;
	
	public void DeleteCompAll(KomeaCompVO compVO) throws Exception;
	
	public void InsertCompExcelList(Map<String, Object> map) throws Exception;
}
