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
%>

<%
	// Açık Bilete çevirme

	boolean acik_olay = (request.getParameter("olay") == null);
	if (!acik_olay) {
		String id = request.getParameter("id");
		int durum = st
				.executeUpdate("update biletler set durum = 2 where id = '"
						+ id + "'");
		if (durum > 0) {

			//out.print("Bilet açık bilete çevrildi");
			response.sendRedirect("BiletSorgu.jsp");
		}
	}
%>

<%
	String y_adi = "";
	String y_soyadi = "";

	String tc = request.getParameter("tc");

	ResultSet rs = st
			.executeQuery("select *from yolcular where yolcu_tc = '"
					+ tc + "'");
	while (rs.next()) {

		y_adi = rs.getString("adi");
		y_soyadi = rs.getString("soyadi");

	}
	//SELECT  * FROM sefer INNER JOIN garlar WHERE garlar.id = sefer.kalkis_yeri OR garlar.id = sefer.varis_yeri AND sefer.id ='"+request.getParameter("id")+"'"
	ResultSet rs2 = st2
			.executeQuery("select b.id as ID,b.sefer_tarihi as tarih, s.saat as saat, b.koltuk_no as koltuk, b.ucret as ucret, b.durum as durum,s.kalkis_yeri as kalkis,s.varis_yeri as varis from biletler as b inner join sefer as s where s.id=b.sefer_id and b.yolcu_tcno='"
					+ tc + "' order by b.id asc");
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

		<%@ include file="ust.jsp"%>

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
							<li class="active">Bilet Sorgu Ekranı</li>
						</ul>
						<!--breadcrumbs end -->

						<section class="panel">

							<br>
							<div class="position-center">
								<form class="form-horizontal"
									action="BiletSorgu.jsp?tc=<%out.print(tc);%>" method="get"
									role="form">
									<div class="form-group">
										<label for="tcno" class="col-lg-2 col-sm-2 control-label">Yolcu
											TCNO</label>
										<div class="col-sm-6">
											<input type="text" class="form-control"
												value="<%out.print(tc);%>" name=tc id="tc"
												placeholder="Yolcu TCNO">
										</div>
									</div>


									<div class="form-group">
										<div class="col-lg-offset-2 col-lg-10">
											<button type="submit" class="btn btn-danger">LİSTELE</button>
											<br>
										</div>
									</div>
								</form>
							</div>
							<br>
						</section>




						<section class="panel">



							<header class="panel-heading">
								<%
									out.print("YOLCU : " + y_adi + " " + y_soyadi);
								%>

							</header>
							<div class="panel-body">
								<div class="adv-table">
									<table class="display table table-bordered table-striped"
										id="dynamic-table">
										<thead>
											<tr>
												<th>Bilet ID</th>
												<th>Kalkış</th>
												<th>Varış</th>
												<th>Tarih</th>
												<th>Saat</th>
												<th>Koltuk No</th>
												<th>Ücret</th>
												<th>Durum</th>
												<th>Kontroller</th>
											</tr>
										</thead>
										<tbody>

											<%
												String durum = "";
												String b_id = "";

												while (rs2.next()) {
													durum = rs2.getString("durum");
													b_id = rs2.getString("ID");
													ResultSet rs3 = st3
															.executeQuery("select id,gar_adi from garlar where id='"
																	+ rs2.getString("kalkis")
																	+ "' or id='"
																	+ rs2.getString("varis") + "'");
											%>

											<tr class="gradeX">
												<td>
													<%
														out.print(rs2.getString("ID"));
													%>
												</td>
												<%
													while (rs3.next()) {

															if (rs3.getString("id").equals(rs2.getString("kalkis"))) {
												%>
												<td>
													<%
														out.print(rs3.getString("gar_adi"));
													%>
												</td>
												<%
													break;
															}

														}
														rs3.first();
														if (rs3.getString("id").equals(rs2.getString("varis"))) {
												%>
												<td>
													<%
														out.print(rs3.getString("gar_adi"));
													%>
												</td>
												<%
													}
														while (rs3.next()) {

															if (rs3.getString("id").equals(rs2.getString("varis"))) {
												%>
												<td>
													<%
														out.print(rs3.getString("gar_adi"));
													%>
												</td>
												<%
													break;
															}

														}
												%>
												<td>
													<%
														out.print(rs2.getString("tarih"));
													%>
												</td>
												<td>
													<%
														out.print(rs2.getString("saat"));
													%>
												</td>
												<td>
													<%
														out.print(rs2.getString("koltuk"));
													%>
												</td>
												<td>
													<%
														out.print(rs2.getString("ucret"));
													%>
												</td>
												<td class="center hidden-phone">
													<%
														if (durum.equals("0")) {
													%> <span class="label label-primary label-mini">Satılmış</span>
													<%
														}
													%> <%
 	if (durum.equals("1")) {
 %> <span class="label label-primary label-mini">Rezerve</span>
													<%
														}
													%> <%
 	if (durum.equals("2")) {
 %> <span class="label label-danger label-mini">Açık</span>
													<%
														}
													%>


												</td>

												<td class="center hidden-phone">
													<%
														if (durum.equals("0")) {
													%> <a href="?olay=acik&id=<%out.print(tc);%>"><button
															type="button" class="btn btn-warning">Açık Bilet
															Yap</button></a> <%
 	}
 %> <%
 	if (durum.equals("1")) {
 %> <a
													href="RezerveBiletKullan.jsp?id=<%out.print(b_id);%>&tc=<%out.print(request.getParameter("tc"));%>"><button
															type="button" class="btn btn-info">Rezerve Bilet
															Kullan</button></a> <%
 	}
 %> <%
 	if (durum.equals("2")) {
 %> <a
													href="AcikBiletKullan.jsp?id=<%out.print(b_id);%>&tc=<%out.print(request.getParameter("tc"));%>"><button
															type="button" class="btn btn-info">Açık Bilet
															Kullan</button></a> <%
 	}
 %>

												</td>

											</tr>


											<%
												}
											%>

										</tbody>
										<tfoot>
											<tr>
												<th>Bilet ID</th>
												<th>Kalkış</th>
												<th>Varış</th>
												<th>Tarih</th>
												<th>Saat</th>
												<th>Koltuk No</th>
												<th>Ücret</th>
												<th>Durum</th>
												<th>Kontroller</th>
											</tr>
										</tfoot>
									</table>
								</div>
							</div>
						</section>


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