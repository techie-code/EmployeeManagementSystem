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
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-client_id" content="clientid">
</head>
<!-- Create account page -->
<body>
    <h1 class="intro1">Employee Management System</h1>
    <div class="container concard card">
        <div class="buttonclass1 col-lg-12">
            <a href="<%=request.getContextPath()%>/employee/Employee.jsp"><button type="submit" class="btn btn-info"><i class="fas fa-arrow-left"></i></button></a>
        <h4>Create Account</h4>
        <div class="buttonclass col-lg-12">
            <a href="<%=request.getContextPath()%>/createacc.jsp"><button class="btn btn-info">Create account using E-mail ID</button></a>
        </div>
        <div class="google-login">
    <h5>OR</h5>
    <div class="g-signin2 d-flex justify-content-center" data-onsuccess="onSignIn" id="googleauth" data-theme="dark"  data-longtitle="true"></div>
    </div>
    </div>  
    </div>
    <script>
     function onSignIn(googleUser) {
      var profile = googleUser.getBasicProfile();
      var name=profile.getName();
      var email=profile.getEmail();
      var link="<%=request.getContextPath()%>";
      window.location.replace(link+"/SelectRole.jsp?email="+email+"&name="+name);
   }
   </script> 
</body>
</html>