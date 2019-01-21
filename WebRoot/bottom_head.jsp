<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

 
	<link rel="stylesheet" type="text/css" href="<%=basePath %>/bootstrap/css/bootstrap.css">
	<link href="<%=basePath %>/css/common.css" rel="stylesheet" type="text/css">
	<link href="<%=basePath %>/css/link.css" rel="stylesheet" type="text/css">
	<link href="<%=basePath %>/css/style.css" rel="stylesheet" type="text/css">

	<script type="text/javascript" src="<%=basePath %>/bootstrap/js/bootstrap.min.js"></script>
	<script src="<%=basePath %>/js/Markdown.Converter.js" type="text/javascript"></script>
	<script src="<%=basePath %>/js/Markdown.Sanitizer.js" type="text/javascript"></script>
	<script src="<%=basePath %>/js/Markdown.Editor.js" type="text/javascript"></script>
	<script src="<%=basePath %>/js/prettify.js" type="text/javascript"></script>
	<script type="text/javascript" src="<%=basePath %>/js/compatibility.js"></script>
	<script type="text/javascript" src="<%=basePath %>/js/aws.js"></script>
	<style type="text/css">
		.panel-body{
		}
		#logo{
			height:60px;
			width:60px;
		}
		.footer{
			margin:0px;
		}
		.btn-default{
			text-shadow: none;
		}
	</style>
