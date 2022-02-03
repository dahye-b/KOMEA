package egovframework.komeaweb.com.service;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.transaction.annotation.Transactional;

public interface BannerService {

  public List<BannerVO> SelectBannerList(BannerVO bannerVO) throws Exception;
  
  public int SelectBannerListTotCnt(BannerVO bannerVO) throws Exception;
  
  @Transactional
  public void InsertBanner(BannerVO bannerVO, HttpServletRequest request) throws Exception;
  
  public BannerVO SelectBannerView(BannerVO bannerVO) throws Exception;
  
  @Transactional
  public void UpdateBanner(BannerVO bannerVO, HttpServletRequest request) throws Exception;
  
  @Transactional
  public void DeleteBanner(BannerVO bannerVO, HttpServletRequest request) throws Exception;
  
  public List<BannerVO> SelectMainBannerList(BannerVO bannerVO) throws Exception;
}
