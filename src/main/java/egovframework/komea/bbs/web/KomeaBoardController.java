package egovframework.komea.bbs.web;

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
import org.springframework.web.servlet.View;

import egovframework.komea.bbs.service.KomeaBoardService;
import egovframework.komea.bbs.service.KomeabbsVO;
import egovframework.komeaweb.com.KomeaBoardValidator;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class KomeaBoardController {
	Logger log = Logger.getLogger(this.getClass());
	
    @Resource(name = "komeaBoardService")
    private KomeaBoardService komeaBoardService;
 
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
    
    @Autowired
    private View jsonview;
    
    /**
     * BoardName, return할 파일명 SETTING
     */
    public void SetValue(KomeabbsVO bbsVO, BindingResult bindingResult) throws Exception{
    	String BoardName = "";
    	String BoardFileName = "";
    	
    	BoardName = new KomeaBoardValidator().get_BoardName(bbsVO, bindingResult);
    	BoardFileName = new KomeaBoardValidator().get_BoardFileName(bbsVO, bindingResult);
    	
    	bbsVO.setBoardName(BoardName);
    	bbsVO.setBoardFileName(BoardFileName);

    	System.out.println("@ "+bbsVO.getBoardName());
    	System.out.println("@ "+bbsVO.getBoardFileName());
    	
    }
    
    /**
     * KomeaBoard FilDownload
     */
    @RequestMapping(value="/komea/bbs/downloadFile.do")
    public void downloadFile(@ModelAttribute("bbs") KomeabbsVO bbsVO, HttpServletResponse response) throws Exception{
    	
    	String bCode = bbsVO.getbCode();
    	
    	bbsVO = komeaBoardService.SelectKomeaFileInfo(bbsVO);
        String storedFileName = bbsVO.getfSnm();
        String originalFileName = bbsVO.getfNm();
        String dir ="";
        
        komeaBoardService.UpdateKomeaFileDownCnt(bbsVO);
        
		if(bCode.equals("B001")){
			dir = "/_UploadData/0405010000/";
		}else if(bCode.equals("B002")){
			dir = "/_UploadData/0404030000/";
		}else if(bCode.equals("B007")){
			dir = "/_UploadData/0404040000/";
		}else if(bCode.equals("B008")){
			dir = "/_UploadData/0404090000/";
		}else if(bCode.equals("B009")){
			dir = "/_UploadData/0404100000/";
		}else if(bCode.equals("B010")){
			dir = "/_UploadData/0405020000/";
		}else if(bCode.equals("B011")){
			dir = "/_UploadData/0405040000/";
		}else if(bCode.equals("B012")){
			dir = "/_UploadData/0405050000/";
		}else if(bCode.equals("B013")){
			dir = "/_UploadData/0405060000/";
		}else if(bCode.equals("B014")){
			dir = "/_UploadData/0405070000/";
		}else if(bCode.equals("B015")){
			dir = "/_UploadData/0405080000/";
		}
		
    	System.out.println("------------- /komea/bbs/downloadFile.do -------------");
    	System.out.println("fileCours : "+"/komeaweb/tomcat/webapps/ROOT"+dir+storedFileName);
    	System.out.println("fileCours : "+bbsVO.getfSnm());
    	System.out.println("fileNm : "+bbsVO.getfNm());
    	System.out.println("------------- /komea/bbs/downloadFile.do -------------");
         
        byte fileByte[] = FileUtils.readFileToByteArray(new File("/komeaweb/tomcat/webapps/ROOT"+dir+storedFileName));
        
        response.setContentType("application/octet-stream");
        response.setContentLength(fileByte.length);
        response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(originalFileName,"UTF-8")+"\";");
        response.setHeader("Content-Transfer-Encoding", "binary");
        response.getOutputStream().write(fileByte);
         
        response.getOutputStream().flush();
        response.getOutputStream().close();
    }
    
    /**
     * KomeaBoard File delete
     */
    @RequestMapping(value="/komea/bbs/deleteFile.do")
    public View deleteFile(@ModelAttribute("bbs") KomeabbsVO bbsVO, ModelMap model) throws Exception{
		try{
	    	bbsVO = komeaBoardService.SelectKomeaFileInfo(bbsVO);
	        komeaBoardService.UpdateKomeaDeleteFileIdx(bbsVO);
			model.addAttribute("msg", "OK");
		}catch(Exception ex){
			model.addAttribute("msg", "ERROR");
		}
        
    	return jsonview;
    }

	/**
	 * List
	 * @param model
	 * @return "komea/bbs/List"
	 * @exception Exception
	 */
	@RequestMapping(value = "/komea/bbs/List.do")
	public String bbsList(@ModelAttribute("bbs") KomeabbsVO bbsVO, 
			@RequestParam(value="bCode", required=false, defaultValue="B001") String bCode, BindingResult bindingResult, ModelMap model) throws Exception {
		
	   bbsVO.setbCode(bCode);
	   SetValue(bbsVO, bindingResult);
		
       // currentPageNo : 현재 페이지 번호
       // recordCountPerPage : 한 페이지당 게시되는 게시물 건 수 (=pageUnit)
       // pageSize : 페이지 리스트에 게시되는 페이지 건수
       // totalRecordCount : 전체 게시물 건 수
       // pageUnit과 pageSize는 context-properties.xml에서 설정
               
	   bbsVO.setPageUnit(propertiesService.getInt("pageUnit"));
	   bbsVO.setPageSize(propertiesService.getInt("pageSize"));
       
       PaginationInfo paginationInfo = new PaginationInfo();
       
       paginationInfo.setCurrentPageNo(bbsVO.getPageIndex());
	   if(bCode.equals("B002")){
	       paginationInfo.setRecordCountPerPage(8);
	   }else{
	       paginationInfo.setRecordCountPerPage(bbsVO.getPageUnit());
	   }
       paginationInfo.setPageSize(bbsVO.getPageSize());
       
       bbsVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
       bbsVO.setLastIndex(paginationInfo.getLastRecordIndex());
       bbsVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
       
       int totCnt = komeaBoardService.SelectKomeaListTotCnt(bbsVO);
       paginationInfo.setTotalRecordCount(totCnt);
   
       model.addAttribute("paginationInfo", paginationInfo);
       
       // 검색조건과 키워드로 부서목록조회
       List<KomeabbsVO> resultBoardList = komeaBoardService.SelectKomeaList(bbsVO);
       model.addAttribute("resultList", resultBoardList);
       model.addAttribute("BoardName", bbsVO.getBoardName());
       
       System.out.println("URL : komea/bbs/"+bbsVO.getBoardFileName()+"List.jsp");
       
       //간행물, 국문뉴스레터, 영문뉴스레터, 보도자료, 거점기지산업동향정보, 거점기지프로젝트정보
       if(bbsVO.getbCode().equals("B002") || bbsVO.getbCode().equals("B007") || bbsVO.getbCode().equals("B008") || 
    	  bbsVO.getbCode().equals("B009") || bbsVO.getbCode().equals("B013") || bbsVO.getbCode().equals("B014")){
     	   model.addAttribute("mnCd", "mn08");
     	   model.addAttribute("bCode", bbsVO.getbCode());
     	//공지사항, 사업공고, 열린제안
        }else if(bbsVO.getbCode().equals("B001") || bbsVO.getbCode().equals("B010") || bbsVO.getbCode().equals("B011")){
     	   model.addAttribute("mnCd", "mn09");
     	  model.addAttribute("bCode", bbsVO.getbCode());
     	//글로벌인증소식(api)	
        }else if(bbsVO.getbCode().equals("B015")){ 
        	model.addAttribute("mnCd", "mn07");
        	model.addAttribute("bCode", bbsVO.getbCode());
        }
        		
        model.addAttribute("mnNm", bbsVO.getBoardName());
		
		return "komea/bbs/"+bbsVO.getBoardFileName()+"List";
	}
	
	/**
	 * Write
	 * @param model
	 * @return "komea/bbs/Write"
	 * @exception Exception
	 */
	@RequestMapping(value = "/komea/bbs/Write.do")
	public String bbsWrite(@ModelAttribute("bbs") KomeabbsVO bbsVO, BindingResult bindingResult, ModelMap model) throws Exception {
		
	   SetValue(bbsVO, bindingResult);
	   model.addAttribute("BoardName", bbsVO.getBoardName());
	   
       //간행물, 국문뉴스레터, 영문뉴스레터, 보도자료, 거점기지산업동향정보, 거점기지프로젝트정보
       if(bbsVO.getbCode().equals("B002") || bbsVO.getbCode().equals("B007") || bbsVO.getbCode().equals("B008") || 
    	  bbsVO.getbCode().equals("B009") || bbsVO.getbCode().equals("B013") || bbsVO.getbCode().equals("B014")){
     	   model.addAttribute("mnCd", "mn08");
     	   model.addAttribute("bCode", bbsVO.getbCode());
     	//공지사항, 사업공고, 열린제안
        }else if(bbsVO.getbCode().equals("B001") || bbsVO.getbCode().equals("B010") || bbsVO.getbCode().equals("B011")){
     	   model.addAttribute("mnCd", "mn09");
     	   model.addAttribute("bCode", bbsVO.getbCode());
     	//글로벌인증소식(api)	
        }else if(bbsVO.getbCode().equals("B015")){ 
        	model.addAttribute("mnCd", "mn07");
        	model.addAttribute("bCode", bbsVO.getbCode());
        }
        model.addAttribute("mnNm", bbsVO.getBoardName());
		
		return "komea/bbs/"+bbsVO.getBoardFileName()+"Write";
	}
	
	/**
	 * Insert
	 * @param model
	 * @return "komea/bbs/List.do"
	 * @exception Exception
	 */
	@SuppressWarnings("finally")
	@RequestMapping(value = "/komea/bbs/InsertKomeaBoard.do")
	public String bbsInsert(@ModelAttribute("bbs") KomeabbsVO bbsVO, BindingResult bindingResult, ModelMap model, HttpServletRequest request) throws Exception {
		
		String bCode = bbsVO.getbCode();
		
		SetValue(bbsVO, bindingResult);
		try{
			komeaBoardService.InsertKomeaBoard (bbsVO, request);
		}catch(Exception e){
			log.debug("Insert KomeaBoard Exception : "+ e.getMessage());
			model.addAttribute("msg", "입력에 실패하였습니다.");
			model.addAttribute("url", "/komea/bbs/List.do?bCode="+bbsVO.getbCode());
			return "redirect";
		}
		return "redirect:/komea/bbs/List.do?bCode="+bCode;
	}
	
	/**
	 * View
	 * @param model
	 * @return "komea/bbs/View"
	 * @exception Exception
	 */
	@RequestMapping(value = "/komea/bbs/View.do")
	public String bbsView(@ModelAttribute("bbs") KomeabbsVO bbsVO, BindingResult bindingResult, ModelMap model) throws Exception {

		komeaBoardService.UpdateKomeaBoardCnt(bbsVO);
		
		bbsVO = komeaBoardService.SelectKomeaView(bbsVO);
		model.addAttribute("bbsVO", bbsVO);
		
		if(bbsVO.getContents() != null){
			String str1 = bbsVO.getContents();
			str1 = str1.replaceAll("\n","<br/>");
			model.addAttribute("Contents",str1);
		}
		
        List<KomeabbsVO> uploadFileList = komeaBoardService.SelectKomeaFileList(bbsVO);
        model.addAttribute("uploadFileList", uploadFileList);
        
        List<KomeabbsVO> PreNextList = komeaBoardService.SelectKomeaPreNextList(bbsVO);
        model.addAttribute("PreNextList", PreNextList);
        
        SetValue(bbsVO, bindingResult);
        model.addAttribute("BoardName", bbsVO.getBoardName());
        
        //간행물, 국문뉴스레터, 영문뉴스레터, 보도자료, 거점기지산업동향정보, 거점기지프로젝트정보
        if(bbsVO.getbCode().equals("B002") || bbsVO.getbCode().equals("B007") || bbsVO.getbCode().equals("B008") || 
     	  bbsVO.getbCode().equals("B009") || bbsVO.getbCode().equals("B013") || bbsVO.getbCode().equals("B014")){
      	   model.addAttribute("mnCd", "mn08");
      	   model.addAttribute("bCode", bbsVO.getbCode());
      	//공지사항, 사업공고, 열린제안
         }else if(bbsVO.getbCode().equals("B001") || bbsVO.getbCode().equals("B010") || bbsVO.getbCode().equals("B011")){
      	   model.addAttribute("mnCd", "mn09");
      	   model.addAttribute("bCode", bbsVO.getbCode());
      	//글로벌인증소식(api)	
         }else if(bbsVO.getbCode().equals("B015")){ 
         	model.addAttribute("mnCd", "mn07");
         	model.addAttribute("bCode", bbsVO.getbCode());
         }
         model.addAttribute("mnNm", bbsVO.getBoardName());
        
		return "komea/bbs/"+bbsVO.getBoardFileName()+"View";
	}
	
	/**
	 * Edit
	 * @param model
	 * @return "komea/bbs/Edit"
	 * @exception Exception
	 */
	@RequestMapping(value = "/komea/bbs/Edit.do")
	public String bbsEdit(@ModelAttribute("bbs") KomeabbsVO bbsVO, BindingResult bindingResult, ModelMap model) throws Exception {

		bbsVO = komeaBoardService.SelectKomeaView(bbsVO);
		model.addAttribute("bbsVO", bbsVO);
		
		if(bbsVO.getContents() != null){
			String str1 = bbsVO.getContents();
			str1 = str1.replaceAll("\n","<br/>");
			model.addAttribute("Contents",str1);
		}
		
        List<KomeabbsVO> uploadFileList = komeaBoardService.SelectKomeaFileList(bbsVO);
        model.addAttribute("uploadFileList", uploadFileList);
		
		SetValue(bbsVO, bindingResult);
		model.addAttribute("BoardName", bbsVO.getBoardName());
		
       //간행물, 국문뉴스레터, 영문뉴스레터, 보도자료, 거점기지산업동향정보, 거점기지프로젝트정보
       if(bbsVO.getbCode().equals("B002") || bbsVO.getbCode().equals("B007") || bbsVO.getbCode().equals("B008") || 
    	  bbsVO.getbCode().equals("B009") || bbsVO.getbCode().equals("B013") || bbsVO.getbCode().equals("B014")){
     	   model.addAttribute("mnCd", "mn08");
     	   model.addAttribute("bCode", bbsVO.getbCode());
     	//공지사항, 사업공고, 열린제안
        }else if(bbsVO.getbCode().equals("B001") || bbsVO.getbCode().equals("B010") || bbsVO.getbCode().equals("B011")){
     	   model.addAttribute("mnCd", "mn09");
     	   model.addAttribute("bCode", bbsVO.getbCode());
     	//글로벌인증소식(api)	
        }else if(bbsVO.getbCode().equals("B015")){ 
        	model.addAttribute("mnCd", "mn07");
        	model.addAttribute("bCode", bbsVO.getbCode());
        }
        model.addAttribute("mnNm", bbsVO.getBoardName());
		
		return "komea/bbs/"+bbsVO.getBoardFileName()+"Edit";
	}
	
	/**
	 * Update
	 * @param model
	 * @return "komea/bbs/List.do"
	 * @exception Exception
	 */
	@SuppressWarnings("finally")
	@RequestMapping(value = "/komea/bbs/UpdateKomeaBoard.do")
	public String bbsUpdate(@ModelAttribute("bbs") KomeabbsVO bbsVO, BindingResult bindingResult, ModelMap model, HttpServletRequest request) throws Exception {
		
		String bCode = bbsVO.getbCode();
		
		SetValue(bbsVO, bindingResult);
		try{
			komeaBoardService.UpdateKomeaBoard(bbsVO, request);
		}catch(Exception e){
			log.debug("Insert KomeaBoard Exception : "+ e.getMessage());
			model.addAttribute("msg", "수정에 실패하였습니다.");
			model.addAttribute("url", "/komea/bbs/List.do?bCode="+bbsVO.getbCode());
			return "redirect";
		}
		
		return "redirect:/komea/bbs/List.do?bCode="+bCode;
	}
	
	/**
	 * Delete
	 * @param model
	 * @return "komea/bbs/List.do"
	 * @exception Exception
	 */
	@SuppressWarnings("finally")
	@RequestMapping(value = "/komea/bbs/DeleteKomeaBoard.do")
	public String bbsDelete(@ModelAttribute("bbs") KomeabbsVO bbsVO, BindingResult bindingResult, ModelMap model, HttpServletRequest request) throws Exception {
		
		String bCode = bbsVO.getbCode();
		
		SetValue(bbsVO, bindingResult);
		try{
			komeaBoardService.DeleteKomeaBoard(bbsVO, request);
		}catch(Exception e){
			log.debug("Insert KomeaBoard Exception : "+ e.getMessage());
			model.addAttribute("msg", "삭제에 실패하였습니다.");
			model.addAttribute("url", "/komea/bbs/List.do?bCode="+bbsVO.getbCode());
			return "redirect";
		}
		
		return "redirect:/komea/bbs/List.do?bCode="+bCode;
	}
	
	
	
	
	
	
	/**
	 * 관리자 > 게시판관리
	 * @param model
	 * @return "NoticeList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/admin/bbsList.do")
	public String bbsList(@ModelAttribute("bbs") KomeabbsVO bbsVO, ModelMap model) throws Exception {

	       // currentPageNo : 현재 페이지 번호
	       // recordCountPerPage : 한 페이지당 게시되는 게시물 건 수 (=pageUnit)
	       // pageSize : 페이지 리스트에 게시되는 페이지 건수
	       // totalRecordCount : 전체 게시물 건 수
	       // pageUnit과 pageSize는 context-properties.xml에서 설정
	               
		   bbsVO.setPageUnit(propertiesService.getInt("pageUnit"));
		   bbsVO.setPageSize(propertiesService.getInt("pageSize"));
	       
	       PaginationInfo paginationInfo = new PaginationInfo();
	       
	       paginationInfo.setCurrentPageNo(bbsVO.getPageIndex());
	       paginationInfo.setRecordCountPerPage(bbsVO.getPageUnit());
	       paginationInfo.setPageSize(bbsVO.getPageSize());
	       
	       bbsVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
	       bbsVO.setLastIndex(paginationInfo.getLastRecordIndex());
	       bbsVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
	       
	       int totCnt = komeaBoardService.SelectBbsListTotCnt(bbsVO);
	       paginationInfo.setTotalRecordCount(totCnt);
	   
	       model.addAttribute("paginationInfo", paginationInfo);
	       
	       // 검색조건과 키워드로 부서목록조회
	       List<KomeabbsVO> resultList = komeaBoardService.SelectBbsList(bbsVO);
	       model.addAttribute("resultList", resultList);
	       
		return "admin/bbs/bbsList";
	}

	/**
	 * Write
	 * @param model
	 * @return "admn/mber/Write"
	 * @exception Exception
	 */
	@RequestMapping(value = "/admin/bbsInput.do")
	public String bbsInput(@ModelAttribute("bbs") KomeabbsVO bbsVO, ModelMap model) throws Exception {
		
		return "admin/bbs/bbsInput";
	}

	/**
	 * View
	 * @param model
	 * @return "admin/mberView"
	 * @exception Exception
	 */
	@RequestMapping(value = "/admin/bbsView.do")
	public String bbsView(@ModelAttribute("bbs") KomeabbsVO bbsVO, ModelMap model) throws Exception {
		
		bbsVO = komeaBoardService.SelectBbsView(bbsVO);
		model.addAttribute("bbs", bbsVO);
		
		if(bbsVO.getContents() != null){
			String str1 = bbsVO.getContents();
			str1 = str1.replaceAll("\n","<br/>");
			model.addAttribute("Contents",str1);
		}
		
        List<KomeabbsVO> uploadFileList = komeaBoardService.SelectKomeaFileList(bbsVO);
        model.addAttribute("uploadFileList", uploadFileList);
        
		return "admin/bbs/bbsView";
	}
	
	/**
	 * Edit
	 * @param model
	 * @return "admin/mberEdit"
	 * @exception Exception
	 */
	@RequestMapping(value = "/admin/bbsEdit.do")
	public String bbsEdit(@ModelAttribute("bbs") KomeabbsVO bbsVO, ModelMap model) throws Exception {
		
		bbsVO = komeaBoardService.SelectBbsView(bbsVO);
		model.addAttribute("bbs", bbsVO);
		
		if(bbsVO.getContents() != null){
			String str1 = bbsVO.getContents();
			str1 = str1.replaceAll("\n","<br/>");
			model.addAttribute("Contents",str1);
		}
		
        List<KomeabbsVO> uploadFileList = komeaBoardService.SelectKomeaFileList(bbsVO);
        model.addAttribute("uploadFileList", uploadFileList);
        model.addAttribute("fCnt", uploadFileList.size());
        
		return "admin/bbs/bbsEdit";
	}

	/**
	 * Insert
	 * @param model
	 * @return "/show/InfoCenter/InsertBoard.do"
	 * @exception Exception
	 */
	@SuppressWarnings("finally")
	@RequestMapping(value = "/admin/InsertBoard.do")
	public String InsertBoard(@ModelAttribute("bbs") KomeabbsVO bbsVO, BindingResult bindingResult, ModelMap model, HttpServletRequest request) throws Exception {
		try{
			komeaBoardService.InsertKomeaBoard (bbsVO, request);
		}catch(Exception e){
			log.debug("InsertBoard Exception : "+ e.getMessage());
			model.addAttribute("msg", "입력에 실패하였습니다.");
			model.addAttribute("url", "/admin/bbsList.do");
			return "redirect";
		}
		return "redirect:/admin/bbsList.do";
	}
	
	//@@@@
	@RequestMapping(value="/admin/DeleteBoardFile.do")
	public View DeleteBoardFile(@ModelAttribute("bbs") KomeabbsVO bbsVO,  ModelMap model) throws Exception{
		try{
			komeaBoardService.DeleteBoardFile(bbsVO);
			model.addAttribute("msg", "OK");
		}catch(Exception ex){
			model.addAttribute("msg", "ERROR");
		}

	return jsonview;
	}
	
	/**
	 * Update
	 * @param model
	 * @return "/show/InfoCenter/UpdateBoard.do"
	 * @exception Exception
	 */
	@SuppressWarnings("finally")
	@RequestMapping(value = "/admin/UpdateBoard.do")
	public String UpdateBoard(@ModelAttribute("bbs") KomeabbsVO bbsVO, BindingResult bindingResult, ModelMap model, HttpServletRequest request) throws Exception {
		try{
			komeaBoardService.UpdateKomeaBoard(bbsVO, request);
		}catch(Exception e){
			log.debug("UpdateBoard Exception : "+ e.getMessage());
			model.addAttribute("msg", "수정에 실패하였습니다.");
			model.addAttribute("url", "/admin/bbsList.do");
			return "redirect";
		}
		return "redirect:/admin/bbsList.do";
	}
	
	/**
	 * Delete
	 * @param model
	 * @return "/show/InfoCenter/DeleteBoard.do"
	 * @exception Exception
	 */
	@SuppressWarnings("finally")
	@RequestMapping(value = "/admin/DeleteBoard.do")
	public String DeleteBoard(@ModelAttribute("bbs") KomeabbsVO bbsVO, BindingResult bindingResult, ModelMap model, HttpServletRequest request) throws Exception {
		try{
			komeaBoardService.DeleteKomeaBoard(bbsVO, request);
		}catch(Exception e){
			log.debug("DeleteBoard Exception : "+ e.getMessage());
			model.addAttribute("msg", "삭제에 실패하였습니다.");
			model.addAttribute("url", "/admin/bbsList.do");
			return "redirect";
		}
		return "redirect:/admin/bbsList.do";
	}
	
	/**
	 * View
	 * @param model
	 * @return "admin/mberView"
	 * @exception Exception
	 */
	@RequestMapping(value = "/bbsViewPopup.do")
	public String bbsViewPopup(@ModelAttribute("bbs") KomeabbsVO bbsVO, ModelMap model) throws Exception {
		
		bbsVO = komeaBoardService.SelectBbsView(bbsVO);
		model.addAttribute("bbs", bbsVO);
		
		if(bbsVO.getContents() != null){
			String str1 = bbsVO.getContents();
			str1 = str1.replaceAll("\n","<br/>");
			model.addAttribute("Contents",str1);
		}
		
        List<KomeabbsVO> uploadFileList = komeaBoardService.SelectKomeaFileList(bbsVO);
        model.addAttribute("uploadFileList", uploadFileList);
        
		return "admin/bbs/bbsViewPopup";
	}
	
	/**------------------------------열린제안---------------------------------------------------------------------*/
	
	/**
	 * 관리자 > 게시판관리
	 * @param model
	 * @return "NoticeList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/komea/bbs/QnaList.do")
	public String QnaList(@ModelAttribute("bbs") KomeabbsVO bbsVO, ModelMap model) throws Exception {

	       // currentPageNo : 현재 페이지 번호
	       // recordCountPerPage : 한 페이지당 게시되는 게시물 건 수 (=pageUnit)
	       // pageSize : 페이지 리스트에 게시되는 페이지 건수
	       // totalRecordCount : 전체 게시물 건 수
	       // pageUnit과 pageSize는 context-properties.xml에서 설정
	               
		   bbsVO.setPageUnit(propertiesService.getInt("pageUnit"));
		   bbsVO.setPageSize(propertiesService.getInt("pageSize"));
	       
	       PaginationInfo paginationInfo = new PaginationInfo();
	       
	       paginationInfo.setCurrentPageNo(bbsVO.getPageIndex());
	       paginationInfo.setRecordCountPerPage(bbsVO.getPageUnit());
	       paginationInfo.setPageSize(bbsVO.getPageSize());
	       
	       bbsVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
	       bbsVO.setLastIndex(paginationInfo.getLastRecordIndex());
	       bbsVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
	       
	       int totCnt = komeaBoardService.SelectQnaListTotCnt(bbsVO);
	       paginationInfo.setTotalRecordCount(totCnt);
	   
	       model.addAttribute("paginationInfo", paginationInfo);
	       
	       // 검색조건과 키워드로 부서목록조회
	       List<KomeabbsVO> resultList = komeaBoardService.SelectQnaList(bbsVO);
	       model.addAttribute("resultList", resultList);
	       
		   model.addAttribute("mnCd", "mn09");
		   model.addAttribute("mnNm", "열린제안");
	       
		return "komea/bbs/QnaList";
	}
	
	/**
	 * Write
	 * @param model
	 * @return "show/InfoCenter/Write"
	 * @exception Exception
	 */
	@RequestMapping(value = "/komea/bbs/QnaWrite.do")
	public String QnaWrite(@ModelAttribute("bbs") KomeabbsVO bbsVO, ModelMap model) throws Exception {
		
		model.addAttribute("mnCd", "mn09");
		model.addAttribute("mnNm", "열린제안");
		
		return "komea/bbs/QnaWrite";
	}
	
	/**
	 * pwCheck
	 * @param model
	 * @return "show/InfoCenter/Write"
	 * @exception Exception
	 */
	@RequestMapping(value = "/komea/bbs/QnaPwCheck.do")
	public String QnaPwCheck(@ModelAttribute("bbs") KomeabbsVO bbsVO, ModelMap model) throws Exception {
		bbsVO = komeaBoardService.SelectQnaView(bbsVO);
		model.addAttribute("bbs", bbsVO);
		
		model.addAttribute("mnCd", "mn09");
		model.addAttribute("mnNm", "열린제안");
		
		return "komea/bbs/QnaViewCheck";
	}
	
	/**
	 * 열린제안 패스워드 체크
	 */
	@RequestMapping(value="/komea/bbs/PwCheck.do")
	public View PwCheck(int idx, int gulIdx, int srsn, ModelMap model) throws Exception{
		KomeabbsVO bbsVO = new KomeabbsVO();
		bbsVO.setIdx(idx);;
		bbsVO.setGulIdx(gulIdx);
		bbsVO.setSrsn(srsn);
		bbsVO = komeaBoardService.SelectQnaView(bbsVO);
	    model.addAttribute("data", bbsVO);
	     
	    return jsonview;
	}	
	
	/**
	 * View
	 * @param model
	 * @return "show/InfoCenter/Write"
	 * @exception Exception
	 */
	@RequestMapping(value = "/komea/bbs/QnaView.do")
	public String QnaView(@ModelAttribute("bbs") KomeabbsVO bbsVO, ModelMap model) throws Exception {
		bbsVO = komeaBoardService.SelectQnaView(bbsVO);
		model.addAttribute("bbs", bbsVO);
		
		if(bbsVO.getContents() != null){
			String str1 = bbsVO.getContents();
			str1 = str1.replaceAll("\n","<br/>");
			model.addAttribute("Contents",str1);
		}
		
		int totCnt = komeaBoardService.SelectQnaReplyTotCnt(bbsVO);
		model.addAttribute("ReplyTotCnt", totCnt);
		
		model.addAttribute("mnCd", "mn09");
		model.addAttribute("mnNm", "열린제안");
		
		return "komea/bbs/QnaView";
	}
	
	/**
	 * Edit
	 * @param model
	 * @return "show/InfoCenter/Write"
	 * @exception Exception
	 */
	@RequestMapping(value = "/komea/bbs/QnaEdit.do")
	public String QnaEdit(@ModelAttribute("bbs") KomeabbsVO bbsVO, ModelMap model) throws Exception {
		
		bbsVO = komeaBoardService.SelectQnaView(bbsVO);
		model.addAttribute("bbs", bbsVO);
		
		model.addAttribute("mnCd", "mn09");
		model.addAttribute("mnNm", "열린제안");
		
		return "komea/bbs/QnaEdit";
	}

	/**
	 * Insert
	 * @param model
	 * @return "/show/InfoCenter/InsertBoard.do"
	 * @exception Exception
	 */
	@SuppressWarnings("finally")
	@RequestMapping(value = "/komea/bbs/InsertQnaBoard.do")
	public String InsertQnaBoard(@ModelAttribute("bbs") KomeabbsVO bbsVO, ModelMap model) throws Exception {
		try{
			komeaBoardService.InsertQnaBoard(bbsVO);
		}catch(Exception e){
			log.debug("InsertQnaBoard Exception : "+ e.getMessage());
			model.addAttribute("msg", "입력에 실패하였습니다.");
			model.addAttribute("url", "/komea/bbs/QnaList.do");
			return "redirect";
		}
		return "redirect:/komea/bbs/QnaList.do";
	}
	
	/**
	 * Update
	 * @param model
	 * @return "/show/InfoCenter/UpdateBoard.do"
	 * @exception Exception
	 */
	@SuppressWarnings("finally")
	@RequestMapping(value = "/komea/bbs/UpdateQnaBoard.do")
	public String UpdateQnaBoard(@ModelAttribute("bbs") KomeabbsVO bbsVO, ModelMap model) throws Exception {
		try{
			komeaBoardService.UpdateQnaBoard(bbsVO);
		}catch(Exception e){
			log.debug("UpdateBoard Exception : "+ e.getMessage());
			model.addAttribute("msg", "수정에 실패하였습니다.");
			model.addAttribute("url", "/komea/bbs/QnaList.do");
			return "redirect";
		}
		return "redirect:/komea/bbs/QnaList.do";
	}
	
	/**
	 * Delete
	 * @param model
	 * @return "/show/InfoCenter/DeleteBoard.do"
	 * @exception Exception
	 */
	@SuppressWarnings("finally")
	@RequestMapping(value = "/komea/bbs/DeleteQnaBoard.do")
	public String DeleteQnaBoard(@ModelAttribute("bbs") KomeabbsVO bbsVO, ModelMap model) throws Exception {
		try{
			komeaBoardService.DeleteQnaBoard(bbsVO);
		}catch(Exception e){
			log.debug("DeleteBoard Exception : "+ e.getMessage());
			model.addAttribute("msg", "삭제에 실패하였습니다.");
			model.addAttribute("url", "/komea/bbs/QnaList.do");
			return "redirect";
		}
		return "redirect:/komea/bbs/QnaList.do";
	}
	
	/**
	 * 열린제안 답변 Write
	 * @param model
	 * @return "show/InfoCenter/Write"
	 * @exception Exception
	 */
	@RequestMapping(value = "/komea/bbs/QnaReplyWrite.do")
	public String QnaReplyWrite(@ModelAttribute("bbs") KomeabbsVO bbsVO, ModelMap model) throws Exception {
		
		bbsVO = komeaBoardService.SelectQnaView(bbsVO);
		model.addAttribute("bbs", bbsVO);
		
		model.addAttribute("mnCd", "mn09");
		model.addAttribute("mnNm", "열린제안");
		
		return "komea/bbs/QnaReplyWrite";
	}
	
	/**
	 * 열린제안 답변 Insert
	 * @param model
	 * @return "/show/InfoCenter/InsertBoard.do"
	 * @exception Exception
	 */
	@SuppressWarnings("finally")
	@RequestMapping(value = "/komea/bbs/InsertQnaReplyBoard.do")
	public String InsertQnaReplyBoard(@ModelAttribute("bbs") KomeabbsVO bbsVO, ModelMap model) throws Exception {
		try{
			komeaBoardService.InsertQnaReplyBoard(bbsVO);
		}catch(Exception e){
			log.debug("InsertQnaReplyBoard Exception : "+ e.getMessage());
			model.addAttribute("msg", "입력에 실패하였습니다.");
			model.addAttribute("url", "/komea/bbs/QnaList.do");
			return "redirect";
		}
		return "redirect:/komea/bbs/QnaList.do";
	}
	
	/**
	 * B011, B012 : 뉴스(국문)/(영문) 팝업 내용
	 */
	@RequestMapping(value="/koema/BbsPopup.do")
	public String BbsPopup(@ModelAttribute("bbs") KomeabbsVO bbsVO, BindingResult bindingResult, ModelMap model) throws Exception {

		komeaBoardService.UpdateKomeaBoardCnt(bbsVO);
		
		bbsVO = komeaBoardService.SelectKomeaView(bbsVO);
		model.addAttribute("bbsVO", bbsVO);
		
		if(bbsVO.getContents() != null){
			String str1 = bbsVO.getContents();
			str1 = str1.replaceAll("\n","<br/>");
			model.addAttribute("Contents",str1);
		}
		
        List<KomeabbsVO> uploadFileList = komeaBoardService.SelectKomeaFileList(bbsVO);
        model.addAttribute("uploadFileList", uploadFileList);
		
		return "komea/popup/BbsPopup";
	}
}
