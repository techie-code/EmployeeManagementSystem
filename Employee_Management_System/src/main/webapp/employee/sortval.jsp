<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee Management System</title>
<link href="../css/searcherror.css" rel="stylesheet" type="text/css">
</head>
<body>
<!-- To display the Sort employee details -->

<%@page import="employeerecord.database.*" %>
<%@page import="java.sql.*" %>
<%
Connection con = null;
PreparedStatement ps = null;
ResultSet rs =null;
	try{
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost/database","root","root");
		System.out.println("Connected");
	}catch(Exception e){
	System.out.println("Not connected");
} 
	
Employee em = new Employee();

//attribute value
String attribute = request.getParameter("att");

//To check that the attribute option is selected
boolean emptyattribute = em.emptyoption(attribute, "Attribute");

//Order value
String order = request.getParameter("md");

//To check that the order option is selected
boolean emptyorder = em.emptyoption(order, "Order");
%>
<jsp:include page="sort.jsp"></jsp:include>
<%
if(emptyattribute==true&&emptyorder==true){ %>
	<table class="container table list ">
    <thead class="thead-dark">
      <tr>
        <th scope="col">Employee ID</th>
        <th scope="col">Name</th>
        <th scope="col">Age</th>
        <th scope="col">Address</th>
        <th scope="col">Gender</th>
        <th scope="col">E-Mail</th>
        <th scope="col">Mobile</th>
        <th scope="col">Department</th>
      </tr>
    </thead>
    <tbody>
	<%
	ps = con.prepareStatement("SELECT * FROM employee1 ORDER BY "+attribute+" "+order);
	rs = ps.executeQuery();%>
	<%while(rs.next()){%>
		<tr>
        <td><%=rs.getString(1) %></td>
        <td><%=rs.getString(2) %></td>
        <td><%=rs.getString(3) %></td>
        <td><%=rs.getString(4) %></td>
        <td><%=rs.getString(5) %></td>
        <td><%=rs.getString(6) %></td>
        <td><%=rs.getString(7) %></td>
        <td><%=rs.getString(8) %></td>
      </tr>
<%}%>
	</tbody>
	</table>
<%}
else{%>
<div class="container card errorcard">
	<%=em.getError() %>
</div>
<%}

%>
%>