<%-- 
    Document   : index
    Created on : Jun 4, 2022, 2:33:59 PM
    Author     : IT(ERA)
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Random,java.util.ArrayList,java.io.*"%>
<%@page import="java.util.Date"%>
<%
    
    
  if(request.getParameter("submit")!=null){
  
  String sid=request.getParameter("id");
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
                <h1><a class="navbar-brand">Student Management Post Form</a></h1>
                <form class="d-flex" action="search.jsp">
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

         <%
            int id=1;
            try{
            Class.forName("com.mysql.jdbc.Driver");
             Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root","");
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery("select max(id) from product ");
            
            while(rs.next()){
            id=rs.getInt(1);
            id=id+1;
            
                }
            
                }catch( Exception e){
                
                }
            
            %>
                    <form action="" method="POST">
                        <div align="left">
                            <h3 for="id" class="text-info">Product ID:<%out.println(id);%></h3>
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
                        <thead class="bg-dark text-white">
                            <tr>
                                <th>Id</th>
                                <th>Name</th>
                                <th>Course</th>
                                <th>Fee</th>
                                <th>Age</th>
                                <th>Edit</th>
                                <th>Delete</th>
                            </tr>
                        </thead>
                        <% 
                             int total=0;
                             int start=0;
                             int recordCount=3;
                           int pgno=request.getParameter("pgno")==null?0:Integer.parseInt(request.getParameter("pgno"));
                            start=pgno*recordCount;
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root","");
                            String sql="select * from student where id ORDER BY id ASC  limit ?,? ";
                            PreparedStatement pst=con.prepareStatement(sql);
                            pst.setInt(1,start);
                            pst.setInt(2,recordCount);
                            ResultSet rs=pst.executeQuery();
                             
                           while(rs.next()){%>
                               
                               
                                
                                <tr> 
                                  
                                    <td><%=rs.getInt("id")%></td>
                                    <td><%=rs.getString("name")%></td>
                                    <td><%=rs.getString("course")%></td>
                                    <td><%=rs.getString("fee")%></td> 
                                    <td><%=rs.getString("age")%></td>
                              
                                   
                                    <td><button class="btn btn-info "><a class="text-decoration-none text-white" href="update.jsp?id=<%=rs.getInt("id")%>">Edit</a></button></td>
                                    <td><button class="btn btn-dark text-white"><a class="text-decoration-none text-white" href="delete.jsp?id=<%=rs.getInt("id")%>">Delete</a></button></td>
                                </tr>
                        
                           
                         <%}

                           String sql1="select count(*) from student";
                           PreparedStatement pst1=con.prepareStatement(sql1);
                           ResultSet rs2=pst1.executeQuery();
                            
                                 if(rs2.next()){
                                    total=rs2.getInt(1);
                                   }
                        con.close();
                        pst.close();
                        
                        
                        %>
                       
                            <tr>
                            
                                <th colspan="7" class="p-0">
                                    <table width="100%" class="mt-3 ">
                                        <tr>
                                           
                                          <%
                                           for(int i=0;i<=total/recordCount;i++){ %>
                                       
                                             <td> 
                                                 <a href="index.jsp?pgno=<%=i%>" class="btn btn-dark mb-3">Page<%=i+1%></a>
                                            </td>
                                           <% }%>
                                           
                                        </tr>
                                        <tr >
                                            <td colspan="7" class=" bg-dark  p-2 text-white "> Total Student: <%=total%></td>
                                        </tr>
                                     </table> 
                                </th>
                            </tr>
                   
                            
                    </table>
                    
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
