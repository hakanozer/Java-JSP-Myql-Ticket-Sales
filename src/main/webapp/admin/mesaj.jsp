<%@page import="java.text.DateFormat"%>
<%@include file="kontrol.jsp"%>
<%@ page contentType="text/html; charset=UTF-8" language="java"
	import="java.sql.*" import="java.util.*" import="java.text.*"
	import="java.*" errorPage=""%>
<%@ include file="ayar.jsp"%>
<%@page import="java.util.Date"%>
<%@ page import = "java.util.Date,java.text.SimpleDateFormat,java.text.ParseException"%>
<% java.util.Locale locale = request.getLocale(); %> 
<%
	// silme işlemi yapıyor
	boolean olay = (request.getParameter("olay") == null);
	if (!olay) {
		String olay1=request.getParameter("olay");
		if(olay1.equals("arsiv")){
			String id = request.getParameter("id");
			int durum = st
					.executeUpdate("update iletisim set durum =1 where id = '"
							+ id + "'");
			if (durum > 0) {
	
				
				response.sendRedirect("mesaj.jsp");
			}
			
		}else if(olay1.equals("sil")){
			String id = request.getParameter("id");
			int durum = st
					.executeUpdate("delete from iletisim where id = '"+ id + "'");
			if (durum > 0) {
	
				
				response.sendRedirect("mesaj.jsp?list=1");
			}
		}
	}
	
	
	
	ResultSet rsf1 = st2 .executeQuery("select * from iletisim where durum=0 order by id desc");
	int liste=0;
	boolean list = (request.getParameter("list") == null);
	if (!list) {
		String id = request.getParameter("list");
		rsf1 = st2 .executeQuery("select * from iletisim where durum=1 order by id desc");
		liste=1;
	}
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="ThemeBucket">
<link rel="shortcut icon" href="../dosya/images/favicon.png">
<title>BucketAdmin</title>
<!--Core CSS -->
<link href="../dosya/bs3/css/bootstrap.min.css" rel="stylesheet">
<link href="../dosya/css/bootstrap-reset.css" rel="stylesheet">
<link href="../dosya/font-awesome/css/font-awesome.css" rel="stylesheet" />

<!--icheck-->
<link href="../dosya/js/iCheck/skins/minimal/minimal.css"
	rel="stylesheet">
<link href="../dosya/js/iCheck/skins/minimal/red.css" rel="stylesheet">
<link href="../dosya/js/iCheck/skins/minimal/green.css" rel="stylesheet">
<link href="../dosya/js/iCheck/skins/minimal/blue.css" rel="stylesheet">
<link href="../dosya/js/iCheck/skins/minimal/yellow.css"
	rel="stylesheet">
<link href="../dosya/js/iCheck/skins/minimal/purple.css"
	rel="stylesheet">

<link href="../dosya/js/iCheck/skins/square/square.css" rel="stylesheet">
<link href="../dosya/js/iCheck/skins/square/red.css" rel="stylesheet">
<link href="../dosya/js/iCheck/skins/square/green.css" rel="stylesheet">
<link href="../dosya/js/iCheck/skins/square/blue.css" rel="stylesheet">
<link href="../dosya/js/iCheck/skins/square/yellow.css" rel="stylesheet">
<link href="../dosya/js/iCheck/skins/square/purple.css" rel="stylesheet">

<link href="../dosya/js/iCheck/skins/flat/grey.css" rel="stylesheet">
<link href="../dosya/js/iCheck/skins/flat/red.css" rel="stylesheet">
<link href="../dosya/js/iCheck/skins/flat/green.css" rel="stylesheet">
<link href="../dosya/js/iCheck/skins/flat/blue.css" rel="stylesheet">
<link href="../dosya/js/iCheck/skins/flat/yellow.css" rel="stylesheet">
<link href="../dosya/js/iCheck/skins/flat/purple.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="../dosya/css/style.css" rel="stylesheet">
<link href="../dosya/css/style-responsive.css" rel="stylesheet" />

<!-- Just for debugging purposes. Don't actually copy this line! -->
<!--[if lt IE 9]>
    <script src="js/ie8-responsive-file-warning.js"></script><![endif]-->

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->



</head>
<body>
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
				<%
					String id = "";
					String sayi1 = "";
					String sayi2 = "";
					String mail1 = "";
					String mesaj1 = "";
					String saat1 = "";
					String tarih1 = "";
					ResultSet rst1 = st5
							.executeQuery("select count(id) from iletisim where durum = '0'");
					ResultSet rst2 = st3
							.executeQuery("select count(id) from iletisim where durum = '1'");
					rst1.next();
					sayi1 = rst1.getString("count(id)");
					rst2.next();
					sayi2 = rst2.getString("count(id)");
				%>

				<div class="row">
					<div class="col-sm-3">
						<section class="panel">
							<div class="panel-body">

								<ul class="nav nav-pills nav-stacked mail-nav">
									<li class="active"><a href="mesaj.jsp"> <i
											class="fa fa-inbox"></i> Gelen Kutusu <span
											class="label label-danger pull-right inbox-notification">
												<%
													out.print(sayi1);
												%>
										</span></a></li>
									<li><a href="?list=1"> <i class="fa fa-file-text-o"></i>
											Arşiv <span
											class="label label-info pull-right inbox-notification">
												<%
													out.print(sayi2);
												%>
										</span></a></a></li>

								</ul>
							</div>
						</section>


					</div>
					<div class="col-sm-9">
						<section class="panel">
							<header class="panel-heading wht-bg">
								<h4 class="gen-case">
								<%if(liste==0){ %>
									Gelen Kutusu (<%
									out.print(sayi1);
								%>)<%}else if(liste==1){ %>
								Arşiv (<%
									out.print(sayi2);
								%>)<%}%>
									<form class="pull-right mail-src-position">
										
									</form>
								</h4>
							</header>
							<div class="panel-body minimal">
								<div class="mail-option">
									

									<div class="btn-group">
									<%if(liste==0){ %>
										<a data-original-title="Refresh" data-placement="top"
											href="mesaj.jsp" class="btn mini tooltips">
											<i class=" fa fa-refresh"></i>
										</a>
										<%}else if(liste==1){ %>
											<a data-original-title="Refresh" data-placement="top"
											href="mesaj.jsp?list=1" class="btn mini tooltips">
											<i class=" fa fa-refresh"></i>
										</a>
										
										<%} %>
									</div>
									
									<%if(liste==0){ %>
									<ul class="unstyled inbox-pagination" style="list-style-type:none;">
									
										<li><span>1-10 of <%out.print(sayi1);%></span></li>
										<li><a class="np-btn" href="#"><i
												class="fa fa-angle-left  pagination-left"></i></a></li>
										<li><a class="np-btn" href="#"><i
												class="fa fa-angle-right pagination-right"></i></a></li>
									</ul>
									<%}else if(liste==1){ %>
									
									<ul class="unstyled inbox-pagination" style="list-style-type:none;">
										<li><span>1-10 of <%out.print(sayi2);%></span></li>
										<li><a class="np-btn" href="#"><i
												class="fa fa-angle-left  pagination-left"></i></a></li>
										<li><a class="np-btn" href="#"><i
												class="fa fa-angle-right pagination-right"></i></a></li>
									</ul>
									
									
									<%} %>
								</div>
								<div class="table-inbox-wrap ">
									<table class="table table-inbox table-hover">
										<tbody>
										<%
										Date simdi=new Date();
										DateFormat tarihh=new SimpleDateFormat("yyyy-MM-dd");
					           		
										
										
											while (rsf1.next()) {
												mail1 = rsf1.getString("mail");
								
												if (rsf1.getString("mesaj").length() > 26) {
								
													mesaj1 = rsf1.getString("mesaj").substring(0, 25);
												} else {
								
													mesaj1 = rsf1.getString("mesaj");
												}
								
												saat1 = rsf1.getTime("tarihsaat").toString();
												tarih1 = rsf1.getDate("tarihsaat").toString();
												id=rsf1.getString("id");
												
												
												if(liste==0){
												%>
													<tr class="unread">
												<%}else if(liste==1){	%>
												<tr class="read">
										
												<%}	
											
											
											
											if(liste==0){ %>
												<td class="inbox-small-cells"><a href="?olay=arsiv&id=<%out.print(id);%>"><button type="button" class="btn btn-default">Arşivle</button></a></td>
												<%}else if(liste==1){ %>
												<td class="inbox-small-cells"><a href="?olay=sil&id=<%out.print(id);%>"><button type="button" class="btn btn-default">Sil</button></a></td>
												<%} %>
												<td class="view-message  dont-show"><a href="mesaj_oku.jsp?id=<%out.print(id);%>"><%out.print(mail1); %></a></td>
												<td class="view-message "><a href="mesaj_oku.jsp?id=<%out.print(id);%>"><%out.print(mesaj1); %></a></td>
												<%
												 if(tarihh.format(simdi).toString().equals(tarih1)){
												
												%>
												
												<td class="view-message  text-right"><a href="mesaj_oku.jsp?id=<%out.print(id);%>"><% Date now = rsf1.getTime("tarihsaat");
												DateFormat formatter = new SimpleDateFormat("HH:mm");
												out.print(formatter.format(now).toString()); %></a></td>
												<%}else{ %>
												<td class="view-message  text-right"><a href="mesaj_oku.jsp?id=<%out.print(id);%>"><%
											    	 Date now = rsf1.getDate("tarihsaat");
													DateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
													out.print(formatter.format(now).toString());
											     %></a></td>
												<%}%>
											</tr>
											<%} %>
										</tbody>
									</table>

								</div>
							</div>
						</section>
					</div>
				</div>
















			</section>

















		</section>
	</section>
	<!--main content end-->


	<!-- Placed js at the end of the document so the pages load faster -->
	<!--Core js-->
	<script src="../dosya/js/jquery.js"></script>
	<script src="../dosya/bs3/js/bootstrap.min.js"></script>
	<script class="include" type="text/javascript"
		src="../dosya/js/jquery.dcjqaccordion.2.7.js"></script>
	<script src="../dosya/js/jquery.scrollTo.min.js"></script>
	<script src="../dosya/js/jQuery-slimScroll-1.3.0/jquery.slimscroll.js"></script>
	<script src="../dosya/js/jquery.nicescroll.js"></script>
	<!--Easy Pie Chart-->
	<script src="../dosya/js/easypiechart/jquery.easypiechart.js"></script>
	<!--Sparkline Chart-->
	<script src="../dosya/js/sparkline/jquery.sparkline.js"></script>
	<!--jQuery Flot Chart-->
	<script src="../dosya/js/flot-chart/jquery.flot.js"></script>
	<script src="../dosya/js/flot-chart/jquery.flot.tooltip.min.js"></script>
	<script src="../dosya/js/flot-chart/jquery.flot.resize.js"></script>
	<script src="../dosya/js/flot-chart/jquery.flot.pie.resize.js"></script>

	<script src="../dosya/js/iCheck/jquery.icheck.js"></script>

	<script type="text/javascript" src="../dosya/js/ckeditor/ckeditor.js"></script>

	<!--common script init for all pages-->
	<script src="../dosya/js/scripts.js"></script>

	<!--icheck init -->
	<script src="../dosya/js/icheck-init.js"></script>





</body>
</html>