<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <link href="../css/list.css" rel="stylesheet" type="text/css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
        <title>Employee Management System</title>
    </head>
    <!-- List of employee details -->
	<body>
    <div class="container">
        <h1 class="intro1">Employee Management System</h1>
    <h4>Employee List</h4>
    <table class="table list ">
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
        <%@page import="java.sql.*" %>
        <%Connection con = null;
    	PreparedStatement ps = null;
    		try{
    			Class.forName("com.mysql.jdbc.Driver");
    			con = DriverManager.getConnection("jdbc:mysql://localhost/database","root","root");
    			System.out.println("Connected");
    		}catch(Exception e){
    		System.out.println("Not connected");
    		} 
    		ps = con.prepareStatement("SELECT * FROM employee1");
    		ResultSet rs = ps.executeQuery();
    		while(rs.next()){%>
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
      <div class="buttonclass">
        <a href="Employee.jsp"> <button type="submit" class="btn btn-info">Back to Home</button></a>
    </div>
     
    </div>
    
</body>
</html>