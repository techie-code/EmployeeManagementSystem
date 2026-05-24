<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee Management System</title>
</head>
<!-- Logout -->
<body>
<%request.getSession().invalidate();
response.sendRedirect(request.getContextPath());
%>
</body>
</html>