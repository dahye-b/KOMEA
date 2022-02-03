package egovframework.komeaweb.com.service.impl;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import egovframework.komeaweb.com.service.ExbiService;
import egovframework.komeaweb.com.service.ExbiVO;

@Service("exbiService")
public class ExbiServiceImpl  implements ExbiService {

	  @Resource(name="exbiMapper")
	  private ExbiMapper exbiMapper;
	    
	  @Override
	  public List<ExbiVO> SelectExbiList(ExbiVO exbiVO) throws Exception{
	    return exbiMapper.SelectExbiList(exbiVO);
	  }

	  @Override
	  public int SelectExbiListTotCnt(ExbiVO exbiVO) throws Exception{
	    return exbiMapper.SelectExbiListTotCnt(exbiVO);
	  }
	  
	  @Transactional
	  @Override
	  public void InsertExbi(ExbiVO exbiVO, HttpServletRequest request) throws Exception{
		  exbiMapper.InsertExbi(exbiVO);
	  	//System.out.println("@@ exbiVO : "+exbiVO.getBuyerCd());
/*
	  	List<Map<String,Object>> list = FileUtils.buyerFileUpload(exbiVO.getBuyerCd(), request);
	      for(int i=0, size=list.size(); i<size; i++){
	    	  buyerMapper.UpdateBuyerFile(list.get(i));
	      }
*/    
	  }
	  
	  @Override
	  public ExbiVO SelectExbiView(ExbiVO exbiVO) throws Exception{
	    return exbiMapper.SelectExbiView(exbiVO);
	  }
	  
	  @Transactional
	  @Override
	  public void UpdateExbi(ExbiVO exbiVO, HttpServletRequest request) throws Exception{
		  
		  if(exbiVO.getGubun().equals("0")){
			  exbiMapper.UpdateExbislctnYn(exbiVO);
		  }else if(exbiVO.getGubun().equals("1")){
			  exbiMapper.UpdateCnsltexhbslctnYn(exbiVO);
		  }
	  }
	  
	  @Transactional
	  @Override
	  public void DeleteExbi(ExbiVO exbiVO, HttpServletRequest request) throws Exception{
		  exbiMapper.DeleteExbi(exbiVO);
	  }


}
