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

import egovframework.komeaweb.com.ShowBoardValidator;
import egovframework.komeaweb.com.service.DisplayService;
import egovframework.komeaweb.com.service.MberVO;
import egovframework.komeaweb.com.service.ShowVO;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class InfoCenterController {
	Logger log = Logger.getLogger(this.getClass());
	
    @Resource(name = "displayService")
    private DisplayService displayService;
    
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
    
    @Autowired
    private View jsonview;
    
    /**
     * BoardName, return할 파일명 SETTING
     */
    public void SetValue(ShowVO showVO, BindingResult bindingResult) throws Exception{
    	String BoardName = "";
    	String BoardFilePath = "";
    	
    	BoardName = new ShowBoardValidator().get_BoardName(showVO, bindingResult);
    	BoardFilePath = new ShowBoardValidator().get_BoardFileName(showVO, bindingResult);
    	
    	showVO.setBoardName(BoardName);
    	showVO.setBoardFilePath(BoardFilePath);

    	System.out.println("@ "+showVO.getBoardName());
    	System.out.println("@ /komea/show/"+showVO.getBoardFilePath());
    }    
	
	/**-------------------------------------------------------------------------------------------------
	 * 정보센터 게시판
	 -------------------------------------------------------------------------------------------------*/

	/**
	 * List
	 * @param model
	 * @return "show/InfoCenter/List"
	 * @exception Exception
	 */
	@RequestMapping(value = "/show/InfoCenter/List.do")
	public String InfoCenterList(@ModelAttribute("show") ShowVO showVO, 
			@RequestParam(value="bbsTy", required=false, defaultValue="0") String bbsTy, BindingResult bindingResult, HttpServletRequest request, ModelMap model) throws Exception {
		
	   showVO.setBbsTy(bbsTy);
	   SetValue(showVO, bindingResult);
		
       // currentPageNo : 현재 페이지 번호
       // recordCountPerPage : 한 페이지당 게시되는 게시물 건 수 (=pageUnit)
       // pageSize : 페이지 리스트에 게시되는 페이지 건수
       // totalRecordCount : 전체 게시물 건 수
       // pageUnit과 pageSize는 context-properties.xml에서 설정
               
	   showVO.setPageUnit(propertiesService.getInt("pageUnit"));
	   showVO.setPageSize(propertiesService.getInt("pageSize"));
       
       PaginationInfo paginationInfo = new PaginationInfo();
       
       paginationInfo.setCurrentPageNo(showVO.getPageIndex());
       paginationInfo.setRecordCountPerPage(showVO.getPageUnit());
       paginationInfo.setPageSize(showVO.getPageSize());
       
       showVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
       showVO.setLastIndex(paginationInfo.getLastRecordIndex());
       showVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
       
       MberVO sessionVO = (MberVO)request.getSession().getAttribute("loginInfo");
       //상담문의
	   if(bbsTy.equals("5")){
	       if(sessionVO != null){
			   if(request.getSession().getAttribute("isAdmin") != null){//담당자인 경우 리스트를 보기 	
			       int totCnt = displayService.SelectBoardListTotCnt(showVO);
			       paginationInfo.setTotalRecordCount(totCnt);
			   
			       model.addAttribute("paginationInfo", paginationInfo);
			       
			       // 검색조건과 키워드로 부서목록조회
			       List<ShowVO> resultBoardList = displayService.SelectBoardList(showVO);
			       model.addAttribute("resultList", resultBoardList);
			       model.addAttribute("BoardName", showVO.getBoardName());
			       
				   model.addAttribute("mnCd", "mn04");
				   model.addAttribute("mnCdS", "mn040"+bbsTy);
				   model.addAttribute("mnNm", showVO.getBoardName());
			       
				   return "komea/show/"+showVO.getBoardFilePath()+"List";
			   }else{
				   return "komea/show/"+showVO.getBoardFilePath()+"Write";
			   }
	       }else{
				model.addAttribute("msg","로그인이 필요합니다.");
				model.addAttribute("url","/komea/login.do");
				return "redirect";
	       }
	   }else if(bbsTy.equals("2")){
	       int totCnt = displayService.SelectBoardListTotCnt(showVO);
	       paginationInfo.setTotalRecordCount(totCnt);
	   
	       model.addAttribute("paginationInfo", paginationInfo);
	       
	       // 검색조건과 키워드로 부서목록조회
	       List<ShowVO> resultBoardList = displayService.SelectBoardList(showVO);
	       model.addAttribute("resultList", resultBoardList);
	       model.addAttribute("BoardName", showVO.getBoardName());
	       
	       System.out.println("URL : komea/show/"+showVO.getBoardFilePath()+"List.jsp");
		   model.addAttribute("mnCd", "mn09");
		   model.addAttribute("mnNm", showVO.getBoardName());
			
			return "komea/show/"+showVO.getBoardFilePath()+"List";
	   }else{
	       int totCnt = displayService.SelectBoardListTotCnt(showVO);
	       paginationInfo.setTotalRecordCount(totCnt);
	   
	       model.addAttribute("paginationInfo", paginationInfo);
	       
	       // 검색조건과 키워드로 부서목록조회
	       List<ShowVO> resultBoardList = displayService.SelectBoardList(showVO);
	       model.addAttribute("resultList", resultBoardList);
	       model.addAttribute("BoardName", showVO.getBoardName());
	       
	       System.out.println("URL : komea/show/"+showVO.getBoardFilePath()+"List.jsp");
		   model.addAttribute("mnCd", "mn04");
		   model.addAttribute("mnCdS", "mn040"+bbsTy);
		   model.addAttribute("mnNm", showVO.getBoardName());
			
			return "komea/show/"+showVO.getBoardFilePath()+"List";
	   }
	}
	
	/**
	 * Write
	 * @param model
	 * @return "show/InfoCenter/Write"
	 * @exception Exception
	 */
	@RequestMapping(value = "/show/InfoCenter/Write.do")
	public String InfoCenterWrite(@ModelAttribute("show") ShowVO showVO, BindingResult bindingResult, HttpServletRequest request, ModelMap model) throws Exception {
		
		SetValue(showVO, bindingResult);
		model.addAttribute("BoardName", showVO.getBoardName());

	   //입찰공고
	   if(showVO.getBbsTy().equals("2")){
	       MberVO sessionVO = (MberVO)request.getSession().getAttribute("loginInfo");
	       
	       if(sessionVO != null){
	    	   showVO.setInsttMberCd(sessionVO.getMberCd());
		       model.addAttribute("comboBox", displayService.SelectRedyEventCombo(showVO));
		   }
	   }
	   model.addAttribute("mnCd", "mn04");
	   model.addAttribute("mnCdS", "mn040"+showVO.getBbsTy());
	   model.addAttribute("mnNm", showVO.getBoardName());
		
		return "komea/show/"+showVO.getBoardFilePath()+"Write";
	}
	
	/**
	 * View
	 * @param model
	 * @return "/show/InfoCenter/View"
	 * @exception Exception
	 */
	@RequestMapping(value = "/show/InfoCenter/View.do")
	public String InfoCenterView(@ModelAttribute("show") ShowVO showVO, BindingResult bindingResult, ModelMap model) throws Exception {

		displayService.UpdateViewCnt(showVO);
		
		showVO = displayService.SelectBoardView(showVO);
		model.addAttribute("showVO", showVO);
		
        List<ShowVO> PreNextList = displayService.SelectBoardPreNextList(showVO);
        model.addAttribute("PreNextList", PreNextList);
        
        if(showVO.getBbsTy().equals("2") && showVO.getEventCd() != null){
        	ShowVO showVO1 = showVO;
        	showVO1.setCode(showVO.getEventCd());
        	showVO1.setGubun(showVO.getEventGb());
        	showVO1 = displayService.SelectEventNm(showVO1);
        	model.addAttribute("EventNm", showVO1.getEventNm());
        }
        
        SetValue(showVO, bindingResult);
        model.addAttribute("BoardName", showVO.getBoardName());
        System.out.println("URL : komea/show/"+showVO.getBoardFilePath()+"View.jsp");
        
        if(showVO.getBbsTy().equals("2")){
        	model.addAttribute("mnCd", "mn09");
        }else{
     	    model.addAttribute("mnCd", "mn04");
     	    model.addAttribute("mnCdS", "mn040"+showVO.getBbsTy());
        }
 	    model.addAttribute("mnNm", showVO.getBoardName());
        
        return "komea/show/"+showVO.getBoardFilePath()+"View";
	}
	
	/**
	 * Edit
	 * @param model
	 * @return "/show/InfoCenter/Edit"
	 * @exception Exception
	 */
	@RequestMapping(value = "/show/InfoCenter/Edit.do")
	public String InfoCenterEdit(@ModelAttribute("show") ShowVO showVO, BindingResult bindingResult, ModelMap model) throws Exception {

		showVO = displayService.SelectBoardView(showVO);
		model.addAttribute("show", showVO);
		
        SetValue(showVO, bindingResult);
        model.addAttribute("BoardName", showVO.getBoardName());
        System.out.println("URL : komea/show/"+showVO.getBoardFilePath()+"Edit.jsp");
        
        if(showVO.getBbsTy().equals("2")){
        	model.addAttribute("mnCd", "mn09");
        }else{
     	    model.addAttribute("mnCd", "mn04");
     	    model.addAttribute("mnCdS", "mn040"+showVO.getBbsTy());
        }
 	    model.addAttribute("mnNm", showVO.getBoardName());
        
        return "komea/show/"+showVO.getBoardFilePath()+"Edit";
	}
	
	/**
	 * Insert
	 * @param model
	 * @return "/show/InfoCenter/InsertBoard.do"
	 * @exception Exception
	 */
	@SuppressWarnings("finally")
	@RequestMapping(value = "/show/InfoCenter/InsertBoard.do")
	public String InfoCenterInsert(@ModelAttribute("show") ShowVO showVO, BindingResult bindingResult, ModelMap model, HttpServletRequest request) throws Exception {
		try{
			displayService.InsertBoard (showVO, request);
		}catch(Exception e){
			log.debug("InsertBoard Exception : "+ e.getMessage());
			model.addAttribute("msg", "입력에 실패하였습니다.");
			model.addAttribute("url", "/show/InfoCenter/List.do?bbsTy="+showVO.getBbsTy());
			return "redirect";
		}
		return "redirect:/show/InfoCenter/List.do?bbsTy="+showVO.getBbsTy();
	}
	
	/**
	 * Update
	 * @param model
	 * @return "/show/InfoCenter/UpdateBoard.do"
	 * @exception Exception
	 */
	@SuppressWarnings("finally")
	@RequestMapping(value = "/show/InfoCenter/UpdateBoard.do")
	public String InfoCenterUpdate(@ModelAttribute("show") ShowVO showVO, BindingResult bindingResult, ModelMap model, HttpServletRequest request) throws Exception {
		try{
			displayService.UpdateBoard(showVO, request);
		}catch(Exception e){
			log.debug("UpdateBoard Exception : "+ e.getMessage());
			model.addAttribute("msg", "수정에 실패하였습니다.");
			model.addAttribute("url", "/show/InfoCenter/List.do?bbsTy="+showVO.getBbsTy());
			return "redirect";
		}
		return "redirect:/show/InfoCenter/List.do?bbsTy="+showVO.getBbsTy();
	}
	
	/**
	 * Delete
	 * @param model
	 * @return "/show/InfoCenter/DeleteBoard.do"
	 * @exception Exception
	 */
	@SuppressWarnings("finally")
	@RequestMapping(value = "/show/InfoCenter/DeleteBoard.do")
	public String InfoCenterDelete(@ModelAttribute("show") ShowVO showVO, BindingResult bindingResult, ModelMap model, HttpServletRequest request) throws Exception {
		try{
			displayService.DeleteBoard(showVO, request);
		}catch(Exception e){
			log.debug("DeleteBoard Exception : "+ e.getMessage());
			model.addAttribute("msg", "삭제에 실패하였습니다.");
			model.addAttribute("url", "/show/InfoCenter/List.do?bbsTy="+showVO.getBbsTy());
			return "redirect";
		}
		return "redirect:/show/InfoCenter/List.do?bbsTy="+showVO.getBbsTy();
	}
	
	/**
	 * 입찰공고 신청하기(기타회원)
	 * BiddingRequestWrite
	 * @param model
	 * @return "show/InfoCenter/Write"
	 * @exception Exception
	 */
	@RequestMapping(value = "/show/InfoCenter/BiddingRequestWrite.do")
	public String BiddingRequestWrite(@ModelAttribute("show") ShowVO showVO, BindingResult bindingResult, HttpServletRequest request, ModelMap model) throws Exception {
       
		System.out.println("===============");
		System.out.println("bbsTy : "+showVO.getBbsTy());
		System.out.println("registNo : "+showVO.getRegistNo());
		System.out.println("bbscttNo : "+showVO.getBbscttNo());
		System.out.println("===============");
		
		model.addAttribute("bbsTy", showVO.getBbsTy());
		model.addAttribute("registNo", showVO.getRegistNo());
		model.addAttribute("bbscttNo", showVO.getBbscttNo());
		
		SetValue(showVO, bindingResult);
		model.addAttribute("BoardName", showVO.getBoardName());
		String FilePath = showVO.getBoardFilePath();
		
	   //입찰공고 신청하기
		MberVO sessionVO = (MberVO)request.getSession().getAttribute("loginInfo");
	       
	       if(sessionVO != null){
	    	   showVO.setMberCd(sessionVO.getMberCd());
	    	   showVO = displayService.SelectMberInfo(showVO);
	    	   model.addAttribute("show", showVO);
	    	   
		   		if(showVO.getMainSkll() != null){
					String str1 = showVO.getMainSkll();
					str1 = str1.replaceAll("\n","<br/>");
					model.addAttribute("MainSkll",str1);
				}
	
				if(showVO.getEtcMatter() != null){
					String str2 = showVO.getEtcMatter();
					str2 = str2.replaceAll("\n","<br/>");
					model.addAttribute("EtcMatter",str2);
				}
	       }else{
				model.addAttribute("msg","로그인이 필요합니다.");
				model.addAttribute("url","/komea/login.do");
				return "redirect";
	       }
	       
		   model.addAttribute("mnCd", "mn04");
		   model.addAttribute("mnCdS", "mn0402");
		   model.addAttribute("mnNm", "입찰공고");

		return "komea/show/"+FilePath+"RequestWrite";
	}
	
	/**
	 * Insert
	 * @param model
	 * @return "/show/InfoCenter/InsertBoard.do"
	 * @exception Exception
	 */
	@SuppressWarnings("finally")
	@RequestMapping(value = "/show/InfoCenter/InsertBiddingReqstInfo.do")
	public String InsertBiddingReqstInfo(@ModelAttribute("show") ShowVO showVO, BindingResult bindingResult, ModelMap model, HttpServletRequest request) throws Exception {
		try{
			displayService.InsertBiddingReqstInfo(showVO, request);
		}catch(Exception e){
			log.debug("InsertBiddingReqstInfo Exception : "+ e.getMessage());
			model.addAttribute("msg", "입력에 실패하였습니다.");
			model.addAttribute("url", "/show/InfoCenter/List.do?bbsTy=2");
			return "redirect";
		}
		return "redirect:/show/InfoCenter/List.do?bbsTy=2";
	}
	//@@@@
	@RequestMapping(value="/show/InfoCenter/DeleteBiddingReqstInfo.do")
	public View DeleteBiddingReqstInfo(@ModelAttribute("show") ShowVO showVO,  ModelMap model) throws Exception{
		try{
			displayService.DeleteBiddingReqstInfo(showVO);
			model.addAttribute("msg", "OK");
		}catch(Exception ex){
			model.addAttribute("msg", "ERROR");
		}

	return jsonview;
	}
	
	/**
	 * 우수업체선정 신청하기(기업회원)
	 * BestCompanyRequestWrite
	 * @param model
	 * @return "show/InfoCenter/Write"
	 * @exception Exception
	 */
	@RequestMapping(value = "/show/InfoCenter/BestCompanyRequestWrite.do")
	public String BestCompanyRequestWrite(@ModelAttribute("show") ShowVO showVO, BindingResult bindingResult, HttpServletRequest request, ModelMap model) throws Exception {
       
		System.out.println("===============");
		System.out.println("bbsTy : "+showVO.getBbsTy());
		System.out.println("registNo : "+showVO.getRegistNo());
		System.out.println("bbscttNo : "+showVO.getBbscttNo());
		System.out.println("===============");
		
		model.addAttribute("bbsTy", showVO.getBbsTy());
		model.addAttribute("registNo", showVO.getRegistNo());
		model.addAttribute("bbscttNo", showVO.getBbscttNo());
		
		SetValue(showVO, bindingResult);
		model.addAttribute("BoardName", showVO.getBoardName());
		String FilePath = showVO.getBoardFilePath();
		
	   //우수업체선정 신청하기
		MberVO sessionVO = (MberVO)request.getSession().getAttribute("loginInfo");
	       
	       if(sessionVO != null){
	    	   showVO.setMberCd(sessionVO.getMberCd());
	    	   showVO = displayService.SelectMberInfo(showVO);
	    	   model.addAttribute("show", showVO);
	    	   
		   		if(showVO.getMainPrduct() != null){
					String str1 = showVO.getMainPrduct();
					str1 = str1.replaceAll("\n","<br/>");
					model.addAttribute("MainPrduct",str1);
				}
	       }else{
				model.addAttribute("msg","로그인이 필요합니다.");
				model.addAttribute("url","/komea/login.do");
				return "redirect";
	       }
	       
		   model.addAttribute("mnCd", "mn04");
		   model.addAttribute("mnCdS", "mn0406");
		   model.addAttribute("mnNm", "우수기업선정");

		return "komea/show/"+FilePath+"RequestWrite";
	}
	
	/**
	 * Insert
	 * @param model
	 * @return "/show/InfoCenter/InsertBoard.do"
	 * @exception Exception
	 */
	@SuppressWarnings("finally")
	@RequestMapping(value = "/show/InfoCenter/InsertBestCompanyReqstInfo.do")
	public String InsertBestCompanyReqstInfo(@ModelAttribute("show") ShowVO showVO, BindingResult bindingResult, ModelMap model, HttpServletRequest request) throws Exception {
		try{
			displayService.InsertBestCompanyReqstInfo(showVO, request);
		}catch(Exception e){
			log.debug("InsertBestCompanyReqstInfo Exception : "+ e.getMessage());
			model.addAttribute("msg", "입력에 실패하였습니다.");
			model.addAttribute("url", "/show/InfoCenter/List.do?bbsTy=6");
			return "redirect";
		}
		return "redirect:/show/InfoCenter/List.do?bbsTy=6";
	}
	
	//@@@@
	@RequestMapping(value="/show/InfoCenter/DeleteBestCompanyReqstInfo.do")
	public View DeleteBestCompanyReqstInfo(String tmp1, String tmp2,  ModelMap model) throws Exception{
		
		ShowVO showVO = new ShowVO();
		showVO.setTmp1(tmp1);
		showVO.setTmp2(tmp2);
	    
		try{
			displayService.DeleteBestCompanyReqstInfo(showVO);
			model.addAttribute("msg", "OK");
		}catch(Exception ex){
			model.addAttribute("msg", "ERROR");
		}

	return jsonview;
	}
}
