package egovframework.komeaweb.com.web;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.komeaweb.com.service.BuyerService;
import egovframework.komeaweb.com.service.BuyerVO;
import egovframework.komeaweb.com.service.DisplayService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class BuyerController {
	Logger log = Logger.getLogger(this.getClass());
	
    @Resource(name = "buyerService")
    private BuyerService buyerService;
    
    @Resource(name = "displayService")
    private DisplayService displayService;
 
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
    
	/**
	 * Buyer List
	 * @param model
	 * @return "buyerList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/admin/buyerList.do")
	public String buyerList(@ModelAttribute("buyer") BuyerVO buyerVO, ModelMap model) throws Exception {

	       // currentPageNo : 현재 페이지 번호
	       // recordCountPerPage : 한 페이지당 게시되는 게시물 건 수 (=pageUnit)
	       // pageSize : 페이지 리스트에 게시되는 페이지 건수
	       // totalRecordCount : 전체 게시물 건 수
	       // pageUnit과 pageSize는 context-properties.xml에서 설정
	               
		   buyerVO.setPageUnit(propertiesService.getInt("pageUnit"));
		   buyerVO.setPageSize(propertiesService.getInt("pageSize"));
	       
	       PaginationInfo paginationInfo = new PaginationInfo();
	       
	       paginationInfo.setCurrentPageNo(buyerVO.getPageIndex());
	       paginationInfo.setRecordCountPerPage(buyerVO.getPageUnit());
	       paginationInfo.setPageSize(buyerVO.getPageSize());
	       
	       buyerVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
	       buyerVO.setLastIndex(paginationInfo.getLastRecordIndex());
	       buyerVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
	       
	       int totCnt = buyerService.SelectBuyerListTotCnt(buyerVO);
	       paginationInfo.setTotalRecordCount(totCnt);
	   
	       model.addAttribute("paginationInfo", paginationInfo);
	       
	       // 검색조건과 키워드로 부서목록조회
	       List<BuyerVO> resultBuyerList = buyerService.SelectBuyerList(buyerVO);
	       model.addAttribute("resultList", resultBuyerList);
	       
		return "admin/buyer/buyerList";
	}
	

	/**
	 * Buyer List Excel
	 * @param model
	 * @return "buyerListExcel"
	 * @exception Exception
	 */
	@RequestMapping(value = "/admin/buyerListExcel.do")
	public String buyerListExcel(@ModelAttribute("buyer") BuyerVO buyerVO, ModelMap model) throws Exception {
		
		PaginationInfo paginationInfo = new PaginationInfo();

	       int totCnt = buyerService.SelectBuyerListTotCnt(buyerVO);
	       paginationInfo.setTotalRecordCount(totCnt);

	       buyerVO.setFirstIndex(0);
	       buyerVO.setRecordCountPerPage(totCnt);
	   
	       model.addAttribute("paginationInfo", paginationInfo);
	       
	       // 검색조건과 키워드로 부서목록조회
	       List<BuyerVO> resultBuyerList = buyerService.SelectBuyerList(buyerVO);
	       model.addAttribute("resultList", resultBuyerList);
	       
		return "admin/buyer/buyerListExcel";
	}
	
	/**
	 * Write
	 * @param model
	 * @return "admn/mber/Write"
	 * @exception Exception
	 */
	@RequestMapping(value = "/admin/buyerInput.do")
	public String buyerInput(@ModelAttribute("buyer") BuyerVO buyerVO, ModelMap model) throws Exception {
		
		String cdDec = "NATION_NM";
		model.addAttribute("comboBox", displayService.CodeBookList(cdDec));
		
		return "admin/buyer/buyerInput";
	}
	
	/**
	 * Insert
	 * @param model
	 * @return "admin/mber/mberList.do"
	 * @exception Exception
	 */
	@SuppressWarnings("finally")
	@RequestMapping(value = "/admin/InsertBuyer.do")
	public String InsertBuyer(@ModelAttribute("buyer") BuyerVO buyerVO, ModelMap model) throws Exception {
		try{
			buyerService.InsertBuyerDbInfo(buyerVO);
		}catch(Exception e){
			log.debug("InsertBuyer Exception : "+ e.getMessage());
			model.addAttribute("msg", "입력에 실패하였습니다.");
			model.addAttribute("url", "/admin/buyerList.do");
			return "redirect";
		}
		return "redirect:/admin/buyerList.do";
	}
	
	/**
	 * View
	 * @param model
	 * @return "admin/mberView"
	 * @exception Exception
	 */
	@RequestMapping(value = "/admin/buyerView.do")
	public String buyerView(@ModelAttribute("buyer") BuyerVO buyerVO, ModelMap model) throws Exception {
		
		buyerVO = buyerService.SelectBuyerView(buyerVO);
		model.addAttribute("buyerVO", buyerVO);
        
		return "admin/buyer/buyerView";
	}
	
	/**
	 * Edit
	 * @param model
	 * @return "admin/mberEdit"
	 * @exception Exception
	 */
	@RequestMapping(value = "/admin/buyerEdit.do")
	public String buyerEdit(@ModelAttribute("buyer") BuyerVO buyerVO, ModelMap model) throws Exception {
		
		String cdDec = "NATION_NM";
		model.addAttribute("comboBox", displayService.CodeBookList(cdDec));
		
		buyerVO = buyerService.SelectBuyerView(buyerVO);
		model.addAttribute("buyerVO", buyerVO);
        
		return "admin/buyer/buyerEdit";
	}
	
	/**
	 * 정보수정
	 * @param model
	 * @return "admin/mber/mberList.do"
	 * @exception Exception
	 */
	@SuppressWarnings("finally")
	@RequestMapping(value = "/admin/UpdateBuyer.do")
	public String buyerUpdate(@ModelAttribute("buyer") BuyerVO buyerVO, ModelMap model) throws Exception {
		try{
			buyerService.UpdateBuyer(buyerVO);
		}catch(Exception e){
			log.debug("UpdateBuyer Exception : "+ e.getMessage());
			model.addAttribute("msg", "수정에 실패하였습니다.");
			model.addAttribute("url", "/admin/buyerList.do");
			return "redirect";
		}
		return "redirect:/admin/buyerList.do";
	}
	
	/**
	 * 삭제
	 * @param model
	 * @return "admin/mber/mberList.do"
	 * @exception Exception
	 */
	@SuppressWarnings("finally")
	@RequestMapping(value = "/admin/DeleteBuyer.do")
	public String buyerDelete(@ModelAttribute("buyer") BuyerVO buyerVO, ModelMap model) throws Exception {
		try{
			buyerService.DeleteBuyer(buyerVO);
		}catch(Exception e){
			log.debug("DeleteBuyer Exception : "+ e.getMessage());
			model.addAttribute("msg", "삭제에 실패하였습니다.");
			model.addAttribute("url", "/admin/buyerList.do");
			return "redirect";
		}
		return "redirect:/admin/buyerList.do";
	}
}
