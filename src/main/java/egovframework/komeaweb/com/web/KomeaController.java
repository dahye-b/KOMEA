package egovframework.komeaweb.com.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.View;

import egovframework.komea.bbs.service.KomeaBoardService;
import egovframework.komea.bbs.service.KomeabbsVO;
import egovframework.komea.comp.service.KomeaCompService;
import egovframework.komea.comp.service.KomeaCompVO;
import egovframework.komeaweb.com.service.BannerService;
import egovframework.komeaweb.com.service.BannerVO;
import egovframework.komeaweb.com.service.DisplayService;
import egovframework.komeaweb.com.service.PopupService;
import egovframework.komeaweb.com.service.PopupVO;
import egovframework.komeaweb.com.service.ShowVO;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class KomeaController {

    @Resource(name = "komeaCompService")
    private KomeaCompService komeaCompService;
 
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
	
    @Resource(name = "komeaBoardService")
    private KomeaBoardService komeaBoardService;
    
    @Resource(name = "bannerService")
    private BannerService bannerService;
    
    @Resource(name = "popupService")
    private PopupService popupService;
    
    @Resource(name = "displayService")
    private DisplayService displayService;
    
    @Autowired
    private View jsonview;
	
	/**
	 * Komea Main
	 * @param model
	 * @return "komeaMain"
	 * @exception Exception
	 */
	@RequestMapping(value = "/komeaMain.do")
	public String komeaMain(ModelMap model) throws Exception {
		
		KomeabbsVO bbsVO = new KomeabbsVO();
		
		//방문자수 업데이트
		int totCnt = komeaBoardService.SelectLogTotCnt(bbsVO);
		if(totCnt == 0){
			komeaBoardService.InsertLogCnt(bbsVO);
		}else{
			komeaBoardService.UpdateLogCnt(bbsVO);
		}
		
		int visitCnt = komeaBoardService.SelectVisitTotCnt(bbsVO);
		model.addAttribute("visitCnt", visitCnt);
		
		//1. 공지사항 4건
		bbsVO.setbCode("B001");
        List<KomeabbsVO> B001List = komeaBoardService.SelectKomeaMainList(bbsVO);
        model.addAttribute("B001List", B001List);
        
		//2. 전시행사 4건
		//bbsVO.setbCode("B002");
        ShowVO showVO = new ShowVO();
        List<ShowVO> B002List = displayService.SelectKomeaMainExbiList(showVO);
        model.addAttribute("B002List", B002List);
        
		//3. 보도자료 4건
		bbsVO.setbCode("B009");
        List<KomeabbsVO> B003List = komeaBoardService.SelectKomeaMainList(bbsVO);
        model.addAttribute("B003List", B003List);
        
		//4. 사업공고 4건
		bbsVO.setbCode("B010");
        List<KomeabbsVO> B004List = komeaBoardService.SelectKomeaMainList(bbsVO);
        model.addAttribute("B004List", B004List);
        
        //배너
        BannerVO bannerVO = new BannerVO();
        List<BannerVO> BannerList = bannerService.SelectMainBannerList(bannerVO);
        model.addAttribute("BannerList", BannerList);
        
        //전시행사 1건
        showVO = displayService.SelectKomeaMainExbiInfo(showVO);
        model.addAttribute("ExbiInfo", showVO);

        //상담행사 1건
        showVO = displayService.SelectKomeaMainCnsltInfo(showVO);
        model.addAttribute("CnsltInfo", showVO);
        
        model.addAttribute("mnCd", "main");
		model.addAttribute("mnNm", "main");
        
		return "komea/komeaMain";
	}
	

	/**
	 * 메인(팝업)
	 */
	@RequestMapping(value="/koema/SelectPopupList.do")
	public View SelectPopupList(@ModelAttribute("popup") PopupVO popupVO, ModelMap model) throws Exception{
		List<PopupVO> result = popupService.SelectMainPopupList(popupVO);
	
		model.addAttribute("data", result);
	 
	return jsonview;
	}

	/**
	 * 메인(팝업) 내용
	 */
	@RequestMapping(value="/koema/MainPopup.do")
	public String MainPopup(@ModelAttribute("popup") PopupVO popupVO, 
			@RequestParam(value="popupNo", required=false) int popupNo, ModelMap model) throws Exception{
		
		popupVO.setPopupNo(popupNo);
		popupVO = popupService.SelectPopupView(popupVO);
		model.addAttribute("popupVO", popupVO);

		return "komea/popup/popupForm";
	}
	
	/**
	 * Mn01 : 조합원사
	 * Mn0101 : 비전
	 * @param model
	 * @exception Exception
	 */
	@RequestMapping(value = "/komea/mn0101.do")
	public String mn0101(ModelMap model) throws Exception {
		model.addAttribute("mnCd", "mn01");
		model.addAttribute("mnNm", "비전");
		return "komea/mn01/mn0101";
	}
	
	/**
	 * Mn01 : 조합원사
	 * Mn0102 : 인사말
	 * @param model
	 * @exception Exception
	 */
	@RequestMapping(value = "/komea/mn0102.do")
	public String mn0102(ModelMap model) throws Exception {
		model.addAttribute("mnCd", "mn01");
		model.addAttribute("mnNm", "인사말");
		return "komea/mn01/mn0102";
	}
	
	/**
	 * Mn01 : 조합원사
	 * Mn0103 : 연혁
	 * @param model
	 * @exception Exception
	 */
	@RequestMapping(value = "/komea/mn0103.do")
	public String mn0103(ModelMap model) throws Exception {
		model.addAttribute("mnCd", "mn01");
		model.addAttribute("mnNm", "연혁");
		return "komea/mn01/mn0103";
	}
	
	/**
	 * Mn01 : 조합원사
	 * Mn0104 : 조직도
	 * @param model
	 * @exception Exception
	 */
	@RequestMapping(value = "/komea/mn0104.do")
	public String mn0104(ModelMap model) throws Exception {
		model.addAttribute("mnCd", "mn01");
		model.addAttribute("mnNm", "조직도");
		return "komea/mn01/mn0104";
	}
	
	/**
	 * Mn01 : 조합원사 
	 * Mn0104 : 조직도 팝업
	 * @param model
	 * @exception Exception
	 */
	@RequestMapping(value = "/komea/mn0104Popup.do")
	public String mn0104Popup(ModelMap model) throws Exception {
		return "komea/mn01/mn0104Popup";
	}
	
	/**
	 * Mn01 : 조합원사
	 * Mn0105 : 오시는길
	 * @param model
	 * @exception Exception
	 */
	@RequestMapping(value = "/komea/mn0105.do")
	public String mn0105(ModelMap model) throws Exception {
		model.addAttribute("mnCd", "mn01");
		model.addAttribute("mnNm", "오시는길");
		return "komea/mn01/mn0105";
	}
	
	/**
	 * Mn02 : 조합원사
	 * Mn0201 : 가입안내
	 * @param model
	 * @exception Exception
	 */
	@RequestMapping(value = "/komea/mn0201.do")
	public String mn0201(ModelMap model) throws Exception {
		model.addAttribute("mnCd", "mn02");
		model.addAttribute("mnNm", "가입안내");
		return "komea/mn02/mn0201";
	}

	/**
	 * Mn02 : 조합원사
	 * Mn0202 : 조합원사
	 * @param model
	 * @exception Exception
	 */
	@RequestMapping(value = "/komea/mn0202.do")
	public String mn0202(@ModelAttribute("comp") KomeaCompVO compVO, ModelMap model) throws Exception {
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
       model.addAttribute("mnCd", "mn02");
       model.addAttribute("mnNm", "조합원사");
		
		return "komea/mn02/mn0202";
	}
	

	/**
	 * Mn02 : 조합원사
	 * Mn0202Excel : 조합원사목록 엑셀저장
	 * @param model
	 * @exception Exception
	 */
	@RequestMapping(value = "/komea/mn0202Excel.do")
	public String mn0202Excel(@ModelAttribute("comp") KomeaCompVO compVO, ModelMap model) throws Exception {
		
		PaginationInfo paginationInfo = new PaginationInfo();
      
       int totCnt = komeaCompService.SelectCompListTotCnt(compVO);
       paginationInfo.setTotalRecordCount(totCnt);

       compVO.setFirstIndex(0);
       compVO.setRecordCountPerPage(totCnt);
   
       model.addAttribute("paginationInfo", paginationInfo);
       
       // 검색조건과 키워드로 부서목록조회
       List<KomeaCompVO> resultBoardList = komeaCompService.SelectCompList(compVO);
       model.addAttribute("resultList", resultBoardList);
		
		return "komea/mn02/mn0202Excel";
	}
	
	/**
	 * Mn02 : 조합원사
	 * Mn0202 : 조합원사 View
	 * @param model
	 * @exception Exception
	 */
	@RequestMapping(value = "/komea/mn020201.do")
	public String mn0202View(@ModelAttribute("comp") KomeaCompVO compVO, ModelMap model) throws Exception {
		
		compVO = komeaCompService.SelectCompView(compVO);
		model.addAttribute("compVO", compVO);
		model.addAttribute("mnCd", "mn02");
		model.addAttribute("mnNm", "조합원사");
        
		return "komea/mn02/mn0202View";
	}

	/**
	 * Mn03 : 사업소개
	 * Mn0301 : 권익도모
	 * @param model
	 * @exception Exception
	 */
	@RequestMapping(value = "/komea/mn0301.do")
	public String mn0301(ModelMap model) throws Exception {
		model.addAttribute("mnCd", "mn03");
		model.addAttribute("mnNm", "권익도모");
		return "komea/mn03/mn0301";
	}

	/**
	 * Mn03 : 사업소개
	 * Mn0301 : 정보공유
	 * @param model
	 * @exception Exception
	 */
	@RequestMapping(value = "/komea/mn0302.do")
	public String mn0302(ModelMap model) throws Exception {
		model.addAttribute("mnCd", "mn03");
		model.addAttribute("mnNm", "정보공유");
		return "komea/mn03/mn0302";
	}

	/**
	 * Mn03 : 사업소개
	 * Mn0303 : 코마린전시회
	 * @param model
	 * @exception Exception
	 */
	@RequestMapping(value = "/komea/mn0303.do")
	public String mn0303(ModelMap model) throws Exception {
		model.addAttribute("mnCd", "mn03");
		model.addAttribute("mnNm", "코마린전시회");
		return "komea/mn03/mn0303";
	}

	/**
	 * Mn03 : 사업소개
	 * Mn0304 : 공제사업
	 * @param model
	 * @exception Exception
	 */
	@RequestMapping(value = "/komea/mn0304.do")
	public String mn0304(ModelMap model) throws Exception {
		model.addAttribute("mnCd", "mn03");
		model.addAttribute("mnNm", "공제사업");
		return "komea/mn03/mn0304";
	}

	/**
	 * Mn03 : 사업소개
	 * Mn0305 : 공동구매
	 * @param model
	 * @exception Exception
	 */
	@RequestMapping(value = "/komea/mn0305.do")
	public String mn0305(ModelMap model) throws Exception {
		model.addAttribute("mnCd", "mn03");
		model.addAttribute("mnNm", "공동구매");
		return "komea/mn03/mn0305";
	}

	/**
	 * Mn03 : 사업소개
	 * Mn0306 : 조선기자재수출 및 A/S 거점기지 구축 및 운영
	 * @param model
	 * @exception Exception
	 */
	@RequestMapping(value = "/komea/mn0306.do")
	public String mn0306(ModelMap model) throws Exception {
		model.addAttribute("mnCd", "mn03");
		model.addAttribute("mnNm", "조선기자재수출 및 A/S 거점기지 구축 및 운영");
		return "komea/mn03/mn0306";
	}

	/**
	 * Mn03 : 사업소개
	 * Mn0307 : 해양플랜트
	 * @param model
	 * @exception Exception
	 */
	@RequestMapping(value = "/komea/mn0307.do")
	public String mn0307(ModelMap model) throws Exception {
		model.addAttribute("mnCd", "mn03");
		model.addAttribute("mnNm", "해양플랜트 기자재수출 기반구축");
		return "komea/mn03/mn0307";
	}
	
	/**
	 * Mn07 : 자료실
	 * Mn0701 : 글로벌인증정보
	 * @param model
	 * @exception Exception
	 */
	@RequestMapping(value = "/komea/mn0701.do")
	public String mn0701(ModelMap model) throws Exception {
		model.addAttribute("mnCd", "mn07");
		model.addAttribute("mnNm", "글로벌인증정보");
		return "komea/mn07/mn0701";
	}
	
	/**
	 * Mn08 : 자료실
	 * Mn0801 : 통계자료
	 * @param model
	 * @exception Exception
	 */
	@RequestMapping(value = "/komea/mn0801.do")
	public String mn0801(ModelMap model) throws Exception {
		model.addAttribute("mnCd", "mn08");
		model.addAttribute("mnNm", "통계자료");
		return "komea/mn08/mn0801";
	}
}
