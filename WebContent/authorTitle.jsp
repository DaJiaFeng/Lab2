<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="java.sql.*,java.io.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
 
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>作者著作</title>
</head>
<body>
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
<% 
	        //数据库用户名   
	        String username = System.getenv("ACCESSKEY");
String password = System.getenv("SECRETKEY");
//System.getenv("MYSQL_HOST_S"); 为从库，只读
String dbUrl = String.format("jdbc:mysql://%s:%s/%s", System.getenv("MYSQL_HOST"), System.getenv("MYSQL_PORT"), System.getenv("MYSQL_DB"));
	        try{
	        Class.forName("com.mysql.jdbc.Driver").newInstance();  
	        Connection connection = DriverManager.getConnection(dbUrl,username,password);  
	        String sql = "select * from book where AuthorID = '"+request.getAttribute("key")+"'";
	        PreparedStatement pq= connection.prepareStatement(sql);
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
				<% while(rs.next()){ %>
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
				<%} %>
			</table> 
                       <a href="/index.jsp#">返回</a>
           
			</div>
</div>
</div>
			
<% rs.close();  
pq.close();  
connection.close(); }catch(Exception e){e.printStackTrace(); 
	}%>


</body>
</html>