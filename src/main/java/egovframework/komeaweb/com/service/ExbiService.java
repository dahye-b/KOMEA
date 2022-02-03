package egovframework.komeaweb.com.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.transaction.annotation.Transactional;

public interface ExbiService {

	  public List<ExbiVO> SelectExbiList(ExbiVO exbiVO) throws Exception;
	  
	  public int SelectExbiListTotCnt(ExbiVO exbiVO) throws Exception;
	  
	  @Transactional
	  public void InsertExbi(ExbiVO exbiVO, HttpServletRequest request) throws Exception;
	  
	  public ExbiVO SelectExbiView(ExbiVO exbiVO) throws Exception;
	  
	  @Transactional
	  public void UpdateExbi(ExbiVO exbiVO, HttpServletRequest request) throws Exception;
	  
	  @Transactional
	  public void DeleteExbi(ExbiVO exbiVO, HttpServletRequest request) throws Exception;
}
