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
<!-- Forget password page -->
<body>
    <h1 class="intro1">Employee Management System</h1>
    <div class="container concard card">
        <div class="buttonclass1 col-lg-12">
            <a href="<%=request.getContextPath()%>/employee/Employee.jsp"><button type="submit" class="btn btn-info"><i class="fas fa-arrow-left"></i></button></a>
        </div>
    <form class="row" action="forgetval.jsp">
        <h4>Change Password</h4>
        <div class="form-group col-lg-12 col-sm-12">
            <input type="text" class="form-control"  name="emailid" id="emailid" placeholder="Email-ID">
        </div>
        <div class="form-group col-lg-12 col-sm-12">
            <input type="text" class="form-control" name="newpass" id="newpass" placeholder="New Password">
        </div>
        <div class="form-group col-lg-12 col-sm-12">
            <input type="text" class="form-control" name="confpass" id="confpass" placeholder="Retype Password">
        </div>
        <div class="buttonclass col-lg-12">
            <button type="submit" class="btn btn-info">Reset Password</button>
        </div>      
    </form>
    </div>
</body>
</html>