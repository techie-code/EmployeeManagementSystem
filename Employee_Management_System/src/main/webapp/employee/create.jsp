<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<link href="../css/create.css" rel="stylesheet" type="text/css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<title>Employee Management System</title>
</head>
<!-- Create the employee page -->
<body>
    <h1 class="intro1">Employee Management System</h1>
    <div class="container concard card">
    <form class="row" action="added.jsp">
        <h4>Enter the Employee Details</h4>
        <div class="form-group col-lg-6 col-sm-12">
            <input type="text" class="form-control" id="emp-id" name="emp-id" placeholder="Employee Number">
        </div>
        <div class="form-group col-lg-6 col-sm-12">
            <input type="text" class="form-control" id="emp-name" name="emp-name" placeholder="Employee name">
        </div>
        <div class="form-group col-lg-6 col-sm-12">
            <input type="text" class="form-control" id="emp-age" name="emp-age" placeholder="Employee Age">
        </div>
        <div class="form-group col-lg-6 col-sm-12">
         <p>Gender</p>
        <div class="form-check form-check-inline">
            <input type="radio" name="gender-op" id="op1" value="Male">
            <label for="op1">Male</label>
          </div>
          <div class="form-check form-check-inline">
            <input type="radio" name="gender-op" id="op2" value="Female" >
            <label for="op2">Female</label>
          </div>
          <div class="form-check form-check-inline">
            <input  type="radio" name="gender-op" id="op3" value="Others">
            <label for="op3">Others</label>
          </div>
        
        </div>
          
        <div class="form-group col-lg-6 col-sm-12">
            <input type="text" class="form-control" id="emp-add" name="emp-add" placeholder="Employee Address">
        </div>
        <div class="form-group col-lg-6 col-sm-12">
            <input type="text" class="form-control" id="emp-mail" name="emp-mail" placeholder="Employee E-mail">
        </div>
        <div class="form-group col-lg-6 col-sm-12">
            <input type="text" class="form-control" id="emp-mob" name="emp-mob" placeholder="Employee Mobile">
        </div>
        <div class="form-group col-lg-6 col-sm-12">
            <input type="text" class="form-control" id="emp-dept" name="emp-dept" placeholder="Employee Department">
        </div>
        <div class="buttonclass col-lg-12">
          <button type="submit" class="btn btn-info">Submit</button>
        </div> 
    </form>
    </div>
    <div class="buttonclass">
	<a href="Employee.jsp"><button type="submit" class="menu btn btn-dark">Back to home</button></a>
	</div>
</body>
</html>