<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee Management System</title>
<link href="../css/searcherror.css" rel="stylesheet" type="text/css">
</head>
<!-- Search the employee based on given input page -->
<body>
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

//Search value 
String searchvalue = request.getParameter("searchvalue");

//To check that the option is selected
boolean emptysearch = em.emptyspace(searchvalue,"Search");

//attribute value
String attribute = request.getParameter("att");

//To check that the attribute is selected
boolean emptyattribute = em.emptyoption(attribute, "Attribute");

//Method value
String method = request.getParameter("md");

//To check that the method option is selected
boolean emptymethod = em.emptyoption(method, "Method");
%>
<jsp:include page="search.jsp"></jsp:include><%
if(emptysearch==true &&emptyattribute==true&&emptymethod==true){

	boolean result = false;
	
	//contains
	if(method.compareTo("contains")==0){
		ps = con.prepareStatement("SELECT * FROM employee1 WHERE "+attribute+" LIKE '%" + searchvalue + "%'");
	    rs = ps.executeQuery();
		result =rs.isBeforeFirst();
		if(result){%>
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
      <% while(rs.next()){%>
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
    		<%}
    	%>
        </tbody>
      </table>
     <% }
		else{%>
			<div class="searcherror">
	        <img src="../imagefolder/search.png" width="100" height="150">
	    	<h4>Not Found!!!!!</h4>
	        </div>
		<%}
	}
	//starts with
	else if (method.compareTo("startswith")==0){
		ps = con.prepareStatement("SELECT * FROM employee1 WHERE "+attribute+" LIKE '"+searchvalue+"%'");
		rs = ps.executeQuery();
		result =rs.isBeforeFirst();
		if(result){%>
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
      <% while(rs.next()){%>
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
    		<%}
    	%>
        </tbody>
      </table>
     <% }
		else{%>
			<div class="searcherror">
	        <img src="../imagefolder/search.png" width="100" height="150">
	    	<h4>Not Found!!!!!</h4>
	        </div>
		<%}
	}
	
	//ends with
	else if (method.compareTo("endswith")==0){
		ps = con.prepareStatement("SELECT * FROM employee1 WHERE "+attribute+" LIKE '%"+searchvalue+"'");
		rs = ps.executeQuery();
		result =rs.isBeforeFirst();
		if(result){%>
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
      <% while(rs.next()){%>
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
    		<%}
    	%>
        </tbody>
      </table>
     <% }
		else{%>
			<div class="searcherror">
	        <img src="../imagefolder/search.png" width="100" height="150">
	    	<h4>Not Found!!!!!</h4>
	        </div>
		<%}
	}
	//equals
	else if (method.compareTo("equals")==0){
		ps = con.prepareStatement("SELECT * FROM employee1 WHERE "+attribute+" = ?");
		ps.setString(1,searchvalue);
		rs = ps.executeQuery();
		result =rs.isBeforeFirst();
		if(result){%>
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
      <% while(rs.next()){%>
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
    		<%}
    	%>
        </tbody>
      </table>
     <% }
		else{%>
			<div class="searcherror">
	        <img src="../imagefolder/search.png" width="100" height="150">
	    	<h4>Not Found!!!!!</h4>
	        </div>
		<%}
	}
	//not equals
	else if (method.compareTo("notequal")==0){
		ps = con.prepareStatement("SELECT * FROM employee1 WHERE "+attribute+" != ?");
		ps.setString(1,searchvalue);
		rs = ps.executeQuery();
		result =rs.isBeforeFirst();
		if(result){%>
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
      <% while(rs.next()){%>
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
    		<%}
    	%>
        </tbody>
      </table>
     <% }
		else{%>
			<div class="searcherror">
	        <img src="../imagefolder/search.png" width="100" height="150">
	    	<h4>Not Found!!!!!</h4>
	        </div>
		<%}
	}
}
else{%>
<div class="container card errorcard">
	<%=em.getError() %>
</div>
<%}

%>
</body>
</html>