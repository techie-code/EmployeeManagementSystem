<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee Management System</title>
</head>
<!-- Delete the employee  -->
<body>
<%@page import="employeerecord.database.*" %>
	<%String opdel = request.getParameter("option");
	String empid =(String)session.getAttribute("empid");
	Employee em = new Employee();
	
	//delete option value
	boolean opdelval = em.optiondelete(opdel,empid);
	
	if(opdelval==true){
		response.sendRedirect("alert.jsp");
		
	}
	else if(opdelval==false){
		response.sendRedirect("delete.jsp");
	}
	%>
</body>
</html>