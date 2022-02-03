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

import egovframework.komeaweb.com.service.ExbiService;
import egovframework.komeaweb.com.service.ExbiVO;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class ExbiController {
	Logger log = Logger.getLogger(this.getClass());
	
    @Resource(name = "exbiService")
    private ExbiService exbiService;
 
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

	
	/**
	 * Exbi List
	 * @param model
	 * @return "exbiList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/admin/exbiList.do")
	public String exbiList(@ModelAttribute("exbi") ExbiVO exbiVO, BindingResult bindingResult, ModelMap model) throws Exception {

	       // currentPageNo : 현재 페이지 번호
	       // recordCountPerPage : 한 페이지당 게시되는 게시물 건 수 (=pageUnit)
	       // pageSize : 페이지 리스트에 게시되는 페이지 건수
	       // totalRecordCount : 전체 게시물 건 수
	       // pageUnit과 pageSize는 context-properties.xml에서 설정
	               
		   exbiVO.setPageUnit(propertiesService.getInt("pageUnit"));
		   exbiVO.setPageSize(propertiesService.getInt("pageSize"));
	       
	       PaginationInfo paginationInfo = new PaginationInfo();
	       
	       paginationInfo.setCurrentPageNo(exbiVO.getPageIndex());
	       paginationInfo.setRecordCountPerPage(exbiVO.getPageUnit());
	       paginationInfo.setPageSize(exbiVO.getPageSize());
	       
	       exbiVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
	       exbiVO.setLastIndex(paginationInfo.getLastRecordIndex());
	       exbiVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
	       
	       int totCnt = exbiService.SelectExbiListTotCnt(exbiVO);
	       paginationInfo.setTotalRecordCount(totCnt);
	   
	       model.addAttribute("paginationInfo", paginationInfo);
	       
	       // 검색조건과 키워드로 부서목록조회
	       List<ExbiVO> resultExbiList = exbiService.SelectExbiList(exbiVO);
	       model.addAttribute("resultList", resultExbiList);
	       
		return "admin/exbi/exbiList";
	}
	
	/**
	 * Write
	 * @param model
	 * @return "admn/mber/Write"
	 * @exception Exception
	 */
	@RequestMapping(value = "/admin/exbiInput.do")
	public String exbiInput(@ModelAttribute("exbi") ExbiVO exbiVO, BindingResult bindingResult, ModelMap model) throws Exception {
		
		return "admin/exbi/exbiInput";
	}
	
	/**
	 * Insert
	 * @param model
	 * @return "admin/mber/mberList.do"
	 * @exception Exception
	 */
	@SuppressWarnings("finally")
	@RequestMapping(value = "/admin/InsertExbi.do")
	public String exbiInsert(@ModelAttribute("exbi") ExbiVO exbiVO, BindingResult bindingResult, ModelMap model, HttpServletRequest request) throws Exception {
		try{
			exbiService.InsertExbi(exbiVO, request);
		}catch(Exception e){
			log.debug("InsertExbi Exception : "+ e.getMessage());
			model.addAttribute("msg", "입력에 실패하였습니다.");
			model.addAttribute("url", "/admin/exbiList.do");
			return "redirect";
		}
		return "redirect:/admin/exbiList.do";
	}
	
	/**
	 * View
	 * @param model
	 * @return "admin/mberView"
	 * @exception Exception
	 */
	@RequestMapping(value = "/admin/exbiView.do")
	public String exbiView(@ModelAttribute("exbi") ExbiVO exbiVO, BindingResult bindingResult, ModelMap model) throws Exception {
		
		exbiVO = exbiService.SelectExbiView(exbiVO);
		model.addAttribute("exbiVO", exbiVO);
        
		return "admin/exbi/exbiView";
	}
	
	/**
	 * Edit
	 * @param model
	 * @return "admin/mberEdit"
	 * @exception Exception
	 */
	@RequestMapping(value = "/admin/exbiEdit.do")
	public String exbiEdit(@ModelAttribute("exbi") ExbiVO exbiVO, BindingResult bindingResult, ModelMap model) throws Exception {
		
		exbiVO = exbiService.SelectExbiView(exbiVO);
		model.addAttribute("exbiVO", exbiVO);
        
		return "admin/exbi/exbiEdit";
	}
	
	/**
	 * 정보수정
	 * @param model
	 * @return "admin/mber/mberList.do"
	 * @exception Exception
	 */
	@SuppressWarnings("finally")
	@RequestMapping(value = "/admin/UpdateExbi.do")
	public String exbiUpdate(@ModelAttribute("exbi") ExbiVO exbiVO, BindingResult bindingResult, ModelMap model, HttpServletRequest request) throws Exception {
		try{
			exbiService.UpdateExbi(exbiVO, request);
		}catch(Exception e){
			log.debug("UpdateExbi Exception : "+ e.getMessage());
			model.addAttribute("msg", "수정에 실패하였습니다.");
			model.addAttribute("url", "/admin/exbiList.do");
			return "redirect";
		}
		return "redirect:/admin/exbiList.do";
	}
	
	/**
	 * 삭제
	 * @param model
	 * @return "admin/mber/mberList.do"
	 * @exception Exception
	 */
	@SuppressWarnings("finally")
	@RequestMapping(value = "/admin/DeleteExbi.do")
	public String exbiDelete(@ModelAttribute("exbi") ExbiVO exbiVO, BindingResult bindingResult, ModelMap model, HttpServletRequest request) throws Exception {
		try{
			exbiService.DeleteExbi(exbiVO, request);
		}catch(Exception e){
			log.debug("DeleteExbi Exception : "+ e.getMessage());
			model.addAttribute("msg", "삭제에 실패하였습니다.");
			model.addAttribute("url", "/admin/exbiList.do");
			return "redirect";
		}
		return "redirect:/admin/exbiList.do";
	}
}
