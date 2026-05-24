package employeerecord.database;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/DownloadCsv")
public class DownloadCsv extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response){
		try (PrintWriter printwriter = response.getWriter()) {
	        String name = "EmployeeManagementSystem.csv";
	        String path = getServletContext().getRealPath("/" + "files"+File.separator+name);            System.out.println(path);
	        response.setContentType("APPLICATION/OCTET-STREAM");
	        response.setHeader("Content-Disposition", "attachment; filename=\""+name+"\"");
	        FileInputStream inputstream = new FileInputStream(path);
	        int i;
	        while ((i = inputstream.read()) != -1) {
	            printwriter.write(i);
	        }
	        inputstream.close();
	        printwriter.close();
	    }catch(Exception e) {
	    	System.out.println(e);
	    }
	}

}
