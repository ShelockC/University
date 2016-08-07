package controller;

import java.io.File;

import com.jfinal.core.Controller;

public class WelcomeController extends Controller{
	public void specialtyExcel(){
		renderFile(new File("C:/培训专业名录.xlsx"));
	}
	public void orgnizationExcel(){
		renderFile(new File("C:/培训机构名录.xlsx"));
	}
	
}
