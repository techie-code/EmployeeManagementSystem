<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<link href="../css/download.css" rel="stylesheet" type="text/css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<title>Employee Management System</title>
</head>
<body>
    <h1 class="intro1">Employee Management System</h1>
    <div class="container concard card">
        <h4>Download the Employee's Data</h2>
            <div class="row">
            <div class="downloadcard card col-lg-6 col-sm-6">
                <a><i class="csvicon fas fa-file-csv fa-2x"></i></a>
                <p>Download the csv file</p>
               <a href="downloadcsv.jsp"><button class="btn btn-success">Download CSV File</button></a>
            </div>
            <div class="downloadcard card col-lg-6 col-sm-6">
                <a><i class="pdficon fas fa-file-pdf fa-2x"></i></a>
                <p>Download the PDF file</p>
                <a href="downloadpdf.jsp"> <button class="btn btn-danger">Download PDF File</button></a>
            </div>
        </div>
    </div>
    <div class="back d-flex justify-content-center ">
        <a href="Employee.jsp"><button class="btn btn-info">Back to home</button></a>
    </div>
</body>
</html>