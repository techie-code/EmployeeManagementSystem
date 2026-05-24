<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee Management System</title>
</head>
<body>
<%@page import="javax.security.auth.login.LoginContext" %>
<%@page import="employeerecord.database.*" %>
<%@page import="javax.security.auth.login.LoginException" %>
<%String email=request.getParameter("username");
String actualOtp=(String)session.getAttribute("actualOtp");
String otp=request.getParameter("otp");
if(email!=null && otp!=null){
	boolean authentication=otp.equals(actualOtp);
	if(authentication==true){
		session.setAttribute("email",email);
		response.sendRedirect(request.getContextPath()+"/googleval.jsp");
	}else{
		response.sendRedirect(request.getContextPath()+"/erroruser.jsp");
	}
}else{
	response.sendRedirect(request.getContextPath());
}
%>
</body>
</html>