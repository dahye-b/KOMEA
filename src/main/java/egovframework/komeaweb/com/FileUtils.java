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

import egovframework.komea.bbs.service.KomeabbsVO;

@Component
public class FileUtils {
	private static Logger log = Logger.getLogger(FileUtils.class);
	
	public static List<Map<String,Object>> komeaFileUpload(KomeabbsVO bbsVO, HttpServletRequest request) throws Exception{
		/** BBS_CM 파일업로드
		B001 : 공지사항 : 			/_UploadData/0405010000/
		B002 : 간행물 : 			/_UploadData/0404030000/
		B007 : Komea뉴스레터 : 	/_UploadData/0404040000/
		B008 : Komea영문뉴스레터 : /_UploadData/0404090000/
		B009 : 보도자료			/_UploadData/0404100000/
		B010 : 사업공고 : 			/_UploadData/0405020000/
		B011 : 뉴스(국문) : 		/_UploadData/0405040000/
		B012 : News(영문) : 		/_UploadData/0405050000/
		B013 : 거점기지 산업동향 정보 : 		/_UploadData/0405060000/
		B014 : 거점기지 프로젝트 정보 : 		/_UploadData/0405070000/
		 */
		String filePath = "/komeaweb/tomcat/webapps/ROOT";
		String dir ="";
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		MultipartFile multipartFile = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;
		/*bbsVO	값 세팅 */
		String tname = bbsVO.getBoardGb();
		String bCode = bbsVO.getbCode();
		int gulIdx = bbsVO.getIdx();
		
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
		}
		
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		Map<String,Object> listMap = null;
		while(iterator.hasNext()){
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());
			if(!multipartFile.isEmpty()){
				originalFileName = multipartFile.getOriginalFilename();
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
				storedFileName = CommonUtils.getRandomString() + originalFileExtension;
				multipartFile.transferTo(new File(filePath + dir + storedFileName));
				
				listMap = new HashMap<String,Object>();
				listMap.put("tname", tname);
				listMap.put("bCode", bCode);
				listMap.put("gulIdx", gulIdx);
				listMap.put("fNo", multipartFile.getName().substring(4, 5));
				listMap.put("fNm", multipartFile.getOriginalFilename());
				listMap.put("fSnm", storedFileName);
				listMap.put("fPath", dir);
				listMap.put("fSize", multipartFile.getSize());
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
	public static List<Map<String,Object>> mberFileUpload(String mberCd, HttpServletRequest request) throws Exception{
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
				
				listMap.put("mberCd", mberCd);
				if(inputName.equals("fileNm")){
					listMap.put("col_1", "file_nm");
					listMap.put("fileNm", multipartFile.getOriginalFilename());
					listMap.put("col_2", "file_cours");
					listMap.put("fileCours", "/upload/" + storedFileName);
				}else if(inputName.equals("fileNm2")){
					listMap.put("col_1", "file_nm2");
					listMap.put("fileNm", multipartFile.getOriginalFilename());
					listMap.put("col_2", "file_cours2");
					listMap.put("fileCours", "/upload/" + storedFileName);
				}else if(inputName.equals("fileNm3")){
					listMap.put("col_1", "file_nm3");
					listMap.put("fileNm", multipartFile.getOriginalFilename());
					listMap.put("col_2", "file_cours3");
					listMap.put("fileCours", "/upload/" + storedFileName);
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
	
	public static List<Map<String,Object>> bannerFileUpload(int bannerNo, HttpServletRequest request) throws Exception{
		String filePath = "/komeaweb/tomcat/webapps/ROOT/banner/";
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		MultipartFile multipartFile = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;
		
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
				
				listMap.put("bannerNo", bannerNo);
				listMap.put("bannerFile", multipartFile.getOriginalFilename());
				listMap.put("bannerFilePath", "/banner/" + storedFileName);
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
	
	public static List<Map<String,Object>> buyerFileUpload(String buyerCd, HttpServletRequest request) throws Exception{
		String filePath = "/komeaweb/tomcat/webapps/ROOT/buyer/";
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		MultipartFile multipartFile = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;
		
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
				
				listMap.put("buyerCd", buyerCd);
				listMap.put("buyerFile", multipartFile.getOriginalFilename());
				listMap.put("catalFilePath1", filePath);
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
	
    public static void FileDelete(String fileNm) throws Exception{
    	String FILEPATH = "/komeaweb/tomcat/webapps/ROOT/komeaFile/";
        
        File file = new File(FILEPATH, fileNm);
        if(file.exists()){
            if(file.delete()){
                //System.out.println(juVO.getFileNm()+"파일삭제 성공");
            	log.debug(fileNm+"파일삭제 성공");
            }else{
                //System.out.println(juVO.getFileNm()+"파일삭제 실패");
            	log.debug(fileNm+"파일삭제 실패");
            }
        }
    }
}
