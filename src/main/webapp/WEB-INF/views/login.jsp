<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<!--[if IE 9 ]><html class="ie9" lang="en"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html lang="en"><!--<![endif]-->
<head>
<meta charset="utf-8">
<title>oz180 admin login</title>
<meta name="description" content="Admin Dashboard">
<meta name="author" content="">
<meta name="keyword" content="">
<!-- end: Meta -->

<!-- start: Mobile Specific -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- end: Mobile Specific -->

<!-- start: CSS -->
<link id="bootstrap-style"
	href="<c:url value="/resources/css/bootstrap.min.css"/>"
	rel="stylesheet">
<link
	href="<c:url value="/resources/css/bootstrap-responsive.min.css"/>"
	rel="stylesheet">
<link id="base-style" href="<c:url value="/resources/css/style.css"/>"
	rel="stylesheet">
<link id="base-style-responsive"
	href="<c:url value="/resources/css/style-responsive.css"/>"
	rel="stylesheet">
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800&subset=latin,cyrillic-ext,latin-ext'
	rel='stylesheet' type='text/css'>
<!-- end: CSS -->


<!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
	  	<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<link id="ie-style" href="<c:url value="/resources/css/ie.css"/>" rel="stylesheet">
	<![endif]-->

<!--[if IE 9]>
		<link id="ie9style" href="<c:url value="/resources/css/ie9.css"/>" rel="stylesheet">
	<![endif]-->

<!-- start: Favicon -->
<link rel="shortcut icon"
	href="<c:url value="/resources/img/favicon.ico"/>">
<!-- end: Favicon -->

<style type="text/css">
body {
	background: url(resources/img/bg-login.jpg) !important;
}
</style>



</head>

<body>
	<div class="container-fluid-full">
		<div class="row-fluid">

			<div class="row-fluid">
				<div class="login-box">
					<div class="icons">
						<a href="index.html"><i class="halflings-icon home"></i></a> <a
							href="#"><i class="halflings-icon cog"></i></a>
					</div>
					<h2>Login to your account</h2>
					<c:url var="home" value="/" />
					<form class="form-horizontal" action="${home}/login" method="post">
						<fieldset>

							<div class="input-prepend" title="Username">
								<span class="add-on"><i class="halflings-icon user"></i></span>
								<input class="input-large span10" name="username" id="username"
									type="text" placeholder="type username" />
							</div>
							<div class="clearfix"></div>

							<div class="input-prepend" title="Password">
								<span class="add-on"><i class="halflings-icon lock"></i></span>
								<input class="input-large span10" name="password" id="password"
									type="password" placeholder="type password" />
							</div>
							<div class="clearfix"></div>

							<div class="button-login">
								<button type="submit" class="btn btn-primary">Login</button>
							</div>
							<div class="clearfix"></div>
					</form>
					<hr>
				</div>
				<!--/span-->
			</div>
			<!--/row-->


		</div>
		<!--/.fluid-container-->

	</div>
	<!--/fluid-row-->

<%-- 	<script src="<c:url value="/resources/js/jquery-1.9.1.min.js"/>"></script>
	<script
		src="<c:url value="/resources/js/jquery-migrate-1.0.0.min.js"/>"></script>

	<script
		src="<c:url value="/resources/js/jquery-ui-1.10.0.custom.min.js"/>"></script>

	<script src="<c:url value="/resources/js/jquery.ui.touch-punch.js"/>"></script>

	<script src="<c:url value="/resources/js/modernizr.js"/>"></script>

	<script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>

	<script src="<c:url value="/resources/js/jquery.cookie.js"/>"></script>

	<script src="<c:url value="/resources/js/fullcalendar.min.js"/>"></script>

	<script src="<c:url value="/resources/js/jquery.dataTables.min.js"/>"></script>

	<script src="<c:url value="/resources/js/excanvas.js"/>"></script>
	<script src="<c:url value="/resources/js/jquery.flot.js"/>"></script>
	<script src="<c:url value="/resources/js/jquery.flot.pie.js"/>"></script>
	<script src="<c:url value="/resources/js/jquery.flot.stack.js"/>"></script>
	<script src="<c:url value="/resources/js/jquery.flot.resize.min.js"/>"></script>

	<script src="<c:url value="/resources/js/jquery.chosen.min.js"/>"></script>

	<script src="<c:url value="/resources/js/jquery.uniform.min.js"/>"></script>

	<script src="<c:url value="/resources/js/jquery.cleditor.min.js"/>"></script>

	<script src="<c:url value="/resources/js/jquery.noty.js"/>"></script>

	<script src="<c:url value="/resources/js/jquery.elfinder.min.js"/>"></script>

	<script src="<c:url value="/resources/js/jquery.raty.min.js"/>"></script>

	<script src="<c:url value="/resources/js/jquery.iphone.toggle.js"/>"></script>

	<script
		src="<c:url value="/resources/js/jquery.uploadify-3.1.min.js"/>"></script>

	<script src="<c:url value="/resources/js/jquery.gritter.min.js"/>"></script>

	<script src="<c:url value="/resources/js/jquery.imagesloaded.js"/>"></script>

	<script src="<c:url value="/resources/js/jquery.masonry.min.js"/>"></script>

	<script src="<c:url value="/resources/js/jquery.knob.modified.js"/>"></script>

	<script src="<c:url value="/resources/js/jquery.sparkline.min.js"/>"></script>

	<script src="<c:url value="/resources/js/counter.js"/>"></script>

	<script src="<c:url value="/resources/js/retina.js"/>"></script>

	<script src="<c:url value="/resources/js/custom.js"/>"></script>
	<!-- end: JavaScript-->
 --%>
</body>
</html>
