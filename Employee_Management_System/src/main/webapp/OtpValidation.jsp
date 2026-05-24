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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>Employee Management System</title>
</head>
<body>
<!-- OTP VALIDATION -->
<%@page import="employeerecord.database.*" %>
<%
//username
String username=(String)session.getAttribute("username");
//otp
String actualOtp=(String)session.getAttribute("otp");
session.setAttribute("actualOtp",actualOtp);
System.out.println(username+" is the username(otp verification)");
if(username!=null){%>
	<h1 class="intro1">Employee Management System</h1>
    <div class="container otpcard card">
    <div class="otpvalidation">   
    <form class="row" action="OtpCheck.jsp">
        <h2>Validate OTP</h2>
        <h5>A one time password has been sent to <% out.print(" "+username); %>. Please enter the OTP below for verification</h5>
        <div class="form-group col-lg-12 col-sm-12">
            <input type="text" class="form-control" id="emp-name" placeholder="Email-ID" name="username" value=<%=username%> readonly>
            <%System.out.println(username); %>
        </div>
        <div class="form-group col-lg-12 col-sm-12">
            <input type="text" class="form-control" id="emp-otp" name="otp" placeholder="OTP Number">
        </div>
        <div class="buttonclass col-lg-12">
            <button type="submit" class="btn btn-info">Submit</button>
        </div>  
        <div class="d-flex justify-content-center">
            <p class="d-inline otpcounter">Enter OTP Before: </p>
            <a class="otpinvalid" id="otpinvalid"></a> <p class="d-inline otpcounter" id="session">&nbsp;01:00</p>         
        </div>
    </form>
    </div>
        <img class="otpimg" src="./imagefolder/otp-icon.png"/>
    </div>
    <script>
    const timer=1;
    let time=timer*60;
    const sessionotp=document.getElementById("session");
   	setInterval(updateotptime,1000);
   	function updateotptime(){
       const minutes=Math.floor(time/60);
       let seconds=time%60;
       seconds=seconds<10?'0'+seconds:seconds;
       sessionotp.innerHTML="&nbsp;0"+minutes+":"+seconds;
       time--;
       if(time<0){
    	   var otpinvalid=document.getElementById("otpinvalid");
    	   otpinvalid.href="<%=request.getContextPath()%>/otpinvalid.jsp";
    	   document.getElementsByClassName("otpinvalid")[0].click();
       }
   }
	</script>
<%}
else{
	response.sendRedirect(request.getContextPath());
}%>
</body>
</html>