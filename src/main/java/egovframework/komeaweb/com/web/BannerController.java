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

import egovframework.komeaweb.com.service.BannerService;
import egovframework.komeaweb.com.service.BannerVO;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class BannerController {

	Logger log = Logger.getLogger(this.getClass());
	
    @Resource(name = "bannerService")
    private BannerService bannerService;
 
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
	
	/**
	 * Banner List
	 * @param model
	 * @return "bannerList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/admin/bannerList.do")
	public String bannerList(@ModelAttribute("banner") BannerVO bannerVO, BindingResult bindingResult, ModelMap model) throws Exception {

	       // currentPageNo : 현재 페이지 번호
	       // recordCountPerPage : 한 페이지당 게시되는 게시물 건 수 (=pageUnit)
	       // pageSize : 페이지 리스트에 게시되는 페이지 건수
	       // totalRecordCount : 전체 게시물 건 수
	       // pageUnit과 pageSize는 context-properties.xml에서 설정
	               
		   bannerVO.setPageUnit(propertiesService.getInt("pageUnit"));
		   bannerVO.setPageSize(propertiesService.getInt("pageSize"));
	       
	       PaginationInfo paginationInfo = new PaginationInfo();
	       
	       paginationInfo.setCurrentPageNo(bannerVO.getPageIndex());
	       paginationInfo.setRecordCountPerPage(bannerVO.getPageUnit());
	       paginationInfo.setPageSize(bannerVO.getPageSize());
	       
	       bannerVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
	       bannerVO.setLastIndex(paginationInfo.getLastRecordIndex());
	       bannerVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
	       
	       int totCnt = bannerService.SelectBannerListTotCnt(bannerVO);
	       paginationInfo.setTotalRecordCount(totCnt);
	   
	       model.addAttribute("paginationInfo", paginationInfo);
	       
	       // 검색조건과 키워드로 부서목록조회
	       List<BannerVO> resultBannerList = bannerService.SelectBannerList(bannerVO);
	       model.addAttribute("resultList", resultBannerList);
	       
		return "admin/banner/bannerList";
	}
	
	/**
	 * Write
	 * @param model
	 * @return "admn/mber/Write"
	 * @exception Exception
	 */
	@RequestMapping(value = "/admin/bannerInput.do")
	public String bannerInput(@ModelAttribute("banner") BannerVO bannerVO, BindingResult bindingResult, ModelMap model) throws Exception {
		
		return "admin/banner/bannerInput";
	}
	
	/**
	 * Insert
	 * @param model
	 * @return "admin/mber/mberList.do"
	 * @exception Exception
	 */
	@SuppressWarnings("finally")
	@RequestMapping(value = "/admin/InsertBanner.do")
	public String bannerInsert(@ModelAttribute("banner") BannerVO bannerVO, BindingResult bindingResult, ModelMap model, HttpServletRequest request) throws Exception {
		try{
			bannerService.InsertBanner(bannerVO, request);
		}catch(Exception e){
			log.debug("InsertBanner Exception : "+ e.getMessage());
			model.addAttribute("msg", "입력에 실패하였습니다.");
			model.addAttribute("url", "/admin/bannerList.do");
			return "redirect";
		}
		return "redirect:/admin/bannerList.do";
	}
	
	/**
	 * View
	 * @param model
	 * @return "admin/mberView"
	 * @exception Exception
	 */
	@RequestMapping(value = "/admin/bannerView.do")
	public String bannerView(@ModelAttribute("banner") BannerVO bannerVO, BindingResult bindingResult, ModelMap model) throws Exception {
		
		bannerVO = bannerService.SelectBannerView(bannerVO);
		model.addAttribute("bannerVO", bannerVO);
        
		return "admin/banner/bannerView";
	}
	
	/**
	 * Edit
	 * @param model
	 * @return "admin/mberEdit"
	 * @exception Exception
	 */
	@RequestMapping(value = "/admin/bannerEdit.do")
	public String bannerEdit(@ModelAttribute("banner") BannerVO bannerVO, BindingResult bindingResult, ModelMap model) throws Exception {
		
		bannerVO = bannerService.SelectBannerView(bannerVO);
		model.addAttribute("bannerVO", bannerVO);
        
		return "admin/banner/bannerEdit";
	}
	
	/**
	 * 정보수정
	 * @param model
	 * @return "admin/mber/mberList.do"
	 * @exception Exception
	 */
	@SuppressWarnings("finally")
	@RequestMapping(value = "/admin/UpdateBanner.do")
	public String bannerUpdate(@ModelAttribute("banner") BannerVO bannerVO, BindingResult bindingResult, ModelMap model, HttpServletRequest request) throws Exception {
		try{
			bannerService.UpdateBanner(bannerVO, request);
		}catch(Exception e){
			log.debug("UpdateBanner Exception : "+ e.getMessage());
			model.addAttribute("msg", "수정에 실패하였습니다.");
			model.addAttribute("url", "/admin/bannerList.do");
			return "redirect";
		}
		return "redirect:/admin/bannerList.do";
	}
	
	/**
	 * 삭제
	 * @param model
	 * @return "admin/mber/mberList.do"
	 * @exception Exception
	 */
	@SuppressWarnings("finally")
	@RequestMapping(value = "/admin/DeleteBanner.do")
	public String bannerDelete(@ModelAttribute("banner") BannerVO bannerVO, BindingResult bindingResult, ModelMap model, HttpServletRequest request) throws Exception {
		try{
			bannerService.DeleteBanner(bannerVO, request);
		}catch(Exception e){
			log.debug("DeleteBanner Exception : "+ e.getMessage());
			model.addAttribute("msg", "삭제에 실패하였습니다.");
			model.addAttribute("url", "/admin/bannerList.do");
			return "redirect";
		}
		return "redirect:/admin/bannerList.do";
	}
}
