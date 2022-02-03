package egovframework.komeaweb.com.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.View;

import egovframework.komea.comp.service.KomeaCompService;
import egovframework.komea.comp.service.KomeaCompVO;
import egovframework.komeaweb.com.UserValidator;
import egovframework.komeaweb.com.service.MberService;
import egovframework.komeaweb.com.service.MberVO;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class MberController {
	
	Logger log = Logger.getLogger(this.getClass());
	
    @Resource(name = "mberService")
    private MberService mberService;
    
    @Resource(name = "komeaCompService")
    private KomeaCompService komeaCompService;
 
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
    
    @Autowired
    private View jsonview;
    
	/**
	 * Mber List
	 * @param model
	 * @return "mberList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/admin/mberList.do")
	public String mberList(@ModelAttribute("mber") MberVO mberVO, BindingResult bindingResult, ModelMap model) throws Exception {

	       // currentPageNo : 현재 페이지 번호
	       // recordCountPerPage : 한 페이지당 게시되는 게시물 건 수 (=pageUnit)
	       // pageSize : 페이지 리스트에 게시되는 페이지 건수
	       // totalRecordCount : 전체 게시물 건 수
	       // pageUnit과 pageSize는 context-properties.xml에서 설정
	               
		   mberVO.setPageUnit(propertiesService.getInt("pageUnit"));
		   mberVO.setPageSize(propertiesService.getInt("pageSize"));
	       
	       PaginationInfo paginationInfo = new PaginationInfo();
	       
	       paginationInfo.setCurrentPageNo(mberVO.getPageIndex());
	       paginationInfo.setRecordCountPerPage(mberVO.getPageUnit());
	       paginationInfo.setPageSize(mberVO.getPageSize());
	       
	       mberVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
	       mberVO.setLastIndex(paginationInfo.getLastRecordIndex());
	       mberVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
	       
	       int totCnt = mberService.SelectMberListTotCnt(mberVO);
	       paginationInfo.setTotalRecordCount(totCnt);
	   
	       model.addAttribute("paginationInfo", paginationInfo);
	       
	       // 검색조건과 키워드로 부서목록조회
	       List<MberVO> resultMberList = mberService.SelectMberList(mberVO);
	       model.addAttribute("resultList", resultMberList);
	       
		return "admin/mber/mberList";
	}
	

	/**
	 * Mber List Excel
	 * @param model
	 * @return "mberListExcel"
	 * @exception Exception
	 */
	@RequestMapping(value = "/admin/mberListExcel.do")
	public String mberListExcel(@ModelAttribute("mber") MberVO mberVO, BindingResult bindingResult, ModelMap model) throws Exception {
		
		PaginationInfo paginationInfo = new PaginationInfo();
	       
	       int totCnt = mberService.SelectMberListTotCnt(mberVO);
	       paginationInfo.setTotalRecordCount(totCnt);

	       mberVO.setFirstIndex(0);
	       mberVO.setRecordCountPerPage(totCnt);
	   
	       model.addAttribute("paginationInfo", paginationInfo);
	       
	       // 검색조건과 키워드로 부서목록조회
	       List<MberVO> resultMberList = mberService.SelectMberList(mberVO);
	       model.addAttribute("resultList", resultMberList);
	       
		return "admin/mber/mberListExcel";
	}
	
	/**
	 * Write
	 * @param model
	 * @return "admn/mber/Write"
	 * @exception Exception
	 */
	@RequestMapping(value = "/admin/mberInput.do")
	public String mberInput(@ModelAttribute("mber") MberVO mberVO, BindingResult bindingResult, 
			@RequestParam(value="id_ok", defaultValue="N") String id_ok,
			@RequestParam(value="ssbyp", defaultValue="1") String ssbyp, ModelMap model) throws Exception {
		
		if(id_ok.equals("N") && mberVO.getId() != null){
			mberVO.setCnt(mberService.userIdCheck(mberVO));
			id_ok = new UserValidator().get_userid_validate(mberVO, bindingResult);
			model.addAttribute("id_ok", id_ok);
			model.addAttribute("flag", "Y");
		}else{
			model.addAttribute("id_ok", "N");
			model.addAttribute("flag", "N");
		}
		
		model.addAttribute("ssbyp", ssbyp);
		
		return "admin/mber/mberInput";
	}
	
	/**
	 * Insert
	 * @param model
	 * @return "admin/mber/mberList.do"
	 * @exception Exception
	 */
	@SuppressWarnings("finally")
	@RequestMapping(value = "/admin/InsertMber.do")
	public String mberInsert(@ModelAttribute("mber") MberVO mberVO, BindingResult bindingResult, ModelMap model, HttpServletRequest request) throws Exception {
		try{
			mberService.InsertMber(mberVO, request);
		}catch(Exception e){
			log.debug("InsertMber Exception : "+ e.getMessage());
			model.addAttribute("msg", "입력에 실패하였습니다.");
			model.addAttribute("url", "/admin/mberList.do");
			return "redirect";
		}
		return "redirect:/admin/mberList.do";
	}
	
	/**
	 * View
	 * @param model
	 * @return "admin/mberView"
	 * @exception Exception
	 */
	@RequestMapping(value = "/admin/mberView.do")
	public String mberView(@ModelAttribute("mber") MberVO mberVO, BindingResult bindingResult, ModelMap model) throws Exception {
		
		mberVO = mberService.SelectMberView(mberVO);
		model.addAttribute("mberVO", mberVO);
        
		return "admin/mber/mberView";
	}
	
	/**
	 * Popup
	 * @param model
	 * @return "admin/mberPointView"
	 * @exception Exception
	 */
	@RequestMapping(value = "/admin/pointViewPopup.do")
	public String pointViewPopup(@ModelAttribute("mber") MberVO mberVO, BindingResult bindingResult, ModelMap model) throws Exception {
		
		List<MberVO> resultPointViewList = mberService.SelectMberPointView(mberVO);
		model.addAttribute("resultPointViewList", resultPointViewList);
        
		return "admin/mber/mberPointViewPopup";
	}
	
	/**
	 * Edit
	 * @param model
	 * @return "admin/mberEdit"
	 * @exception Exception
	 */
	@RequestMapping(value = "/admin/mberEdit.do")
	public String mberEdit(@ModelAttribute("mber") MberVO mberVO, BindingResult bindingResult, ModelMap model) throws Exception {
		
		mberVO = mberService.SelectMberView(mberVO);
		model.addAttribute("mberVO", mberVO);
        
		return "admin/mber/mberEdit";
	}
	
	/**
	 * 승인/승인취소
	 * @param model
	 * @return "admin/mber/mberList.do"
	 * @exception Exception
	 */
	@SuppressWarnings("finally")
	@RequestMapping(value = "/admin/UpdateMberConfm.do")
	public String UpdateMberConfm(@ModelAttribute("mber") MberVO mberVO, BindingResult bindingResult, ModelMap model) throws Exception {
		try{
			mberService.UpdateMberConfm(mberVO);
		}catch(Exception e){
			log.debug("UpdateMberConfm Exception : "+ e.getMessage());
			model.addAttribute("msg", "승인처리에 실패하였습니다.");
			model.addAttribute("url", "/admin/mberList.do");
			return "redirect";
		}
		return "redirect:/admin/mberList.do";
	}
	
	/**
	 * 승인/승인취소
	 * @param model
	 * @return "admin/mber/mberList.do"
	 * @exception Exception
	 */
	@SuppressWarnings("finally")
	@RequestMapping(value = "/admin/UpdateUnionCompYn.do")
	public String UpdateUnionCompYn(@ModelAttribute("mber") MberVO mberVO, BindingResult bindingResult, ModelMap model) throws Exception {
		try{
			mberService.UpdateUnionCompYn(mberVO);
			
			KomeaCompVO compVO = new KomeaCompVO();
			mberVO = mberService.SelectMberView(mberVO);
			compVO.setId(mberVO.getId());
			System.out.println("@@ mberVO.getUnionCompYn() : "+mberVO.getUnionCompYn());
			if(mberVO.getUnionCompYn().equals("Y")){
				//추가
				compVO.setCompany(mberVO.getCmpnyNm());
				compVO.setCeo(mberVO.getRprsntv());
				compVO.setHomepage(mberVO.getHmpg());
				compVO.setTel(mberVO.getTelno());
				komeaCompService.InsertMberComp(compVO);
			}else{
				//삭제
				komeaCompService.DeleteCompId(compVO);
			}
		}catch(Exception e){
			log.debug("UpdateMberConfm Exception : "+ e.getMessage());
			model.addAttribute("msg", "조합원사승인처리에 실패하였습니다.");
			model.addAttribute("url", "/admin/mberList.do");
			return "redirect";
		}
		return "redirect:/admin/mberList.do";
	}
	
	/**
	 * 정보수정
	 * @param model
	 * @return "admin/mber/mberList.do"
	 * @exception Exception
	 */
	@SuppressWarnings("finally")
	@RequestMapping(value = "/admin/UpdateMber.do")
	public String mberUpdate(@ModelAttribute("mber") MberVO mberVO, BindingResult bindingResult, ModelMap model, HttpServletRequest request) throws Exception {
		try{
			mberService.UpdateMber(mberVO, request);
		}catch(Exception e){
			log.debug("UpdateMber Exception : "+ e.getMessage());
			model.addAttribute("msg", "수정에 실패하였습니다.");
			model.addAttribute("url", "/admin/mberList.do");
			return "redirect";
		}
		return "redirect:/admin/mberList.do";
	}
	
	/**
	 * 삭제
	 * @param model
	 * @return "admin/mber/mberList.do"
	 * @exception Exception
	 */
	@SuppressWarnings("finally")
	@RequestMapping(value = "/admin/DeleteMber.do")
	public String mberDelete(@ModelAttribute("mber") MberVO mberVO, BindingResult bindingResult, ModelMap model, HttpServletRequest request) throws Exception {
		try{
			mberService.DeleteMber(mberVO, request);
		}catch(Exception e){
			log.debug("DeletetMber Exception : "+ e.getMessage());
			model.addAttribute("msg", "삭제에 실패하였습니다.");
			model.addAttribute("url", "/admin/mberList.do");
			return "redirect";
		}
		return "redirect:/admin/mberList.do";
	}
	
	/**
	 * 패스워드 초기화
	 * @param model
	 * @return "admin/mber/mberList.do"
	 * @exception Exception
	 */
	@SuppressWarnings("finally")
	@RequestMapping(value = "/admin/UpdateMemberPass.do")
	public String UpdateMemberPass(@ModelAttribute("mber") MberVO mberVO, BindingResult bindingResult, ModelMap model) throws Exception {
		try{
			mberService.updateMemberPass(mberVO);
		}catch(Exception e){
			log.debug("updateMemberPass Exception : "+ e.getMessage());
			model.addAttribute("msg", "패스워드 초기화에 실패하였습니다.");
			model.addAttribute("url", "/admin/mberList.do");
			return "redirect";
		}
		return "redirect:/admin/mberList.do";
	}	
	
	@RequestMapping(value="/mber/SelectCompPoint.do")
	public View selectBoardList(String mberCd, ModelMap model) throws Exception{
		int sum = 0;
		MberVO mberVO = new MberVO();
	    mberVO.setMberCd(mberCd);
		List<MberVO> result = mberService.CompPointList(mberVO);
		sum = mberService.CompPointListSum(mberVO);
	    model.addAttribute("data", result);
	    model.addAttribute("TotalCnt", result.size());
	    model.addAttribute("TotalSum", sum);
	     
	    return jsonview;
	}
	
	@RequestMapping(value="/mber/MberPwCheck.do")
	public View MberPwCheck(String pw, ModelMap model, HttpServletRequest request) throws Exception{
		MberVO sessionVO = (MberVO)request.getSession().getAttribute("loginInfo");
		
		MberVO mberVO = new MberVO();
		mberVO.setId(sessionVO.getId());
	    mberVO.setPassword(pw);
	    mberVO = mberService.MberPwCheck(mberVO);
	    model.addAttribute("data", mberVO);
	     
	    return jsonview;
	}
	//@@@@
	@RequestMapping(value="/mber/DeleteMberUploadFile.do")
	public View DeleteMberUploadFile(@ModelAttribute("mber") MberVO mberVO,  ModelMap model) throws Exception{
		try{
			mberService.DeleteMberUploadFile(mberVO);
			model.addAttribute("msg", "OK");
		}catch(Exception ex){
			model.addAttribute("msg", "ERROR");
		}

	return jsonview;
	}
}
