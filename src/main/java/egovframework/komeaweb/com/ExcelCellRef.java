package egovframework.komeaweb.com;

import java.text.SimpleDateFormat;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.util.CellReference;

public class ExcelCellRef {
	
	/*
	 * cell에 해당하는 column Name 가져옴
	 */
	public static String getName(Cell cell, int cellIndex){
		int cellNum = 0;
		
		if(cell != null){
			cellNum = cell.getColumnIndex();
		}else{
			cellNum = cellIndex;
		}
		
		return CellReference.convertNumToColString(cellNum);
	}
	
	public static String getValue(Cell cell){
		
       String value = null;
        if (cell == null)
            value = "";
        else {
            switch (cell.getCellType()) { // cell 타입에 따른 데이타 저장
            case Cell.CELL_TYPE_FORMULA:
                value = cell.getCellFormula();
                break;
            case Cell.CELL_TYPE_NUMERIC:
                if (DateUtil.isCellDateFormatted(cell)) {
                    // you should change this to your application date format
                    SimpleDateFormat objSimpleDateFormat = new SimpleDateFormat(
                            "yyyy-MM-dd");
                    value = ""
                            + objSimpleDateFormat.format(cell
                                    .getDateCellValue());
                } else {
                    value = ""
                            + String.format("%.0f",
                                    new Double(cell.getNumericCellValue()));
                }
                break;
            case Cell.CELL_TYPE_STRING:
                value = "" + cell.getStringCellValue();
                break;
            case Cell.CELL_TYPE_BLANK:
                // value=""+cell.getBooleanCellValue();
                value = "";
                break;
            case Cell.CELL_TYPE_ERROR:
                value = "" + cell.getErrorCellValue();
                break;
            default:
            }
        }
 
        return value.trim();
    }

}
