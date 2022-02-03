package egovframework.komeaweb.com.web;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import egovframework.komea.comp.service.KomeaCompService;
import egovframework.komeaweb.com.service.DisplayService;
import egovframework.komeaweb.com.service.MberService;
import egovframework.komeaweb.com.service.MberVO;
import egovframework.komeaweb.com.service.ReqCompService;
import egovframework.komeaweb.com.service.ShowVO;

@Controller
public class ComController {
	
    @Resource(name = "displayService")
    private DisplayService displayService;
	
    @Resource(name = "komeaCompService")
    private KomeaCompService komeaCompService;
    
	@Resource(name="mberService")
	private MberService mberService;
	
    @Resource(name = "reqCompService")
    private ReqCompService reqCompService;

	Logger log = Logger.getLogger(this.getClass());
	
	/**
     * KomeaBoard FilDownload(json)
	 */
    @RequestMapping(value="/komea/downloadFile.do")
    public void komeaDownloadFile(@ModelAttribute("show") ShowVO showVO, HttpServletResponse response) throws Exception{
        String storedFileName = showVO.getFilePath();
        String originalFileName = showVO.getFileNm();
        
    	System.out.println("------------- /komea/downloadFile.do -------------");
    	System.out.println("fileCours : "+"/komeaweb/tomcat/webapps/ROOT/"+storedFileName);
    	System.out.println("fileCours : "+showVO.getFilePath());
    	System.out.println("fileNm : "+showVO.getFileNm());
    	System.out.println("------------- /komea/downloadFile.do -------------");
        
        byte fileByte[] = FileUtils.readFileToByteArray(new File("/komeaweb/tomcat/webapps/ROOT/"+storedFileName));
         
        response.setContentType("application/octet-stream");
        response.setContentLength(fileByte.length);
        response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(originalFileName,"UTF-8")+"\";");
        response.setHeader("Content-Transfer-Encoding", "binary");
        response.getOutputStream().write(fileByte);
         
        response.getOutputStream().flush();
        response.getOutputStream().close();
    }
    
	/**
     * KomeaBoard FilDownload(json)
	 */
    @RequestMapping(value="/komea/fileDownloadFile.do")
    public void komeaShowDownloadFile(@RequestParam(value="filePath", defaultValue="N") String filePath,
    							      @RequestParam(value="originalFileName", defaultValue="N") String originalFileName, HttpServletResponse response) throws Exception{
    	
        byte fileByte[] = FileUtils.readFileToByteArray(new File("/komeaweb/tomcat/webapps/ROOT/"+filePath));
        
    	System.out.println("------------- /komea/fileDownloadFile.do -------------");
    	System.out.println("fileCours : "+filePath);
    	System.out.println("fileNm : "+originalFileName);
    	System.out.println("------------- /komea/fileDownloadFile.do -------------");
         
        response.setContentType("application/octet-stream");
        response.setContentLength(fileByte.length);
        response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(originalFileName,"UTF-8")+"\";");
        response.setHeader("Content-Transfer-Encoding", "binary");
        response.getOutputStream().write(fileByte);
         
        response.getOutputStream().flush();
        response.getOutputStream().close();
    }
    
	/**
	 * ckeditor에디터 파일 업로드 
	 * @param request
	 * @param response
	 * @param upload
	 * @return
	 */
    
	@RequestMapping(value = "/ckeditor/fileUpload.do", method = RequestMethod.POST)
	@ResponseBody
	public String ckeditorFileUpload(HttpServletRequest request, HttpServletResponse response, @RequestParam MultipartFile upload) {
 
        OutputStream out = null;
        PrintWriter printWriter = null;
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
 
        try{
 
            String fileName = upload.getOriginalFilename();
            
			// 파일 명 변경(uuid로 암호화) 
			String ext = fileName.substring(fileName.lastIndexOf('.'));
			
			// 확장자 
			String saveFileName = getUuid() + ext;
            
            byte[] bytes = upload.getBytes();
            String uploadPath = "/komeaweb/tomcat/webapps/ROOT/ckeditor/upload/" + saveFileName;//저장경로
 
            out = new FileOutputStream(new File(uploadPath));
            out.write(bytes);
            String callback = request.getParameter("CKEditorFuncNum");
            
            printWriter = response.getWriter();
            String fileUrl = "/ckeditor/upload/" + saveFileName;//url경로
            
            
            String strScript = "<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction("
                    + callback
                    + ",'"
                    + fileUrl
                    + "','이미지를 업로드 하였습니다.'"
                    + ");</script>";
            
            
            printWriter.println(strScript);
            printWriter.flush();
 
        }catch(IOException e){
            e.printStackTrace();
        } finally {
            try {
                if (out != null) {
                    out.close();
                }
                if (printWriter != null) {
                    printWriter.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
 
        return null;
    }
	
	//uuid생성 
	public static String getUuid() { 
		return UUID.randomUUID().toString().replaceAll("-", ""); 
	}	
	

	//참가업체신청서 엑셀저장 _ 전시
	@RequestMapping("/show/ExcelReqCompManageExbi.do")
	public String ExcelReqCompManageExbi (@ModelAttribute("show") ShowVO showVO, ModelMap model) throws Exception {

		MberVO mberVO = new MberVO();
	    mberVO.setMberCd(showVO.getEntrprsMberCd());
	    mberVO = mberService.SelectMberView(mberVO);
	    model.addAttribute("mberInfo", mberVO);

		//전시
		ShowVO showVO1;
		showVO1 = reqCompService.SelectExbiCompReq(showVO);
		model.addAttribute("ExbiCompReqInfo", showVO1);
		//model.addAttribute("ViewGb", "0");

		if(showVO1.getMfrcDspyPrduct() != null){
			String str1 = showVO1.getMfrcDspyPrduct();
			str1 = str1.replaceAll("\n","<br/>");
			model.addAttribute("MfrcDspyPrduct",str1);
		}

		return "komea/show/mn05/reqCompManageExcelExbi";
	}

	//참가업체신청서 엑셀저장 _ 상담
	@RequestMapping("/show/ExcelReqCompManageCnslt.do")
	public String ExcelReqCompManageCnslt (@ModelAttribute("show") ShowVO showVO, ModelMap model) throws Exception {

		MberVO mberVO = new MberVO();
	    mberVO.setMberCd(showVO.getEntrprsMberCd());
	    mberVO = mberService.SelectMberView(mberVO);
	    model.addAttribute("mberInfo", mberVO);

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
        
		//model.addAttribute("ViewGb", "1");

		return "komea/show/mn05/reqCompManageExcelCnslt";

	}
}
