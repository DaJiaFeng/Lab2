<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,java.io.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>删除图书</title>
</head>
<body>
<% 
	        //数据库用户名   
	        String username = System.getenv("ACCESSKEY");
String password = System.getenv("SECRETKEY");
//System.getenv("MYSQL_HOST_S"); 为从库，只读
String dbUrl = String.format("jdbc:mysql://%s:%s/%s", System.getenv("MYSQL_HOST"), System.getenv("MYSQL_PORT"), System.getenv("MYSQL_DB"));
	        Class.forName("com.mysql.jdbc.Driver").newInstance();  
	        Connection connection = DriverManager.getConnection(dbUrl,username,password);  
	        String sql = "select * from book where ISBN = '"+request.getParameter("IS")+"'";
	        String sqq="delete from book where ISBN = '"+request.getParameter("IS")+"'";
	        PreparedStatement pq= connection.prepareStatement(sql);
	        PreparedStatement pp= connection.prepareStatement(sqq);
	        ResultSet rs = pq.executeQuery(sql); %>
	        <table class="table">
				<thead>
					<tr>
						<th>
							ISBN
						</th>
						<th>
							Title
						</th>
						<th>
							AuthorID
						</th>
						<th>
							Publisher
						</th>
						<th>
							PublishDate
						</th>
						<th>
							Price
						</th>
					</tr>
				</thead>
				<% if(rs.next()){ %>
				<tbody>
				
					<tr>
						<td>
							<%out.print(rs.getString(1)); %>
					    </td>
						<td>
							<%out.print(rs.getString(2)); %>
						</td>
						<td>
							<%out.print(rs.getString(3)); %>
						</td>
						<td>
							<%out.print(rs.getString(4)); %>
						</td>
						<td>
							<%out.print(rs.getString(5)); %>
						</td>
						<td>
							<%out.print(rs.getFloat(6)); %>
						</td>
					</tr>
					
				</tbody>
				<%} pp.executeUpdate();%>
			</table>
			
                       <a href="/index.jsp#">返回</a>
                   
			<% 
rs.close();  
pq.close();  
connection.close();   %>
</body>
</html>