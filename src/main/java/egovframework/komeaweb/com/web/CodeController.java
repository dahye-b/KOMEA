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

import egovframework.komeaweb.com.service.CodeService;
import egovframework.komeaweb.com.service.CodeVO;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class CodeController {

	Logger log = Logger.getLogger(this.getClass());
	
    @Resource(name = "codeService")
    private CodeService codeService;
 
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
	
	/**
	 * Code List
	 * @param model
	 * @return "codeList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/admin/codeList.do")
	public String codeList(@ModelAttribute("code") CodeVO codeVO, BindingResult bindingResult, ModelMap model) throws Exception {

	       // currentPageNo : 현재 페이지 번호
	       // recordCountPerPage : 한 페이지당 게시되는 게시물 건 수 (=pageUnit)
	       // pageSize : 페이지 리스트에 게시되는 페이지 건수
	       // totalRecordCount : 전체 게시물 건 수
	       // pageUnit과 pageSize는 context-properties.xml에서 설정
	               
		   codeVO.setPageUnit(propertiesService.getInt("pageUnit"));
		   codeVO.setPageSize(propertiesService.getInt("pageSize"));
	       
	       PaginationInfo paginationInfo = new PaginationInfo();
	       
	       paginationInfo.setCurrentPageNo(codeVO.getPageIndex());
	       paginationInfo.setRecordCountPerPage(codeVO.getPageUnit());
	       paginationInfo.setPageSize(codeVO.getPageSize());
	       
	       codeVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
	       codeVO.setLastIndex(paginationInfo.getLastRecordIndex());
	       codeVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
	       
	       int totCnt = codeService.SelectCodeListTotCnt(codeVO);
	       paginationInfo.setTotalRecordCount(totCnt);
	   
	       model.addAttribute("paginationInfo", paginationInfo);
	       
	       // 검색조건과 키워드로 부서목록조회
	       List<CodeVO> resultCodeList = codeService.SelectCodeList(codeVO);
	       model.addAttribute("resultList", resultCodeList);
	       
		return "admin/code/codeList";
	}
	
	/**
	 * Write
	 * @param model
	 * @return "admn/mber/Write"
	 * @exception Exception
	 */
	@RequestMapping(value = "/admin/codeInput.do")
	public String codeInput(@ModelAttribute("code") CodeVO codeVO, BindingResult bindingResult, ModelMap model) throws Exception {
		
		return "admin/code/codeInput";
	}
	
	/**
	 * Insert
	 * @param model
	 * @return "admin/mber/mberList.do"
	 * @exception Exception
	 */
	@SuppressWarnings("finally")
	@RequestMapping(value = "/admin/InsertCode.do")
	public String codeInsert(@ModelAttribute("code") CodeVO codeVO, BindingResult bindingResult, ModelMap model) throws Exception {
		try{
			codeService.InsertCode(codeVO);
		}catch(Exception e){
			log.debug("InsertCode Exception : "+ e.getMessage());
			model.addAttribute("msg", "입력에 실패하였습니다.");
			model.addAttribute("url", "/admin/codeList.do");
			return "redirect";
		}
		return "redirect:/admin/codeList.do";
	}
	
	/**
	 * View
	 * @param model
	 * @return "admin/mberView"
	 * @exception Exception
	 */
	@RequestMapping(value = "/admin/codeView.do")
	public String codeView(@ModelAttribute("code") CodeVO codeVO, BindingResult bindingResult, ModelMap model) throws Exception {
		
		codeVO = codeService.SelectCodeView(codeVO);
		model.addAttribute("codeVO", codeVO);
        
		return "admin/code/codeView";
	}
	
	/**
	 * Edit
	 * @param model
	 * @return "admin/mberEdit"
	 * @exception Exception
	 */
	@RequestMapping(value = "/admin/codeEdit.do")
	public String codeEdit(@ModelAttribute("code") CodeVO codeVO, BindingResult bindingResult, ModelMap model) throws Exception {
		
		codeVO = codeService.SelectCodeView(codeVO);
		model.addAttribute("codeVO", codeVO);
        
		return "admin/code/codeEdit";
	}
	
	/**
	 * 정보수정
	 * @param model
	 * @return "admin/mber/mberList.do"
	 * @exception Exception
	 */
	@SuppressWarnings("finally")
	@RequestMapping(value = "/admin/UpdateCode.do")
	public String codeUpdate(@ModelAttribute("code") CodeVO codeVO, BindingResult bindingResult, ModelMap model, HttpServletRequest request) throws Exception {
		try{
			codeService.UpdateCode(codeVO);
		}catch(Exception e){
			log.debug("UpdateCode Exception : "+ e.getMessage());
			model.addAttribute("msg", "수정에 실패하였습니다.");
			model.addAttribute("url", "/admin/codeList.do");
			return "redirect";
		}
		return "redirect:/admin/codeList.do";
	}
	
	/**
	 * 삭제
	 * @param model
	 * @return "admin/mber/mberList.do"
	 * @exception Exception
	 */
	@SuppressWarnings("finally")
	@RequestMapping(value = "/admin/DeleteCode.do")
	public String codeDelete(@ModelAttribute("code") CodeVO codeVO, BindingResult bindingResult, ModelMap model, HttpServletRequest request) throws Exception {
		try{
			codeService.DeleteCode(codeVO);
		}catch(Exception e){
			log.debug("DeleteCode Exception : "+ e.getMessage());
			model.addAttribute("msg", "삭제에 실패하였습니다.");
			model.addAttribute("url", "/admin/codeList.do");
			return "redirect";
		}
		return "redirect:/admin/codeList.do";
	}
}
