package egovframework.komeaweb.com;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.web.servlet.view.document.AbstractXlsView;

public class ExcelReqCompManageCnslt extends AbstractXlsView {
	
	@Override
	protected void buildExcelDocument(Map<String,Object> model, Workbook wb, HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		String title = (String)model.get("Title");
		
		response.setHeader("Content-Disposition", "attachment; filename=\""+java.net.URLEncoder.encode(title, "UTF-8")+"\"'charset=\"UTF-8\"");
		
		//시트생성
		Sheet sheet1 = wb.createSheet(title);
		
		//스타일 
		CellStyle st = wb.createCellStyle();
		CellStyle sc = wb.createCellStyle();
		CellStyle sLeft = wb.createCellStyle();
		CellStyle sRight = wb.createCellStyle();
		CellStyle sCenter = wb.createCellStyle();
		
		//제목폰트 스타일
		Font tf = wb.createFont();
		tf.setFontName("맑은 고딕");
		tf.setFontHeightInPoints((short)15);
		tf.setBold(true);
		
		//제목 스타일
		st.setFont(tf);
		st.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		st.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		
		//컨텐츠폰트 스타일
		Font cf = wb.createFont();
		cf.setFontName("맑은 고딕");
		cf.setFontHeightInPoints((short)10);
		
		//컬럼 스타일
		sc.setFont(cf);
		st.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		st.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		sc.setFillPattern((short)1);
		sc.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.index);
		
		//Left 스타일
		sLeft.setFont(cf);
		sLeft.setAlignment(HSSFCellStyle.ALIGN_LEFT);
		
		//Right 스타일
		sRight.setFont(cf);
		sRight.setAlignment(HSSFCellStyle.ALIGN_RIGHT);
		
		//Center 스타일
		sCenter.setFont(cf);
		sCenter.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		
		//0row 제목
		Row rTitle = sheet1.createRow(0);
		rTitle.createCell(0).setCellValue(title);
		rTitle.getCell(0).setCellStyle(st);
	}

}
