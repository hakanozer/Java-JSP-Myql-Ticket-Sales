<%@include file="kontrol.jsp"%>
<%@include file="ayar.jsp"%>
<%@ page contentType="text/html; charset=UTF-8" language="java"
	import="java.sql.*" import="java.util.*" import="java.text.*"
	import="java.*" errorPage=""%>

<%
	//turkçe karakter
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");

	String bilet_id = "";
	String Adi = "";
	String Soyadi = "";
	String kalkis = "";
	String varis = "";
	String tarih = "";
	String saat = "";
	String koltukno = "";
	String ucret = "";
	String tcno = "";

	boolean id_varmi = (request.getParameter("id") == null);
	if (!id_varmi) {

		bilet_id = request.getParameter("id");
		try {

			ResultSet b_rs = st
					.executeQuery("select y.adi, y.soyadi,b.yolcu_tcno, s.kalkis, s.varis, s.tarih, s.saat, b.koltuk_no, b.ucret from biletler as b inner join sefer as s inner join yolcular as y where s.id=b.sefer_id and y.yolcu_tc=b.yolcu_tcno and b.id='"
							+ request.getParameter("id") + "'");
			b_rs.next();
			Adi = b_rs.getString("y.adi");
			Soyadi = b_rs.getString("y.soyadi");
			kalkis = b_rs.getString("s.kalkis");
			varis = b_rs.getString("s.varis");
			tarih = b_rs.getString("s.tarih");
			saat = b_rs.getString("s.saat");
			koltukno = b_rs.getString("b.koltuk_no");
			ucret = b_rs.getString("b.ucret");

			int biletdurum = st
					.executeUpdate("update biletler set durum='0' where id='"
							+ bilet_id + "'");
			if (biletdurum > 0) {

			}

		} catch (SQLException e) {
			out.print(e);
		}

	} else {
		response.sendRedirect("AcikBiletKullan.jsp");
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

		<%@ include file="ust.jsp "%>

		<!--header end-->
		<!--sidebar start-->

		<%@include file="sol_menu.jsp"%>


		<!--sidebar end-->
		<!--main content start-->

		<section id="main-content">
			<section class="wrapper">

				<div class="row">


					<div class="col-md-12">


						<!--breadcrumbs start -->
						<ul class="breadcrumb">
							<li><a href="index.jsp"><i class="fa fa-home"></i>
									Anasayfa</a></li>
							<li><a href="BiletSorgu.jsp">Bilet Sorgu Ekranı</a></li>
							<li class="active">Açık Bilet Kullanım Ekranı</li>
						</ul>
						<!--breadcrumbs end -->



						<section class="panel">
							<header class="panel-heading"> Bilet Bilgileri </header>
							<div class="panel-body">
								<form class="form-horizontal bucket-form"
									action="BiletSorgu.jsp?id=<%out.print(request.getParameter("id"));%>&tc=<%out.print(request.getParameter("tc"));%>"
									method="post">
									<div class="form-group">
										<label class=" col-sm-3 control-label">Yolcu Adı </label>
										<div class="col-lg-6">
											<p class="form-control-static">
												<%
													out.print(Adi);
												%>
											</p>
										</div>
									</div>
									<div class="form-group">
										<label class=" col-sm-3 control-label">Yolcu Soyadı </label>
										<div class="col-lg-6">
											<p class="form-control-static">
												<%
													out.print(Soyadi);
												%>
											</p>
										</div>
									</div>
									<div class="form-group">
										<label class=" col-sm-3 control-label">Kalkış </label>
										<div class="col-lg-6">
											<p class="form-control-static">
												<%
													out.print(kalkis);
												%>
											</p>
										</div>
									</div>
									<div class="form-group">
										<label class=" col-sm-3 control-label">Varış </label>
										<div class="col-lg-6">
											<p class="form-control-static">
												<%
													out.print(varis);
												%>
											</p>
										</div>
									</div>
									<div class="form-group">
										<label for="inputEmail1"
											class="col-lg-2 col-sm-2 control-label">Tarih</label>
										<div class="col-lg-10">
											<input type="email" class="form-control" value=""
												name="tarih" id="tarih" placeholder="Tarih">

										</div>
									</div>
									<div class="form-group">
										<label for="inputEmail1"
											class="col-lg-2 col-sm-2 control-label">Saat</label>
										<div class="col-lg-10">
											<input type="email" class="form-control" value="" name="saat"
												id="saat" placeholder="Saat">

										</div>
									</div>
									<div class="form-group">
										<label for="inputEmail1"
											class="col-lg-2 col-sm-2 control-label">Koltuk No</label>
										<div class="col-lg-10">
											<input type="email" class="form-control" value=""
												name="kolyuk_no" id="koltuk_no" placeholder="Koltuk No">

										</div>
									</div>

									<div class="form-group">
										<label class=" col-sm-3 control-label">Bilet Ücreti</label>
										<div class="col-lg-6">
											<p class="form-control-static">
												<%
													out.print(ucret);
												%>
											</p>
										</div>
									</div>

									<div class="form-group">
										<div class="col-sm-6" align="right">
											<button type="submit" value="gonder" class="btn btn-success">ONAY</button>
										</div>
									</div>

								</form>
							</div>
						</section>


						<section class="panel"></section>





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