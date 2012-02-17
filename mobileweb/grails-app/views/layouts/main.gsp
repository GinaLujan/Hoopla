<!doctype html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Hoopla Mobile"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="apple-mobile-web-app-capable" content="yes" />
		<meta name="viewport" content="minimum-scale=1.0, width=device-width, maximum-scale=0.6667, user-scalable=no" />

		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.png')}" >
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">

		<!-- stylesheet for jQuery Mobile -->
	    <link rel="stylesheet" href="${resource(dir: 'css', file: 'jquery.mobile-1.0.min.css')}" type="text/css" />
 
	    <!-- javascript for jQuery Mobile -->		
	    <script src="${resource(dir: 'js', file: 'jquery-1.7.1.min.js')}"></script>
    	<script src="${resource(dir: 'js', file: 'jquery.mobile-1.0.min.js')}"></script>

		<g:layoutHead/>
        <r:layoutResources />
	</head>
	<body>
		<div data-role="page">
			<div data-role="header" data-position="fixed">
				<h1><g:layoutTitle default="Hoopla" /> </h1>

				<g:pageProperty name="page.buttons" />
			</div>

			<div data-role="content">
				<g:pageProperty name="page.content" />
			</div>

        	<div data-role="footer" data-id="nav" data-position="fixed">
            	<div data-role="navbar">
<!--
					<ul>
						<li>
							<g:link controller="transaction" action="list" params="[type:'bill']" data-transition="fade">Bills</g:link>
						</li>
						<li>
							<g:link controller="transaction" action="list" params="[type:'budget']" data-transition="fade">Budget</g:link>
						</li>
						<li>
							<g:link controller="transaction" action="list" params="[type:'deposit']" data-transition="fade">Deposits</g:link>
						</li>
					</ul>
-->
					<div align="center">Powered by <a href="http://www.hoopla-app.com/">Hoopla</a></div>
            	</div>
        	</div>
		</div>
	</body>
</html>
