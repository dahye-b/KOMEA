package egovframework.komeaweb.com.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.komeaweb.com.service.BuyerVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("buyerMapper")
public interface BuyerMapper {
	  public List<BuyerVO> SelectBuyerList(BuyerVO buyerVO) throws Exception;
	  
	  public int SelectBuyerListTotCnt(BuyerVO buyerVO) throws Exception;
	  
	  public void InsertBuyer(BuyerVO buyerVO) throws Exception;
	  
	  public void UpdateBuyerFile(Map<String, Object> map) throws Exception;
	  
	  public BuyerVO SelectBuyerView(BuyerVO buyerVO) throws Exception;
	  
	  public BuyerVO SelectBuyerView1(BuyerVO buyerVO) throws Exception;
	  
	  public void UpdateBuyer(BuyerVO buyerVO) throws Exception;
	  
	  public void DeleteBuyer(BuyerVO buyerVO) throws Exception;
	  
	  public void InsertBuyerDbInfo(BuyerVO buyerVO) throws Exception;

	  public void insertBuyerLsnInfo(BuyerVO buyerVO) throws Exception;
	  
	  public void UpdateBuyerDbInfo(BuyerVO buyerVO) throws Exception;

	  public void UpdateBuyerLsnInfo(BuyerVO buyerVO) throws Exception;
	  
	  public void DeleteBuyerLsnInfo(BuyerVO buyerVO) throws Exception;
	  
	  public BuyerVO SelectBuyerLsnInfo(BuyerVO buyerVO) throws Exception;
}
