<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<link href="<%=request.getContextPath()%>/css/login.css" rel="stylesheet" type="text/css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<title>Employee Management System</title>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-client_id" content="clientid">
</head>
<!-- Login page -->
<body>
    <h1 class="intro1">Employee Management System</h1>
    <!-- Login with Email ID-->
    <div class="container concard card">
    <form class="row" action="<%=request.getContextPath()%>/loginValidation.jsp">
        <h4>Login</h4>
        <div class="form-group col-lg-12 col-sm-12">
            <input type="text" class="form-control"  name="username" id="username" placeholder="Email-ID">
        </div>
        <div class="form-group col-lg-12 col-sm-12">
            <input type="password" class="form-control" name="password" id="password" placeholder="Password">
        </div>
        <div class="linkclass col-lg-4">
           <p><a href="<%=request.getContextPath()%>/forget.jsp">Forgot Password?</a></p> 
        </div>
        <div class="buttonclass col-lg-4">
            <button type="submit" class="btn btn-info">Login</button>
        </div>
        <div class="linkclass1 col-lg-4">
           <p><a href="<%=request.getContextPath()%>/createaccountpage.jsp">Create Account</a></p> 
        </div>     
    </form>
    <!-- Google login-->
    <div class="google-login">
    <h5>OR</h5>
    <div class="g-signin2 d-flex justify-content-center" data-onsuccess="onSignIn" id="googleauth" data-theme="dark"  data-longtitle="true"></div>
    </div>
    </div>
    <script>
     function onSignIn(googleUser) {
      var profile = googleUser.getBasicProfile();
      var name=profile.getName();
      var email=profile.getEmail();
      var link="<%=request.getContextPath()%>";
      window.location.replace(link+"/googleval.jsp?email="+email+"&name="+name);
   }
   </script>
</body>
</html>