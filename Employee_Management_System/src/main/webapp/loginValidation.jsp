<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee Management System</title>
</head>
<body>

<!-- LOGIN VALIDATION -->
<%@page import="employeerecord.database.*" %>
<%@page import="java.sql.*" %>
<%
OtpMail otpmail=new OtpMail();
PasswordEncryption pe=new PasswordEncryption();
//To get the username
String username=request.getParameter("username");

//To get the password
String password=request.getParameter("password");

//To check whether the username and password is correct 
if(username!=null && password!=null){
boolean authentication=true;
Connection con = null;
PreparedStatement ps = null;
ResultSet rs=null;
try{
	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost/database","root","root");
	System.out.println("Connected");
}catch(Exception e){
	System.out.println("Not connected");
}
String encryptPassword=pe.encryption(password);
ps=con.prepareStatement("SELECT * FROM user_logging WHERE username='"+username+"' and password='"+encryptPassword+"'");
rs=ps.executeQuery();
authentication=rs.isBeforeFirst();
if(authentication==true){
	//To get the otp as well as send the otp mail to user
	String otp=otpmail.sendMail(username);
	session.setAttribute("username",username);
	session.setAttribute("otp",otp);
	System.out.println("username and password is valid");
	response.sendRedirect(request.getContextPath()+"/OtpValidation.jsp");
}else{
	response.sendRedirect(request.getContextPath()+"/erroruser.jsp");
}
}else{
	response.sendRedirect(request.getContextPath());
}
%>
</body>
</html>