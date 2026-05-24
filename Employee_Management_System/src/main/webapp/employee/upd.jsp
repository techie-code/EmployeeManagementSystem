<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<link href="../css/valid.css" rel="stylesheet" type="text/css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<title>Employee Management System</title>
</head>
<!-- Update validation -->
<body>
<%@page import="employeerecord.database.*" %>
<%

 Employee em = new Employee();

/*Employee ID*/

//Employee ID
String empid = (String)session.getAttribute("empid");

/*Employee name*/

//employee name
String name = request.getParameter("emp-name");

int namelen = name.length();

//To check that the employee name is filled

boolean emptyname = em.emptyspace(name,"Name");


/*Employee age*/

//Employee age
String age = request.getParameter("emp-age");

int agelen = age.length();

System.out.println(age);

//To validate employee age
boolean ageval = em.empAge(age, agelen);

/*Employee Address*/

//Employee address
String address = request.getParameter("emp-add");

int addlen = address.length();

//To check that the employee address is filled
boolean emptyaddress = em.emptyspace(address,"Address");

/*Employee Gender*/

//Employee gender
String gender = request.getParameter("gender-op");

//To check that the employee gender option is selected

boolean genval = em.genVal(gender);

/*Employee mail*/

//Employee mail
String mail = request.getParameter("emp-mail");

int maillen = mail.length();

//To validate the mail
boolean emailValue = em.emailVal(mail);

//To check that the given mail id is unique or not
boolean uniqueemailid=em.emailIdVal(empid, mail);

/*Employee mobile*/

//employee mobile

String mobile = request.getParameter("emp-mob");

//To validate the mobile number
int moblen = mobile.length();

boolean mobval=em.mobileVal(mobile, moblen);

/*Employee department*/

//Employee department
String dept = request.getParameter("emp-dept");

//To check that the employee department is filled or not

boolean emptydept = em.emptyspace(dept,"Department");
int deptlen = dept.length();


if(emptyname==true && ageval==true && genval==true&& uniqueemailid==true &&emptyaddress==true && emailValue==true && emptydept==true && mobval==true){
	em.updatedb(empid,name,age,address,gender,mail,mobile,dept);
	response.sendRedirect("alert.jsp");
}
else{%>
<jsp:include page="upval.jsp"></jsp:include>
    <div class="errorclass">
   <p> <%=em.getError() %><p>
    </div>

 <% }
 %>

</body>
</html>