<%@page import="java.util.Date"%>
<%@include file="kontrol.jsp"%>

<%@ page contentType="text/html; charset=UTF-8" language="java"
	import="java.sql.*" import="java.util.*" import="java.text.*"
	import="java.*" errorPage=""%>



<!DOCTYPE html>
<html lang="tr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="ThemeBucket">
<link rel="shortcut icon" href="../dosya/images/favicon.png">
<title>Personel Paneli</title>
<!--Core CSS -->
<link href="../dosya/bs3/css/bootstrap.min.css" rel="stylesheet">
<link href="../dosya/js/jquery-ui/jquery-ui-1.10.1.custom.min.css"
	rel="stylesheet">
<link href="../dosya/css/bootstrap-reset.css" rel="stylesheet">
<link href="../dosya/font-awesome/css/font-awesome.css" rel="stylesheet">
<link href="../dosya/js/jvector-map/jquery-jvectormap-1.2.2.css"
	rel="stylesheet">
<link href="../dosya/css/clndr.css" rel="stylesheet">
<!--clock css-->
<link href="../dosya/js/css3clock/css/style.css" rel="stylesheet">
<!--Morris Chart CSS -->
<link rel="stylesheet" href="../dosya/js/morris-chart/morris.css">
<!-- Custom styles for this template -->
<link href="../dosya/css/style.css" rel="stylesheet">
<link href="../dosya/css/style-responsive.css" rel="stylesheet" />

<script>
        function startTime()
        {
            var today=new Date();
            var h=today.getHours();
            var m=today.getMinutes();
            var s=today.getSeconds();
            // add a zero in front of numbers<10
            m=checkTime(m);
            s=checkTime(s);
            document.getElementById('time').innerHTML=h+":"+m+":"+s;
            t=setTimeout(function(){startTime()},500);
        }

        function checkTime(i)
        {
            if (i<10)
            {
                i="0" + i;
            }
            return i;
        }
    </script>
<!-- Just for debugging purposes. Don't actually copy this line! -->
<!--[if lt IE 9]>
    <script src="js/ie8-responsive-file-warning.js"></script><![endif]-->
<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
</head>
<body onload="startTime()">
	<section id="container">
		<!--header start-->

		<%@ include file="ust.jsp"%>

		<!--header end-->
		<!--sidebar start-->

		<%@include file="sol_menu.jsp"%>


		<!--sidebar end-->
		<!--main content start-->
		<section id="main-content">
			<section class="wrapper">

				<div class="row">
					
					



					<div class="col-md-4">
						<div class="profile-nav alt">
							<section class="panel">
								<%
                    Date simdi=new Date();
                    
           			DateFormat yil= new SimpleDateFormat("yyyy");
                    DateFormat ay= new SimpleDateFormat("MMMM");
                    DateFormat gun=new SimpleDateFormat("dd");
                    DateFormat gun2=new SimpleDateFormat("EEEE");
             %>
								<div class="user-heading alt clock-row terques-bg">
									<h1><%=ay.format(simdi)%>
										<%=gun.format(simdi) %></h1>
									<p class="text-left"><%=yil.format(simdi)%>,
										<%=gun2.format(simdi)%></p>

								</div>
								<ul id="clock">
									<li id="sec"></li>
									<li id="hour"></li>
									<li id="min"></li>
								</ul>

								<ul style="text-align: center" class="clock-category" id="time">

								</ul>

							</section>

						</div>
					</div>






				</div>
			</section>
		</section>
		<!--main content end-->
	
	</section>
	<!-- Placed js at the end of the document so the pages load faster -->
	<!--Core js-->
	<script src="../dosya/js/jquery.js"></script>
	<script src="../dosya/js/jquery-ui/jquery-ui-1.10.1.custom.min.js"></script>
	<script src="../dosya/bs3/js/bootstrap.min.js"></script>
	<script src="../dosya/js/jquery.dcjqaccordion.2.7.js"></script>
	<script src="../dosya/js/jquery.scrollTo.min.js"></script>
	<script src="../dosya/js/jQuery-slimScroll-1.3.0/jquery.slimscroll.js"></script>
	<script src="../dosya/js/jquery.nicescroll.js"></script>
	<!--[if lte IE 8]><script language="javascript" type="text/javascript" src="../dosya/js/flot-chart/excanvas.min.js"></script><![endif]-->
	<script src="../dosya/js/skycons/skycons.js"></script>
	<script src="../dosya/js/jquery.scrollTo/jquery.scrollTo.js"></script>
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
	<script src="../dosya/js/calendar/clndr.js"></script>
	<script
		src="http://cdnjs.cloudflare.com/ajax/libs/underscore.js/1.5.2/underscore-min.js"></script>
	<script src="../dosya/js/calendar/moment-2.2.1.js"></script>
	<script src="../dosya/js/evnt.calendar.init.js"></script>
	<script src="../dosya/js/jvector-map/jquery-jvectormap-1.2.2.min.js"></script>
	<script src="../dosya/js/jvector-map/jquery-jvectormap-us-lcc-en.js"></script>
	<script src="../dosya/js/gauge/gauge.js"></script>
	<!--clock init-->
	<script src="../dosya/js/css3clock/js/css3clock.js"></script>
	<!--Easy Pie Chart-->
	<script src="../dosya/js/easypiechart/jquery.easypiechart.js"></script>
	<!--Sparkline Chart-->
	<script src="../dosya/js/sparkline/jquery.sparkline.js"></script>
	<!--Morris Chart-->
	<script src="../dosya/js/morris-chart/morris.js"></script>
	<script src="../dosya/js/morris-chart/raphael-min.js"></script>
	<!--jQuery Flot Chart-->
	<script src="../dosya/js/flot-chart/jquery.flot.js"></script>
	<script src="../dosya/js/flot-chart/jquery.flot.tooltip.min.js"></script>
	<script src="../dosya/js/flot-chart/jquery.flot.resize.js"></script>
	<script src="../dosya/js/flot-chart/jquery.flot.pie.resize.js"></script>
	<script src="../dosya/js/flot-chart/jquery.flot.animator.min.js"></script>
	<script src="../dosya/js/flot-chart/jquery.flot.growraf.js"></script>
	<script src="../dosya/js/dashboard.js"></script>
	<script src="../dosya/js/jquery.customSelect.min.js"></script>
	<!--common script init for all pages-->
	<script src="../dosya/js/scripts.js"></script>
	<!--script for this page-->
</body>
</html>