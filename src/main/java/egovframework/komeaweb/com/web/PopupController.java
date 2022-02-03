package egovframework.komeaweb.com.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.komeaweb.com.service.PopupService;
import egovframework.komeaweb.com.service.PopupVO;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class PopupController {

	Logger log = Logger.getLogger(this.getClass());
	
    @Resource(name = "popupService")
    private PopupService popupService;
 
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
	
	/**
	 * Popup List
	 * @param model
	 * @return "popupList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/admin/popupList.do")
	public String popupList(@ModelAttribute("popup") PopupVO popupVO, BindingResult bindingResult, ModelMap model) throws Exception {

	       // currentPageNo : 현재 페이지 번호
	       // recordCountPerPage : 한 페이지당 게시되는 게시물 건 수 (=pageUnit)
	       // pageSize : 페이지 리스트에 게시되는 페이지 건수
	       // totalRecordCount : 전체 게시물 건 수
	       // pageUnit과 pageSize는 context-properties.xml에서 설정
	               
		   popupVO.setPageUnit(propertiesService.getInt("pageUnit"));
		   popupVO.setPageSize(propertiesService.getInt("pageSize"));
	       
	       PaginationInfo paginationInfo = new PaginationInfo();
	       
	       paginationInfo.setCurrentPageNo(popupVO.getPageIndex());
	       paginationInfo.setRecordCountPerPage(popupVO.getPageUnit());
	       paginationInfo.setPageSize(popupVO.getPageSize());
	       
	       popupVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
	       popupVO.setLastIndex(paginationInfo.getLastRecordIndex());
	       popupVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
	       
	       int totCnt = popupService.SelectPopupListTotCnt(popupVO);
	       paginationInfo.setTotalRecordCount(totCnt);
	   
	       model.addAttribute("paginationInfo", paginationInfo);
	       
	       // 검색조건과 키워드로 부서목록조회
	       List<PopupVO> resultPopupList = popupService.SelectPopupList(popupVO);
	       model.addAttribute("resultList", resultPopupList);
	       
		return "admin/popup/popupList";
	}
	
	
	/**
	 * Write
	 * @param model
	 * @return "admn/mber/Write"
	 * @exception Exception
	 */
	@RequestMapping(value = "/admin/popupInput.do")
	public String popupInput(@ModelAttribute("popup") PopupVO popupVO, BindingResult bindingResult, ModelMap model) throws Exception {
		
		return "admin/popup/popupInput";
	}
	
	/**
	 * Insert
	 * @param model
	 * @return "admin/mber/mberList.do"
	 * @exception Exception
	 */
	@SuppressWarnings("finally")
	@RequestMapping(value = "/admin/InsertPopup.do")
	public String popupInsert(@ModelAttribute("popup") PopupVO popupVO, BindingResult bindingResult, ModelMap model, HttpServletRequest request) throws Exception {
		try{
			popupService.InsertPopup(popupVO, request);
		}catch(Exception e){
			log.debug("InsertPopup Exception : "+ e.getMessage());
			model.addAttribute("msg", "입력에 실패하였습니다.");
			model.addAttribute("url", "/admin/popupList.do");
			return "redirect";
		}
		return "redirect:/admin/popupList.do";
	}
	
	/**
	 * View
	 * @param model
	 * @return "admin/mberView"
	 * @exception Exception
	 */
	@RequestMapping(value = "/admin/popupView.do")
	public String popupView(@ModelAttribute("popup") PopupVO popupVO, BindingResult bindingResult, ModelMap model) throws Exception {
		
		popupVO = popupService.SelectPopupView(popupVO);
		model.addAttribute("popupVO", popupVO);
        
		return "admin/popup/popupView";
	}
	
	/**
	 * Edit
	 * @param model
	 * @return "admin/mberEdit"
	 * @exception Exception
	 */
	@RequestMapping(value = "/admin/popupEdit.do")
	public String popupEdit(@ModelAttribute("popup") PopupVO popupVO, BindingResult bindingResult, ModelMap model) throws Exception {
		
		popupVO = popupService.SelectPopupView(popupVO);
		model.addAttribute("popupVO", popupVO);
        
		return "admin/popup/popupEdit";
	}
	
	/**
	 * 정보수정
	 * @param model
	 * @return "admin/mber/mberList.do"
	 * @exception Exception
	 */
	@SuppressWarnings("finally")
	@RequestMapping(value = "/admin/UpdatePopup.do")
	public String popupUpdate(@ModelAttribute("popup") PopupVO popupVO, BindingResult bindingResult, ModelMap model, HttpServletRequest request) throws Exception {
		try{
			popupService.UpdatePopup(popupVO, request);
		}catch(Exception e){
			log.debug("UpdatePopup Exception : "+ e.getMessage());
			model.addAttribute("msg", "수정에 실패하였습니다.");
			model.addAttribute("url", "/admin/popupList.do");
			return "redirect";
		}
		return "redirect:/admin/popupList.do";
	}
	
	/**
	 * 삭제
	 * @param model
	 * @return "admin/mber/mberList.do"
	 * @exception Exception
	 */
	@SuppressWarnings("finally")
	@RequestMapping(value = "/admin/DeletePopup.do")
	public String popupDelete(@ModelAttribute("popup") PopupVO popupVO, BindingResult bindingResult, ModelMap model, HttpServletRequest request) throws Exception {
		try{
			popupService.DeletePopup(popupVO, request);
		}catch(Exception e){
			log.debug("DeletePopup Exception : "+ e.getMessage());
			model.addAttribute("msg", "삭제에 실패하였습니다.");
			model.addAttribute("url", "/admin/popupList.do");
			return "redirect";
		}
		return "redirect:/admin/popupList.do";
	}
}
