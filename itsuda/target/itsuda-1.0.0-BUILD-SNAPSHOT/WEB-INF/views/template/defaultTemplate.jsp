<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/default/include/include.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<meta name="description" content="itsuda">
		<meta name="author" content="itsuda' WEBTeam">
		
		<script src="http://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js" integrity="sha256-VazP97ZCwtekAsvgPBSUwPFKdrwD3unUfSGVYrahUqU=" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
		<script src="https://unpkg.com/masonry-layout@4.2.1/dist/masonry.pkgd.min.js"></script>
		<script src="https://unpkg.com/infinite-scroll@3/dist/infinite-scroll.pkgd.js"></script>
		<script src="../js/common.js" type="text/javascript"></script>
		
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"/>
		<link rel="stylesheet" type="text/css" href="../css/default.css"/>
		<link rel="icon" href="http://getbootstrap.com/favicon.ico">
		
		<title>ItSuda</title>
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
		<footer class="container footer">
			<tiles:insertAttribute name="footer" ignore="true"/>
		</footer>
	</body>
</html>