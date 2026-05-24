<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<link href="../css/search.css" rel="stylesheet" type="text/css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<title>Employee Management System</title>
</head>
<!-- Sort employee details page -->
<body>
    <h1 class="intro1">Employee Management System</h1>
<div class=" container searchcard card">
<form action="sortval.jsp">
<div class="attribute">
    <label class="heading">Attributes: </label>
    <label class="attri" for="empid">
    <input type="radio" name="att" id="empid" value="EmployeeID"/>
        <div class="con card">Employee ID</div>
    </label>
    <label class="attri" for="empname">
        <input type="radio" name="att" id="empname" value="Name"/>
            <div class="con card">Employee Name</div>
    </label>
    <label class="attri" for="empage">
        <input type="radio" name="att" id="empage" value="Age"/>
            <div class="con card">Employee Age</div>
    </label>
    <label class="attri" for="empadd">
        <input type="radio" name="att" id="empadd" value="Address"/>
            <div class="con card">Employee Address</div>
    </label>
    <label class="attri" for="empgen">
        <input type="radio" name="att" id="empgen" value="Gender"/>
            <div class="con card">Gender</div>
        </label>
        <label class="attri" for="empem">
            <input type="radio" name="att" id="empem" value="Email"/>
                <div class="con card">E-mail</div>
        </label>
        <label class="attri" for="empmob">
            <input type="radio" name="att" id="empmob" value="Mobile"/>
                <div class="con card">Mobile</div>
        </label>
        <label class="attri" for="empdept">
            <input type="radio" name="att" id="empdept" value="Department"/>
                <div class="con card">Department</div>
        </label>
</div>
<div class="method">
    <label class="heading">Orders:</label>
    <label class="meth" for="asc">
        <input type="radio" name="md" id="asc" value="ASC"/>
        <div class="con card">Ascending</div>
    </label>
    <label class="meth" for="desc">
        <input type="radio" name="md" id="desc" value="DESC"/>
        <div class="con card">Descending</div>
    </label>

</div>
<div class="container backtomenu">
<button type="submit"class="menubtn btn btn-info">Show</button>
</div>
</form>
</div>
<div class="container backtomenu">
<a href="Employee.jsp"><button type="submit"class="menubtn btn btn-dark">Back to home</button></a>
</div>
</body>
</html>