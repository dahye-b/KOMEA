package egovframework.komeaweb.com.service;

import java.util.List;
import org.springframework.transaction.annotation.Transactional;

public interface CodeService
{

  public List<CodeVO> SelectCodeList(CodeVO codeVO) throws Exception;
  
  public int SelectCodeListTotCnt(CodeVO codeVO) throws Exception;
  
  @Transactional
  public void InsertCode(CodeVO codeVO) throws Exception;
  
  public CodeVO SelectCodeView(CodeVO codeVO) throws Exception;
  
  @Transactional
  public void UpdateCode(CodeVO codeVO) throws Exception;
  
  @Transactional
  public void DeleteCode(CodeVO codeVO) throws Exception;
  

}
