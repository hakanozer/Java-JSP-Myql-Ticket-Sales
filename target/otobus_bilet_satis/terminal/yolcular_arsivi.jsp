<%@include file="kontrol.jsp"%>
<%@include file="ayar.jsp"%>
<%@ page contentType="text/html; charset=UTF-8" language="java"
	import="java.sql.*" import="java.util.*" import="java.text.*"
	import="java.*" errorPage=""%>



<%
	// silme işlemi yapıyor
	boolean sil_olay = (request.getParameter("olay") == null);
	if (!sil_olay) {
		String id = request.getParameter("id");
		int durum = st
				.executeUpdate("update yolcular set durum = 0 where id = '"
						+ id + "'");
		if (durum > 0) {

			//out.print("Silme İşlemi Başarılı");
			response.sendRedirect("yolcular.jsp");
		}
	}

	boolean sil_tam = (request.getParameter("gerceksil") == null);
	if (!sil_tam) {
		String id = request.getParameter("id");
		int durum = st
				.executeUpdate("delete from yolcular where id = '" + id
						+ "'");
		if (durum > 0) {

			//out.print("Silme İşlemi Başarılı");
			response.sendRedirect("yolcular_arsivi.jsp");
		}
	}
%>







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

<!--dynamic table-->
<link href="../dosya/js/advanced-datatable/css/demo_page.css"
	rel="stylesheet" />
<link href="../dosya/js/advanced-datatable/css/demo_table.css"
	rel="stylesheet" />
<link rel="stylesheet" href="../dosya/js/data-tables/DT_bootstrap.css" />

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



				<!--Boş sayfa-->
				<div class="row">


					<div class="col-md-12">


						<!--breadcrumbs start -->
						<ul class="breadcrumb">
							<li><a href="index.jsp"><i class="fa fa-home"></i>
									Anasayfa</a></li>
							<li><a href="yolcular.jsp">Yolcular</a></li>
							<li class="active">Kişi Arşivi</li>

						</ul>
						<!--breadcrumbs end -->





						<section class="panel">
							<header class="panel-heading">
								ARŞİVDEKİ KİŞİLER <span class="tools pull-right"> <a
									href="yolcular_arsivi.jsp"><button type="button"
											class="btn btn-success" style="margin-top: -7px;">
											<i class="fa fa-eye"></i> Arşiv
										</button></a> <a href="yolcular_yeni_kayit.jsp"><button type="button"
											class="btn btn-danger" style="margin-top: -7px;">
											<i class="fa fa-cloud"></i> Yeni Kişi Ekle
										</button></a>
								</span>

							</header>
							<div class="panel-body">
								<div class="adv-table">
									<table class="display table table-bordered table-striped"
										id="dynamic-table">
										<thead>
											<tr>
												<th>Yolcu Tc</th>
												<th>Adı</th>
												<th>Soyadı</th>
												<th>Adresi</th>
												<th class="hidden-phone">Telefonu</th>
												<th>Maili</th>
												<th class="hidden-phone">Durum</th>
												<th class="hidden-phone">Hareket</th>
											</tr>
										</thead>
										<tbody>


											<%
												ResultSet rs = st
														.executeQuery("select *from yolcular where durum =2 order by id desc");
												while (rs.next()) {
											%>

											<tr class="gradeX">
												<td>
													<%
														out.print(rs.getString("yolcu_tc"));
													%>
												</td>
												<td>
													<%
														out.print(rs.getString("adi"));
													%>
												</td>
												<td>
													<%
														out.print(rs.getString("soyadi"));
													%>
												</td>
												<td>
													<%
														out.print(rs.getString("adres"));
													%>
												</td>
												<td class="center hidden-phone">
													<%
														out.print(rs.getString("tel"));
													%>
												</td>
												<td>
													<%
														out.print(rs.getString("mail"));
													%>
												</td>

												<td class="center hidden-phone">
													<%
														if (rs.getString("durum").equals("0")) {
													%> <span class="label label-primary label-mini">Aktif</span> <%
 	}
 %> <%
 	if (rs.getString("durum").equals("1")) {
 %> <span class="label label-danger label-mini">Pasif</span> <%
 	}
 %>


												</td>
												<td class="center hidden-phone"><a
													href="?olay=sil&id=<%out.print(rs.getString("id"));%>"><button
															type="button" class="btn btn-warning">Arşivden
															Çıkar</button></a> <a
													href="?gerceksil=sil&id=<%out.print(rs.getString("id"));%>"><button
															type="button" class="btn btn-default">Sil</button></a></td>
											</tr>


											<%
												}
											%>






										</tbody>
										<tfoot>
											<tr>
												<th>Yolcu Tc</th>
												<th>Adı</th>
												<th>Soyadı</th>
												<th>Adresi</th>
												<th class="hidden-phone">Telefonu</th>
												<th>Maili</th>
												<th class="hidden-phone">Durum</th>
												<th class="hidden-phone">Hareket</th>
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
	<!--[if lte IE 8]><script language="javascript" type="text/javascript" src="js/flot-chart/excanvas.min.js"></script><![endif]-->
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