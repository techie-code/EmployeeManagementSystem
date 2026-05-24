package employeerecord.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.regex.*;


public class Employee{
	private Connection con = null;
	private PreparedStatement ps = null;
	private ResultSet rs=null;
    public Employee() throws ClassNotFoundException, SQLException{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost/database","root","root");
			System.out.println("Connected");
	}
     String error = new String();
    public String getError() {
		return error;
	}
	public  void setError(String error) {
		this.error = error;
	}
	
	//To insert the employee details
	public void insert(String EmployeeID,String Name, String Age,String Address,String Gender,String Mail,String Mobile,String Department)throws Exception{
		ps = con.prepareStatement("INSERT INTO EMPLOYEE1(EmployeeID,Name,Age,Address,Gender,Email,Mobile,Department)VALUES(?,?,?,?,?,?,?,?)");
		ps.setString(1,EmployeeID);
		ps.setString(2,Name);
		ps.setString(3,Age);
		ps.setString(4,Address);
		ps.setString(5,Gender);
		ps.setString(6,Mail);
		ps.setString(7,Mobile);
		ps.setString(8,Department);
		ps.executeUpdate();
	}
	
	//To check whether the employee id is exists
	public boolean empIdVal(String empId) throws Exception{
    	boolean found = false;
    	boolean result=false;
    	ps =con.prepareStatement("SELECT * FROM employee1 WHERE EmployeeID='"+empId+"'") ;
    	rs = ps.executeQuery();
    	result =rs.isBeforeFirst();
    	if(result){
    		{error+="<br>Enter the valid Employee Number";}
    		found=false;
    	}
    	else{
    		
    		found=true;
    	}
    	return found;
    	
    }
	
	
	//To check the email is unique
	public boolean emailIdVal(String id,String email) throws Exception{
    	boolean found = false;
    	boolean result=false;
    	ps =con.prepareStatement("SELECT Email FROM employee1 WHERE EmployeeID !='"+id+"'and Email ='"+email+"'") ;
    	rs = ps.executeQuery();
    	result =rs.isBeforeFirst();
    	if(result){
    		{error+="<br>Email-ID already exists!!";}
    		found=false;
    	}
    	else{
    		
    		found=true;
    	}
    	return found;
    	
    }
	
	//To check the email id is valid or not to create an account
	public boolean logIdVal(String email) throws Exception{
    	boolean found = false;
    	boolean result=false;
    	ps =con.prepareStatement("SELECT * FROM user_roles WHERE username='"+email+"'") ;
    	rs = ps.executeQuery();
    	result =rs.isBeforeFirst();
    	if(result){
    		{error+="<br>Enter the valid Email-ID";}
    		found=false;
    	}
    	else{
    		
    		found=true;
    	}
    	return found;
    	
    }
	
	//To check the new password and confirm password is same
	public boolean logPassEq(String newpass, String confpass) {
		boolean found = false;
		if(newpass.equals(confpass)) {
			found=true;
		}
		else {
			{error+="<br>Password isn't match";}
			found=false;
		}
		return found;
	}
	
	//To check the employee age
	public boolean empAge(String a,int len){
		boolean ageValue = false;
		int i,intVal,count = 0;
		for(i=0;i<len;i++){
			if (a.charAt(i) >= '0' && a.charAt(i) <= '9') {
	               count = 1;
	           }
	        else {
	                count = 0;
	        }
		}
		if(count==1){
			intVal = Integer.parseInt(a);
			if(intVal>17 && intVal<51){
			ageValue= true;
			}
			else{
			{error+="<br>Please provide a valid Age!!! NOTE: THE AGE SHOULD BE 18 - 50 ";}
			}
		}
		else if(count==0){
			{error+="<br>Please Enter the age";}
		}

		return ageValue;
		}
	
	//To validate the email
	public boolean emailVal(String email){
	boolean emailValue = false;
	String emailPattern = "^(.+)@(.+)(\\.)(.+)$";
	Pattern pattern = Pattern.compile(emailPattern);
	java.util.regex.Matcher matcher = pattern.matcher(email);
	if(matcher.matches()){
		emailValue=true;
	}
	else{
		{error+="<br>Please Enter the valid Mail-ID ";}
	}
	return emailValue;
}
	
	//To check that the given number is mobile number or not
	public boolean mobileVal(String mobile,int len){
		boolean mobileValue = false;
		int i,count = 0;
		for(i=0;i<len;i++){
			if (mobile.charAt(i) >= '0' && mobile.charAt(i) <= '9') {
	                count = 1;
	            }
	            else {
	                count=0;
	            }
		}
		if(count==1){
			if(len==10 || len==8){
				mobileValue=true;
		}
		else{
			{error+="<br>Please Enter the Valid Number ";}
		}
		}
		else if(count==0){
			{error+="<br>Please Enter the number";}
		}
		return mobileValue;
		
	}
	
	//To check that the gender option is selected
	public boolean genVal(String op) {
		boolean genval = false;
		if(op==null) {
			{error+="<br>Please select the gender";}
			genval=false;
		}
		else {
			genval=true;
		}
		return genval;
	}
	//To check the gender value 
	public boolean gendervalue(String gender) {
		if(gender.equalsIgnoreCase("male")||gender.equalsIgnoreCase("female")||gender.equalsIgnoreCase("others")) {
			return true;
		}
		else {
		{error+="<br>Please enter the valid gender";}	
		return false;
		}
	}
	
	//To check that the role option is selected
	public boolean roleVal(String op) {
		boolean roleval = false;
		if(op==null) {
			{error+="<br>Please select the role";}
			roleval=false;
		}
		else {
			roleval=true;
		}
		return roleval;
	}
	
	//To check is there any option is selected
	public boolean emptyoption(String op,String value) {
		boolean option = false;
		if(op==null) {
			{error+="<br>Please select any "+value+" option";}
			option=false;
		}
		else {
			option=true;
		}
		return option;
	}
	
	// To check is there any field is empty
	public boolean emptyspace (String attribute, String name) {
		boolean emptyspace = false;
		if(attribute.isBlank()) {
			{error+="<br>Please fill " +name+" Field";}
			emptyspace=false;
		}
		else {
			emptyspace=true;
		}
		return emptyspace;
	}
	
	//To search the employee is exist or not for update and delete operation
	public boolean updatevalidation(String empId) throws Exception{
		boolean found = false;
		boolean result=false;
		ps= con.prepareStatement("SELECT * FROM employee1 WHERE EmployeeID='"+empId+"'");
		rs = ps.executeQuery();
		result =rs.isBeforeFirst();
		if(result==true){
			found=true;
			
		}
		else{
			{error+="<br>Not Found!!!!!";}
			found=false;
		}
		return found;
	}
	
	//To check the user email is exist or not
	public boolean updateuserval(String email) throws Exception{
		boolean found = false;
		boolean result=false;
		ps= con.prepareStatement("SELECT * FROM user_logging WHERE username='"+email+"'");
		rs = ps.executeQuery();
		result =rs.isBeforeFirst();
		if(result==true){
			found=true;
			
		}
		else{
			{error+="<br>Enter valid E-mail ID";}
			found=false;
		}
		return found;
	}
	
	//To delete the employee details
	public boolean optiondelete(String option,String empId) throws Exception{
		boolean opdel=false;
		System.out.println(option);
		System.out.println(empId);
		if(option.equals("Yes")) {
			ps = con.prepareStatement("DELETE  FROM employee1 WHERE EmployeeID = ?");
			ps.setString(1,empId);
			ps.executeUpdate();
			opdel=true;
		}
		else if(option.equals("No")) {
			opdel = false;
		}
		return opdel;
	}
	
	//Update the employee details
	public void updatedb(String empid, String name, String age, String address, String gender,String email,String mobile,String dept) throws Exception{
		ps =con.prepareStatement("UPDATE employee1 SET Name=?,Age=?,Address=?,Gender=?,Email=?,Mobile=?,Department=? WHERE EmployeeID = ?");
        ps.setString(1,name);
        ps.setString(2,age);
        ps.setString(3,address);
        ps.setString(4,gender);
        ps.setString(5,email);
        ps.setString(6,mobile);
        ps.setString(7,dept);
        ps.setString(8,empid);
		ps.executeUpdate();
	}
	
}

