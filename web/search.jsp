<%-- 
    Document   : index
    Created on : Jun 4, 2022, 2:33:59 PM
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
  
 Connection con;
 PreparedStatement pst;
 ResultSet rs;
 Class.forName("com.mysql.jdbc.Driver");
 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root","");
 pst=con.prepareStatement("insert into student(id,name,course,fee,age) values(?,?,?,?,?)");
 pst.setString(1, sid);
 pst.setString(2, name);
 pst.setString(3, course);
 pst.setString(4, fee);
 pst.setString(5, age);
 
 pst.executeUpdate();

 
 
 
    
%>
<script>
    alert("Record Success ");
</script>

<%
    }

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- Bootstrap link -->
        <link href="bootstrap/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        
        
        <!-- //bootstrap -->
        
    </head>
    <body>
        
        <!--navbar container-->
        <nav class="navbar navbar-light bg-info">
            <div class="container">
                <h1><a class="navbar-brand">Student Management Form</a></h1>
                <form class="d-flex" action="">
                  <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="course">
                  <button class="btn btn-outline-success" type="submit">Search</button>
                </form>
            </div>
        </nav>
        <!-- container -->
        <div class=" container">
            <!-- main row -->
            <div class="row">
                <!-- form col -->
                <div class="col-md-4">
                   
                    <form action="" method="POST">
                        <div align="left">
                            <label class="form-label">Student Id</label>
                            <input type="text" class="form-control" name="sid" placeholder="Enter Student Id"/>
                        </div>
                        <div align="left">
                            <label class="form-label">Student Name</label>
                            <input type="text" class="form-control" name="name" placeholder="Enter Student Name"/>
                        </div>
                        <div align="left">
                            <label class="form-label">Course</label>
                            <select class="form-select" aria-label="Default select example" name="course" >
                                 <option selected>Select</option>
                                 <option value="Java">Java</option>
                                 <option value="PHP">PHP</option>
                                 <option value="Python">Python</option>
                                 <option value="JavaScript">JavaScript</option>
                            </select>
                            
                        </div>
                        <div align="left">
                            <label class="form-label">Fee</label>
                            
                            <input type="text" class="form-control" name="fee" placeholder="Enter Fee"/>
                        </div>
                        <div align="left">
                            <label class="form-label">Age</label>
                            <input type="text"class="form-control" name="age" placeholder="Enter Student Age"/>
                        </div>
                        <div align="left" class="mt-3">
                             <input type="submit" id="submit" name="submit" onclick="addStudent()" class="btn btn-info" value="Add"/>
                             <input type="submit" id="reset" name="reset" onclick="reSet()" class="btn btn-dark" value="Reset"/>
                        </div>
                        
                        
                    </form>
                    
                </div>
                 <!-- // form col -->
                  <!-- table col -->
                <div class="col-md-8 mt-3 ">
                    
                    <table id="tbl-student" class="table table-responsive table-bordered mt-3 text-center"  cellpadding="0" width="100%">
                        
                        <thead class="bg-dark text-white    ">
                            <tr>
                                <th>Id</th>
                                <th>Student Name</th>
                                <th>Course</th> 
                                <th>Fee</th>
                                <th>Age</th>
                                <th>Edit</th>
                                <th>Delete</th>
                            </tr>
                        </thead>
 <%
     
                Class.forName("com.mysql.jdbc.Driver");
                 Connection con;
                 PreparedStatement pst;
                 ResultSet rs;

                con=DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root","");
                
                 Statement st=con.createStatement();
                 String course=request.getParameter("course");
                 String query="select * from student where course='"+ course +" ' LIMIT 5" ;
                        
                 rs=st.executeQuery(query);
                 
                 while(rs.next()){
                 
                 String id=rs.getString("id");
                 
                 

              %>
                        
                        <tbody>
                           
                            <tr>
                                <td><%=rs.getInt("id")%></td> 
                                <td><%=rs.getString("name")%></td>
                                <td><%=rs.getString("course")%></td>
                                <td><%=rs.getString("fee")%> ks</td>
                                <td><%=rs.getString("age")%></td>
                                <td><button class="btn btn-info " ><a href="update.jsp?id=<%=id%>" class="text-white" style="text-decoration: none;"> Edit</a></button></td>
                                <td><button class="btn btn-dark " > <a href="delete.jsp?id=<%=id%>" class="text-white" style="text-decoration: none;"> Delete</a> </button></td>
                            </tr
                            
                         
                          
                           
                        </tbody>
                           
                        <%
                            }
                           
                        %>
                        
                    </table>
                     
                                <p><a href="index.jsp">All Post</a></p>
                            
                    
                </div>
                   <!-- // table col -->
            </div>
            <!-- // main row -->
        </div>
        <!-- //container-->
        
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
        <!-- bootstrap js -->
        <script src="bootstrap/bootstrap/js/bootstrap.js" type="text/javascript"></script>
        <script src="bootstrap/bootstrap/js/bootstrap.min.js" type="text/javascript"> </script>
        
        
         <!-- //bootstrap js -->
         
         
         
    </body>
</html>
