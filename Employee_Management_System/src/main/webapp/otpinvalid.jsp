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
<!--otp invalid session-->
<body>
	<%request.getSession().invalidate(); %>
    <h1 class="intro1">Employee Management System</h1>
    <div class="container concard card">
        <h2>OTP Expired!!!!!</h2>
        <div class="otpcounter d-flex justify-content-center"><img src="./imagefolder/otpsession.png" width="200" height="200"/></div>
        <p class="otpcounter d-flex justify-content-center">Please login again and enter the otp before the given time</p>
        <div class="buttonclass col-lg-12">
            <a href="<%=request.getContextPath()%>/employee/Employee.jsp"><button class="btn btn-info">Go to Login page</button></a>
        </div>
    </div>
</body>
</html>