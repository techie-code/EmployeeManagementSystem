<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee Management System</title>
</head>
<body>
<!-- create user validation page to check details -->
<%@page import="employeerecord.database.*" %>
<%@page import="java.sql.*" %>
<%

Employee em = new Employee();

//email id
String emailiduser = request.getParameter("emailid");

//user role
String userrole = request.getParameter("emp-role");

//new password
String newpass = request.getParameter("newpass");

//confirm password
String confpass = request.getParameter("confpass");
if(emailiduser!=null){
//validate the email
boolean emailval = em.emailVal(emailiduser);

//To check that the role option is selected
boolean emptyrole = em.roleVal(userrole);

//To check that the new password field is filled
boolean emptynewpass = em.emptyspace (newpass,"Password");

//To check that the confirm password is filled
boolean emptyconfpass = em.emptyspace (confpass,"Confirm Password");

//To check that the email id is unique
boolean validemail = em.logIdVal(emailiduser);

//To check that the both password is equal
boolean logpasseq = em.logPassEq(newpass,confpass);

if(emailval==true && emptyrole==true && emptynewpass==true &&emptyconfpass==true && validemail==true && logpasseq==true){
	session.setAttribute("emailid",emailiduser);
	session.setAttribute("role",userrole);
	session.setAttribute("password",newpass);
	response.sendRedirect("createAccountOtpVal.jsp");	
}
else{%>
System.out.println("Not connected");
<jsp:include page="createacc.jsp"></jsp:include>
    <div class="errorclass">
    <%=em.getError() %>
    </div>

 <% }}
else{
	response.sendRedirect(request.getContextPath());
}
 %>
</body>
</html>