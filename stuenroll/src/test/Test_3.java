package test;

import java.io.FileInputStream;
import java.io.FileOutputStream;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class Test_3 {
	public static void main(String[] args){
		try{
			XSSFWorkbook workbook=new XSSFWorkbook(new FileInputStream("C:/培训专业名录.xlsx"));
            XSSFSheet sheet=workbook.getSheet("培训专业概况表");
            XSSFRow row =sheet.getRow(4);
            XSSFCell c1=row.getCell(2);
            c1.setCellValue("软件");
			workbook.write(new FileOutputStream("c:/培训专业目录.xlsx"));
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
