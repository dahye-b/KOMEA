package egovframework.komeaweb.com.web;

import java.io.File;
import java.net.URLEncoder;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.servlet.View;

import egovframework.komeaweb.com.ShowBoardValidator;
import egovframework.komeaweb.com.service.BuyerService;
import egovframework.komeaweb.com.service.BuyerVO;
import egovframework.komeaweb.com.service.DisplayService;
import egovframework.komeaweb.com.service.MberService;
import egovframework.komeaweb.com.service.MberVO;
import egovframework.komeaweb.com.service.ReqCompService;
import egovframework.komeaweb.com.service.ShowVO;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class DisplayController {
	
	Logger log = Logger.getLogger(this.getClass());
	
    @Resource(name = "displayService")
    private DisplayService displayService;
    
	@Resource(name="mberService")
	private MberService mberService;
	
    @Resource(name = "buyerService")
    private BuyerService buyerService;
    
    @Resource(name = "reqCompService")
    private ReqCompService reqCompService;
	
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
    
    /**
     * KomeaBoard FilDownload
     */
    @RequestMapping(value="/komea/show/downloadFile.do")
    public void showDownloadFile(@RequestParam(value="fileCours", defaultValue="N") String fileCours,
    							 @RequestParam(value="fileNm", defaultValue="N") String fileNm, HttpServletResponse response) throws Exception{
    	
        String storedFileName = fileCours;
        String originalFileName = fileNm;
        
    	System.out.println("------------- /komea/show/downloadFile.do -------------");
    	System.out.println("fileCours : "+"/komeaweb/tomcat/webapps/ROOT"+storedFileName);
    	System.out.println("fileCours : "+fileCours);
    	System.out.println("fileNm : "+fileNm);
    	System.out.println("------------- /komea/show/downloadFile.do -------------");
        
        byte fileByte[] = FileUtils.readFileToByteArray(new File("/komeaweb/tomcat/webapps/ROOT"+storedFileName));
         
        response.setContentType("application/octet-stream");
        response.setContentLength(fileByte.length);
        response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(originalFileName,"UTF-8")+"\";");
        response.setHeader("Content-Transfer-Encoding", "binary");
        response.getOutputStream().write(fileByte);
         
        response.getOutputStream().flush();
        response.getOutputStream().close();
    }
    
	/**
	 * 전시상담포털 > 마린엑스포 > 지난행사보기
	 * @param model
	 * @return "workList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/show/WorkList.do")
	public String workList(@ModelAttribute("show") ShowVO showVO, ModelMap model) throws Exception {
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
	       
	       model.addAttribute("comboBox", displayService.YearComboList(showVO));
	       
	       int totCnt = displayService.SelectYearWorkListTotCnt(showVO);
	       paginationInfo.setTotalRecordCount(totCnt);
	   
	       model.addAttribute("paginationInfo", paginationInfo);
	       // 검색조건과 키워드로 부서목록조회
	       List<ShowVO> resultList = displayService.SelectYearWorkList(showVO);
	       model.addAttribute("resultList", resultList);

		  //model.addAttribute("ComYear",codService.YearComboList(""));
	       model.addAttribute("mnCd", "mn04");
	       model.addAttribute("mnCdS", "mn0101");
	       model.addAttribute("mnNm", "지난행사보기");

		return "komea/show/mn01/workList";
	}

	/**
	 * 전시상담포털 > 마린엑스포 > 지난행사보기 > 상세정보
	 * @param model
	 * @return "workView"
	 * @exception Exception
	 */
	@RequestMapping(value = "/show/WorkView.do")
	public String workView(@ModelAttribute("show") ShowVO showVO, ModelMap model) throws Exception {
		
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
	       model.addAttribute("mnCdS", "mn0101");
	       model.addAttribute("mnNm", "지난행사보기");
        
		return "komea/show/mn01/workView";
	}
	
	/**
	 * 전시상담포털 > 마린엑스포 > 지난행사보기
	 * @param model
	 * @return "workList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/show/ShowList.do")
	public String ShowList(@ModelAttribute("show") ShowVO showVO, ModelMap model) throws Exception {
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
	       
	       model.addAttribute("comboBox", displayService.YearComboList(showVO));
	       
	       int totCnt = displayService.SelectShowWorkListTotCnt(showVO);
	       paginationInfo.setTotalRecordCount(totCnt);
	   
	       model.addAttribute("paginationInfo", paginationInfo);
	       // 검색조건과 키워드로 부서목록조회
	       List<ShowVO> resultList = displayService.SelectShowWorkList(showVO);
	       model.addAttribute("resultList", resultList);

		  //model.addAttribute("ComYear",codService.YearComboList(""));
	       model.addAttribute("mnCd", "mn04");
	       model.addAttribute("mnCdS", "mn0104");
	       model.addAttribute("mnNm", "행사보기");

		return "komea/show/mn01/showList";
	}

	/**
	 * 전시상담포털 > 마린엑스포 > 지난행사보기 > 상세정보
	 * @param model
	 * @return "workView"
	 * @exception Exception
	 */
	@RequestMapping(value = "/show/ShowView.do")
	public String ShowView(@ModelAttribute("show") ShowVO showVO, ModelMap model) throws Exception {
		
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
	       model.addAttribute("mnCdS", "mn0104");
	       model.addAttribute("mnNm", "행사보기");
        
		return "komea/show/mn01/showView";
	}

	/**
	 * 전시상담포털 > 마린엑스포 > 해외 바이어 소개
	 * @param model
	 * @return "buyerList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/show/BuyerList.do")
	public String buyerList(@ModelAttribute("show") ShowVO showVO, ModelMap model) throws Exception {

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
	       
	       int totCnt = displayService.SelectBuyerListTotCnt(showVO);
	       paginationInfo.setTotalRecordCount(totCnt);
	   
	       model.addAttribute("paginationInfo", paginationInfo);
	       
	       // 검색조건과 키워드로 부서목록조회
	       List<ShowVO> resultList = displayService.SelectBuyerList(showVO);
	       model.addAttribute("resultList", resultList);

		   //model.addAttribute("ComYear",codService.CodeBookList(""));
	       model.addAttribute("mnCd", "mn04");
	       model.addAttribute("mnCdS", "mn0102");
	       model.addAttribute("mnNm", "해외 바이어 소개");
	       
		return "komea/show/mn01/buyerList";
	}

	/**
	 * 전시상담포털 > 마린엑스포 > 해외 바이어 소개 > 상세정보
	 * @param model
	 * @return "buyerView"
	 * @exception Exception
	 */
	@RequestMapping(value = "/show/BuyerView.do")
	public String buyerView(@ModelAttribute("show") ShowVO showVO, HttpServletRequest request, ModelMap model) throws Exception {

		showVO = displayService.SelectBuyerInfo1(showVO);
	   model.addAttribute("BuyerInfo", showVO);
	   
       List<ShowVO> ResultAccList = displayService.SelectBuyerResultAccList(showVO);
       model.addAttribute("ResultAccList", ResultAccList);
       
       ShowVO ResultAccSum = displayService.SelectBuyerResultAccSum(showVO);
       model.addAttribute("ResultAccSum", ResultAccSum);
       
       model.addAttribute("mnCd", "mn04");
       model.addAttribute("mnCdS", "mn0102");
       model.addAttribute("mnNm", "해외 바이어 소개");

		return "komea/show/mn01/buyerView";
	}
	
	/**
	 * 바이어리스트 엑셀저장
	 * @param model
	 * @exception Exception
	 */
	@RequestMapping(value = "/show/BuyerListExcel.do")
	public String BuyerListExcel(@ModelAttribute("show") ShowVO showVO, ModelMap model) throws Exception {
      
       List<ShowVO> resultList = displayService.SelectBuyerList1(showVO);
       model.addAttribute("buyerList", resultList);
		
		return "komea/form/buyerListExcel";
	}
	
	/**
	 * 바이어 리스트 조회
	 */
	@RequestMapping(value="/show/SelectBuyerInfoList.do")
	public View SelectBuyerInfoList(String cnsltexhbCd, ModelMap model) throws Exception{
	    ShowVO showVO = new ShowVO();
	    showVO.setCnsltexhbCd(cnsltexhbCd);
		List<ShowVO> result = displayService.SelectBuyerList1(showVO);
		model.addAttribute("data", result);
		model.addAttribute("totalCnt", result.size());
	     
	    return jsonview;
	}
	
	/**
	 * 바이어 상세정보 조회
	 */
	@RequestMapping(value="/show/SelectBuyerInfo.do")
	public View SelectBuyerInfo(String buyerCd, ModelMap model) throws Exception{
	    ShowVO showVO = new ShowVO();
	    showVO.setBuyerCd(buyerCd);
	    showVO = displayService.SelectBuyerInfo1(showVO);
	    model.addAttribute("data", showVO);
	     
	    return jsonview;
	}
	
	/**
	 * 참가업체 리스트 조회
	 */
	@RequestMapping(value="/show/SelectExbiAndCnsltCompanyList.do")
	public View SelectExbiAndCnsltCompanyList(String param, String gubun, String eventCd, ModelMap model) throws Exception{
		ShowVO showVO = new ShowVO();
		List<ShowVO> result = null;
		showVO.setGubun(gubun);
		showVO.setEventCd(eventCd);
		showVO.setSlctnYn("Y");
		
		if(gubun.equals("0")){
			result = displayService.SelectExbiWinCompanyList(showVO);
		}else{
			result = displayService.SelectCnsltexhbWinCompanyList(showVO);
		}
	
		model.addAttribute("data", result);
		model.addAttribute("totalCnt", result.size());
	 
	return jsonview;
	}
	
	/**
	 * 일정확인 리스트 조회
	 */
	@RequestMapping(value="/show/SelectExbiAndCnsltResultFileList.do")
	public View SelectExbiAndCnsltResultFileList(String eventGb, String eventCd, ModelMap model) throws Exception{
		ShowVO showVO = new ShowVO();
		showVO.setEventGb(eventGb);
		showVO.setEventCd(eventCd);
		
		List<ShowVO> result = displayService.SelectExbiOrCnsltBiddingResultList(showVO);
		model.addAttribute("data", result);
		model.addAttribute("totalCnt", result.size());
	 
	return jsonview;
	}

	/**
	 * 전시상담포털 > 마린엑스포 > 회원사 목록
	 * @param model
	 * @return "companyList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/show/CompanyList.do")
	public String companyList(@ModelAttribute("show") ShowVO showVO, ModelMap model) throws Exception {

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
	       
	       model.addAttribute("comboBox", displayService.LocComboList(showVO));
	       
	       int totCnt = displayService.SelectCompanyListTotCnt(showVO);
	       paginationInfo.setTotalRecordCount(totCnt);
	   
	       model.addAttribute("paginationInfo", paginationInfo);
	       
	       // 검색조건과 키워드로 부서목록조회
	       List<ShowVO> resultList = displayService.SelectCompanyList(showVO);
	       model.addAttribute("resultList", resultList);
	       
	       model.addAttribute("mnCd", "mn04");
	       model.addAttribute("mnCdS", "mn0103");
	       model.addAttribute("mnNm", "회원사목록");

		return "komea/show/mn01/companyList";
	}

	/**
	 * 전시상담포털 > 마린엑스포 > 회원사 목록 > 상세정보
	 * @param model
	 * @return "companyView"
	 * @exception Exception
	 */
	@RequestMapping(value = "/show/CompanyView.do")
	public String companyView(@ModelAttribute("mber") MberVO mberVO, ModelMap model) throws Exception {
		
		mberVO = mberService.SelectMberView(mberVO);
 	   	model.addAttribute("mberVO", mberVO);

 	    ShowVO showVO = new ShowVO();
 	    showVO.setMberCd(mberVO.getMberCd());
		List<ShowVO> ResultAccList = displayService.SelectCompResultAccList(showVO);
	    model.addAttribute("ResultAccList", ResultAccList);
	       
	    ShowVO ResultAccSum = displayService.SelectCompResultAccSum(showVO);
	    model.addAttribute("ResultAccSum", ResultAccSum);
	    
	    model.addAttribute("mnCd", "mn04");
	    model.addAttribute("mnCdS", "mn0103");
	    model.addAttribute("mnNm", "회원사목록");
        
		return "komea/show/mn01/companyView";
	}

	/**
	 * 전시상담포털 > 전시행사 목록
	 * @param model
	 * @return "DisplayList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/show/DisplayList.do")
	public String DisplayList(@ModelAttribute("show") ShowVO showVO, ModelMap model) throws Exception {
		
	       // currentPageNo : 현재 페이지 번호
	       // recordCountPerPage : 한 페이지당 게시되는 게시물 건 수 (=pageUnit)
	       // pageSize : 페이지 리스트에 게시되는 페이지 건수
	       // totalRecordCount : 전체 게시물 건 수
	       // pageUnit과 pageSize는 context-properties.xml에서 설정

		   showVO.setPageUnit(6);
		   showVO.setPageSize(propertiesService.getInt("pageSize"));
	       
	       PaginationInfo paginationInfo = new PaginationInfo();
	       
	       paginationInfo.setCurrentPageNo(showVO.getPageIndex());
	       paginationInfo.setRecordCountPerPage(showVO.getPageUnit());
	       paginationInfo.setPageSize(showVO.getPageSize());
	       
	       showVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
	       showVO.setLastIndex(paginationInfo.getLastRecordIndex());
	       showVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
	       
	       int totCnt = displayService.SelectExbiListTotCnt(showVO);
	       paginationInfo.setTotalRecordCount(totCnt);
	   
	       model.addAttribute("paginationInfo", paginationInfo);
	       
	       // 검색조건과 키워드로 부서목록조회
	       List<ShowVO> resultList = displayService.SelectExbiList(showVO);
	       model.addAttribute("resultList", resultList);
	       
		   model.addAttribute("mnCd", "mn04");
		   model.addAttribute("mnCdS", "mn0201");
		   model.addAttribute("mnNm", "전시행사");
		
		return "komea/show/mn02/displayList";
	}

	/**
	 * 전시상담포털 > 전시행사 > 상세정보
	 * @param model
	 * @return "DisplayView"
	 * @exception Exception
	 */
	@RequestMapping(value = "/show/DisplayView.do")
	public String DisplayView(@ModelAttribute("show") ShowVO showVO, ModelMap model) throws Exception {
		
		showVO = displayService.ExbiRegistInfo(showVO);
		model.addAttribute("ExbiRegistInfo", showVO);
		model.addAttribute("code", showVO.getExbiCd());
		model.addAttribute("ViewGb", "0");
	
		if(showVO.getPartcptSumry() != null){
			String str1 = showVO.getPartcptSumry();
			str1 = str1.replaceAll("\n","<br/>");
			model.addAttribute("ExbiPartcptSumry",str1);
		}

		if(showVO.getPartcptReqstMth() != null){
			String str2 = showVO.getPartcptReqstMth();
			str2 = str2.replaceAll("\n","<br/>");
			model.addAttribute("ExbiPartcptReqstMth",str2);
		}

		if(showVO.getSportCn() != null){
			String str3 = showVO.getSportCn();
			str3 = str3.replaceAll("\n","<br/>");
			model.addAttribute("ExbiSportCn",str3);
		}
		
		if(showVO.getNoticeItems() != null){
			String str4 = showVO.getNoticeItems();
			str4 = str4.replaceAll("\n","<br/>");
			model.addAttribute("ExbiNoticeItems",str4);
		}
		
		if(showVO.getMainSkll() != null){
			String str5 = showVO.getMainSkll();
			str5 = str5.replaceAll("\n","<br/>");
			model.addAttribute("ExbiMainSkll",str5);
		}
		
		if(showVO.getPartcptInclsMatter() != null){
			String str6 = showVO.getPartcptInclsMatter();
			str6 = str6.replaceAll("\n","<br/>");
			model.addAttribute("ExbiPartcptInclsMatter",str6);
		}
		
		if(showVO.getEtcResult() != null){
			String str7 = showVO.getEtcResult();
			str7 = str7.replaceAll("\n","<br/>");
			model.addAttribute("ExbiEtcResult",str7);
		}
		
		model.addAttribute("mnCd", "mn04");
		model.addAttribute("mnCdS", "mn0201");
		model.addAttribute("mnNm", "전시행사");
		
		return "komea/show/mn02/displayView";
	}
	
	/**
	 * 전시상담포털 > 전시행사 > 신청하기
	 * @param model
	 * @return "DisplayView"
	 * @exception Exception
	 */
	@RequestMapping(value = "/show/DisplayWrite.do")
	public String DisplayWrite(@ModelAttribute("show") ShowVO showVO, HttpServletRequest request, ModelMap model) throws Exception {

		System.out.println("===============");
		System.out.println("code : "+showVO.getCode());
		System.out.println("===============");
		
		model.addAttribute("code", showVO.getCode());
		model.addAttribute("insttMberCd", showVO.getInsttMberCd());
		
		MberVO sessionVO = (MberVO)request.getSession().getAttribute("loginInfo");
		/*
		showVO.setEntrprsMberCd(sessionVO.getMberCd());
		showVO = displayService.SelectExbiCompReq(showVO);
		model.addAttribute("ExbiCompReq", showVO);
		
		if(showVO != null){
			if(showVO.getMfrcDspyPrduct() != null){
				String str1 = showVO.getMfrcDspyPrduct();
				model.addAttribute("MfrcDspyPrduct",str1);
			}
		}
		*/
		showVO.setId(sessionVO.getId());
		showVO = displayService.SelectLoginUser(showVO);
		model.addAttribute("LoginUser", showVO);
		
		model.addAttribute("mnCd", "mn04");
		model.addAttribute("mnCdS", "mn0201");
		model.addAttribute("mnNm", "전시행사");

		return "komea/show/mn02/displayWrite";
	}
	
	/**
	 * Insert
	 * @param model
	 * @return "/show/InsertRequestExbiInfo.do"
	 * @exception Exception
	 */
	@SuppressWarnings("finally")
	@RequestMapping(value = "/show/InsertRequestExbiInfo.do")
	public String InsertRequestExbiInfo(@ModelAttribute("show") ShowVO showVO, ModelMap model, HttpServletRequest request) throws Exception {
		try{
			displayService.InsertRequestExbiInfo(showVO, request);
		}catch(Exception e){
			log.debug("InsertRequestExbiInfo Exception : "+ e.getMessage());
			model.addAttribute("msg", "입력에 실패하였습니다.");
			model.addAttribute("url", "/show/DisplayList.do");
			return "redirect";
		}
		return "redirect:/show/DisplayList.do";
	}
	
	//@@@@
	@RequestMapping(value="/show/DeleteExbiReqstFileInfo.do")
	public View DeleteExbiReqstFileInfo(@ModelAttribute("show") ShowVO showVO,  ModelMap model) throws Exception{
		try{
			displayService.DeleteExbiReqstFileInfo(showVO);
			model.addAttribute("msg", "OK");
		}catch(Exception ex){
			model.addAttribute("msg", "ERROR");
		}

	return jsonview;
	}

	/**
	 * 전시상담포털 > 상담행사 목록
	 * @param model
	 * @return "ConcultList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/show/ConsultList.do")
	public String ConsultList(@ModelAttribute("show") ShowVO showVO, ModelMap model) throws Exception {
		
	       // currentPageNo : 현재 페이지 번호
	       // recordCountPerPage : 한 페이지당 게시되는 게시물 건 수 (=pageUnit)
	       // pageSize : 페이지 리스트에 게시되는 페이지 건수
	       // totalRecordCount : 전체 게시물 건 수
	       // pageUnit과 pageSize는 context-properties.xml에서 설정

		   showVO.setPageUnit(6);
		   showVO.setPageSize(propertiesService.getInt("pageSize"));
	       
	       PaginationInfo paginationInfo = new PaginationInfo();
	       
	       paginationInfo.setCurrentPageNo(showVO.getPageIndex());
	       paginationInfo.setRecordCountPerPage(showVO.getPageUnit());
	       paginationInfo.setPageSize(showVO.getPageSize());
	       
	       showVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
	       showVO.setLastIndex(paginationInfo.getLastRecordIndex());
	       showVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
	       
	       int totCnt = displayService.SelectCnsltListTotCnt(showVO);
	       paginationInfo.setTotalRecordCount(totCnt);
	   
	       model.addAttribute("paginationInfo", paginationInfo);
	       
	       // 검색조건과 키워드로 부서목록조회
	       List<ShowVO> resultList = displayService.SelectCnsltList(showVO);
	       model.addAttribute("resultList", resultList);
	       
	       model.addAttribute("mnCd", "mn04");
	       model.addAttribute("mnCdS", "mn0301");
	       model.addAttribute("mnNm", "상담행사");
		
		return "komea/show/mn03/consultList";
	}

	/**
	 * 전시상담포털 > 상담행사 > 상세정보
	 * @param model
	 * @return "ConcultView"
	 * @exception Exception
	 */
	@RequestMapping(value = "/show/ConsultView.do")
	public String ConsultView(@ModelAttribute("show") ShowVO showVO, ModelMap model) throws Exception {

		showVO = displayService.CnsltexhbRegistInfo(showVO);
		model.addAttribute("CnsltexhbRegistInfo", showVO);
		model.addAttribute("code", showVO.getCnsltexhbCd()); 
		model.addAttribute("ViewGb", "1");

		if(showVO.getMainCn() != null){
			String str1 = showVO.getMainCn();
			str1 = str1.replaceAll("\n","<br/>");
			model.addAttribute("CnsltMainCn",str1);
		}

		if(showVO.getSportCn() != null){
			String str2 = showVO.getSportCn();
			str2 = str2.replaceAll("\n","<br/>");
			model.addAttribute("CnsltSportCn",str2);
		}

		List<ShowVO> resultList = displayService.SelectBuyerList1(showVO);
		model.addAttribute("buyerList", resultList);
		
	    model.addAttribute("mnCd", "mn04");
	    model.addAttribute("mnCdS", "mn0301");
	    model.addAttribute("mnNm", "상담행사");
		
		return "komea/show/mn03/consultView";
	}
	
	/**
	 * 전시상담포털 > 전시행사 > 신청하기
	 * @param model
	 * @return "DisplayView"
	 * @exception Exception
	 */
	@RequestMapping(value = "/show/ConsultWrite.do")
	public String ConsultWrite(@ModelAttribute("show") ShowVO showVO, ModelMap model, HttpServletRequest request) throws Exception {

		System.out.println("===============");
		System.out.println("code : "+showVO.getCode());
		System.out.println("===============");
		model.addAttribute("code", showVO.getCode());
		model.addAttribute("insttMberCd", showVO.getInsttMberCd());
		
		ShowVO showVO1 = showVO;
		showVO1.setCnsltexhbCd(showVO.getCode());
		List<ShowVO> resultList = displayService.SelectBuyerList1(showVO1);
	    model.addAttribute("buyerList", resultList);
		
		MberVO sessionVO = (MberVO)request.getSession().getAttribute("loginInfo");
		
		showVO.setEntrprsMberCd(sessionVO.getMberCd());
		showVO = displayService.SelectCnsltCompReq(showVO);
		model.addAttribute("CnsltCompReq", showVO);
		
		showVO.setId(sessionVO.getId());
		showVO = displayService.SelectLoginUser(showVO);
		model.addAttribute("LoginUser", showVO);
		
		if(showVO.getMainPrduct() != null){
			String str1 = showVO.getMainPrduct();
			model.addAttribute("MainPrduct",str1);
		}

		if(showVO.getMainPrductEng() != null){
			String str2 = showVO.getMainPrductEng();
			model.addAttribute("MainPrductEng",str2);
		}
		
		if(showVO.getAddPrduct() != null){
			String str3 = showVO.getAddPrduct();
			model.addAttribute("AddPrduct",str3);
		}
		
		if(showVO.getAddPrductEng() != null){
			String str4 = showVO.getAddPrductEng();
			model.addAttribute("AddPrductEng",str4);
		}

		if(showVO.getPatentCrtfc() != null){
			String str5 = showVO.getPatentCrtfc();
			model.addAttribute("PatentCrtfc",str5);
		}
		
		if(showVO.getPatentCrtfcEng() != null){
			String str6 = showVO.getPatentCrtfcEng();
			model.addAttribute("PatentCrtfcEng",str6);
		}

		if(showVO.getMainBcnc() != null){
			String str7 = showVO.getMainBcnc();
			model.addAttribute("MainBcnc",str7);
		}
		
		if(showVO.getMainBcncEng() != null){
			String str8 = showVO.getMainBcncEng();
			model.addAttribute("MainBcncEng",str8);
		}
		
	    model.addAttribute("mnCd", "mn04");
	    model.addAttribute("mnCdS", "mn0301");
	    model.addAttribute("mnNm", "상담행사");
		
		return "komea/show/mn03/consultWrite";
	}
	
	/**
	 * Insert
	 * @param model
	 * @return "/show/InsertRequestCnsltInfo.do"
	 * @exception Exception
	 */
	@SuppressWarnings("finally")
	@RequestMapping(value = "/show/InsertRequestCnsltInfo.do")
	public String InsertRequestCnsltInfo(@ModelAttribute("show") ShowVO showVO, NativeWebRequest webRequest, ModelMap model, HttpServletRequest request) throws Exception {
		try{
			displayService.InsertRequestCnsltInfo(showVO, webRequest, request);
		}catch(Exception e){
			log.debug("InsertRequestCnsltInfo Exception : "+ e.getMessage());
			model.addAttribute("msg", "입력에 실패하였습니다.");
			model.addAttribute("url", "/show/ConsultList.do");
			return "redirect";
		}
		return "redirect:/show/ConsultList.do";
	}
	
	//@@@@
	@RequestMapping(value="/show/DeleteCnsltexhbReqstFileInfo.do")
	public View DeleteCnsltexhbReqstFileInfo(@ModelAttribute("show") ShowVO showVO,  ModelMap model) throws Exception{
		try{
			displayService.DeleteCnsltexhbReqstFileInfo(showVO);
			model.addAttribute("msg", "OK");
		}catch(Exception ex){
			model.addAttribute("msg", "ERROR");
		}

	return jsonview;
	}

    /**
     * 전시, 상담 신청하기 시 데이터 세팅
     */
    @RequestMapping(value="/show/isLoginAndShowDataSet.do")
    public View isLoginAndShowDataSet(String gubun, String code, HttpServletRequest request, ModelMap model) throws Exception{

        MberVO sessionVO = (MberVO)request.getSession().getAttribute("loginInfo");
        ShowVO showVO = new ShowVO();

        if(sessionVO == null){
            model.addAttribute("isLogin", Boolean.valueOf(false));
        }else{
            model.addAttribute("isLogin", Boolean.valueOf(true));
            model.addAttribute("ssbyp", sessionVO.getSsbyp());
            showVO.setCode(code);
			showVO.setEntrprsMberCd(sessionVO.getMberCd());
			if (gubun.equals("0")){
				ShowVO ExbiPreReguestInfo;
				ExbiPreReguestInfo = displayService.SelectExbiPreReguestInfo(showVO);
				if(ExbiPreReguestInfo == null){
		            model.addAttribute("preReq", Boolean.valueOf(false));
				}else{
		            model.addAttribute("preReq", Boolean.valueOf(true));
				}
			}else if (gubun.equals("1")){
				ShowVO CnsltPreReguestInfo;
				CnsltPreReguestInfo = displayService.SelectCnsltPreReguestInfo(showVO);
				if(CnsltPreReguestInfo == null){
		            model.addAttribute("preReq", Boolean.valueOf(false));
				}else{
		            model.addAttribute("preReq", Boolean.valueOf(true));
				}
			}
		}

    return jsonview;
    }

    /**
     * 정보센터 신청하기 시 데이터 세팅
	 BBS_TY:2, REGIST_NO: registNo, BBSCTT_NO:bbscttNo, EVENT_CD: eventCd, EVENT_GB: eventGb
     */
    @RequestMapping(value="/show/isLoginAndBbsDataSet.do")
    public View isLoginAndBbsDataSet(String bbsTy, String registNo, int bbscttNo, String eventCd, String eventGb, HttpServletRequest request, ModelMap model) throws Exception{
    	
        MberVO sessionVO = (MberVO)request.getSession().getAttribute("loginInfo");
        ShowVO showVO = new ShowVO();

        if(sessionVO == null){
            model.addAttribute("isLogin", Boolean.valueOf(false));
        }else{
            model.addAttribute("isLogin", Boolean.valueOf(true));
            model.addAttribute("ssbyp", sessionVO.getSsbyp());
            showVO.setRegistNo(registNo);
            showVO.setBbscttNo(bbscttNo);
			showVO.setEntrprsMberCd(sessionVO.getMberCd());
			if (bbsTy.equals("2")){
				ShowVO BiddingPreReguestInfo;
				BiddingPreReguestInfo = displayService.SelectBiddingPreReguestInfo(showVO);
				if(BiddingPreReguestInfo == null){
		            model.addAttribute("preReq", Boolean.valueOf(false));
				}else{
		            model.addAttribute("preReq", Boolean.valueOf(true));
				}
			}else if (bbsTy.equals("6")){
				ShowVO WinnerPreReguestInfo;
				WinnerPreReguestInfo = displayService.SelectWinnerPreReguestInfo(showVO);
				if(WinnerPreReguestInfo == null){
		            model.addAttribute("preReq", Boolean.valueOf(false));
				}else{
		            model.addAttribute("preReq", Boolean.valueOf(true));
				}
			}
		}

    return jsonview;
    }
	
	/**
	 * 전시상담포털 > MyDesk > 기본정보관리
	 * @param model
	 * @return "InfoManage"
	 * @exception Exception
	 */
	@RequestMapping(value = "/show/InfoManage.do")
	public String InfoManage(@ModelAttribute("mber") MberVO mberVO, HttpServletRequest request, ModelMap model) throws Exception {
		
		MberVO sessionVO = (MberVO)request.getSession().getAttribute("loginInfo");
	       
	       if(sessionVO != null){
	    	   mberVO.setMberCd(sessionVO.getMberCd());
	    	   mberVO = mberService.SelectMberView(mberVO);
	    	   model.addAttribute("mberVO", mberVO);
	       }else{
				model.addAttribute("msg","로그인이 필요합니다.");
				model.addAttribute("url","/komea/login.do");
				return "redirect";
	       }
	       
	       model.addAttribute("mnCd", "mn04");
		   model.addAttribute("mnCdS", "mn0501");
		   model.addAttribute("mnNm", "기본정보관리");
		
		return "komea/show/mn05/InfoManage";
	}
	
	/**
	 * 	기본정보 업데이트
	 */
	@SuppressWarnings("finally")
	@RequestMapping(value = "/show/UpdateMber.do")
	public String mberUpdate(@ModelAttribute("mber") MberVO mberVO, BindingResult bindingResult, ModelMap model, HttpServletRequest request) throws Exception {
		try{
			mberService.UpdateMber(mberVO, request);
		}catch(Exception e){
			log.debug("UpdateMber Exception : "+ e.getMessage());
			model.addAttribute("msg", "수정에 실패하였습니다.");
			model.addAttribute("url", "/show/InfoManage.do");
			return "redirect";
		}
		return "redirect:/show/InfoManage.do";
	}

	/**
	 * 전시상담포털 > MyDesk > 지원사업관리
	 * @param model
	 * @return "SuppBizManage"
	 * @exception Exception
	 */
	@RequestMapping(value = "/show/SuppBizManage.do")
	public String SuppBizManage(@ModelAttribute("show") ShowVO showVO, 
			@RequestParam(value="gubun", required=false, defaultValue="0") String gubun, HttpServletRequest request, ModelMap model) throws Exception {
		
	       // currentPageNo : 현재 페이지 번호
	       // recordCountPerPage : 한 페이지당 게시되는 게시물 건 수 (=pageUnit)
	       // pageSize : 페이지 리스트에 게시되는 페이지 건수
	       // totalRecordCount : 전체 게시물 건 수
	       // pageUnit과 pageSize는 context-properties.xml에서 설정

		   showVO.setPageUnit(5);
		   showVO.setPageSize(propertiesService.getInt("pageSize"));
	       
	       PaginationInfo paginationInfo = new PaginationInfo();
	       
	       paginationInfo.setCurrentPageNo(showVO.getPageIndex());
	       paginationInfo.setRecordCountPerPage(showVO.getPageUnit());
	       paginationInfo.setPageSize(showVO.getPageSize());
	       
	       showVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
	       showVO.setLastIndex(paginationInfo.getLastRecordIndex());
	       showVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
	       model.addAttribute("progrsSttus", showVO.getProgrsSttus());
	       
	       MberVO sessionVO = (MberVO)request.getSession().getAttribute("loginInfo");
	       
	       if(sessionVO != null){
	    	   showVO.setInsttMberCd(sessionVO.getMberCd());
	    	   if(gubun.equals("0")){
	    		   model.addAttribute("comboBox", displayService.SelectPreCombo0(showVO));
	    	   }else{
	    		   model.addAttribute("comboBox", displayService.SelectPreCombo1(showVO));
	    	   }
				
		       showVO.setAuthYn((String) request.getSession().getAttribute("authYn"));
		       if(sessionVO.getSsbyp().equals("2")){
		    	   showVO.setMberCd(sessionVO.getMberCd());
		       }else{
		    	   showVO.setInsttMberCd(sessionVO.getMberCd());   
		       }
		       int totCnt = displayService.SelectExbiAndCnsltListTotCnt(showVO);
		       paginationInfo.setTotalRecordCount(totCnt);
		   
		       model.addAttribute("paginationInfo", paginationInfo);
		       
		       // 검색조건과 키워드로 부서목록조회
		       List<ShowVO> resultList = displayService.SelectExbiAndCnsltList(showVO);
		       model.addAttribute("resultList", resultList);

	       }else{
				model.addAttribute("msg","로그인이 필요합니다.");
				model.addAttribute("url","/komea/login.do");
				return "redirect";
	       }
	       
	       model.addAttribute("mnCd", "mn04");
		   model.addAttribute("mnCdS", "mn0503");
		   model.addAttribute("mnNm", "지원사업관리");
		
		return "komea/show/mn05/suppBizManage";
	}
	
	/**
	 * 전시상담포털 > MyDesk > 지원사업관리 > 진행사항 업데이트
	 */
	@SuppressWarnings("finally")
	@RequestMapping(value = "/show/UpdateProgressStatus.do")
	public String UpdateProgressStatus(@ModelAttribute("show") ShowVO showVO, BindingResult bindingResult, ModelMap model, HttpServletRequest request) throws Exception {
		try{
			displayService.UpdateProgressStatus(showVO);
		}catch(Exception e){
			log.debug("UpdateProgressStatus Exception : "+ e.getMessage());
			model.addAttribute("msg", "진행사항 수정에 실패하였습니다.");
			model.addAttribute("url", "/show/SuppBizManage.do");
			return "redirect";
		}
		return "redirect:/show/SuppBizManage.do";
	}

	/**
	 * 전시상담포털 > MyDesk > 지원사업관리 > 삭제
	 */
	@SuppressWarnings("finally")
	@RequestMapping(value = "/show/DeleteBusiness.do")
	public String DeleteBusiness(@ModelAttribute("show") ShowVO showVO, BindingResult bindingResult, ModelMap model, HttpServletRequest request) throws Exception {
		try{
			if(showVO.getGubun().equals("0")){
				displayService.DeleteExbiBusiness(showVO);
			}else{
				displayService.DeleteCnsltBusiness(showVO);
			}
		}catch(Exception e){
			log.debug("UpdateProgressStatus Exception : "+ e.getMessage());
			model.addAttribute("msg", "사업내용 삭제에 실패하였습니다.");
			model.addAttribute("url", "/show/SuppBizManage.do");
			return "redirect";
		}
		return "redirect:/show/SuppBizManage.do";
	}

	/**
	 * 전시상담포털 > MyDesk > 지원사업관리 > 상세조회
	 * @param model
	 * @return "SuppBizManageView"
	 * @exception Exception
	 */
	@RequestMapping(value = "/show/SuppBizManageView.do")
	public String SuppBizManageView(@ModelAttribute("show") ShowVO showVO, HttpServletRequest request, ModelMap model) throws Exception {
		
		System.out.println("@@@ : "+showVO.getGubun());
		System.out.println("@@@ : "+showVO.getCode());
		
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
		   model.addAttribute("mnCdS", "mn0503");
		   model.addAttribute("mnNm", "지원사업관리");

		return "komea/show/mn05/suppBizManageView";
	}
	
	@RequestMapping(value = "/show/suppBizManageExbiWrite.do")
	public String suppBizManageExbiWrite(@ModelAttribute("show") ShowVO showVO, BindingResult bindingResult, ModelMap model, HttpServletRequest request) throws Exception {

		model.addAttribute("comboBox", displayService.SelectPreCombo0(showVO));
		String preCode = "";
		
 	   if(showVO.getPreExbiCd() != null){
				preCode = showVO.getPreExbiCd();
				showVO.setCode(preCode);
				showVO = displayService.ExbiRegistInfoEdit(showVO);
				showVO.setPreExbiCd(preCode);
				model.addAttribute("show", showVO);

				if(showVO.getPartcptSumry() != null){
					model.addAttribute("ExbiPartcptSumry",showVO.getPartcptSumry());
				}

				if(showVO.getPartcptReqstMth() != null){
					model.addAttribute("ExbiPartcptReqstMth",showVO.getPartcptReqstMth());
				}

				if(showVO.getSportCn() != null){
					model.addAttribute("ExbiSportCn",showVO.getSportCn());
				}
				
				if(showVO.getNoticeItems() != null){
					model.addAttribute("ExbiNoticeItems",showVO.getNoticeItems());
				}
				
				if(showVO.getMainSkll() != null){
					model.addAttribute("ExbiMainSkll",showVO.getMainSkll());
				}
				
				if(showVO.getPartcptInclsMatter() != null){
					model.addAttribute("ExbiPartcptInclsMatter",showVO.getPartcptInclsMatter());
				}
				
				if(showVO.getEtcResult() != null){
					model.addAttribute("ExbiEtcResult",showVO.getEtcResult());
				}
	       }else{
	    	   ShowVO showVO1 = new ShowVO();
	    	   model.addAttribute("show", showVO1);
	       }
    	   
	       model.addAttribute("mnCd", "mn04");
		   model.addAttribute("mnCdS", "mn0503");
		   model.addAttribute("mnNm", "지원사업관리");
		
		return "komea/show/mn05/suppBizManageExbiWrite";
	}
	
	/**
	 * InsertSuppBizManageExbi
	 */
	@SuppressWarnings("finally")
	@RequestMapping(value = "/show/InsertSuppBizManageExbi.do")
	public String InsertSuppBizManageExbi(@ModelAttribute("show") ShowVO showVO, BindingResult bindingResult, ModelMap model, HttpServletRequest request) throws Exception {
		try{
			displayService.InsertSuppBizManageExbi (showVO, request);
		}catch(Exception e){
			log.debug("InsertSuppBizManageExbi Exception : "+ e.getMessage());
			model.addAttribute("msg", "입력에 실패하였습니다.");
			model.addAttribute("url", "/show/SuppBizManage.do");
			return "redirect";
		}
		return "redirect:/show/SuppBizManage.do";
	}
	//@@@@
	@RequestMapping(value="/show/DeleteSuppBizManageExbiFile.do")
	public View DeleteSuppBizManageExbiFile(@ModelAttribute("show") ShowVO showVO,  ModelMap model) throws Exception{
		try{
			displayService.DeleteSuppBizManageExbiFile(showVO);
			model.addAttribute("msg", "OK");
		}catch(Exception ex){
			model.addAttribute("msg", "ERROR");
		}

	return jsonview;
	}
	
	/**
	 * 지원사업(전시) 수정화면
	 */
	@RequestMapping(value = "/show/suppBizManageExbiEdit.do")
	public String suppBizManageExbiEdit(@ModelAttribute("show") ShowVO showVO, BindingResult bindingResult, ModelMap model, HttpServletRequest request) throws Exception {

		model.addAttribute("comboBox", displayService.SelectPreCombo0(showVO));
		
		showVO = displayService.ExbiRegistInfoEdit(showVO);
		model.addAttribute("show", showVO);

		if(showVO.getPartcptSumry() != null){
			String str1 = showVO.getPartcptSumry();
			//str1 = str1.replaceAll("\n","<br/>");
			model.addAttribute("ExbiPartcptSumry",str1);
		}

		if(showVO.getPartcptReqstMth() != null){
			String str2 = showVO.getPartcptReqstMth();
			//str2 = str2.replaceAll("\n","<br/>");
			model.addAttribute("ExbiPartcptReqstMth",str2);
		}

		if(showVO.getSportCn() != null){
			String str3 = showVO.getSportCn();
			//str3 = str3.replaceAll("\n","<br/>");
			model.addAttribute("ExbiSportCn",str3);
		}
		
		if(showVO.getNoticeItems() != null){
			String str4 = showVO.getNoticeItems();
			//str4 = str4.replaceAll("\n","<br/>");
			model.addAttribute("ExbiNoticeItems",str4);
		}
		
		if(showVO.getMainSkll() != null){
			String str5 = showVO.getMainSkll();
			//str5 = str5.replaceAll("\n","<br/>");
			model.addAttribute("ExbiMainSkll",str5);
		}
		
		if(showVO.getPartcptInclsMatter() != null){
			String str6 = showVO.getPartcptInclsMatter();
			//str6 = str6.replaceAll("\n","<br/>");
			model.addAttribute("ExbiPartcptInclsMatter",str6);
		}
		
		if(showVO.getEtcResult() != null){
			String str7 = showVO.getEtcResult();
			//str7 = str7.replaceAll("\n","<br/>");
			model.addAttribute("ExbiEtcResult",str7);
		}
		
	    model.addAttribute("mnCd", "mn04");
		model.addAttribute("mnCdS", "mn0503");
		model.addAttribute("mnNm", "지원사업관리");
		
		return "komea/show/mn05/suppBizManageExbiEdit";
	}
	
	/**
	 * UpdateSuppBizManageExbi
	 */
	@SuppressWarnings("finally")
	@RequestMapping(value = "/show/UpdateSuppBizManageExbi.do")
	public String UpdateSuppBizManageExbi(@ModelAttribute("show") ShowVO showVO, BindingResult bindingResult, ModelMap model, HttpServletRequest request) throws Exception {
		try{
			displayService.UpdateSuppBizManageExbi (showVO, request);
		}catch(Exception e){
			log.debug("UpdateSuppBizManageExbi Exception : "+ e.getMessage());
			model.addAttribute("msg", "입력에 실패하였습니다.");
			model.addAttribute("url", "/show/SuppBizManage.do");
			return "redirect";
		}
		return "redirect:/show/SuppBizManage.do";
	}
	
	/**
	 * 지원사업(전시) 지난행사이전화면
	 */
	@RequestMapping(value = "/show/suppBizManageExbiMove.do")
	public String suppBizManageExbiMove(@ModelAttribute("show") ShowVO showVO, BindingResult bindingResult, ModelMap model, HttpServletRequest request) throws Exception {

		showVO = displayService.SelectExbiByMove(showVO);
		model.addAttribute("show", showVO);
		
	    model.addAttribute("mnCd", "mn04");
		model.addAttribute("mnCdS", "mn0503");
		model.addAttribute("mnNm", "지원사업관리");
		
		return "komea/show/mn05/suppBizManageExbiMove";
	}
	
	@RequestMapping(value = "/show/suppBizManageCnsltWrite.do")
	public String suppBizManageCnsltWrite(@ModelAttribute("show") ShowVO showVO, BindingResult bindingResult, ModelMap model, HttpServletRequest request) throws Exception {

		model.addAttribute("comboBox", displayService.SelectPreCombo1(showVO));
		String preCode = "";
		
 	   if(showVO.getPreCnsltexhbCd() != null){
				preCode = showVO.getPreCnsltexhbCd();
				showVO.setCode(showVO.getPreCnsltexhbCd());
				showVO = displayService.CnsltexhbRegistInfoEdit(showVO);
				showVO.setPreCnsltexhbCd(preCode);
				model.addAttribute("show", showVO);
	    	   
				if(showVO.getMainCn() != null){
					model.addAttribute("CnsltMainCn",showVO.getMainCn());
				}

				if(showVO.getSportCn() != null){
					model.addAttribute("CnsltSportCn",showVO.getSportCn());
				}
	       }else{
	    	   ShowVO showVO1 = new ShowVO();
	    	   model.addAttribute("show", showVO1);
	       }
    	   
   	    model.addAttribute("mnCd", "mn04");
   		model.addAttribute("mnCdS", "mn0503");
   		model.addAttribute("mnNm", "지원사업관리");
		
		return "komea/show/mn05/suppBizManageCnsltWrite";
	}

	/**
	 * InsertSuppBizManageCnslt
	 */
	@SuppressWarnings("finally")
	@RequestMapping(value = "/show/InsertSuppBizManageCnslt.do")
	public String InsertSuppBizManageCnslt(@ModelAttribute("show") ShowVO showVO, BindingResult bindingResult, ModelMap model, HttpServletRequest request) throws Exception {
		try{
			displayService.InsertSuppBizManageCnslt (showVO, request);
		}catch(Exception e){
			log.debug("InsertSuppBizManageCnslt Exception : "+ e.getMessage());
			model.addAttribute("msg", "입력에 실패하였습니다.");
			model.addAttribute("url", "/show/SuppBizManage.do");
			return "redirect";
		}
		return "redirect:/show/SuppBizManage.do";
	}
	
	//@@@@
	@RequestMapping(value="/show/DeleteSuppBizManageCnsltFile.do")
	public View DeleteSuppBizManageCnsltFile(@ModelAttribute("show") ShowVO showVO, ModelMap model) throws Exception{
		try{
			displayService.DeleteSuppBizManageCnsltFile(showVO);
			model.addAttribute("msg", "OK");
		}catch(Exception ex){
			model.addAttribute("msg", "ERROR");
		}

	return jsonview;
	}
	
	/**
	 * 지원사업(상담) 수정화면
	 */
	@RequestMapping(value = "/show/suppBizManageCnsltEdit.do")
	public String suppBizManageCnsltEdit(@ModelAttribute("show") ShowVO showVO, BindingResult bindingResult, ModelMap model, HttpServletRequest request) throws Exception {

		model.addAttribute("comboBox", displayService.SelectPreCombo1(showVO));
		
		showVO = displayService.CnsltexhbRegistInfoEdit(showVO);
		model.addAttribute("show", showVO);

		if(showVO.getMainCn() != null){
			String str1 = showVO.getMainCn();
			//str1 = str1.replaceAll("\n","<br/>");
			model.addAttribute("CnsltMainCn",str1);
		}

		if(showVO.getSportCn() != null){
			String str2 = showVO.getSportCn();
			//str2 = str2.replaceAll("\n","<br/>");
			model.addAttribute("CnsltSportCn",str2);
		}
		
	    model.addAttribute("mnCd", "mn04");
		model.addAttribute("mnCdS", "mn0503");
		model.addAttribute("mnNm", "지원사업관리");
		
		return "komea/show/mn05/suppBizManageCnsltEdit";
	}	
	
	/**
	 * 지원사업(전시) 지난행사이전화면
	 */
	@RequestMapping(value = "/show/suppBizManageCnsltMove.do")
	public String suppBizManageCnsltMove(@ModelAttribute("show") ShowVO showVO, BindingResult bindingResult, ModelMap model, HttpServletRequest request) throws Exception {

		showVO = displayService.SelectCnsltByMove(showVO);
		model.addAttribute("show", showVO);
		
	    model.addAttribute("mnCd", "mn04");
		model.addAttribute("mnCdS", "mn0503");
		model.addAttribute("mnNm", "지원사업관리");
		
		return "komea/show/mn05/suppBizManageCnsltMove";
	}	
	
	/**
	 * UpdateSuppBizManageCnslt
	 */
	@SuppressWarnings("finally")
	@RequestMapping(value = "/show/UpdateSuppBizManageCnslt.do")
	public String UpdateSuppBizManageCnslt(@ModelAttribute("show") ShowVO showVO, BindingResult bindingResult, ModelMap model, HttpServletRequest request) throws Exception {
		try{
			displayService.UpdateSuppBizManageCnslt (showVO, request);
		}catch(Exception e){
			log.debug("UpdateSuppBizManageCnslt Exception : "+ e.getMessage());
			model.addAttribute("msg", "입력에 실패하였습니다.");
			model.addAttribute("url", "/show/SuppBizManage.do");
			return "redirect";
		}
		return "redirect:/show/SuppBizManage.do";
	}
	
	/**
	 * 바이어등록 팝업
	 */
	@RequestMapping(value="/show/suppBizManageBuyerInput.do")
	public String suppBizManageBuyerInput(@ModelAttribute("buyer") BuyerVO buyerVO, 
			@RequestParam(value="buyerCd", required=false, defaultValue="0") String buyerCd,
			@RequestParam(value="code", required=false, defaultValue="0") String code, ModelMap model) throws Exception{
		
		System.out.println("@@"+code);
		
		String cdDec = "NATION_NM";
		model.addAttribute("comboBox", displayService.CodeBookList(cdDec));
		
		System.out.println("@@"+buyerCd);
		if(!buyerCd.equals("0")){
			buyerVO = buyerService.SelectBuyerView1(buyerVO);
			buyerVO.setCnsltexhbCd(code);
			model.addAttribute("buyer", buyerVO);
		}
		
	    model.addAttribute("mnCd", "mn04");
		model.addAttribute("mnCdS", "mn0503");
		model.addAttribute("mnNm", "지원사업관리");

		return "komea/show/mn05/suppBizManageBuyerInput";
	}
	
	
	/**
	 * 바이어검색 팝업
	 */
	@RequestMapping(value="/show/BuyerSearchPopup.do")
	public String BuyerSearchPopup(@ModelAttribute("show") ShowVO showVO, 
			@RequestParam(value="code", required=false, defaultValue="0") String code, ModelMap model) throws Exception{

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
       
        showVO.setCnsltexhbCd("");
        showVO.setInsttMberCd("");
        int totCnt = displayService.SelectBuyerListTotCnt(showVO);
        paginationInfo.setTotalRecordCount(totCnt);
   
        model.addAttribute("paginationInfo", paginationInfo);
		
		List<ShowVO> resultList = displayService.SelectBuyerList(showVO);
	    model.addAttribute("resultList", resultList);
	    model.addAttribute("cnsltexhbCd", code);
	    
		return "komea/form/buyerRegistList";
	}
	
	/**
	 * InsertBuyerInfo
	 */
	@SuppressWarnings("finally")
	@RequestMapping(value = "/show/InsertBuyerInfo.do")
	public String InsertBuyerInfo(@ModelAttribute("buyer") BuyerVO buyerVO, ModelMap model) throws Exception {
		try{
			buyerService.InsertBuyerDbInfo (buyerVO);
		}catch(Exception e){
			log.debug("InsertBuyerInfo Exception : "+ e.getMessage());
			model.addAttribute("msg", "입력에 실패하였습니다.");
			model.addAttribute("url", "/show/SuppBizManage.do");
			return "redirect";
		}
		
		return "redirect:/show/SuppBizManageView.do?gubun="+1+"&code="+buyerVO.getCnsltexhbCd();
	}
	
	/**
	 * UpdateBuyerInfo
	 */
	@SuppressWarnings("finally")
	@RequestMapping(value = "/show/UpdateBuyerInfo.do")
	public String UpdateBuyerInfo(@ModelAttribute("buyer") BuyerVO buyerVO, ModelMap model) throws Exception {
		try{
			buyerService.UpdateBuyerDbInfo (buyerVO);
		}catch(Exception e){
			log.debug("UpdateBuyerDbInfo Exception : "+ e.getMessage());
			model.addAttribute("msg", "입력에 실패하였습니다.");
			model.addAttribute("url", "/show/SuppBizManage.do");
			return "redirect";
		}
		return "redirect:/show/SuppBizManage.do";
	}
	
	/**
	 * DeleteBuyerInfo
	 */
	@RequestMapping(value="/show/DeleteBuyerInfo.do")
	public View DeleteBuyerInfo(String cnsltexhbCd, String buyerCd, ModelMap model) throws Exception{
		BuyerVO buyerVO = new BuyerVO();
		buyerVO.setCnsltexhbCd(cnsltexhbCd);
		buyerVO.setBuyerCd(buyerCd);
		try{
			buyerService.DeleteBuyerLsnInfo (buyerVO);
			model.addAttribute("msg", "OK");
		}catch(Exception ex){
			model.addAttribute("msg", "ERROR");
		}
	 
	return jsonview;
	}
	
	/**
	 * 전시상담포털 > MyDesk > 참가신청업체관리
	 * @param model
	 * @return "ReqCompManage"
	 * @exception Exception
	 */
	@RequestMapping(value = "/show/ReqCompManage.do")
	public String ReqCompManage(@ModelAttribute("show") ShowVO showVO, 
			@RequestParam(value="gubun", required=false, defaultValue="0") String gubun, 
			@RequestParam(value="code", required=false, defaultValue="0") String code,  HttpServletRequest request, ModelMap model) throws Exception {
		
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
	       model.addAttribute("gubun", showVO.getGubun());
	       
	       MberVO sessionVO = (MberVO)request.getSession().getAttribute("loginInfo");
	       
	       if(sessionVO != null){
		       showVO.setInsttMberCd(sessionVO.getMberCd());
		       showVO.setCode(code);
		       
		       if(gubun.equals("0")){
			       model.addAttribute("comboBox", displayService.SelectRedyExbiCombo(showVO));
			       
			       int totCnt = displayService.SelectExbiReqCompanyListTotCnt(showVO);
			       paginationInfo.setTotalRecordCount(totCnt);
			   
			       model.addAttribute("paginationInfo", paginationInfo);
			       
			       // 검색조건과 키워드로 부서목록조회
			       List<ShowVO> resultList = displayService.SelectExbiReqCompanyList(showVO);
			       model.addAttribute("resultList", resultList);
			       showVO.setGubun("0");
		       }else{
			       model.addAttribute("comboBox", displayService.SelectRedyCnsltCombo(showVO));
			       
			       int totCnt = displayService.SelectCnsltReqCompanyListTotCnt(showVO);
			       paginationInfo.setTotalRecordCount(totCnt);
			   
			       model.addAttribute("paginationInfo", paginationInfo);
			       
			       // 검색조건과 키워드로 부서목록조회
			       List<ShowVO> resultList = displayService.SelectCnsltReqCompanyList(showVO);
			       model.addAttribute("resultList", resultList);	  
			       showVO.setGubun("1");
		       }
	       }else{
				model.addAttribute("msg","로그인이 필요합니다.");
				model.addAttribute("url","/komea/login.do");
				return "redirect";
	       }
	       
		    model.addAttribute("mnCd", "mn04");
			model.addAttribute("mnCdS", "mn0504");
			model.addAttribute("mnNm", "참가신청업체");
		
		return "komea/show/mn05/reqCompManage";
	}
	
	/**
	 * 전시상담포털 > MyDesk > 참가신청업체관리 > 상세조회
	 * @param model
	 * @return "SuppBizManageView"
	 * @exception Exception
	 */
	@RequestMapping(value = "/show/ReqCompManageView.do")
	public String ReqCompManageView(@ModelAttribute("show") ShowVO showVO, HttpServletRequest request, ModelMap model) throws Exception {
		
		MberVO mberVO = new MberVO();
	    mberVO.setMberCd(showVO.getEntrprsMberCd());
	    mberVO = mberService.SelectMberView(mberVO);
	    model.addAttribute("mberInfo", mberVO);
		
		if(showVO.getGubun().equals("0")){
			//전시
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
			//상담
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
			
			ShowVO showVO2;
			showVO2 = reqCompService.SelectCnsltCompReq(showVO);
			model.addAttribute("CnsltCompReqInfo", showVO2);
			
	        List<ShowVO> resultList = displayService.SelectPreferBuyerList(showVO);
	        model.addAttribute("buyerList", resultList);
	        
			model.addAttribute("ViewGb", "1"); 
		}
	    model.addAttribute("mnCd", "mn04");
		model.addAttribute("mnCdS", "mn0504");
		model.addAttribute("mnNm", "참가신청업체관리");
		
		return "komea/show/mn05/reqCompManageView";
		
	}
	
	/**
	 * 전시상담포털 > MyDesk > 참가신청업체관리 > 승인 업데이트
	 */
	@SuppressWarnings("finally")
	@RequestMapping(value = "/show/UpdateSlctnYn.do")
	public String UpdateSlctnYn(@ModelAttribute("show") ShowVO showVO, BindingResult bindingResult, ModelMap model, HttpServletRequest request) throws Exception {
		try{
			displayService.UpdateSlctnYn(showVO);
		}catch(Exception e){
			log.debug("UpdateProgressStatus Exception : "+ e.getMessage());
			model.addAttribute("msg", "승인에 실패하였습니다.");
			model.addAttribute("url", "/show/ReqCompManage.do");
			return "redirect";
		}
		return "redirect:/show/ReqCompManage.do";
	}
	
	/**
	 * 선정완료 업데이트
	 */
	@SuppressWarnings("finally")
	@RequestMapping(value = "/show/UpdateWinCmpl.do")
	public String UpdateWinCmpl(@ModelAttribute("show") ShowVO showVO, BindingResult bindingResult, ModelMap model, HttpServletRequest request) throws Exception {
		try{
		       MberVO sessionVO = (MberVO)request.getSession().getAttribute("loginInfo");
		       
		       if(sessionVO != null){
			       showVO.setInsttMberCd(sessionVO.getMberCd());
		       }
		       displayService.UpdateWinCmpl(showVO);
		}catch(Exception e){
			log.debug("UpdateWinCmpl Exception : "+ e.getMessage());
			model.addAttribute("msg", "선정완료에 실패하였습니다.");
			model.addAttribute("url", "/show/ReqCompManage.do");
			return "redirect";
		}
		return "redirect:/show/ReqCompManage.do";
	}
	
	/**
	 * 전시상담포털 > MyDesk > 입찰신청관리
	 * @param model
	 * @return "BiddingAppManage"
	 * @exception Exception
	 */
	@RequestMapping(value = "/show/BiddingAppManage.do")
	public String BiddingAppManage(@ModelAttribute("show") ShowVO showVO, HttpServletRequest request, ModelMap model) throws Exception {
		
	       // currentPageNo : 현재 페이지 번호
	       // recordCountPerPage : 한 페이지당 게시되는 게시물 건 수 (=pageUnit)
	       // pageSize : 페이지 리스트에 게시되는 페이지 건수
	       // totalRecordCount : 전체 게시물 건 수
	       // pageUnit과 pageSize는 context-properties.xml에서 설정

		   showVO.setPageUnit(5);
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
	    	   showVO.setWrter(sessionVO.getMberCd());
		       model.addAttribute("comboBox", displayService.SelectBiddingCombo(showVO));
		       
		       if(showVO.getRegistNo() != null){
			       int totCnt = displayService.SelectReqBiddingOthersListTotCnt(showVO);
			       paginationInfo.setTotalRecordCount(totCnt);
			   
			       model.addAttribute("paginationInfo", paginationInfo);
			       
			       // 검색조건과 키워드로 부서목록조회
			       List<ShowVO> resultList = displayService.SelectReqBiddingOthersList(showVO);
			       model.addAttribute("resultList", resultList);
		       }else{
					int totCnt = 0;
					paginationInfo.setTotalRecordCount(totCnt);
					model.addAttribute("paginationInfo",paginationInfo);
					
					// 검색조건과 키워드로 신청자목록조회
					model.addAttribute("resultList", null);
					model.addAttribute("totCnt", 0);
		       }
	       }else{
				model.addAttribute("msg","로그인이 필요합니다.");
				model.addAttribute("url","/komea/login.do");
				return "redirect";
	       }
	       
		    model.addAttribute("mnCd", "mn04");
			model.addAttribute("mnCdS", "mn0505");
			model.addAttribute("mnNm", "입찰신청관리");
		
		return "komea/show/mn05/biddingAppManage";
	}
	
	/**
	 * 전시상담포털 > MyDesk > 입찰참여관리 > 상세정보
	 * @param model
	 * @return "companyView"
	 * @exception Exception
	 */
	@RequestMapping(value = "/show/BiddingAppManageView.do")
	public String BiddingAppManageView(@ModelAttribute("show") ShowVO showVO, ModelMap model, HttpServletRequest request) throws Exception {
		
		String mberCd = showVO.getMberCd();

		//입찰신청 내용
		showVO = reqCompService.SelectReqBiddingInfo(showVO);
		model.addAttribute("show", showVO);

	   //기타회원 정보조회
	   showVO.setMberCd(mberCd);
	   showVO = displayService.SelectMberInfo(showVO);
	   model.addAttribute("mberInfo", showVO);
	   
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
 	   	
	    model.addAttribute("mnCd", "mn04");
		model.addAttribute("mnCdS", "mn0505");
		model.addAttribute("mnNm", "입찰신청관리");
 	   	
		return "komea/show/mn05/biddingAppManageView";
	}
	
  	/**
	 * 입찰업체선정 업데이트
	 */
	@SuppressWarnings("finally")
	@RequestMapping(value = "/show/UpdateBiddingStatus.do")
	public String UpdateBiddingStatus(@ModelAttribute("show") ShowVO showVO, ModelMap model, HttpServletRequest request) throws Exception {
		try{
			displayService.UpdateBiddingStatus(showVO);
		}catch(Exception e){
			log.debug("UpdateBiddingStatus Exception : "+ e.getMessage());
			model.addAttribute("msg", "입찰신청 승인에 실패하였습니다.");
			model.addAttribute("url", "/show/BiddingAppManage.do");
			return "redirect";
		}
		return "redirect:/show/BiddingAppManage.do";
	}
	
	/**
	 * 입찰업체선정 결과확인
	 */
	@RequestMapping(value="/show/SelectBiddingStatus.do")
	public View isBiddingStatus(String registNo, ModelMap model) throws Exception{
		ShowVO showVO = new ShowVO();
		showVO.setRegistNo(registNo);
		List<ShowVO> result = displayService.SelectBiddingStatus(showVO);

		for (int i = 0; i < result.size(); i++){
		  if ("0".equals(result.get(i).getCdItem())){
			  model.addAttribute("reqCnt", result.get(i).getCnt());
			  System.out.println("* reqCnt : "+result.get(i).getCnt());
		  }else if("1".equals(result.get(i).getCdItem())){
			  model.addAttribute("winCnt", result.get(i).getCnt());
			  System.out.println("* winCnt : "+result.get(i).getCnt());
		  }else if("2".equals(result.get(i).getCdItem())){
			  model.addAttribute("rejCnt", result.get(i).getCnt());
			  System.out.println("* rejCnt : "+result.get(i).getCnt());
		  }
		}
	 
	return jsonview;
	}
	
	/**
	 * 입찰업체선정 완료처리
	 */
	@RequestMapping(value="/show/UpdateResultComplete.do")
	public View UpdateResultComplete(String registNo, ModelMap model) throws Exception{
		ShowVO showVO = new ShowVO();
		showVO.setRegistNo(registNo);
		List<ShowVO> result = displayService.SelectBiddingStatusCompanyList(showVO);

		String cmpnyNm = "";
		String mberCd = "";
		
		for (int i = 0; i < result.size(); i++){
			  if (i > 0){
					cmpnyNm = cmpnyNm + "," + result.get(i).getCmpnyNm();
					mberCd = mberCd + "," + result.get(i).getMberCd();
			  }else{
					cmpnyNm = result.get(i).getCmpnyNm();
					mberCd = result.get(i).getMberCd();
			  }
		}
		showVO.setEtc2(cmpnyNm);
		showVO.setEtc3(mberCd);
		
		try{
			displayService.UpdateBiddingResultComplete(showVO);
			model.addAttribute("msg", "OK");
		}catch(Exception ex){
			model.addAttribute("msg", "ERROR");
		}
	 
	return jsonview;
	}
	
	/**
	 * 전시상담포털 > MyDesk > 우수기업선정관리
	 * @param model
	 * @return "BestCompManage"
	 * @exception Exception
	 */
	@RequestMapping(value = "/show/BestCompManage.do")
	public String BestCompManage(@ModelAttribute("show") ShowVO showVO, HttpServletRequest request, ModelMap model) throws Exception {
		
	       // currentPageNo : 현재 페이지 번호
	       // recordCountPerPage : 한 페이지당 게시되는 게시물 건 수 (=pageUnit)
	       // pageSize : 페이지 리스트에 게시되는 페이지 건수
	       // totalRecordCount : 전체 게시물 건 수
	       // pageUnit과 pageSize는 context-properties.xml에서 설정

		   showVO.setPageUnit(5);
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
	    	   showVO.setWrter(sessionVO.getMberCd());
		       model.addAttribute("comboBox", displayService.SelectBestCompCombo(showVO));
		       
		       if(showVO.getRegistNo() != null){
			       int totCnt = displayService.SelectReqBestCompOthersListTotCnt(showVO);
			       paginationInfo.setTotalRecordCount(totCnt);
			   
			       model.addAttribute("paginationInfo", paginationInfo);
			       
			       // 검색조건과 키워드로 부서목록조회
			       List<ShowVO> resultList = displayService.SelectReqBestCompOthersList(showVO);
			       model.addAttribute("resultList", resultList);
		       }else{
					int totCnt = 0;
					paginationInfo.setTotalRecordCount(totCnt);
					model.addAttribute("paginationInfo",paginationInfo);
					
					// 검색조건과 키워드로 신청자목록조회
					model.addAttribute("resultList", null);
					model.addAttribute("totCnt", 0);
		       }
	       }else{
				model.addAttribute("msg","로그인이 필요합니다.");
				model.addAttribute("url","/komea/login.do");
				return "redirect";
	       }
	       
		    model.addAttribute("mnCd", "mn04");
			model.addAttribute("mnCdS", "mn0502");
			model.addAttribute("mnNm", "우수기업선정관리");
		       
		return "komea/show/mn05/bestCompManage";
	}
	
  	/**
	 * 우수기업선정 업데이트
	 */
	@SuppressWarnings("finally")
	@RequestMapping(value = "/show/UpdateWinnerStatus.do")
	public String UpdateWinnerStatus(@ModelAttribute("show") ShowVO showVO, ModelMap model, HttpServletRequest request) throws Exception {
		try{
			displayService.UpdateWinnerStatus(showVO);
		}catch(Exception e){
			log.debug("UpdateWinnerStatus Exception : "+ e.getMessage());
			model.addAttribute("msg", "진행사항 수정에 실패하였습니다.");
			model.addAttribute("url", "/show/BestCompManage.do");
			return "redirect";
		}
		return "redirect:/show/BestCompManage.do";
	}
	
	/**
	 * 우수기업신청 테이터 수정
	 */
	@SuppressWarnings("finally")
	@RequestMapping(value = "/show/UpdateWinnerReqstInfo.do")
	public String UpdateWinnerReqstInfo(@ModelAttribute("show") ShowVO showVO, ModelMap model, HttpServletRequest request) throws Exception {
		try{
			displayService.UpdateWinnerReqstInfo(showVO);
		}catch(Exception e){
			log.debug("UpdateWinnerReqstInfo Exception : "+ e.getMessage());
			model.addAttribute("msg", "신청 데이터 수정에 실패하였습니다.");
			model.addAttribute("url", "/show/BestCompManage.do");
			return "redirect";
		}
		return "redirect:/show/BestCompManage.do";
	}

	/**
	 * 우수기업신청 테이터 삭제
	 */
	@SuppressWarnings("finally")
	@RequestMapping(value = "/show/DeleteBestCompanyRequest.do")
	public String DeleteBestCompanyRequest(@ModelAttribute("show") ShowVO showVO, ModelMap model, HttpServletRequest request) throws Exception {
		try{
			displayService.DeleteBestCompanyRequest(showVO);
		}catch(Exception e){
			log.debug("DeleteBestCompanyRequest Exception : "+ e.getMessage());
			model.addAttribute("msg", "신청 데이터 삭제에 실패하였습니다.");
			model.addAttribute("url", "/show/BestCompManage.do");
			return "redirect";
		}
		return "redirect:/show/BestCompManage.do";
	}
	
	/**
	 * 우수기업선정 결과확인
	 */
	@RequestMapping(value="/show/SelectBestCompStatus.do")
	public View SelectBestCompStatus(String registNo, ModelMap model) throws Exception{
		ShowVO showVO = new ShowVO();
		showVO.setRegistNo(registNo);
		List<ShowVO> result = displayService.SelectBestCompStatus(showVO);

		for (int i = 0; i < result.size(); i++){
		  if ("0".equals(result.get(i).getCdItem())){
			  model.addAttribute("reqCnt", result.get(i).getCnt());
			  System.out.println("* reqCnt : "+result.get(i).getCnt());
		  }else if("1".equals(result.get(i).getCdItem())){
			  model.addAttribute("winCnt", result.get(i).getCnt());
			  System.out.println("* winCnt : "+result.get(i).getCnt());
		  }else if("2".equals(result.get(i).getCdItem())){
			  model.addAttribute("rejCnt", result.get(i).getCnt());
			  System.out.println("* rejCnt : "+result.get(i).getCnt());
		  }
		}
	 
	return jsonview;
	}

	/**
	 * 우수기업선정 완료처리
	 */
	@RequestMapping(value="/show/UpdateBestCompResultComplete.do")
	public View UpdateBestCompResultComplete(String registNo, ModelMap model) throws Exception{
		ShowVO showVO = new ShowVO();
		showVO.setRegistNo(registNo);
		List<ShowVO> result = displayService.SelectBestCompStatusCompanyList(showVO);

		int bbscttNo = 0;
		String cmpnyNm = "";
		String mberCd = "";
		
		for (int i = 0; i < result.size(); i++){
			  if (i > 0){
					cmpnyNm = cmpnyNm + "," + result.get(i).getCmpnyNm();
					mberCd = mberCd + "," + result.get(i).getMberCd();
			  }else{
				    bbscttNo = result.get(i).getBbscttNo();
					cmpnyNm = result.get(i).getCmpnyNm();
					mberCd = result.get(i).getMberCd();
			  }
		}
		showVO.setBbscttNo(bbscttNo);
		showVO.setEtc2(cmpnyNm);
		showVO.setEtc3(mberCd);
		
		try{
			displayService.UpdateBestCompResultComplete(showVO);
			model.addAttribute("msg", "OK");
		}catch(Exception ex){
			model.addAttribute("msg", "ERROR");
		}
	 
	return jsonview;
	}
}