<%-- 
    Document   : delete
    Created on : Jun 6, 2022, 2:10:52 PM
    Author     : IT(ERA)
--%>

    <%@page import="java.sql.*"%>

<%

  
  
  
  
  String id=request.getParameter("id");
  
 Connection con;
 PreparedStatement pst;
 ResultSet rs;
 Class.forName("com.mysql.jdbc.Driver");
 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root","");
 pst=con.prepareStatement("delete from student where id=?");
 
 pst.setString(1, id);
 pst.executeUpdate();
%>
<script>
    alert("Delete Success ");
</script>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <!-- Bootstrap link -->
        <link href="bootstrap/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        
        <script src="bootstrap/bootstrap/js/bootstrap.js" type="text/javascript"></script>
        <script src="bootstrap/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <!-- //bootstrap -->
    </head>
    <body>
        <div>
            <p><a href="index.jsp">View</a></p>
        </div>
    </body>
</html>
