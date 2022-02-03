package egovframework.komeaweb.com.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.transaction.annotation.Transactional;

public interface BuyerService {

	  public List<BuyerVO> SelectBuyerList(BuyerVO buyerVO) throws Exception;
	  
	  public int SelectBuyerListTotCnt(BuyerVO buyerVO) throws Exception;
	  
	  @Transactional
	  public void InsertBuyer(BuyerVO buyerVO, HttpServletRequest request) throws Exception;
	  
	  public BuyerVO SelectBuyerView(BuyerVO buyerVO) throws Exception;
	  
	  public BuyerVO SelectBuyerView1(BuyerVO buyerVO) throws Exception;
	  
	  @Transactional
	  public void UpdateBuyer(BuyerVO buyerVO) throws Exception;
	  
	  @Transactional
	  public void DeleteBuyer(BuyerVO buyerVO) throws Exception;
	  
	  @Transactional
	  public void InsertBuyerDbInfo(BuyerVO buyerVO) throws Exception;

	  @Transactional
	  public void UpdateBuyerDbInfo(BuyerVO buyerVO) throws Exception;
	  
	  @Transactional
	  public void DeleteBuyerLsnInfo(BuyerVO buyerVO) throws Exception;
	  
	  public BuyerVO SelectBuyerLsnInfo(BuyerVO buyerVO) throws Exception;


}
