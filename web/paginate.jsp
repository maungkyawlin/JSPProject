<%-- 
    Document   : paginate
    Created on : Jun 12, 2022, 3:47:19 AM
    Author     : Mra Pann
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.* "%>
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
        <div class="container">
            <div class="row">
                <div class="col-md-6">
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
                            String sql="select * from student limit ?,?";
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
                                    <td><a class="" href="update.jsp?id=<%=rs.getInt("id")%>">Edit</a></td>
                                    <td><a class="" href="">Delete</a></td>
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
                            
                                <th colspan="7" class="text- ">
                                    <table width="100%">
                                        <tr>
                                           
                                          <%
                                           for(int i=0;i<=total/recordCount;i++){ %>
                                       
                                             <td> <a href="paginate.jsp?pgno=<%=i%>" class="btn btn-info">Page<%=i+1%></a>
                                            </td>
                                           <% }%>
                                           
                                        </tr>
                                     </table> 
                                </th>
                            </tr>
                   
                            
                    </table>
                </div>
            </div>
        </div>
        <!-- bootstrap js -->
        <script src="bootstrap/bootstrap/js/bootstrap.js" type="text/javascript"></script>
        <script src="bootstrap/bootstrap/js/bootstrap.min.js" type="text/javascript"> </script>
        
        
         <!-- //bootstrap js -->
    </body>
</html>
