<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <%
      Connection connetion;
      Statement statement;
      ResultSet rs;
      
      String driver = "oracle.jdbc.driver.OracleDriver";
      String url = "jdbc:oracle:thin:@localhost:1521:xe";
      String uid = "scott";
      String upw = "tiger";
      
      String query = "select * from emp";
      
      try{
         
         Class.forName(driver);
         connetion = DriverManager.getConnection(url, uid, upw);
         statement = connetion.createStatement();
         rs = statement.executeQuery(query);
         
         ResultSetMetaData rsmd = rs.getMetaData();
               
         
         out.print("<table border='1'>");
         out.print("<tr>");   
         
         for(int i=1; i<=rsmd.getColumnCount();i++){
            out.print("<td>" + rsmd.getColumnName(i) + "</td>");
         }
               
         out.print("</tr>");   
         
         
         
         
         
         while(rs.next()){
            int empno = rs.getInt("empno");
            String ename = rs.getString("ename");
            String job = rs.getString("job");
            String mgr = rs.getString("mgr");
            String hiredate = rs.getString("hiredate");
            int sal = rs.getInt("sal");
            String comm = rs.getString("comm");
            int deptno = rs.getInt("deptno");
            
            out.print("<tr>");         
            
            out.print("<td>" + empno + "</td>");
            out.print("<td>" + ename + "</td>");
            out.print("<td>" + job + "</td>");
            out.print("<td>" + mgr + "</td>");
            out.print("<td>" + hiredate + "</td>");
            out.print("<td>" + sal + "</td>");
            out.print("<td>" + comm + "</td>");
            out.print("<td>" + deptno + "</td>");
            
            out.print("</tr>");
            
         }
         
         out.print("</table>");
         
         
      }catch(Exception e){}
      finally{}
      
      
      
   %>
   
</body>
</html>