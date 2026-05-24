<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee Management System</title>
</head>
<!-- Google role validation -->
<body>
<%@page import="employeerecord.database.*" %>
<%@page import="java.sql.*" %>
<%Employee em=new Employee();
String userrole = request.getParameter("emprole");
String email=(String)session.getAttribute("email");
if(email!=null && userrole!=null){
Connection con = null;
PreparedStatement ps = null;
try{
	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost/database","root","root");
	System.out.println("Connected");
}catch(Exception e){
	System.out.println("Not connected");
}
	ps = con.prepareStatement("INSERT INTO USER_ROLES(USERNAME,ROLES)VALUES(?,?)");
	ps.setString(1,email);
	ps.setString(2,userrole);
	ps.executeUpdate();
	response.sendRedirect("success.jsp");
}else{
	response.sendRedirect(request.getContextPath());
}
%>
</body>
</html>