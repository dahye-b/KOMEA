package egovframework.komeaweb.com.service.impl;

import egovframework.komeaweb.com.service.BannerVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;
import java.util.List;
import java.util.Map;

@Mapper("bannerMapper")
public interface BannerMapper {

  public List<BannerVO> SelectBannerList(BannerVO bannerVO) throws Exception;
  
  public int SelectBannerListTotCnt(BannerVO bannerVO) throws Exception;
  
  public void InsertBanner(BannerVO bannerVO) throws Exception;
  
  public void UpdateBannerFile(Map<String, Object> map) throws Exception;
  
  public BannerVO SelectBannerView(BannerVO bannerVO) throws Exception;
  
  public void UpdateBanner(BannerVO bannerVO) throws Exception;
  
  public void DeleteBanner(BannerVO bannerVO) throws Exception;
  
  public List<BannerVO> SelectMainBannerList(BannerVO bannerVO) throws Exception;
}
