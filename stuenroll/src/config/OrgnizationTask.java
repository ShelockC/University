package config;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.TimerTask;

import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.FontFamily;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.jfinal.plugin.activerecord.Record;

import dao.OrgnizationDao;

public class OrgnizationTask extends TimerTask {
	private OrgnizationDao orgnizationDao = (OrgnizationDao) Factory.getBean("OrgnizationDao");

	@Override
	public void run() {
		System.out.println("start");
		List<Record> list = orgnizationDao.analyse();
		try {
			XSSFWorkbook workbook = new XSSFWorkbook(new FileInputStream("C:/培训机构名录.xlsx"));
			XSSFSheet sheet = workbook.getSheetAt(0);
			// 每次输出之前都要删除已经存在统计的内容
			int last = sheet.getLastRowNum();
			for (int i = 4; i <= last; i++) {
				sheet.removeRow(sheet.getRow(i)); // 删除已经存在的统计行
			}

			XSSFCellStyle baseStyle = workbook.createCellStyle();
			baseStyle.setAlignment(HorizontalAlignment.CENTER);// 水平居中
			baseStyle.setVerticalAlignment(VerticalAlignment.CENTER);// 垂直居中

			XSSFFont font = workbook.createFont(); // 创建字体对象
			font.setFontName("微软雅黑");
			font.setFontHeightInPoints((short) 10);
			baseStyle.setFont(font);
			baseStyle.setBorderLeft((short) 1);
			baseStyle.setBorderRight((short) 1);
			baseStyle.setBorderTop((short) 1);
			baseStyle.setBorderBottom((short) 1);
			
			XSSFCellStyle s1 = (XSSFCellStyle) baseStyle.clone(); // 克隆配置
			s1.setBorderLeft(BorderStyle.MEDIUM);
			
			XSSFCellStyle s2 = (XSSFCellStyle) s1.clone(); // 克隆配置
			s2.setBorderBottom(BorderStyle.MEDIUM);
			
			XSSFCellStyle s3 = (XSSFCellStyle) baseStyle.clone(); // 克隆配置
			s3.setBorderBottom(BorderStyle.MEDIUM);
			
			XSSFCellStyle s4 = (XSSFCellStyle) baseStyle.clone(); // 克隆配置
			s4.setBorderRight(BorderStyle.MEDIUM);
			
			XSSFCellStyle s5 = (XSSFCellStyle) s3.clone(); // 克隆配置
			s4.setBorderRight(BorderStyle.MEDIUM);
			
			for (int i = 4; i < list.size() + 4; i++) {
				Record one = list.get(i - 4);
				XSSFRow row = sheet.getRow(i);

				if (row == null) {
					row = sheet.createRow(i);
				}
				row.setHeightInPoints(20); // 行高为20像素

				XSSFCell c1 = row.createCell(2);
				
				c1.setCellValue(one.getStr("name"));
				System.out.println(one.getStr("name"));

				XSSFCell c2 = row.createCell(3);
				c2.setCellValue(one.getLong("specialty_count"));

				XSSFCell c3 = row.createCell(4);
				c3.setCellValue(one.getLong("class_num"));
				
				XSSFCell c4 = row.createCell(5);
				c4.setCellValue(0);
				
				XSSFCell c5 = row.createCell(6);
				c5.setCellValue(one.getLong("enroll_count"));
				
				
				
				if(i==list.size()+4-1){
					c1.setCellStyle(s2);
					c2.setCellStyle(s3);
					c3.setCellStyle(s3);
					c4.setCellStyle(s3);
					c5.setCellStyle(s5);
				}else{
					c1.setCellStyle(s1);
					c2.setCellStyle(baseStyle);
					c3.setCellStyle(baseStyle);
					c4.setCellStyle(baseStyle);
					c5.setCellStyle(s4);
				}
			}
			workbook.write(new FileOutputStream("C:/培训机构名录.xlsx"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("HELLp");
	}

}
