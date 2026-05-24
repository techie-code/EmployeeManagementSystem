<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<link href="./css/login.css" rel="stylesheet" type="text/css">
<title>Employee Management System</title>
</head>
<!-- Select role for google user -->
<body>
<%@page import="employeerecord.database.*" %>
<%@page import="java.sql.*" %>
<%String email=request.getParameter("email");
String name=request.getParameter("name");
if(email!=null){
	boolean userexist=false;
	Connection con=null;
	PreparedStatement ps = null;
	ResultSet rs=null;
	try{
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost/database","root","root");
		System.out.println("Connected");
	}catch(Exception e){
	System.out.println("Not connected");
	}
	ps = con.prepareStatement("SELECT * FROM user_roles WHERE username='"+email+"'");
	rs=ps.executeQuery();
	userexist=rs.isBeforeFirst();
	if(userexist==true){
		response.sendRedirect(request.getContextPath()+"/existsuser.jsp");
	}else{
		session.setAttribute("email", email);
	%>
	<script>
    function validate(){
    	var valid=false;
    	var x=document.myform.emprole;
    	for(var i=0;i<x.length;i++){
    		if(x[i].checked){
    			valid=true;
    			break;
    		}
    	}
    	if(valid){
    		alert("Your account is created!!! Click here to login");
    	}else{
    		alert("please select any role");
    		return false;
    	}
    }
    </script>
    	<h1 class="intro1">Employee Management System</h1>
	    <div class="container concard card">
		<form name="myform" class="row" action="googlerolevalidation.jsp" onsubmit="return validate()">
        <h4>Create Account</h4>
        <h5>Hi <%out.println(name);%></h5>
        <div class="form-group col-lg-12 col-sm-12">
            <p>Choose your Role</p>
            <div class="form-check form-check-inline">
                <input type="radio" name="emprole" id="op1" value="Admin">
                <label for="op1">Admin</label>
              </div>
              <div class="form-check form-check-inline">
                <input type="radio" name="emprole" id="op2" value="Employee">
                <label for="op2">Employee</label>
              </div>
            </div>
        <div class="buttonclass col-lg-12">
            <button type="submit" class="btn btn-info">Create account</button>
        </div>      
    </form>
 	</div>
		
	<%}
}else{
	response.sendRedirect(request.getContextPath());
}
%>
</body>
</html>