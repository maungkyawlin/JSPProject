<%-- 
    Document   : update
    Created on : Jun 6, 2022, 2:10:36 PM
    Author     : IT(ERA)
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%
  if(request.getParameter("submit")!=null){
  
  
  
  String sid=request.getParameter("sid");
  String name=request.getParameter("name");
  String course=request.getParameter("course");
  String fee=request.getParameter("fee");
  String age=request.getParameter("age"); 
  String id=request.getParameter("id");
  
 Connection con;
 PreparedStatement pst;
 ResultSet rs;
 Class.forName("com.mysql.jdbc.Driver");
 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root","");
 pst=con.prepareStatement("update student set  name=?,course=?,fee=?,age=? where id=?");
 pst.setString(1, name);
 pst.setString(2, course);
 pst.setString(3, fee);
 pst.setString(4, age);
 pst.setString(5, id);
 pst.executeUpdate();
%>
<script>
    alert(" Update Success ");
</script>
<%
    };
%>
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
        <nav class="navbar navbar-light bg-info">
            <div class="container">
                <h1><a class="navbar-brand">Student Management Update Form</a></h1>
                <form class="d-flex" action="search.jsp">
                   <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="course">
                  <button class="btn btn-outline-success" type="submit">Search</button>
                </form>
            </div>
        </nav>
        <!-- container -->
        <div class="container">
            <!-- main row -->
            <div class="row">
                <!-- form col -->
                <div class="col-md-4">
                    
                    <form action="#" method="POST">
                        
                        <%
                            Connection con;
                            PreparedStatement pst;
                            ResultSet rs;
                            Class.forName("com.mysql.jdbc.Driver");
                            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root","");
 
                            String id=request.getParameter("id");
                            pst=con.prepareStatement("select * from student where id = ? ");
                            pst.setString(1,id);

                            rs=pst.executeQuery();
                            
                              while(rs.next())
                              
                              {


                            %>
                        <div align="left">
                            <label class="form-label">Student Id</label>
                            <input type="text" class="form-control" value="<%=rs.getString("id")%>" name="sid" placeholder="Enter Student Id"/>
                        </div>
                        <div align="left">
                            <label class="form-label">Student Name</label>
                            <input type="text" class="form-control" value="<%=rs.getString("name")%>" name="name" placeholder="Enter Student Name"/>
                        </div>
                        <div align="left">
                            <label class="form-label">Course</label>
                            <input type="text"class="form-control" value="<%=rs.getString("course")%>" name="course" placeholder="Enter Course"/>
                        </div>
                        <div align="left">
                            <label class="form-label">Fee</label>
                            <input type="text" class="form-control" value="<%=rs.getString("fee")%>" name="fee" placeholder="Enter Fee"/>
                        </div>
                        <div align="left">
                            <label class="form-label">Age</label>
                            <input type="text"class="form-control" value="<%=rs.getString("age")%>" name="age" placeholder="Enter Student Age"/>
                        </div>
                            
                        
                            <%
                                };
                             %>
                            
                            
                        <div align="left" class="mt-3 mb-3">
                             <input type="submit" id="submit" name="submit" class="btn btn-info" value="Update"/>
                             <input type="submit" id="reset" name="reset" class="btn btn-dark" value="Reset"/>
                        </div>
                        
                             <div align="">
                                 <p><a href="index.jsp" class=" mt-3">Click Back</a> </p>
                             </div>
                        
                    </form>
                    
                </div>
                 <!-- // form col -->
                
            </div>
            
            <!-- //main row -->
        </div>
        <!-- //container -->
        
         <div class="container-fluid bg-dark mt-3">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 m-3 p-2" >
                        <p><a href="index.jsp" class="text-decoration-none">>>Home</a></p>
                        <p><a href="index.jsp" class="text-decoration-none">>>About</a></p>
                        <p><a href="index.jsp" class="text-decoration-none">>>Contact</a></p>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
