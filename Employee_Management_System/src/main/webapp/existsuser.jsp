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
<meta name="google-signin-client_id" content="clientid">
<title>Employee Management System</title>
</head>
<!-- Create account page -->
<body>
<script>
function signOut() {
    var auth2 = gapi.auth2.getAuthInstance();
    auth2.disconnect().then(function () {
      console.log('User signed out.');
    });
  }

  function onLoad() {
    gapi.load('auth2', function() {
      gapi.auth2.init();
    });
  }
</script>
    <h1 class="intro1">Employee Management System</h1>
    <div class="container concard card">
        <div class="buttonclass1 col-lg-12">
            <a href="<%=request.getContextPath()%>/employee/Employee.jsp"><button onclick="signOut()" class="btn btn-info"><i class="fas fa-arrow-left"></i></button></a>
        </div>
        <h4>Already exist!!!!!</h4>
        <div class="d-flex justify-content-center"><img src="./imagefolder/found.png" width="100" height="100"/></div>
        <p class="already-exist d-flex justify-content-center">You already created an account either using email or using google.</p>
    </div>
    <script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script>
</body>
</html>