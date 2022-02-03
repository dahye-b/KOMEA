package egovframework.komeaweb.com.service.impl;

import egovframework.komeaweb.com.service.CodeService;
import egovframework.komeaweb.com.service.CodeVO;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("codeService")
public class CodeServiceImpl implements CodeService {

  @Resource(name="codeMapper")
  private CodeMapper codeMapper;
    
  @Override
  public List<CodeVO> SelectCodeList(CodeVO codeVO) throws Exception{
    return codeMapper.SelectCodeList(codeVO);
  }

  @Override
  public int SelectCodeListTotCnt(CodeVO codeVO) throws Exception{
    return codeMapper.SelectCodeListTotCnt(codeVO);
  }
  
  @Transactional
  @Override
  public void InsertCode(CodeVO codeVO) throws Exception{
    codeMapper.InsertCode(codeVO);
  }
  
  @Override
  public CodeVO SelectCodeView(CodeVO codeVO) throws Exception{
    return codeMapper.SelectCodeView(codeVO);
  }
  
  @Transactional
  @Override
  public void UpdateCode(CodeVO codeVO) throws Exception{
    codeMapper.UpdateCode(codeVO);
  }
  
  @Transactional
  @Override
  public void DeleteCode(CodeVO codeVO) throws Exception{
    codeMapper.DeleteCode(codeVO);
  }

}
