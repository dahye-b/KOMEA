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
import org.springframework.web.servlet.View;

import egovframework.komeaweb.com.service.DisplayService;
import egovframework.komeaweb.com.service.MberService;
import egovframework.komeaweb.com.service.MberVO;
import egovframework.komeaweb.com.service.ReqCompService;
import egovframework.komeaweb.com.service.ShowVO;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class ReqCompController {

	Logger log = Logger.getLogger(this.getClass());
	
    @Resource(name = "displayService")
    private DisplayService displayService;
	
    @Resource(name = "reqCompService")
    private ReqCompService reqCompService;
    
	@Resource(name="mberService")
	private MberService mberService;    
    
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
    
    @Autowired
    private View jsonview;
    
	/**
	 * 전시상담포털 > MyDesk > 참여입찰관리
	 * @param model
	 * @return "workList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/show/ReqBiddingList.do")
	public String ReqBiddingList(@ModelAttribute("show") ShowVO showVO, ModelMap model, HttpServletRequest request) throws Exception {
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
	       if(sessionVO != null){
	    	   showVO.setMberCd(sessionVO.getMberCd());
		       int totCnt = reqCompService.SelectReqBiddingListTotCnt(showVO);
		       paginationInfo.setTotalRecordCount(totCnt);
		   
		       model.addAttribute("paginationInfo", paginationInfo);
		       
		       // 검색조건과 키워드로 부서목록조회
		       List<ShowVO> resultList = reqCompService.SelectReqBiddingList(showVO);
		       model.addAttribute("resultList", resultList);
	       }else{
				model.addAttribute("msg","로그인이 필요합니다.");
				model.addAttribute("url","/komea/login.do");
				return "redirect";
	       }

		   //model.addAttribute("ComYear",codService.CodeBookList(""));
	       model.addAttribute("mnCd", "mn04");
	       model.addAttribute("mnCdS", "mn0506");
	       model.addAttribute("mnNm", "참여입찰관리");
	       
		return "komea/show/mn05/reqBiddingList";
	}
	
	/**
	 * 전시상담포털 > MyDesk > 입찰참여관리 > 일정등록
	 * @param model
	 * @return "companyView"
	 * @exception Exception
	 */
	@RequestMapping(value = "/show/ReqBiddingResultFile.do")
	public String ReqBiddingResultFile(@ModelAttribute("show") ShowVO showVO, ModelMap model) throws Exception {

		//입찰신청 내용
		showVO = reqCompService.SelectReqBiddingInfo(showVO);
		model.addAttribute("show", showVO);
 	   	
		model.addAttribute("mnCd", "mn04");
		model.addAttribute("mnCdS", "mn0506");
		model.addAttribute("mnNm", "참여입찰관리");
 	   	
		return "komea/show/mn05/reqBiddingResultFileInput";
	}
	
	/**
	 * Update
	 * @param model
	 * @return "/show/UpdateReqBidding.do"
	 * @exception Exception
	 */
	@SuppressWarnings("finally")
	@RequestMapping(value = "/show/InsertReqBiddingResultFile.do")
	public String InsertReqBiddingResultFile(@ModelAttribute("show") ShowVO showVO, BindingResult bindingResult, ModelMap model, HttpServletRequest request) throws Exception {
		try{
			reqCompService.InsertReqBiddingResultFile(showVO, request);
		}catch(Exception e){
			log.debug("InsertReqBiddingResultFile Exception : "+ e.getMessage());
			model.addAttribute("msg", "입력에 실패하였습니다.");
			model.addAttribute("url", "/show/ReqBiddingList.do");
			return "redirect";
		}
		return "redirect:/show/ReqBiddingList.do";
	}
	
	//@@@@
	@RequestMapping(value="/show/DeleteBiddingResultInfoFile.do")
	public View DeleteBiddingResultInfoFile(@ModelAttribute("show") ShowVO showVO,  ModelMap model) throws Exception{
		try{
			reqCompService.DeleteBiddingResultInfoFile(showVO);
			model.addAttribute("msg", "OK");
		}catch(Exception ex){
			model.addAttribute("msg", "ERROR");
		}

	return jsonview;
	}
	
	/**
	 * Update
	 * @param model
	 * @return "/show/UpdateReqBidding.do"
	 * @exception Exception
	 */
	@SuppressWarnings("finally")
	@RequestMapping(value = "/show/UpdateReqBidding.do")
	public String UpdateReqBidding(@ModelAttribute("show") ShowVO showVO, BindingResult bindingResult, ModelMap model, HttpServletRequest request) throws Exception {
		try{
			displayService.InsertBiddingReqstInfo(showVO, request);
		}catch(Exception e){
			log.debug("InsertBiddingReqstInfo Exception : "+ e.getMessage());
			model.addAttribute("msg", "수정에 실패하였습니다.");
			model.addAttribute("url", "/show/ReqBiddingList.do");
			return "redirect";
		}
		return "redirect:/show/ReqBiddingList.do";
	}
	
	
	/**
	 * 전시상담포털 > MyDesk > 사업참여관리
	 * @param model
	 * @return "ReqBizList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/show/ReqBizList.do")
	public String ReqBizList(@ModelAttribute("show") ShowVO showVO, ModelMap model, HttpServletRequest request) throws Exception {

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
	       if(sessionVO != null){
	    	   showVO.setMberCd(sessionVO.getMberCd());
		       int totCnt = reqCompService.SelectReqBizListTotCnt(showVO);
		       paginationInfo.setTotalRecordCount(totCnt);
		   
		       model.addAttribute("paginationInfo", paginationInfo);
		       
		       // 검색조건과 키워드로 부서목록조회
		       List<ShowVO> resultList = reqCompService.SelectReqBizList(showVO);
		       model.addAttribute("resultList", resultList);
	       }else{
				model.addAttribute("msg","로그인이 필요합니다.");
				model.addAttribute("url","/komea/login.do");
				return "redirect";
	       }

	       model.addAttribute("mnCd", "mn04");
	       model.addAttribute("mnCdS", "mn0506");
	       model.addAttribute("mnNm", "사업참여관리");
	       
		return "komea/show/mn05/reqBizList";
	}
	
	/**
	 * 전시상담포털 > MyDesk > 사업참여관리 > 사업내용조회(상세)
	 * @param model
	 * @return "companyView"
	 * @exception Exception
	 */
	@RequestMapping(value = "/show/ReqBizWorkView.do")
	public String ReqBizView(@ModelAttribute("show") ShowVO showVO, ModelMap model, HttpServletRequest request) throws Exception {
		
			if(showVO.getGubun().equals("0")){
				ShowVO showVO1;
				showVO1 = displayService.ExbiRegistInfo(showVO);
				model.addAttribute("ExbiRegistInfo", showVO1);
				model.addAttribute("ViewGb", "0");
				
				if(showVO1.getPartcptSumry() != null){
					String str1 = showVO1.getPartcptSumry();
					str1 = str1.replaceAll("\n","<br/>");
					model.addAttribute("ExbiPartcptSumry",str1);
				}
	
				if(showVO1.getPartcptReqstMth() != null){
					String str2 = showVO1.getPartcptReqstMth();
					str2 = str2.replaceAll("\n","<br/>");
					model.addAttribute("ExbiPartcptReqstMth",str2);
				}
	
				if(showVO1.getSportCn() != null){
					String str3 = showVO1.getSportCn();
					str3 = str3.replaceAll("\n","<br/>");
					model.addAttribute("ExbiSportCn",str3);
				}
				
				if(showVO1.getNoticeItems() != null){
					String str4 = showVO1.getNoticeItems();
					str4 = str4.replaceAll("\n","<br/>");
					model.addAttribute("ExbiNoticeItems",str4);
				}
				
				if(showVO1.getMainSkll() != null){
					String str5 = showVO1.getMainSkll();
					str5 = str5.replaceAll("\n","<br/>");
					model.addAttribute("ExbiMainSkll",str5);
				}
				
				if(showVO1.getPartcptInclsMatter() != null){
					String str6 = showVO1.getPartcptInclsMatter();
					str6 = str6.replaceAll("\n","<br/>");
					model.addAttribute("ExbiPartcptInclsMatter",str6);
				}
				
				if(showVO1.getEtcResult() != null){
					String str7 = showVO1.getEtcResult();
					str7 = str7.replaceAll("\n","<br/>");
					model.addAttribute("ExbiEtcResult",str7);
				}
			}else{
				ShowVO showVO2;
				showVO2 = displayService.CnsltexhbRegistInfo(showVO);
				model.addAttribute("CnsltexhbRegistInfo", showVO2);
				model.addAttribute("ViewGb", "1"); 
				
				if(showVO2.getMainCn() != null){
					String str1 = showVO2.getMainCn();
					str1 = str1.replaceAll("\n","<br/>");
					model.addAttribute("CnsltMainCn",str1);
				}
	
				if(showVO2.getSportCn() != null){
					String str2 = showVO2.getSportCn();
					str2 = str2.replaceAll("\n","<br/>");
					model.addAttribute("CnsltSportCn",str2);
				}
	
		        List<ShowVO> resultList = displayService.SelectBuyerList1(showVO2);
		        model.addAttribute("buyerList", resultList);
			}
		
		model.addAttribute("mnCd", "mn04");
		model.addAttribute("mnCdS", "mn0506");
		model.addAttribute("mnNm", "사업참여관리");
		
		return "komea/show/mn05/reqBizWorkView";
	}
	
	/**
	 * 전시상담포털 > MyDesk > 사업참여관리 > 신청서조회(상세보기)
	 * @param model
	 * @return "companyView"
	 * @exception Exception
	 */
	@RequestMapping(value = "/show/ReqBizFormView.do")
	public String ReqBizFormView(@ModelAttribute("show") ShowVO showVO, ModelMap model, HttpServletRequest request) throws Exception {

		MberVO sessionVO = (MberVO)request.getSession().getAttribute("loginInfo");
        if(sessionVO != null){
        	MberVO mberVO = new MberVO();
    	    mberVO.setMberCd(sessionVO.getMberCd());
    	    mberVO = mberService.SelectMberView(mberVO);
    	    model.addAttribute("mberInfo", mberVO);
    	    
			if(mberVO.getMainPrduct() != null){
				String str1 = mberVO.getMainPrduct();
				str1 = str1.replaceAll("\n","<br/>");
				model.addAttribute("MainPrduct",str1);
			}
			if(mberVO.getMainPrductEng() != null){
				String str2 = mberVO.getMainPrductEng();
				str2 = str2.replaceAll("\n","<br/>");
				model.addAttribute("MainPrductEng",str2);
			}
			if(mberVO.getAddPrduct() != null){
				String str3 = mberVO.getAddPrduct();
				str3 = str3.replaceAll("\n","<br/>");
				model.addAttribute("AddPrduct",str3);
			}
			if(mberVO.getAddPrductEng() != null){
				String str4 = mberVO.getAddPrductEng();
				str4 = str4.replaceAll("\n","<br/>");
				model.addAttribute("AddPrductEng",str4);
			}
			if(mberVO.getPatentCrtfc() != null){
				String str5 = mberVO.getPatentCrtfc();
				str5 = str5.replaceAll("\n","<br/>");
				model.addAttribute("PatentCrtfc",str5);
			}
			if(mberVO.getPatentCrtfcEng() != null){
				String str6 = mberVO.getPatentCrtfcEng();
				str6 = str6.replaceAll("\n","<br/>");
				model.addAttribute("PatentCrtfcEng",str6);
			}
			if(mberVO.getMainBcnc() != null){
				String str7 = mberVO.getMainBcnc();
				str7 = str7.replaceAll("\n","<br/>");
				model.addAttribute("MainBcnc",str7);
			}
			if(mberVO.getMainBcncEng() != null){
				String str8 = mberVO.getMainBcncEng();
				str8 = str8.replaceAll("\n","<br/>");
				model.addAttribute("MainBcncEng",str8);
			}
    	    
			if(showVO.getGubun().equals("0")){
				ShowVO showVO1;
				showVO1 = reqCompService.SelectExbiCompReq(showVO);
				model.addAttribute("ExbiCompReqInfo", showVO1);
				model.addAttribute("ViewGb", "0");
				
				if(showVO1.getMfrcDspyPrduct() != null){
					String str1 = showVO1.getMfrcDspyPrduct();
					str1 = str1.replaceAll("\n","<br/>");
					model.addAttribute("MfrcDspyPrduct",str1);
				}
			}else{
				ShowVO showVO2;
				showVO2 = reqCompService.SelectCnsltCompReq(showVO);
				model.addAttribute("CnsltCompReqInfo", showVO2);
				model.addAttribute("ViewGb", "1"); 
			}
        }else{
			 model.addAttribute("msg","로그인이 필요합니다.");
			 model.addAttribute("url","/komea/login.do");
			 return "redirect";
        }
		
		model.addAttribute("mnCd", "mn04");
		model.addAttribute("mnCdS", "mn0506");
		model.addAttribute("mnNm", "사업참여관리");
	       
		return "komea/show/mn05/reqBizFormView";
	}
	
	/**
	 * 전시상담포털 > MyDesk > 사업참여관리 > 신청서수정 <전시행사>
	 * @param model
	 * @return "companyView"
	 * @exception Exception
	 */
	@RequestMapping(value = "/show/ReqBizExbiEdit.do")
	public String ReqBizExbiEdit(@ModelAttribute("show") ShowVO showVO, ModelMap model, HttpServletRequest request) throws Exception {
		
		MberVO sessionVO = (MberVO)request.getSession().getAttribute("loginInfo");
        if(sessionVO != null){
        	MberVO mberVO = new MberVO();
    	    mberVO.setMberCd(sessionVO.getMberCd());
    	    mberVO = mberService.SelectMberView(mberVO);
    	    model.addAttribute("mberInfo", mberVO);
    	    
			showVO = reqCompService.SelectExbiCompReq(showVO);
			model.addAttribute("show", showVO);
        }else{
			 model.addAttribute("msg","로그인이 필요합니다.");
			 model.addAttribute("url","/komea/login.do");
			 return "redirect";
        }
		
		model.addAttribute("mnCd", "mn04");
		model.addAttribute("mnCdS", "mn0506");
		model.addAttribute("mnNm", "사업참여관리");
	       
		return "komea/show/mn02/displayEdit";
	}	
	
	/**
	 * 전시상담포털 > MyDesk > 사업참여관리 > 신청서수정 <상담행사>
	 * @param model
	 * @return "companyView"
	 * @exception Exception
	 */
	@RequestMapping(value = "/show/ReqBizCnsltEdit.do")
	public String ReqBizCnsltEdit(@ModelAttribute("show") ShowVO showVO, ModelMap model, HttpServletRequest request) throws Exception {

		MberVO sessionVO = (MberVO)request.getSession().getAttribute("loginInfo");
        if(sessionVO != null){
        	MberVO mberVO = new MberVO();
    	    mberVO.setMberCd(sessionVO.getMberCd());
    	    mberVO = mberService.SelectMberView(mberVO);
    	    model.addAttribute("mberInfo", mberVO);

			//바이어목록 가져오기
			ShowVO showVO1 = showVO;
			showVO1.setCnsltexhbCd(showVO.getCode());
			List<ShowVO> resultList = displayService.SelectBuyerList1(showVO1);
			model.addAttribute("buyerList", resultList);
    	    
			showVO = reqCompService.SelectCnsltCompReq(showVO);
			model.addAttribute("show", showVO);
        }else{
			 model.addAttribute("msg","로그인이 필요합니다.");
			 model.addAttribute("url","/komea/login.do");
			 return "redirect";
        }
		
		model.addAttribute("mnCd", "mn04");
		model.addAttribute("mnCdS", "mn0506");
		model.addAttribute("mnNm", "사업참여관리");
	       
		return "komea/show/mn03/consultEdit";
	}	
	/**
	 * 전시상담포털 > MyDesk > 사업참여관리 > 신청서조회(상세)
	 * @param model
	 * @return "companyView"
	 * @exception Exception
	 */
	@RequestMapping(value = "/show/ReqBizFormEdit.do")
	public String ReqBizFormEdit(@ModelAttribute("show") ShowVO showVO, ModelMap model) throws Exception {

		if(showVO.getGubun().equals("0")){
			ShowVO showVO1;
			showVO1 = reqCompService.SelectExbiCompReq(showVO);
			model.addAttribute("ExbiCompReqInfo", showVO1);
			model.addAttribute("ViewGb", "0");
			
			if(showVO1.getMainPrduct() != null){
				String str1 = showVO1.getMainPrduct();
				str1 = str1.replaceAll("\n","<br/>");
				model.addAttribute("MainPrduct",str1);
			}
			if(showVO1.getMainPrductEng() != null){
				String str2 = showVO1.getMainPrductEng();
				str2 = str2.replaceAll("\n","<br/>");
				model.addAttribute("MainPrductEng",str2);
			}
			if(showVO1.getAddPrduct() != null){
				String str3 = showVO1.getAddPrduct();
				str3 = str3.replaceAll("\n","<br/>");
				model.addAttribute("AddPrduct",str3);
			}
			if(showVO1.getAddPrductEng() != null){
				String str4 = showVO1.getAddPrductEng();
				str4 = str4.replaceAll("\n","<br/>");
				model.addAttribute("AddPrductEng",str4);
			}
			if(showVO1.getPatentCrtfc() != null){
				String str5 = showVO1.getPatentCrtfc();
				str5 = str5.replaceAll("\n","<br/>");
				model.addAttribute("PatentCrtfc",str5);
			}
			if(showVO1.getPatentCrtfcEng() != null){
				String str6 = showVO1.getPatentCrtfcEng();
				str6 = str6.replaceAll("\n","<br/>");
				model.addAttribute("PatentCrtfcEng",str6);
			}
			if(showVO1.getMainBcnc() != null){
				String str7 = showVO1.getMainBcnc();
				str7 = str7.replaceAll("\n","<br/>");
				model.addAttribute("MainBcnc",str7);
			}
			if(showVO1.getMainBcncEng() != null){
				String str8 = showVO1.getMainBcncEng();
				str8 = str8.replaceAll("\n","<br/>");
				model.addAttribute("MainBcncEng",str8);
			}
		}else{
			ShowVO showVO2;
			showVO2 = reqCompService.SelectCnsltCompReq(showVO);
			model.addAttribute("CnsltCompReqInfo", showVO2);
			model.addAttribute("ViewGb", "1"); 
			
			if(showVO2.getMfrcDspyPrduct() != null){
				String str1 = showVO2.getMfrcDspyPrduct();
				str1 = str1.replaceAll("\n","<br/>");
				model.addAttribute("MfrcDspyPrduct",str1);
			}
		}
		
		model.addAttribute("mnCd", "mn04");
		model.addAttribute("mnCdS", "mn0506");
		model.addAttribute("mnNm", "사업참여관리");
	       
		return "komea/show/mn05/reqBizFormEdit";
	}
	
	/**
	 * 	기본정보 업데이트
	 */
	@SuppressWarnings("finally")
	@RequestMapping(value = "/show/UpdateReqBizExbiInfo.do")
	public String UpdateReqBizExbiInfo(@ModelAttribute("show") ShowVO showVO, BindingResult bindingResult, ModelMap model, HttpServletRequest request) throws Exception {
		try{
			reqCompService.UpdateReqBizExbiInfo(showVO, request);
		}catch(Exception e){
			log.debug("UpdateReqBizExbiInfo Exception : "+ e.getMessage());
			model.addAttribute("msg", "수정에 실패하였습니다.");
			model.addAttribute("url", "/show/ReqBizList.do");
			return "redirect";
		}
		return "redirect:/show/ReqBizList.do";
	}
	
	/**
	 * 	기본정보 업데이트
	 */
	@SuppressWarnings("finally")
	@RequestMapping(value = "/show/UpdateReqBizCnsltInfo.do")
	public String UpdateReqBizCnsltInfo(@ModelAttribute("show") ShowVO showVO, BindingResult bindingResult, ModelMap model, HttpServletRequest request) throws Exception {
		try{
			reqCompService.UpdateReqBizCnsltInfo(showVO, request);
		}catch(Exception e){
			log.debug("UpdateReqBizCnsltInfo Exception : "+ e.getMessage());
			model.addAttribute("msg", "수정에 실패하였습니다.");
			model.addAttribute("url", "/show/ReqBizList.do");
			return "redirect";
		}
		return "redirect:/show/ReqBizList.do";
	}
	
	/**
	 * 전시상담포털 > MyDesk > 사업참여관리 > 사업결과
	 * @param model
	 * @return "companyView"
	 * @exception Exception
	 */
	@RequestMapping(value = "/show/ReqBizResultView.do")
	public String ReqBizResultView(@ModelAttribute("show") ShowVO showVO, ModelMap model) throws Exception {
		
		showVO = reqCompService.SelectCnsltResearchResult(showVO);
 	   	model.addAttribute("showVO", showVO);
 	   	
        model.addAttribute("mnCd", "mn04");
        model.addAttribute("mnCdS", "mn0506");
        model.addAttribute("mnNm", "사업참여관리");
 	   	
		return "komea/show/mn05/reqBizFormView";
	}
}
