<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee Management System</title>

</head>
<!-- Employee validation page to create -->
<body>
<%@page import="employeerecord.database.*" %>
<%
 Employee em = new Employee();
/*Employee's id*/

//Employee's ID
String empid = request.getParameter("emp-id");

int emplen = empid.length();

//validate the employee's id
boolean empval = em.empIdVal(empid);

//to check employee id is filled
boolean emptyid = em.emptyspace(empid,"Employee-ID");

/*Employee's name*/

//employee's name
String name = request.getParameter("emp-name");


int namelen = name.length();

//To check the employee name is filled
boolean emptyname = em.emptyspace(name,"Name");


/*Employee's Age*/

//Employee's age
String age = request.getParameter("emp-age");

int agelen = age.length();

//To validate the employee age
boolean ageval = em.empAge(age, agelen);


/*Employee's Address*/

//Employee's Address
String address = request.getParameter("emp-add");

int addlen = address.length();

//To check the employee address is filled
boolean emptyaddress = em.emptyspace(address,"Address");


/*Employee's Gender*/

//Employee gender
String gender = request.getParameter("gender-op");

//To validate Employee gender
boolean genval = em.genVal(gender);


/*Employee's Mail*/

//Employee Mail
String mail = request.getParameter("emp-mail");
int maillen = mail.length();

//To validate the mail
boolean emailValue = em.emailVal(mail);

//To check that the mail id is unique 
boolean uniqueemailid=em.emailIdVal(empid, mail);


/*Employee's Mobile number*/

//Employee's mobile number
String mobile = request.getParameter("emp-mob");

//To validate the mobile number
int moblen = mobile.length();

boolean mobval=em.mobileVal(mobile, moblen);


/*Employee's Department*/

//employee department
String dept = request.getParameter("emp-dept");

//To check that the department field is filled
boolean emptydept = em.emptyspace(dept,"Department");

int deptlen = dept.length();


if(empval==true && emptyid==true && emptyname==true && ageval==true && genval==true &&emptyaddress==true && emailValue==true &&uniqueemailid==true && emptydept==true && mobval==true){
	em.insert(empid,name,age,address,gender,mail,mobile,dept);
	response.sendRedirect("alert.jsp");
}
else{%>
<jsp:include page="create.jsp"></jsp:include>
    <div class="errorclass">
    <%=em.getError() %>
    </div>

 <% }
 %>

</body>
</html>