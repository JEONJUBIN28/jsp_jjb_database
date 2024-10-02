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
		Connection connetion = null;
		Statement statement = null;
		ResultSet rs = null;
		
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String uid = "scott";
		String upw = "tiger";
		
		String query = "select e.ename, e.deptno, d.dname, d.loc from emp e,dept d where e.deptno=d.deptno";
		
		try{
			//OracleDriver oracl = new OracleDriver();
			Class.forName(driver);
			
			connetion = DriverManager.getConnection(url, uid, upw);
			statement = connetion.createStatement();
			rs = statement.executeQuery(query);
			
			while(rs.next()){
				int deptno = rs.getInt("deptno");
				String dname = rs.getString("dname");
				String loc = rs.getString("loc");
				String ename = rs.getString("ename");
			
				
				out.print("이름: " + ename + "&nbsp");
				out.print("부서번호: " + deptno + "&nbsp");
				out.print("부서이름: " + dname + "&nbsp");
				out.print("부서위치: " + loc + "&nbsp");
				
				
				out.print("<br>");
				
			}
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		finally{
			try{
				if(rs !=null) 
					rs.close();
				
				if(statement != null)
					statement.close();
				
				if(connetion != null)
					connetion.close();
			}catch(Exception e){}
		}		
		
	%>

</body>
</html>