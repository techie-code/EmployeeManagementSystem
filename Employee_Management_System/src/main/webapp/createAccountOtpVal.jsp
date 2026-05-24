<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<link href="./css/login.css" rel="stylesheet" type="text/css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<title>Employee Management System</title>
</head>
<!-- Create account Otp validation page -->
<body>
    
	<%@page import="employeerecord.database.*" %>
	<%@page import="java.sql.*" %>
     
	<%OtpMail otpmail=new OtpMail();
	
	//To get the username
	String username=(String)session.getAttribute("emailid");
	System.out.println(username);
	//To get the password
	String password=(String)session.getAttribute("password");
	System.out.println(password);
	//To get the role
	String rolename=(String)session.getAttribute("role");
	System.out.println(rolename);
	if(username!=null){
	//To get the otp value as well as to send the mail to user
	String otpval=otpmail.sendMail(username);
	%>
    <h1 class="intro1">Employee Management System</h1>
    <div class="container concard card">
    <form class="row" action="create_user_validation.jsp">
        <h4>We sent your code<% out.print(" "+username); %></h4>
        <h6 class="otpcontent">Enter the confirmation code below</h6>
        <div class="form-group col-lg-12 col-sm-12">
            <input type="text" class="form-control" id="emp-otp" name="otpnumber" placeholder="OTP Number">
        </div>
        <div class="buttonclass col-lg-12">
            <button type="submit" class="btn btn-info">Verify OTP</button>
        </div>
    </form>
    </div>
    <%session.setAttribute("username",username);
    session.setAttribute("password",password);
    session.setAttribute("rolename",rolename);
    session.setAttribute("otpval",otpval);
    }else{
    	response.sendRedirect(request.getContextPath()+"/employee/Employee.jsp");
    }
    %>
</body>
</html>