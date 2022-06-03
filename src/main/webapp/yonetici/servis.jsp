<%@include file="kontrol.jsp"%>
<%@ page contentType="text/html; charset=UTF-8" language="java"
	import="java.sql.*" import="java.*" errorPage=""%>
<%@ include file="ayar.jsp"%>

<%
	// silme işlemi yapıyor
	boolean sil_olay = (request.getParameter("olay") == null);
	if (!sil_olay) {
		String id = request.getParameter("id");
		int durum = st.executeUpdate("delete from servis where id = '"
				+ id + "'");
		if (durum > 0) {

			//out.print("Silme İşlemi Başarılı");
			response.sendRedirect("servis.jsp");
		}
	}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="ThemeBucket">
<link rel="shortcut icon" href="../dosya/images/favicon.png">
<title>Servis Noktaları</title>
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
</head>
<body>
	<section id="container"> <!--header start--> <%@ include
		file="ust.jsp"%> <!--header end--> <!--sidebar start-->

	<%@include file="sol_menu.jsp"%> <!--sidebar end-->
	<!--main content start--> <section id="main-content"> <section
		class="wrapper"> <!--Boş sayfa-->
	<div class="row">


		<div class="col-md-12">


			<!--breadcrumbs start -->
			<ul class="breadcrumb">
				<li><a href="index.jsp"><i class="fa fa-home"></i> Anasayfa</a></li>
				<li><a href="index.jsp">Kontroller</a></li>
				<li class="active">Servisler</li>
			</ul>
			<!--breadcrumbs end -->





			<section class="panel"> <header class="panel-heading">
			Servis Noktaları <span class="tools pull-right"> <a
				href="yeni_servis.jsp"><button type="button"
						class="btn btn-danger" style="margin-top: -7px;">
						<i class="fa fa-cloud"></i> Yeni Servis Ekleme
					</button></a>
			</span> </header>
			<div class="panel-body">
				<div class="adv-table">
					<table class="display table table-bordered table-striped"
						id="dynamic-table">
						<thead>
							<tr>
								<th>Firma Id</th>
								<th>Şehir</th>
								<th>Güzergah No</th>
								<th>Servis Noktaları</th>

								<th class="hidden-phone">Hareket</th>
							</tr>
						</thead>
						<tbody>
							<%
								ResultSet rs = st
										.executeQuery("select *from servis order by id desc");
								while (rs.next()) {
							%>

							<tr class="gradeX">
								<td>
									<%
										out.print(rs.getString("id"));
									%>
								</td>
								<td>
									<%
										out.print(rs.getString("sehir"));
									%>
								</td>
								<td>
									<%
										out.print(rs.getString("guzargah_no"));
									%>
								</td>
								<td class="center hidden-phone">
									<%
										out.print(rs.getString("varilacak_yer"));
									%>
								</td>

								<td class="center hidden-phone"><a
									href="servis_duzenle.jsp?id=<%out.print(rs.getString("id"));%>"><button
											type="button" class="btn btn-info">Düzenle</button></a> <a
									href="?olay=sil&id=<%out.print(rs.getString("id"));%>"><button
											type="button" class="btn btn-warning">Sil</button></a></td>
							</tr>


							<%
								}
							%>
						</tbody>
						<tfoot>
							<tr>
								<th>Firma Id</th>
								<th>Şehir</th>
								<th>Güzergah No</th>
								<th>Servis Noktaları</th>
								<th class="hidden-phone">Hareket</th>
							</tr>
						</tfoot>
					</table>
				</div>
			</div>
			</section>

		</div>

	</div>

	</section> </section> <!--main content end--> </section>
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