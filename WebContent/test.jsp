<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<ul class="nav nav-tabs">
				<li >
					 <a href="/index.jsp#">BOOK</a>
				</li>
				<li class="active">
					 <a href="/test.jsp#">AUTHOR</a>
				</li>
			</ul>
			<form role="form" action="join">
				<div class="col-sm-5">
					 <label for="AuthorID">AuthorID</label>
					 <input type="text" class="form-control" name="AuthorID" />
				</div>
				<div class="col-sm-5">
					 <label for="Name">Name</label><input type="text" class="form-control" name="Name" />
				</div>
				<div class="col-sm-5">
					 <label for="Age">Age</label><input type="text"   class="form-control" name="Age" />
				</div>
				<div class="col-sm-5">
					 <label for="Country">Country</label><input type="text" class="form-control" name="Country" />
				</div>
				<button type="submit" class="btn btn-default">CREATE</button>
				</form>
         </div>
	</div>
</div>
</body>
</html>