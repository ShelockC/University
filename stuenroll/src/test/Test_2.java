package test;

import java.io.FileInputStream;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class Test_2 {
	public static void main(String[] args){
		try{
			XSSFWorkbook workbook=new XSSFWorkbook(new FileInputStream("D:/test.xlsx"));
			XSSFSheet sheet=workbook.getSheet("员工通讯簿");
			int first=sheet.getFirstRowNum();//第一个有效的ROW行号
			int last=sheet.getLastRowNum();//最后一个有效的ROW行号
			for(int i=first;i<=last;i++){
				XSSFRow row=sheet.getRow(i);
				XSSFCell c1=row.getCell(0);
				XSSFCell c2=row.getCell(1);
				System.out.println(c1+","+c2);
			}
		} catch(Exception e){
			e.printStackTrace();
		}
	}

}
