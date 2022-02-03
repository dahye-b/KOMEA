package egovframework.komeaweb.com.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.komeaweb.com.service.ExbiVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("exbiMapper")
public interface ExbiMapper {
	  public List<ExbiVO> SelectExbiList(ExbiVO exbiVO) throws Exception;
	  
	  public int SelectExbiListTotCnt(ExbiVO exbiVO) throws Exception;
	  
	  public void InsertExbi(ExbiVO exbiVO) throws Exception;
	  
	  public void UpdateExbiFile(Map<String, Object> map) throws Exception;
	  
	  public ExbiVO SelectExbiView(ExbiVO exbiVO) throws Exception;
	  
	  public void UpdateExbislctnYn(ExbiVO exbiVO) throws Exception;
	  
	  public void UpdateCnsltexhbslctnYn(ExbiVO exbiVO) throws Exception;
	  
	  public void DeleteExbi(ExbiVO exbiVO) throws Exception;
}
