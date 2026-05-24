package employeerecord.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.regex.Pattern;

public class EmployeeCheck {
	private static Connection con = null;
	private static PreparedStatement ps = null;
	private static ResultSet rs=null;
	public EmployeeCheck() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost/database","root","root");
		System.out.println("Connected");
	}
	public static boolean employeeCheck(String id,String name,String age,String address,String gender,String email,String mobile,String dept)throws Exception {
		if(!id.isBlank()&&!name.isBlank()&&!age.isBlank()&&!address.isBlank()&&!gender.isBlank()&&!email.isBlank()&&!mobile.isBlank()&&!dept.isBlank()) {
    	String emailPattern = "^(.+)@(.+)(\\.)(.+)$";
    	Pattern pattern = Pattern.compile(emailPattern);
    	java.util.regex.Matcher matcher = pattern.matcher(email);
    	if(!matcher.matches()) {
    		System.out.println("Enter the valid email "+id );
    		return false;
    	}
    	if(gender.equalsIgnoreCase("male")||gender.equalsIgnoreCase("female")||gender.equalsIgnoreCase("others")) {
		}else {
    		System.out.println("Enter the gender "+id );
    		return false;
		}
    	int intVal = Integer.parseInt(age);
		if(intVal<18 || intVal>50){
			System.out.println("Enter the valid age "+id );
		return false;
		}
		int len=mobile.length();
		if(len==8||len==10) {
		}else {
		System.out.println("Enter the valid mobile number "+id );
		return false;
		}
		}else {
			System.out.println("Enter the all field "+id );
			return false;
		}
		return true;
	}

}
