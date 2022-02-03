package egovframework.komea.comp.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import egovframework.komea.comp.service.KomeaCompService;
import egovframework.komea.comp.service.KomeaCompVO;
import egovframework.komeaweb.com.ExcelCellRef;
import egovframework.komeaweb.com.ExcelFileType;

@Service("komeaCompService")
public class KomeaCompServiceImpl implements KomeaCompService {
 
    @Resource(name = "komeaCompMapper")
    private KomeaCompMapper komeaCompMapper;
 
    @Override
    public List<KomeaCompVO> SelectCompList(KomeaCompVO compVO) throws Exception {
        return komeaCompMapper.SelectCompList(compVO);
    }
 
    @Override
    public int SelectCompListTotCnt(KomeaCompVO compVO) throws Exception {
        return komeaCompMapper.SelectCompListTotCnt(compVO);
    }
    
    @Override
    public KomeaCompVO SelectCompView(KomeaCompVO compVO) throws Exception {
        return komeaCompMapper.SelectCompView(compVO);
    }
    
    @Transactional
    @Override
    public void InsertComp(KomeaCompVO compVO) throws Exception {
    	komeaCompMapper.InsertComp(compVO);
    }
    
    @Transactional
    @Override
    public void DeleteComp(KomeaCompVO compVO) throws Exception {
    	komeaCompMapper.DeleteComp(compVO);
    }
    
    @Transactional
    @Override
    public void DeleteCompId(KomeaCompVO compVO) throws Exception {
    	komeaCompMapper.DeleteCompId(compVO);
    }
    
    @Transactional
    @Override
    public void InsertMberComp(KomeaCompVO compVO) throws Exception {
    	komeaCompMapper.InsertMberComp(compVO);
    }
    
    @Transactional
    @Override
    public void UpdateCompArea(KomeaCompVO compVO) throws Exception {
    	komeaCompMapper.UpdateCompArea(compVO);
    }
    
    @Transactional
    @Override
    public void DeleteCompAll(KomeaCompVO compVO) throws Exception {
    	komeaCompMapper.DeleteCompAll(compVO);
    }
    
    @Transactional
    @Override
    public List<?> InsertCompExcelList(String fileName) throws Exception {
    	
    	Map<String, Object> map = new HashMap<String, Object>();
    	List<?> list = null;
    	
    	try{
    		Workbook wb = ExcelFileType.getWorkbook(fileName);
    		Sheet sheet = (Sheet)wb.getSheetAt(0);//첫번째 시트
    		
    		for(int i = sheet.getFirstRowNum()+1; i <= sheet.getLastRowNum(); i++){
    			Row row = sheet.getRow(i);
    			map.put("idx", ExcelCellRef.getValue(row.getCell(0)));
    			map.put("company", ExcelCellRef.getValue(row.getCell(1)));
    			map.put("ceo", ExcelCellRef.getValue(row.getCell(2)));
    			map.put("homepage", ExcelCellRef.getValue(row.getCell(3)));
    			map.put("tel", ExcelCellRef.getValue(row.getCell(4)));
    			map.put("ID", ExcelCellRef.getValue(row.getCell(5)));
    			map.put("area", ExcelCellRef.getValue(row.getCell(6)));
    			
    			komeaCompMapper.InsertCompExcelList(map);
    		}
    		
    	}catch(Exception e){
    		e.getMessage();
    	}
    	
    	return list;
    }
}
