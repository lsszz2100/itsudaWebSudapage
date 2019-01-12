<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="itsuda's namguro project in 2018">
<meta name="author" content="Youmi Hwang">
<script src="http://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js" integrity="sha256-VazP97ZCwtekAsvgPBSUwPFKdrwD3unUfSGVYrahUqU=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"/>
<link rel="icon" href="http://getbootstrap.com/favicon.ico">
<title>남구로시장</title>
<!-- <style>
body{background-color:#f7f7f7;}
@media (max-width: 768px)
{
	.navbar-nav{margin: 0px -15px;}
}
.navbar-default{background-color:#f5f5f5; box-shadow: 0px 1px 5px #e5e5e5;}
.navbar-default .navbar-nav>.active>a, 
.navbar-default .navbar-nav>.active>a:focus, 
.navbar-default .navbar-nav>.active>a:hover,
.navbar-nav .open .dropdown-menu{background-color:#f1f1f1;}
.navbar-default .navbar-toggle .icon-bar{background-color:#868686;}
.navbar-brand{margin:0 auto;}
.dropdown-toggle > *{color:#028d88;}
.nav>li{border-bottom:1px solid #f1f1f1;}
.nav .open>a, .nav .open>a:focus, .nav .open>a:hover{border-bottom:1px solid #028d88;}
</style> -->
</head>
<body>
<!-- <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark"> -->
<nav class="navbar navbar-default navbar-static-top">
	<div class="container">
	<tiles:insertAttribute name="header"  ignore="true"/>
	</div>
</nav>
<main role="main">
	<tiles:insertAttribute name="body" ignore="true"/>
</main>
<footer class="container">
	<p>© itsuda since 2018</p>
</footer>
</body>
</html>