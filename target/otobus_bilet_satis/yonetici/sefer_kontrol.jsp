<%@include file="kontrol.jsp"%>
<%@ page contentType="text/html; charset=UTF-8" language="java"
	import="java.sql.*" import="java.*" errorPage=""%>
<%@ include file="ayar.jsp"%>

<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");

	// silme işlemi yapıyor
	boolean sil_olay = (request.getParameter("olay") == null);
	if (!sil_olay) {
		String id = request.getParameter("id");
		int durum = st.executeUpdate("delete from sefer where id = '"
				+ id + "'");
		if (durum > 0) {

			//out.print("Silme İşlemi Başarılı");
			response.sendRedirect("sefer_kontrol.jsp");
		}
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
<title>Sefer Kontrol</title>
<!--Core CSS -->
<link href="../dosya/bs3/css/bootstrap.min.css" rel="stylesheet">
<link href="../dosya/css/bootstrap-reset.css" rel="stylesheet">
<link href="../dosya/font-awesome/css/font-awesome.css" rel="stylesheet" />

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
							<li class="active">Sefer Kontrol</li>
						</ul>
						<!--breadcrumbs end -->





						<section class="panel">
							<header class="panel-heading">
								Seferler <span class="tools pull-right"> <a
									href="yeni_sefer.jsp"><button type="button"
											class="btn btn-danger" style="margin-top: -7px;">Yeni
											Sefer Ekle</button></a>
								</span>

							</header>
							<div class="panel-body">
								<div class="adv-table">
									<table class="display table table-bordered table-striped"
										id="dynamic-table">
										<thead>
											<tr>
												<th>İşletme</th>
												<th>Kalkış</th>
												<th>Varış</th>
												<th>Saat</th>
												<th>Sefer Tipi</th>
												<th>Otobüs Tipi</th>
												<th>Limit</th>
												<th>Fiyat</th>
												<th>İndirimli</th>
												<th>Bilgi</th>

												<th class="hidden-phone">Hareket</th>
											</tr>
										</thead>
										<tbody>


											<%
												ResultSet rs = st
														.executeQuery("select *from sefer where isletme_id = '"
																+ session.getAttribute("yonetici_id")
																+ "' order by id desc");
												while (rs.next()) {
													ResultSet rs1 = st1
															.executeQuery("select * from   isletme where id = '"
																	+ session.getAttribute("yonetici_id") + "'");
													while (rs1.next()) {
														ResultSet rs2 = st2
																.executeQuery("select * from   garlar where id = '"
																		+ (rs.getString("kalkis_yeri")) + "'");
														while (rs2.next()) {
															ResultSet rs3 = st3
																	.executeQuery("select * from   garlar where id = '"
																			+ (rs.getString("varis_yeri")) + "'");
															while (rs3.next()) {
											%>


											<tr class="gradeX">

												<td>
													<%
														out.print(rs1.getString("firma_unvani"));
													%>
												</td>
												<td>
													<%
														out.print(rs2.getString("gar_adi"));
													%>
												</td>
												<td>
													<%
														out.print(rs3.getString("gar_adi"));
													%>
												</td>
												<td>
													<%
														out.print(rs.getString("saat"));
													%>
												</td>
												<td>
													<%
														out.print(rs.getString("sefer_tipi"));
													%>
												</td>
												<td>
													<%
														out.print(rs.getString("otobus_tipi"));
													%>
												</td>
												<td>
													<%
														out.print(rs.getString("koltuk_sayisi"));
													%>
												</td>
												<td>
													<%
														out.print(rs.getString("normal_fiyat"));
													%>
												</td>
												<td>
													<%
														out.print(rs.getString("indirimli_fiyat"));
													%>
												</td>
												<td>
													<%
														out.print(rs.getString("bilgi"));
													%>
												</td>



												<td class="center hidden-phone"><a
													href="sefer_duzenle.jsp?id=<%out.print(rs.getString("id"));%>"><button
															type="button" class="btn btn-info">Düzenle</button></a> <a
													href="?olay=sil&id=<%out.print(rs.getString("id"));%>"><button
															type="button" class="btn btn-warning">Sil</button></a></td>
											</tr>


											<%
												}
														}
													}
												}
											%>






										</tbody>
										<tfoot>
											<tr>
												<th>İşletme</th>
												<th>Kalkış</th>
												<th>Varış</th>
												<th>Saat</th>
												<th>Sefer Tipi</th>
												<th>Otobüs Tipi</th>
												<th>Limit</th>
												<th>Fiyat</th>
												<th>İndirimli</th>
												<th>Bilgi</th>

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

	<!--dynamic table-->
	<script type="text/javascript" language="javascript"
		src="../dosya/js/advanced-datatable/js/jquery.dataTables.js"></script>
	<script type="text/javascript"
		src="../dosya/js/data-tables/DT_bootstrap.js"></script>
	<!--common script init for all pages-->
	<script src="../dosya/js/scripts.js"></script>

	<!--dynamic table initialization -->
	<script src="../dosya/js/dynamic_table_init.js"></script>



</body>
</html>