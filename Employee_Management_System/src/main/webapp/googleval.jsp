<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee Management System</title>
</head>
<body>
<!--Validation email for login -->
<%@page import="employeerecord.database.*" %>
<%String email=request.getParameter("email");
System.out.println("Email is"+email);
if(email==null){
	email=(String)session.getAttribute("email");
}
if(email!=null){
String configFile=getServletContext().getRealPath("/WEB-INF/lib/jaas.config");
System.setProperty("java.security.auth.login.config",configFile);
%>	<form action="j_security_check" id="form">
		<input type="hidden" class="form-control" id="emp-name" placeholder="Email-ID" name="j_username" value=<%=email%> readonly>
		</form>
		<script>
		document.getElementById("form").submit();
		</script>
<%}
else{
	response.sendRedirect(request.getContextPath());
}
%>
</body>
</html>