package egovframework.komea.comp.web;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.View;

import egovframework.komea.comp.service.KomeaCompService;
import egovframework.komea.comp.service.KomeaCompVO;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class KomeaCompController {
	Logger log = Logger.getLogger(this.getClass());
	
    @Resource(name = "komeaCompService")
    private KomeaCompService komeaCompService;
 
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
    
    @Autowired
    private View jsonview;
    
	/**
	 * List
	 * @param model
	 * @return "komea/comp/List"
	 * @exception Exception
	 */
	@RequestMapping(value = "/komea/comp/List.do")
	public String compList(@ModelAttribute("comp") KomeaCompVO compVO, ModelMap model) throws Exception {
       // currentPageNo : 현재 페이지 번호
       // recordCountPerPage : 한 페이지당 게시되는 게시물 건 수 (=pageUnit)
       // pageSize : 페이지 리스트에 게시되는 페이지 건수
       // totalRecordCount : 전체 게시물 건 수
       // pageUnit과 pageSize는 context-properties.xml에서 설정
               
	   compVO.setPageUnit(propertiesService.getInt("pageUnit"));
	   compVO.setPageSize(propertiesService.getInt("pageSize"));
       
       PaginationInfo paginationInfo = new PaginationInfo();
       
       paginationInfo.setCurrentPageNo(compVO.getPageIndex());
       paginationInfo.setRecordCountPerPage(compVO.getPageUnit());
       paginationInfo.setPageSize(compVO.getPageSize());
       
       compVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
       compVO.setLastIndex(paginationInfo.getLastRecordIndex());
       compVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
       
       int totCnt = komeaCompService.SelectCompListTotCnt(compVO);
       paginationInfo.setTotalRecordCount(totCnt);
   
       model.addAttribute("paginationInfo", paginationInfo);
       
       // 검색조건과 키워드로 부서목록조회
       List<KomeaCompVO> resultBoardList = komeaCompService.SelectCompList(compVO);
       model.addAttribute("resultList", resultBoardList);
		
		return "komea/comp/List";
	}
	

	/**
	 * List
	 * @param model
	 * @return "komea/comp/List"
	 * @exception Exception
	 */
	@RequestMapping(value = "/admin/compListExcel.do")
	public String AdmincompListExcel(@ModelAttribute("comp") KomeaCompVO compVO, ModelMap model) throws Exception {
		
		PaginationInfo paginationInfo = new PaginationInfo();
       
       int totCnt = komeaCompService.SelectCompListTotCnt(compVO);
       paginationInfo.setTotalRecordCount(totCnt);
	   
	   compVO.setFirstIndex(0);
       compVO.setRecordCountPerPage(totCnt);
       
       model.addAttribute("paginationInfo", paginationInfo);
       
       // 검색조건과 키워드로 부서목록조회
       List<KomeaCompVO> resultBoardList = komeaCompService.SelectCompList(compVO);
       model.addAttribute("resultList", resultBoardList);
		
		return "admin/comp/compListExcel";
	}
	
	/**
	 * View
	 * @param model
	 * @return "komea/cmop/View"
	 * @exception Exception
	 */
	@RequestMapping(value = "/komea/comp/View.do")
	public String compView(@ModelAttribute("comp") KomeaCompVO compVO, ModelMap model) throws Exception {
		
		compVO = komeaCompService.SelectCompView(compVO);
		model.addAttribute("compVO", compVO);
        
		return "komea/comp/View";
	}
	
	/**
	 * List
	 * @param model
	 * @return "komea/comp/List"
	 * @exception Exception
	 */
	@RequestMapping(value = "/admin/compList.do")
	public String AdmincompList(@ModelAttribute("comp") KomeaCompVO compVO, ModelMap model) throws Exception {
       // currentPageNo : 현재 페이지 번호
       // recordCountPerPage : 한 페이지당 게시되는 게시물 건 수 (=pageUnit)
       // pageSize : 페이지 리스트에 게시되는 페이지 건수
       // totalRecordCount : 전체 게시물 건 수
       // pageUnit과 pageSize는 context-properties.xml에서 설정
               
	   compVO.setPageUnit(propertiesService.getInt("pageUnit"));
	   compVO.setPageSize(propertiesService.getInt("pageSize"));
       
       PaginationInfo paginationInfo = new PaginationInfo();
       
       paginationInfo.setCurrentPageNo(compVO.getPageIndex());
       paginationInfo.setRecordCountPerPage(compVO.getPageUnit());
       paginationInfo.setPageSize(compVO.getPageSize());
       
       compVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
       compVO.setLastIndex(paginationInfo.getLastRecordIndex());
       compVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
       
       int totCnt = komeaCompService.SelectCompListTotCnt(compVO);
       paginationInfo.setTotalRecordCount(totCnt);
   
       model.addAttribute("paginationInfo", paginationInfo);
       
       // 검색조건과 키워드로 부서목록조회
       List<KomeaCompVO> resultBoardList = komeaCompService.SelectCompList(compVO);
       model.addAttribute("resultList", resultBoardList);
		
		return "admin/comp/compList";
	}
	
    /**
     * 조합원사 등록
     */
	/**
	 * Write
	 * @param model
	 * @return "admn/mber/Write"
	 * @exception Exception
	 */
	@RequestMapping(value = "/admin/compInput.do")
	public String compInput(@ModelAttribute("comp") KomeaCompVO compVO, ModelMap model) throws Exception {
		
		return "admin/comp/compInput";
	}
	
    @RequestMapping(value="/admin/InsertComp.do")
    public View InsertComp(@ModelAttribute("comp") KomeaCompVO compVO, ModelMap model) throws Exception{
		try{
			komeaCompService.InsertComp(compVO);
			model.addAttribute("msg", "OK");
		}catch(Exception ex){
			model.addAttribute("msg", "ERROR");
		}
        
    	return jsonview;
    }
    
    @RequestMapping(value="/admin/DeleteComp.do")
    public View DeleteComp(@ModelAttribute("comp") KomeaCompVO compVO, ModelMap model) throws Exception{
		try{
			komeaCompService.DeleteComp(compVO);
			model.addAttribute("msg", "OK");
		}catch(Exception ex){
			model.addAttribute("msg", "ERROR");
		}
        
    	return jsonview;
    }
    
    @RequestMapping(value="/admin/UpdateCompArea.do")
    public View UpdateCompArea(@ModelAttribute("comp") KomeaCompVO compVO, ModelMap model) throws Exception{
    	try{
    		komeaCompService.UpdateCompArea(compVO);
    		model.addAttribute("msg", "OK");
    	}catch(Exception ex){
    		model.addAttribute("msg", "ERROR");
    	}

    return jsonview;
    }
    
	/**
	 * 조합원사 엑셀 인서트 
	 * @param req
	 * @param rep
	 */
	@SuppressWarnings("finally")
	@RequestMapping(value = "/comp/fileUpload.do") // method = RequestMethod.GET 
	public String fileUpload(@ModelAttribute("comp") KomeaCompVO compVO, ModelMap model, HttpServletRequest req, HttpServletResponse rep) {
		
		//파일이 저장될 path 설정 
		String path = "/komeaweb/tomcat/webapps/ROOT/comp/";
		try { 
			// MultipartHttpServletRequest 생성 
			MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) req;
			Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
			MultipartFile multipartFile = null;
			String fieldName = "";
			
				while (iterator.hasNext()){
					fieldName = iterator.next(); 
					multipartFile = multipartHttpServletRequest.getFile(fieldName); 
					String origName; 
					origName = new String(multipartFile.getOriginalFilename().getBytes("8859_1"), "UTF-8");
					
					// 파일 명 변경(uuid로 암호화) 
					String ext = origName.substring(origName.lastIndexOf('.'));
					
					// 확장자 
					String saveFileName = getUuid() + ext;
					
					// 설정한 path에 파일저장 
					File serverFile = new File(path + File.separator + saveFileName); 
					multipartFile.transferTo(serverFile);
					
					//엑셀 insert
					try {
						komeaCompService.DeleteCompAll(compVO);
						komeaCompService.InsertCompExcelList(path + saveFileName);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
						model.addAttribute("msg", "입력에 실패하였습니다.");
						model.addAttribute("url", "/admin/compList.do");
						return "redirect";
					}
				} 
			} catch (UnsupportedEncodingException e) { 
				// TODO Auto-generated catch block 
				e.printStackTrace(); 
			}catch (IllegalStateException e) { 
				// TODO Auto-generated catch block
				e.printStackTrace(); 
			} catch (IOException e) { 
				// TODO Auto-generated catch block 
				e.printStackTrace(); 
			} 
		return "redirect:/admin/compList.do";
		} 
	
	//uuid생성 
	public static String getUuid() { 
		return UUID.randomUUID().toString().replaceAll("-", ""); 
	}
}
