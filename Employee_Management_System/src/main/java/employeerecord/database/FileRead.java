package employeerecord.database;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import org.apache.commons.lang3.time.StopWatch;
import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.RequestContext;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext;
import java.util.concurrent.TimeUnit;
import com.opencsv.CSVReader;
import employeerecord.database.Employee;
@MultipartConfig
public class FileRead extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Connection con = null;
	private static PreparedStatement ps = null;
	public FileRead() throws SQLException, ClassNotFoundException {
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost/database","root","root");
		System.out.println("Connected");
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<FileItem> multipart=new ServletFileUpload(new DiskFileItemFactory()).parseRequest(new ServletRequestContext(request));
		try {
		EmployeeCheck e=new EmployeeCheck();
		int count=1;
		int numcou=0;
		boolean valid=false;
		String filename="csvfile.csv";
		String filepath ="G:\\employeemanagecsv"+File.separator+filename;
		for(FileItem fileitem:multipart) {
			if(!fileitem.isFormField()) {
					fileitem.write( new File(filepath));
				}
		}
		StopWatch sw=new StopWatch();
		sw.start();
		CSVReader br=new CSVReader(new FileReader(filepath));
		String[]datas =br.readNext();
		String id=datas[0];
		String empname=datas[1];
		String empage=datas[2];
		String empaddress=datas[3];
		String empgender=datas[4];
		String empemail=datas[5];
		String empmobile=datas[6];
		String empdept=datas[7];
		if(id.equals("EmployeeID")&&empname.equals("Name")&&empage.equals("Age")&&empaddress.equals("Address")&&empgender.equals("Gender")&&empemail.equals("Email")&&empmobile.equals("Mobile")&&empdept.equals("Department")) {
			datas =br.readNext();
			if(datas!=null) {
			while(count!=0) {
				if(datas!=null) {
  	    		  id=datas[0];
  	    		  empname=datas[1];
  	    		  empage=datas[2];
  	    		  empaddress=datas[3];
  	    		  empgender=datas[4];
  	    		  empemail=datas[5];
  	    		  empmobile=datas[6];
  	    		  empdept=datas[7];
  	    		 boolean validemp=e.employeeCheck(id, empname, empage, empaddress, empgender, empemail, empmobile, empdept);
	    		  if(validemp) {
	    			  numcou=numcou+1;
	    			  System.out.println(numcou);
	    			  valid=true;
	    			  count=1;
	    		  }else {
	    			  System.out.println("error");
	    			  HttpSession session=request.getSession();  
	    			  session.setAttribute("id",id);
	    			  System.out.println("Please check the employee id "+id+" details");
	    			  valid=false;
	    			  count=0;
	    			  RequestDispatcher rd=request.getRequestDispatcher("/employee/invalidupload.jsp");  
	    		      rd.forward(request, response);  
	    		  }
	    		  datas =br.readNext();
				  }else {
					break;
				}
			}
			if(valid) {
			System.out.println(filepath);
			String filepathload=filepath.replace("\\","/");
			System.out.println(filepathload);
			String load = "LOAD DATA INFILE '"+filepathload+"' IGNORE INTO TABLE employee1 "
			          + "FIELDS TERMINATED BY \',\' ENCLOSED BY \'\"'"+ "LINES TERMINATED BY \'\\n\' IGNORE 1 ROWS";
			ps=con.prepareStatement(load);
			ps.executeUpdate();
			System.out.println("Uploaded");
			sw.stop();
			System.out.println("Uploaded"+sw.getTime(TimeUnit.SECONDS));
			RequestDispatcher rd=request.getRequestDispatcher("/employee/alert.jsp");
			rd.forward(request, response); 
			}
		}
		else {
			RequestDispatcher rd=request.getRequestDispatcher("/employee/invalidfile.jsp");
			rd.forward(request, response); 
			System.out.println("The given csv is blank");
		}
		}
		else {
			RequestDispatcher rd=request.getRequestDispatcher("/employee/invalidfile.jsp");
			rd.forward(request, response); 
			System.out.println("Error file");
		}
		}catch(Exception e) {
		System.out.println(e);
		}
	}

}