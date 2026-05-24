<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<link href="../css/style.css" rel="stylesheet" type="text/css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<meta name="google-signin-client_id" content="clientid">
<title>Employee Management System</title>
</head>
<!-- Welcome page -->
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
<div class="settings col-lg-12">
    <a href="logout.jsp"><button onclick="signOut()" class="btn btn-danger"><i class="fas fa-power-off"></i><p>Log out</p></button></a>    
</div>
<h2 class="intro">Welcome to the </h2>
 <h1 class="intro1">Employee Management System</h1>
 <h2 class="intro2">Select the Operation</h2>
 <div class="container">
 <div class="row">
<div class="contentcard card col-lg-6 col-sm-12">
<div class="front">
    <h3>Create</h3>
    <h5><i class="fa fa-user-plus"></i></h5>
</div>
<div class="back">
    <p>To add the employee details</p>
    <a href="create.jsp"><button type="button" class="buttonintro btn btn-info">Create</button></a>
</div>

</div>

<div class="contentcard card col-lg-6 col-sm-12">
    <div class="front">
        <h3>Update</h3>
        <h5><i class="fas fa-user-edit"></i></h5>
    </div>
    <div class="back">
        <p>To update the employee details</p>
       <a href="update.jsp"> <button type="button" class="buttonintro btn btn-info">Update</button></a>
    </div>
    
</div>
<div class="contentcard card col-lg-6 col-sm-12">
    <div class="front">
        <h3>Delete</h3>
        <h5><i class="fas fa-user-slash"></i></h5>
    </div>
    <div class="back">
        <p>To delete the employee details</p>
        <a href="delete.jsp"><button type="button" class="buttonintro btn btn-info">Delete</button></a>
    </div>
   
</div>
<div class="contentcard card col-lg-6 col-sm-12">
    <div class="front">
        <h3>List the employee details</h3>
        <h5><i class="fas fa-clipboard-list"></i></h5>
    </div>
    <div class="back">
        <p>To display the employee details</p>
       <a href="list.jsp"><button type="button" class="buttonintro btn btn-info">Show</button></a> 
    </div>
    
</div>
<div class="contentcard card col-lg-6 col-sm-12">
    <div class="front">
        <h3>Search</h3>
        <h5><i class="fas fa-search"></i></h5>
    </div>
    <div class="back">
        <p>To search the employee details</p>
        <a href="search.jsp"><button type="button" class="buttonintro btn btn-info">Search</button></a>
    </div>
    
</div>
<div class="contentcard card col-lg-6 col-sm-12">
    <div class="front">
        <h3>Sort</h3>
        <h5><i class="fas fa-sort"></i></h5>
    </div>
    <div class="back">
        <p>To sort the employee details</p>
       <a href="sort.jsp"> <button type="button" class="buttonintro btn btn-info">Sort</button></a>
    </div>
</div>
<div class="contentcard card col-lg-6 col-sm-12">
    <div class="front">
        <h3>Upload</h3>
        <h5><i class="fas fa-upload"></i></h5>
    </div>
    <div class="back">
        <p>To upload the employee details</p>
       <a href="upload.jsp"> <button type="button" class="buttonintro btn btn-info">Upload</button></a>
    </div>
</div>
<div class="contentcard card col-lg-6 col-sm-12">
    <div class="front">
        <h3>Download</h3>
        <h5><i class="fas fa-download"></i></h5>
    </div>
    <div class="back">
        <p>To download the employee details</p>
       <a href="download.jsp"> <button type="button" class="buttonintro btn btn-info">Download</button></a>
    </div>
</div>

 </div>
 </div>
<script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script>
</body>
</html>