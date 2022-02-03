package egovframework.komeaweb.com.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import egovframework.komeaweb.com.FileUtils;
import egovframework.komeaweb.com.service.BuyerService;
import egovframework.komeaweb.com.service.BuyerVO;

@Service("buyerService")
public class BuyerServiceImpl implements BuyerService {

	  @Resource(name="buyerMapper")
	  private BuyerMapper buyerMapper;
	    
	  @Override
	  public List<BuyerVO> SelectBuyerList(BuyerVO buyerVO) throws Exception{
	    return buyerMapper.SelectBuyerList(buyerVO);
	  }

	  @Override
	  public int SelectBuyerListTotCnt(BuyerVO buyerVO) throws Exception{
	    return buyerMapper.SelectBuyerListTotCnt(buyerVO);
	  }
	  
	  @Transactional
	  @Override
	  public void InsertBuyer(BuyerVO buyerVO, HttpServletRequest request) throws Exception{
		buyerMapper.InsertBuyer(buyerVO);
	  	System.out.println("@@ buyerVO : "+buyerVO.getBuyerCd());

	  	List<Map<String,Object>> list = FileUtils.buyerFileUpload(buyerVO.getBuyerCd(), request);
	      for(int i=0, size=list.size(); i<size; i++){
	    	  buyerMapper.UpdateBuyerFile(list.get(i));
	      }
	    
	  }
	  
	  @Override
	  public BuyerVO SelectBuyerView(BuyerVO buyerVO) throws Exception{
	    return buyerMapper.SelectBuyerView(buyerVO);
	  }
	  
	  @Override
	  public BuyerVO SelectBuyerView1(BuyerVO buyerVO) throws Exception{
	    return buyerMapper.SelectBuyerView1(buyerVO);
	  }
	  
	  @Transactional
	  @Override
	  public void UpdateBuyer(BuyerVO buyerVO) throws Exception{
	    buyerMapper.UpdateBuyerDbInfo(buyerVO);
	  }
	  
	  @Transactional
	  @Override
	  public void DeleteBuyer(BuyerVO buyerVO) throws Exception{
	    buyerMapper.DeleteBuyer(buyerVO);
	  }
	  
	  
	  @Transactional
	  @Override
	  public void InsertBuyerDbInfo(BuyerVO buyerVO) throws Exception {
		  if(buyerVO.getBuyerCd().equals("")){
			  System.out.println("바이어신규등록1");
			  buyerMapper.InsertBuyerDbInfo(buyerVO);
		  }
		  System.out.println("@@ buyerVO : "+buyerVO.getBuyerCd());
		  buyerMapper.insertBuyerLsnInfo(buyerVO);
		  System.out.println("상담바이어등록2");
	  }
	  @Transactional
	  @Override
	  public void UpdateBuyerDbInfo(BuyerVO buyerVO) throws Exception {
		  buyerMapper.UpdateBuyerDbInfo(buyerVO);
		  buyerMapper.UpdateBuyerLsnInfo(buyerVO);
	  }
	  
	  @Transactional
	  @Override
	  public void DeleteBuyerLsnInfo(BuyerVO buyerVO) throws Exception {
		  buyerMapper.DeleteBuyerLsnInfo(buyerVO);
	  }

	  @Override
	  public BuyerVO SelectBuyerLsnInfo(BuyerVO buyerVO) throws Exception{
	    return buyerMapper.SelectBuyerLsnInfo(buyerVO);
	  }
}
