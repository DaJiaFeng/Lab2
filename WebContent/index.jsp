<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,java.io.*,java.util.*"%>
    <!-- 欢迎界面 -->
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
<title>图书管理</title>
</head>
<body>
 <div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<ul class="nav nav-tabs">
				<li class="active">
					 <a href="/index.jsp#">BOOK</a>
				</li>
				<li >
					 <a href="/test.jsp#">AUTHOR</a>
				</li>
			</ul>
			<form role="form" action="creation">
				<div class="col-sm-5">
					 <label for="ISBN">ISBN</label>
					 <input type="text" class="form-control" name="ISBN" />
				</div>
				<div class="col-sm-5">
					 <label for="Title">Title</label><input type="text" class="form-control" name="Title" />
				</div>
				<div class="col-sm-5">
					 <label for="AuthorID">AuthorID</label><input type="text"   class="form-control" name="AuthorID" />
				</div>
				<div class="col-sm-5">
					 <label for="Publisher">Publisher</label><input type="text" class="form-control" name="Publisher" />
				</div>
				<div class="col-sm-5">
					 <label for="PublishDate">PublishDate</label><input type="text" class="form-control" name="PublishDate" />
				</div>
				<div class="col-sm-5">
					 <label for="Price">Price</label><input type="number" class="form-control" name="Price" />
				</div>
				<!-- <div class="checkbox">
					 <label><input type="checkbox" />Check me out</label>
				</div>  -->
				<button type="submit" class="btn btn-default">Join</button>
			</form>
			<% 
	        //数据库用户名   
	        String driver = "com.mysql.jdbc.Driver";
String username = System.getenv("ACCESSKEY");
String password = System.getenv("SECRETKEY");
//System.getenv("MYSQL_HOST_S"); 为从库，只读
String dbUrl = String.format("jdbc:mysql://%s:%s/%s", System.getenv("MYSQL_HOST"), System.getenv("MYSQL_PORT"), System.getenv("MYSQL_DB"));
	        Class.forName("com.mysql.jdbc.Driver").newInstance();  
	        Connection connection = DriverManager.getConnection(dbUrl,username,password);  
	        Statement statement = connection.createStatement();  
	        String sql = "select * from book";  
	        ResultSet rs = statement.executeQuery(sql); %>
			<table class="table">
			 <caption>图书库信息:</caption>
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
						<th>
						    Operation
						</th>
					</tr>
				</thead>
				<% while(rs.next()){ %>
				<tbody>
				
					<tr>
						<td>
							<%out.print(rs.getString(1)); %>
					    </td>
						<td><a href="/Formation.jsp?ISB=<%=rs.getString(1) %>">
							<% out.print(rs.getString(2)); %></a>
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
						<td>
						    <a href="/delete.jsp?IS=<%=rs.getString(1) %>">Delete</a>
						</td>
					</tr>
					
				</tbody>
				<%} %>
			</table> 
		</div>
	</div>
</div>
<% rs.close();  
statement.close();  
connection.close();   %>
<div style="padding: 100px 100px 10px;">
    <form class="bs-example bs-example-form" role="form"  action="index">
        <div class="row">
            <div class="col-lg-6">
                <div class="input-group">
                    <span class="input-group-btn" >
                        <button class="btn btn-default" type="submit" >查询</button>
                    </span>
                    <input type="text" class="form-control" placeholder="Author's name" name="SerchName">
                </div><!-- /input-group -->
            </div><!-- /.col-lg-6 -->
        </div>
    </form>
</div>
</body>
</html>