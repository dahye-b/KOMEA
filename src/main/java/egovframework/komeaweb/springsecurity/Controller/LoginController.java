package egovframework.komeaweb.springsecurity.Controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.komeaweb.com.UserValidator;
import egovframework.komeaweb.com.service.MberService;
import egovframework.komeaweb.com.service.MberVO;

@Controller
public class LoginController {
	
	Logger log = Logger.getLogger(this.getClass());
	
    @Resource(name = "mberService")
    private MberService mberService;
    
	/**
	 * 로그인
	 * @param model
	 * @throws Exception
	 */
	@RequestMapping(value = "/komea/login.do")
	public String LoginPage(ModelMap model) throws Exception {
		
		return "komea/komeaLogin";
	}
	
	/**
	 * 회원가입 > 가입약관
	 * @param model
	 * @exception Exception
	 */
	@RequestMapping(value = "/komea/JoinInit.do")
	public String JoinInit(ModelMap model) throws Exception {
		
		return "/komea/join/JoinInit";
	}
	
	/**
	 * 회원가입 > 회원유형선택
	 * @param model
	 * @exception Exception
	 */
	@RequestMapping(value = "/komea/Join01.do")
	public String Join01(@ModelAttribute("mber") MberVO mberVO, ModelMap model) throws Exception {
		
		return "/komea/join/Join01";
	}
	
	/**
	 * 회원가입 > 입력화면(기업, 기관, 기타)
	 * @param model
	 * @exception Exception
	 */
	@RequestMapping(value = "/komea/Join02.do")
	public String Join02(@ModelAttribute("mber") MberVO mberVO, BindingResult bindingResult, 
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
		
		return "/komea/join/Join02";
	}
	
	/**
	 * Insert
	 * @param model
	 * @return "komea/JoinMber.do"
	 * @exception Exception
	 */
	@SuppressWarnings("finally")
	@RequestMapping(value = "/komea/JoinMber.do")
	public String JoinMber(@ModelAttribute("mber") MberVO mberVO, BindingResult bindingResult, ModelMap model, HttpServletRequest request) throws Exception {
		try{
			mberService.InsertMber(mberVO, request);
		}catch(Exception e){
			log.debug("JoinMber Exception : "+ e.getMessage());
			model.addAttribute("msg", "입력에 실패하였습니다.");
			model.addAttribute("url", "/komea/JoinInit.do");
			return "redirect";
		}
		return "redirect:/komea/Join03.do";
	}
	
	/**
	 * 회원가입 > 완료
	 * @param model
	 * @exception Exception
	 */
	@RequestMapping(value = "/komea/Join03.do")
	public String Join03(@ModelAttribute("mber") MberVO mberVO, ModelMap model) throws Exception {
		
		return "/komea/join/Join03";
	}
	
	/**
	 * 회원가입 > 아이디/패스워드 찾기
	 * @param model
	 * @exception Exception
	 */
	@RequestMapping(value = "/komea/FindInfo.do")
	public String FindInfo(ModelMap model) throws Exception {
		
		return "/komea/join/FindInfo";
	}
}
