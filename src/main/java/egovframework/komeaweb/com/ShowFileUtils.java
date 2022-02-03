package egovframework.komeaweb.com;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egovframework.komeaweb.com.service.ShowVO;

@Component
public class ShowFileUtils {
	private static Logger log = Logger.getLogger(ShowFileUtils.class);
	
	public static List<Map<String,Object>> ExbiFileUpload(ShowVO showVO, HttpServletRequest request) throws Exception{
		String filePath = "/komeaweb/tomcat/webapps/ROOT/upload/";
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		MultipartFile multipartFile = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;
		String inputName = null;
		
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		Map<String,Object> listMap = null;
		while(iterator.hasNext()){
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());
			if(!multipartFile.isEmpty()){
				originalFileName = multipartFile.getOriginalFilename();
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
				storedFileName = CommonUtils.getRandomString() + originalFileExtension;
				multipartFile.transferTo(new File(filePath + storedFileName));
				
				listMap = new HashMap<String,Object>();
				inputName = multipartFile.getName();
				
				listMap.put("insttMberCd", showVO.getMberCd());
				listMap.put("exbiCd", showVO.getExbiCd());
				listMap.put("updateUserId", showVO.getMberCd());
				if(inputName.equals("exbiPhotoFileNm1")){
					listMap.put("exbiPhotoFileNm1", multipartFile.getOriginalFilename());
					listMap.put("exbiPhotoFilePath1", "/upload/" + storedFileName);
				}else if(inputName.equals("exbiPhotoFileNm2")){
					listMap.put("exbiPhotoFileNm2", multipartFile.getOriginalFilename());
					listMap.put("exbiPhotoFilePath2", "/upload/" + storedFileName);
				}else if(inputName.equals("exbiPhotoFileNm3")){
					listMap.put("exbiPhotoFileNm3", multipartFile.getOriginalFilename());
					listMap.put("exbiPhotoFilePath3", "/upload/" + storedFileName);
				}else if(inputName.equals("opmtAcmsltImageFileNm")){
					listMap.put("opmtAcmsltImageFileNm", multipartFile.getOriginalFilename());
					listMap.put("opmtAcmsltImageFilePath", "/upload/" + storedFileName); 
				}else if(inputName.equals("opmtAcmsltDocFileNm")){
					listMap.put("opmtAcmsltDocFileNm", multipartFile.getOriginalFilename());
					listMap.put("opmtAcmsltDocFilePath", "/upload/" + storedFileName); 
				}else if(inputName.equals("partcptAcmsltDocFileNm")){
					listMap.put("partcptAcmsltDocFileNm", multipartFile.getOriginalFilename());
					listMap.put("partcptAcmsltDocFilePath", "/upload/" + storedFileName); 
				}else if(inputName.equals("opmtAcmsltImageFileNm2")){
					listMap.put("opmtAcmsltImageFileNm2", multipartFile.getOriginalFilename());
					listMap.put("opmtAcmsltImageFilePath2", "/upload/" + storedFileName); 
				}else if(inputName.equals("opmtAcmsltImageFileNm3")){
					listMap.put("opmtAcmsltImageFileNm3", multipartFile.getOriginalFilename());
					listMap.put("opmtAcmsltImageFilePath3", "/upload/" + storedFileName); 
				}else if(inputName.equals("opmtAcmsltImageFileNm4")){
					listMap.put("opmtAcmsltImageFileNm4", multipartFile.getOriginalFilename());
					listMap.put("opmtAcmsltImageFilePath4", "/upload/" + storedFileName); 
				}else if(inputName.equals("attcheFileNm")){
					listMap.put("attcheFileNm", multipartFile.getOriginalFilename()); 
					listMap.put("attcheFilePath", "/upload/" + storedFileName); 
				}else if(inputName.equals("attcheFileNm2")){
					listMap.put("attcheFileNm2", multipartFile.getOriginalFilename());
					listMap.put("attcheFilePath2", "/upload/" + storedFileName);
				}else if(inputName.equals("partcptAcmImageFileNm1")){
					listMap.put("partcptAcmImageFileNm1", multipartFile.getOriginalFilename()); 
					listMap.put("partcptAcmImageFilePath1", "/upload/" + storedFileName);
				}else if(inputName.equals("partcptAcmImageFileNm2")){
					listMap.put("partcptAcmImageFileNm2", multipartFile.getOriginalFilename()); 
					listMap.put("partcptAcmImageFilePath2", "/upload/" + storedFileName);
				}else if(inputName.equals("partcptAcmImageFileNm3")){
					listMap.put("partcptAcmImageFileNm3", multipartFile.getOriginalFilename()); 
					listMap.put("partcptAcmImageFilePath3", "/upload/" + storedFileName);
				}else if(inputName.equals("partcptAcmImageFileNm4")){
					listMap.put("partcptAcmImageFileNm4", multipartFile.getOriginalFilename()); 
					listMap.put("partcptAcmImageFilePath4", "/upload/" + storedFileName);
				}else if(inputName.equals("attcheFileNm3")){
					listMap.put("attcheFileNm3", multipartFile.getOriginalFilename()); 
					listMap.put("attcheFilePath3", "/upload/" + storedFileName);
				}else if(inputName.equals("floorPlanFileNm")){
					listMap.put("floorPlanFileNm", multipartFile.getOriginalFilename()); 
					listMap.put("floorPlanPath", "/upload/" + storedFileName);
				}
				log.debug("------------- file start -------------");
				log.debug("name : "+multipartFile.getName());
				log.debug("filename : "+multipartFile.getOriginalFilename());
				log.debug("size : "+multipartFile.getSize());
				log.debug("-------------- file end --------------\n");
				list.add(listMap);
			}
		}
		return list;
	}

	public static List<Map<String,Object>> CnsltFileUpload(ShowVO showVO, HttpServletRequest request) throws Exception{
		String filePath = "/komeaweb/tomcat/webapps/ROOT/upload/";
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		MultipartFile multipartFile = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;
		String inputName = null;
		
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		Map<String,Object> listMap = null;
		while(iterator.hasNext()){
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());
			if(!multipartFile.isEmpty()){
				originalFileName = multipartFile.getOriginalFilename();
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
				storedFileName = CommonUtils.getRandomString() + originalFileExtension;
				multipartFile.transferTo(new File(filePath + storedFileName));
				
				listMap = new HashMap<String,Object>();
				inputName = multipartFile.getName();
				
				listMap.put("insttMberCd", showVO.getMberCd());
				listMap.put("cnsltexhbCd", showVO.getCnsltexhbCd());
				listMap.put("updateUserId", showVO.getMberCd());
				if(inputName.equals("cnsltexhbPhotoFileNm1")){
					listMap.put("cnsltexhbPhotoFileNm1", multipartFile.getOriginalFilename()); 
					listMap.put("cnsltexhbPhotoFileCours1", "/upload/" + storedFileName); 
				}else if(inputName.equals("cnsltexhbPhotoFileNm2")){
					listMap.put("cnsltexhbPhotoFileNm2", multipartFile.getOriginalFilename()); 
					listMap.put("cnsltexhbPhotoFileCours2", "/upload/" + storedFileName);
				}else if(inputName.equals("cnsltexhbPhotoFileNm3")){
					listMap.put("cnsltexhbPhotoFileNm3", multipartFile.getOriginalFilename()); 
					listMap.put("cnsltexhbPhotoFileCours3", "/upload/" + storedFileName);
				}else if(inputName.equals("cnsltexhbAttchFileNm1")){
					listMap.put("cnsltexhbAttchFileNm1", multipartFile.getOriginalFilename()); 
					listMap.put("cnsltexhbAttchFileCours1", "/upload/" + storedFileName);
				}else if(inputName.equals("cnsltexhbPhotoFileNm4")){
					listMap.put("cnsltexhbPhotoFileNm4", multipartFile.getOriginalFilename()); 
					listMap.put("cnsltexhbPhotoFileCours4", "/upload/" + storedFileName);
				}else if(inputName.equals("cnsltexhbAttchFileNm2")){
					listMap.put("cnsltexhbAttchFileNm2", multipartFile.getOriginalFilename()); 
					listMap.put("cnsltexhbAttchFileCours2", "/upload/" + storedFileName);
				}else if(inputName.equals("cnsltexhbAttchFileNm3")){
					listMap.put("cnsltexhbAttchFileNm3", multipartFile.getOriginalFilename()); 
					listMap.put("cnsltexhbAttchFileCours3", "/upload/" + storedFileName);
				}
				log.debug("------------- file start -------------");
				log.debug("name : "+multipartFile.getName());
				log.debug("filename : "+multipartFile.getOriginalFilename());
				log.debug("size : "+multipartFile.getSize());
				log.debug("-------------- file end --------------\n");
				list.add(listMap);
			}
		}
		return list;
	}
	
	public static List<Map<String,Object>> BbsFileUpload(ShowVO showVO, HttpServletRequest request) throws Exception{
		String filePath = "/komeaweb/tomcat/webapps/ROOT/upload/";
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		MultipartFile multipartFile = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;
		String inputName = null;
		
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		Map<String,Object> listMap = null;
		while(iterator.hasNext()){
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());
			if(!multipartFile.isEmpty()){
				originalFileName = multipartFile.getOriginalFilename();
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
				storedFileName = CommonUtils.getRandomString() + originalFileExtension;
				multipartFile.transferTo(new File(filePath + storedFileName));
				
				listMap = new HashMap<String,Object>();
				inputName = multipartFile.getName();
				
				listMap.put("bbsTy", showVO.getBbsTy());
				listMap.put("registNo", showVO.getRegistNo());
				listMap.put("updateUserId", showVO.getMberCd());
				if(inputName.equals("atchFileNm")){
					listMap.put("atchFileNm", multipartFile.getOriginalFilename()); 
					listMap.put("atchFileCours", "/upload/" + storedFileName); 
				}else if(inputName.equals("atchFileNm2")){
					listMap.put("atchFileNm2", multipartFile.getOriginalFilename()); 
					listMap.put("atchFileCours2", "/upload/" + storedFileName);
				}else if(inputName.equals("atchFileNm3")){
					listMap.put("atchFileNm3", multipartFile.getOriginalFilename()); 
					listMap.put("atchFileCours3", "/upload/" + storedFileName);
				}
				log.debug("------------- file start -------------");
				log.debug("name : "+multipartFile.getName());
				log.debug("filename : "+multipartFile.getOriginalFilename());
				log.debug("size : "+multipartFile.getSize());
				log.debug("-------------- file end --------------\n");
				list.add(listMap);
			}
		}
		return list;
	}
	
	public static List<Map<String,Object>> BiddingFileUpload(ShowVO showVO, HttpServletRequest request) throws Exception{
		String filePath = "/komeaweb/tomcat/webapps/ROOT/upload/";
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		MultipartFile multipartFile = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;
		String inputName = null;
		
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		Map<String,Object> listMap = null;
		while(iterator.hasNext()){
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());
			if(!multipartFile.isEmpty()){
				originalFileName = multipartFile.getOriginalFilename();
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
				storedFileName = CommonUtils.getRandomString() + originalFileExtension;
				multipartFile.transferTo(new File(filePath + storedFileName));
				
				listMap = new HashMap<String,Object>();
				inputName = multipartFile.getName();
				
				listMap.put("bbsTy", showVO.getBbsTy());
				listMap.put("registNo", showVO.getRegistNo());
				listMap.put("bbscttNo", showVO.getBbscttNo());
				listMap.put("mberCd", showVO.getMberCd());
				listMap.put("updateUserId", showVO.getMberCd());
				if(inputName.equals("bsnmRsctftFileNm")){
					listMap.put("bsnmRsctftFileNm", multipartFile.getOriginalFilename()); 
					listMap.put("bsnmRsctftFilePath", "/upload/" + storedFileName); 
				}else if(inputName.equals("biddingFileNm")){
					listMap.put("biddingFileNm", multipartFile.getOriginalFilename()); 
					listMap.put("biddingFilePath", "/upload/" + storedFileName);
				}else if(inputName.equals("etcFileNm")){
					listMap.put("etcFileNm", multipartFile.getOriginalFilename()); 
					listMap.put("etcFilePath", "/upload/" + storedFileName);
				}
				log.debug("------------- file start -------------");
				log.debug("name : "+multipartFile.getName());
				log.debug("filename : "+multipartFile.getOriginalFilename());
				log.debug("size : "+multipartFile.getSize());
				log.debug("-------------- file end --------------\n");
				list.add(listMap);
			}
		}
		return list;
	}
	
	public static List<Map<String,Object>> BestCompFileUpload(ShowVO showVO, HttpServletRequest request) throws Exception{
		String filePath = "/komeaweb/tomcat/webapps/ROOT/upload/";
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		MultipartFile multipartFile = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;
		String inputName = null;
		
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		Map<String,Object> listMap = null;
		while(iterator.hasNext()){
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());
			if(!multipartFile.isEmpty()){
				originalFileName = multipartFile.getOriginalFilename();
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
				storedFileName = CommonUtils.getRandomString() + originalFileExtension;
				multipartFile.transferTo(new File(filePath + storedFileName));
				
				listMap = new HashMap<String,Object>();
				inputName = multipartFile.getName();
				
				listMap.put("bbsTy", showVO.getBbsTy());
				listMap.put("registNo", showVO.getRegistNo());
				listMap.put("bbscttNo", showVO.getBbscttNo());
				listMap.put("mberCd", showVO.getMberCd());
				listMap.put("updateUserId", showVO.getMberCd());
				if(inputName.equals("applyFileNm")){
					listMap.put("applyFileNm", multipartFile.getOriginalFilename()); 
					listMap.put("applyFilePath", "/upload/" + storedFileName); 
				}else if(inputName.equals("mainProductFileNm")){
					listMap.put("mainProductFileNm", multipartFile.getOriginalFilename()); 
					listMap.put("mainProductFilePath", "/upload/" + storedFileName);
				}else if(inputName.equals("rsctftFileNm")){
					listMap.put("rsctftFileNm", multipartFile.getOriginalFilename()); 
					listMap.put("rsctftFilePath", "/upload/" + storedFileName);
				}else if(inputName.equals("careerFileNm")){
					listMap.put("careerFileNm", multipartFile.getOriginalFilename()); 
					listMap.put("careerFilePath", "/upload/" + storedFileName);
				}else if(inputName.equals("agreeFileNm")){
					listMap.put("agreeFileNm", multipartFile.getOriginalFilename()); 
					listMap.put("agreeFilePath", "/upload/" + storedFileName);
				}
				log.debug("------------- file start -------------");
				log.debug("name : "+multipartFile.getName());
				log.debug("filename : "+multipartFile.getOriginalFilename());
				log.debug("size : "+multipartFile.getSize());
				log.debug("-------------- file end --------------\n");
				list.add(listMap);
			}
		}
		return list;
	}
	

	public static List<Map<String,Object>> ExbiRequestFileUpload(ShowVO showVO, HttpServletRequest request) throws Exception{
		String filePath = "/komeaweb/tomcat/webapps/ROOT/upload/";
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		MultipartFile multipartFile = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;
		String inputName = null;
		
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		Map<String,Object> listMap = null;
		while(iterator.hasNext()){
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());
			if(!multipartFile.isEmpty()){
				originalFileName = multipartFile.getOriginalFilename();
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
				storedFileName = CommonUtils.getRandomString() + originalFileExtension;
				multipartFile.transferTo(new File(filePath + storedFileName));
				
				listMap = new HashMap<String,Object>();
				inputName = multipartFile.getName();

				listMap.put("insttMberCd", showVO.getInsttMberCd());				
				listMap.put("exbiCd", showVO.getExbiCd());
				listMap.put("entrprsMberCd", showVO.getEntrprsMberCd());
				if(inputName.equals("file1")){
					listMap.put("bsnmRsctftFileNm", multipartFile.getOriginalFilename()); 
					listMap.put("bsnmRsctftFilePath", "/upload/" + storedFileName); 
				}else if(inputName.equals("file2")){
					listMap.put("xportAcmsltFileNm", multipartFile.getOriginalFilename()); 
					listMap.put("xportAcmsltFilePath", "/upload/" + storedFileName);
				}else if(inputName.equals("file3")){
					listMap.put("partcptAmountFileNm", multipartFile.getOriginalFilename()); 
					listMap.put("partcptAmountFilePath", "/upload/" + storedFileName);
				}else if(inputName.equals("file4")){
					listMap.put("etcAtchFileNm", multipartFile.getOriginalFilename()); 
					listMap.put("etcAtchFilePath", "/upload/" + storedFileName);
				}
				log.debug("------------- file start -------------");
				log.debug("name : "+multipartFile.getName());
				log.debug("filename : "+multipartFile.getOriginalFilename());
				log.debug("size : "+multipartFile.getSize());
				log.debug("-------------- file end --------------\n");
				list.add(listMap);
			}
		}
		return list;
	}

	public static List<Map<String,Object>> CnsltRequestFileUpload(ShowVO showVO, HttpServletRequest request) throws Exception{
		String filePath = "/komeaweb/tomcat/webapps/ROOT/upload/";
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		MultipartFile multipartFile = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;
		String inputName = null;
		
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		Map<String,Object> listMap = null;
		while(iterator.hasNext()){
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());
			if(!multipartFile.isEmpty()){
				originalFileName = multipartFile.getOriginalFilename();
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
				storedFileName = CommonUtils.getRandomString() + originalFileExtension;
				multipartFile.transferTo(new File(filePath + storedFileName));
				
				listMap = new HashMap<String,Object>();
				inputName = multipartFile.getName();

				listMap.put("insttMberCd", showVO.getInsttMberCd());				
				listMap.put("cnsltexhbCd", showVO.getCnsltexhbCd());
				listMap.put("entrprsMberCd", showVO.getEntrprsMberCd());
				if(inputName.equals("file1")){
					listMap.put("bsnmRsctftFileNm", multipartFile.getOriginalFilename()); 
					listMap.put("bsnmRsctftFileCours", "/upload/" + storedFileName); 
				}else if(inputName.equals("file4")){
					listMap.put("prductCatlFileNm1", multipartFile.getOriginalFilename()); 
					listMap.put("prductCatlFileCours1", "/upload/" + storedFileName);
				}else if(inputName.equals("prductCatlFileNm2")){
					listMap.put("prductCatlFileNm2", multipartFile.getOriginalFilename()); 
					listMap.put("prductCatlFileCours2", "/upload/" + storedFileName);
				}else if(inputName.equals("file2")){
					listMap.put("basicProductFileNm", multipartFile.getOriginalFilename()); 
					listMap.put("basicProductFileCours", "/upload/" + storedFileName);
				}else if(inputName.equals("file3")){
					listMap.put("addProductFileNm", multipartFile.getOriginalFilename()); 
					listMap.put("addProductFileCours", "/upload/" + storedFileName);
				}else if(inputName.equals("file5")){
					listMap.put("etcFileNm", multipartFile.getOriginalFilename()); 
					listMap.put("etcFileCours", "/upload/" + storedFileName);
				}
				log.debug("------------- file start -------------");
				log.debug("name : "+multipartFile.getName());
				log.debug("filename : "+multipartFile.getOriginalFilename());
				log.debug("size : "+multipartFile.getSize());
				log.debug("-------------- file end --------------\n");
				list.add(listMap);
			}
		}
		return list;
	}
	
	public static List<Map<String,Object>> BiddingResultFileUpload(ShowVO showVO, HttpServletRequest request) throws Exception{
		String filePath = "/komeaweb/tomcat/webapps/ROOT/upload/";
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		MultipartFile multipartFile = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;
		String inputName = null;
		
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		Map<String,Object> listMap = null;
		while(iterator.hasNext()){
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());
			if(!multipartFile.isEmpty()){
				originalFileName = multipartFile.getOriginalFilename();
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
				storedFileName = CommonUtils.getRandomString() + originalFileExtension;
				multipartFile.transferTo(new File(filePath + storedFileName));
				
				listMap = new HashMap<String,Object>();
				inputName = multipartFile.getName();
				
				listMap.put("registNo", showVO.getRegistNo());
				listMap.put("bbscttNo", showVO.getBbscttNo());
				listMap.put("mberCd", showVO.getMberCd());
				listMap.put("updateUserId", showVO.getMberCd());
				if(inputName.equals("resultFileNm1")){
					listMap.put("resultFileNm1", multipartFile.getOriginalFilename()); 
					listMap.put("resultFilePath1", "/upload/" + storedFileName); 
				}else if(inputName.equals("resultFileNm2")){
					listMap.put("resultFileNm2", multipartFile.getOriginalFilename()); 
					listMap.put("resultFilePath2", "/upload/" + storedFileName);
				}
				log.debug("------------- file start -------------");
				log.debug("name : "+multipartFile.getName());
				log.debug("filename : "+multipartFile.getOriginalFilename());
				log.debug("size : "+multipartFile.getSize());
				log.debug("-------------- file end --------------\n");
				list.add(listMap);
			}
		}
		return list;
	}
}
