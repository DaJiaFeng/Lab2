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
<title>Error!</title>
</head>
<body>
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
<h1>发生了错误！ </h1>
<h2>原因可能如下：</h2>
<dl>
				<dt>
					1.可能因为：
				</dt>
				<dd>
					您添加的书籍ISBN或名字，作者等信息为空。    书籍的作者，ISBN序号，名字不能为空。
				</dd>
				<dt>
					2.可能因为：
				</dt>
				<dd>
					你添加的作者信息名字或ID为空。 作者的名字和ID不能为空。
				</dd>
				<dd>
					或者你查找的作者图书库中没有记录，请返回主页先添加作者信息.
				</dd>
				<dt>
					3.可能因为：
				</dt>
				<dd>
					系统服务故障，请联系相关人员，谢谢。
				</dd>
				<dt>
					4.可能原因：
				</dt>
				<dd>
					未知Bug，GG!!!
				</dd>
			</dl>

                       <a href="/index.jsp#">返回主页</a>
                  
    </div>
    </div>
    </div>
</body>
</html>