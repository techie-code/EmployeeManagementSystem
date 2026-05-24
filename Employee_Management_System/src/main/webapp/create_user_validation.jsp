<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee Management System</title>
</head>
<body>
<!-- CREATE USER VALIDATION -->
<%@page import="employeerecord.database.*" %>
<%@page import="java.sql.*" %>
<%
Connection con = null;
PreparedStatement ps = null;

try{
	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost/database","root","root");
	System.out.println("Connected");
}catch(Exception e){
System.out.println("Not connected");
}
//OTP value
String otpValue=request.getParameter("otpnumber");
//username
String username=(String)session.getAttribute("username");
//password
String password=(String)session.getAttribute("password");
//rolename
String rolename=(String)session.getAttribute("rolename");
//actual otp
String actualotp=(String)session.getAttribute("otpval");
//To create the user account
if(otpValue!=null){
if(otpValue.equals(actualotp)){
	PasswordEncryption pe=new PasswordEncryption();
	String encryptPassword=pe.encryption(password);
	ps = con.prepareStatement("INSERT INTO USER_LOGGING(USERNAME,PASSWORD)VALUES(?,?)");
	ps.setString(1,username);
	ps.setString(2,encryptPassword);
	ps.executeUpdate();
	ps = con.prepareStatement("INSERT INTO USER_ROLES(USERNAME,ROLES)VALUES(?,?)");
	ps.setString(1,username);
	ps.setString(2,rolename);
	ps.executeUpdate();
	response.sendRedirect("success.jsp");
}else{
	response.sendRedirect("erroruser.jsp");
}}
else{
	response.sendRedirect(request.getContextPath());
}
%>
</body>
</html>