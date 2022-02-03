package egovframework.komeaweb.com.service;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.transaction.annotation.Transactional;

public interface PopupService
{

  public List<PopupVO> SelectPopupList(PopupVO popupVO) throws Exception;
  
  public int SelectPopupListTotCnt(PopupVO popupVO) throws Exception;
  
  @Transactional
  public void InsertPopup(PopupVO popupVO, HttpServletRequest request) throws Exception;
  
  public PopupVO SelectPopupView(PopupVO popupVO) throws Exception;
  
  @Transactional
  public void UpdatePopup(PopupVO popupVO, HttpServletRequest request) throws Exception;
  
  @Transactional
  public void DeletePopup(PopupVO popupVO, HttpServletRequest request) throws Exception;
  
  public List<PopupVO> SelectMainPopupList(PopupVO popupVO) throws Exception;
}
