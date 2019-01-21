<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

 
  	<link rel="stylesheet" type="text/css" href="<%=path %>/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="<%=path %>/bootstrap/css/bootstrap-theme.min.css">
	<link rel="stylesheet" type="text/css" href="<%=path %>/bootstrap/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="<%=path %>/icon/iconfont.css">
	<link href="<%=path %>/css/common.css" rel="stylesheet" type="text/css">
	<link href="<%=path %>/css/link.css" rel="stylesheet" type="text/css">
	<link href="<%=path %>/css/style.css" rel="stylesheet" type="text/css">
	
	<script type="text/javascript" src="<%=path %>/bootstrap/js/bootstrap.min.js"></script>
	<script src="<%=path %>/js/Markdown.Converter.js" type="text/javascript"></script>
	<script src="<%=path %>/js/Markdown.Sanitizer.js" type="text/javascript"></script>
	<script src="<%=path %>/js/Markdown.Editor.js" type="text/javascript"></script>
	<script src="<%=path %>/js/prettify.js" type="text/javascript"></script>
	<script type="text/javascript" src="<%=path %>/js/compatibility.js"></script>
	
	<script src="<%=path %>/icon/iconfont.js"></script>
	<script type="text/javascript">
		var G_INDEX_SCRIPT = '';
		var G_SITE_NAME = 'CCND论坛';
		var G_BASE_URL = 'localhost/CCND/';
	</script>
	<style type="text/css">
	.aw-btn-nav {
		display:inline-block;
	    position: relative;
	    margin: 10px 0 0 10px;
	}
	.navbar-btn,.btn-info{
		height:34px;
	}
	.w4 .buy-icno {
    position: absolute;
    margin-top:20px;
    margin-right:10px;
    top: 0;
    right: 50%;
    z-index: -1;
}
/*infinite动画一直重复*/

.w4 .buy-icno {
    animation: transform 9s linear infinite forwards;
}
	
		@keyframes transform {
    0% {
        transform-origin: top center;
        transform: rotate(0deg);
    }
    25% {
        transform-origin: top center;
        transform: rotate(50deg);
    }
    50% {
        transform-origin: top center;
        transform: rotate(0deg);
    }
    75% {
        transform-origin: top center;
        transform: rotate(-50deg);
    }
    100% {
        transform-origin: top center;
        transform: rotate(0deg);
    }
}
	</style>

