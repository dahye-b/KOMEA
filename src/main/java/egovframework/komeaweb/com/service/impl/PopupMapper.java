package egovframework.komeaweb.com.service.impl;

import egovframework.komeaweb.com.service.PopupVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;
import java.util.List;

@Mapper("popupMapper")
public interface PopupMapper
{

  public List<PopupVO> SelectPopupList(PopupVO popupVO) throws Exception;
  
  public int SelectPopupListTotCnt(PopupVO popupVO) throws Exception;
  
  public void InsertPopup(PopupVO popupVO) throws Exception;
  
  public PopupVO SelectPopupView(PopupVO popupVO) throws Exception;
  
  public void UpdatePopup(PopupVO popupVO) throws Exception;
  
  public void DeletePopup(PopupVO popupVO) throws Exception;
  
  public List<PopupVO> SelectMainPopupList(PopupVO popupVO) throws Exception;
}
