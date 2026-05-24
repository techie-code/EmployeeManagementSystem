<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee Management System</title>
</head>
<body>
<!-- Forget password validation page -->
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

Employee em = new Employee();
PasswordEncryption pe=new PasswordEncryption();

//email id
String emailiduser = request.getParameter("emailid");

//new password
String newpass = request.getParameter("newpass");

//confirm password
String confpass = request.getParameter("confpass");

//validate email id

boolean emailval = em.emailVal(emailiduser);

//To check that the new password field is filled 
boolean emptynewpass = em.emptyspace (newpass,"Password");

//To check that the cofirm password is filled 
boolean emptyconfpass = em.emptyspace (confpass,"Confirm Password");

//To check that the both password is equal 
boolean logpasseq = em.logPassEq(newpass, confpass);

if(emailval==true&&emptynewpass==true&&emptyconfpass==true&&logpasseq==true){
	boolean validemail = em.updateuserval(emailiduser);
	if(validemail==true){
	String encryptPassword=pe.encryption(newpass);
	ps = con.prepareStatement("UPDATE user_logging SET password=?WHERE username = ?");
    ps.setString(1,encryptPassword);
    ps.setString(2,emailiduser);
	ps.executeUpdate();
	response.sendRedirect("success.jsp");
}
	else{%>
	<jsp:include page="forget.jsp"></jsp:include>
	    <div class="errorclass">
	    <%=em.getError() %>
	    </div>

	 <% }
	 %>

<%}else{%>
<jsp:include page="forget.jsp"></jsp:include>
    <div class="errorclass">
    <%=em.getError() %>
    </div>

 <%}%>

</body>
</html>