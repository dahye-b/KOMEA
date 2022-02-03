package egovframework.komeaweb.com.service.impl;

import egovframework.komeaweb.com.service.CodeVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;
import java.util.List;

@Mapper("codeMapper")
public interface CodeMapper
{

  public List<CodeVO> SelectCodeList(CodeVO codeVO) throws Exception;
  
  public int SelectCodeListTotCnt(CodeVO codeVO) throws Exception;
  
  public void InsertCode(CodeVO codeVO) throws Exception;
  
  public CodeVO SelectCodeView(CodeVO codeVO) throws Exception;
  
  public void UpdateCode(CodeVO codeVO) throws Exception;
  
  public void DeleteCode(CodeVO codeVO) throws Exception;
  
}
