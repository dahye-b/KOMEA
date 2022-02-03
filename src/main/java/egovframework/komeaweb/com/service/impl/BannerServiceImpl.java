package egovframework.komeaweb.com.service.impl;

import egovframework.komeaweb.com.FileUtils;
import egovframework.komeaweb.com.service.BannerService;
import egovframework.komeaweb.com.service.BannerVO;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("bannerService")
public class BannerServiceImpl implements BannerService {

  @Resource(name="bannerMapper")
  private BannerMapper bannerMapper;
    
  @Override
  public List<BannerVO> SelectBannerList(BannerVO bannerVO) throws Exception{
    return bannerMapper.SelectBannerList(bannerVO);
  }

  @Override
  public int SelectBannerListTotCnt(BannerVO bannerVO) throws Exception{
    return bannerMapper.SelectBannerListTotCnt(bannerVO);
  }
  
  @Transactional
  @Override
  public void InsertBanner(BannerVO bannerVO, HttpServletRequest request) throws Exception{
	bannerMapper.InsertBanner(bannerVO);
  	System.out.println("@@ bannerVO : "+bannerVO.getBannerNo());

  	List<Map<String,Object>> list = FileUtils.bannerFileUpload(bannerVO.getBannerNo(), request);
      for(int i=0, size=list.size(); i<size; i++){
    	  bannerMapper.UpdateBannerFile(list.get(i));
      }
    
  }
  
  @Override
  public BannerVO SelectBannerView(BannerVO bannerVO) throws Exception{
    return bannerMapper.SelectBannerView(bannerVO);
  }
  
  @Transactional
  @Override
  public void UpdateBanner(BannerVO bannerVO, HttpServletRequest request) throws Exception{
    bannerMapper.UpdateBanner(bannerVO);
  }
  
  @Transactional
  @Override
  public void DeleteBanner(BannerVO bannerVO, HttpServletRequest request) throws Exception{
    bannerMapper.DeleteBanner(bannerVO);
  }
  
  @Override
  public List<BannerVO> SelectMainBannerList(BannerVO bannerVO) throws Exception{
    return bannerMapper.SelectMainBannerList(bannerVO);
  }
}
