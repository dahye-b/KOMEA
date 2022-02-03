package egovframework.komeaweb.com.service.impl;

import egovframework.komeaweb.com.service.PopupService;
import egovframework.komeaweb.com.service.PopupVO;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("popupService")
public class PopupServiceImpl implements PopupService {

  @Resource(name="popupMapper")
  private PopupMapper popupMapper;
    
  @Override
  public List<PopupVO> SelectPopupList(PopupVO popupVO) throws Exception{
    return popupMapper.SelectPopupList(popupVO);
  }

  @Override
  public int SelectPopupListTotCnt(PopupVO popupVO) throws Exception{
    return popupMapper.SelectPopupListTotCnt(popupVO);
  }
  
  @Transactional
  @Override
  public void InsertPopup(PopupVO popupVO, HttpServletRequest request) throws Exception{
    popupMapper.InsertPopup(popupVO);
  }
  
  @Override
  public PopupVO SelectPopupView(PopupVO popupVO) throws Exception{
    return popupMapper.SelectPopupView(popupVO);
  }
  
  @Transactional
  @Override
  public void UpdatePopup(PopupVO popupVO, HttpServletRequest request) throws Exception{
    popupMapper.UpdatePopup(popupVO);
  }
  
  @Transactional
  @Override
  public void DeletePopup(PopupVO popupVO, HttpServletRequest request) throws Exception{
    popupMapper.DeletePopup(popupVO);
  }
  
  @Override
  public List<PopupVO> SelectMainPopupList(PopupVO popupVO) throws Exception{
    return popupMapper.SelectMainPopupList(popupVO);
  }
}
