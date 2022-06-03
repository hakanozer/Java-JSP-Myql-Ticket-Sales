<%@include file="kontrol.jsp"%>
<%@ page contentType="text/html; charset=UTF-8" language="java"
	import="java.sql.*" import="java.*" errorPage=""%>
<%@ include file="ayar.jsp"%>


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
							<li><a href="index.jsp">Kontroller</a></li>
							<li class="active">Hakkımızda Kontrolü</li>
						</ul>
						<!--breadcrumbs end -->



						<%
							ResultSet r = st
									.executeQuery("SELECT COUNT(duyurular) AS rowcount FROM hakkimizda WHERE isletme_id='"
											+ session.getAttribute("yonetici_id") + "'");
							r.next();
							int count = r.getInt("rowcount");
							r.close();

							if (count != 0) {
								ResultSet rs = st
										.executeQuery("select * from hakkimizda where isletme_id= '"
												+ session.getAttribute("yonetici_id") + "'");
								rs.next();
						%>

						<section class="panel">
							<header class="panel-heading">
								Hakkımızda <span class="tools pull-right"> <a
									href="icerik.jsp?isletme_id=<%out.print(session.getAttribute("yonetici_id"));%>"><button
											type="button" class="btn btn-danger"
											style="margin-top: -7px;">Hakkımızda Bilgilerini
											Düzenle</button></a>

								</span>
							</header>


							<div class="panel-body">
								<div class="position-left">


									<form class="form-horizontal bucket-form" action=""
										method="post">
										<div class="form-group">
											<label class="col-sm-2 control-label" for="icerik">Hakkımızda:</label>
											<div class="col-sm-6">
												<label class="col-sm-10 control-label" for="icerik">
													<%
														out.print(rs.getString("icerik"));
													%>
												</label>
											</div>
										</div>





									</form>
								</div>



							</div>
						</section>
					</div>


				</div>

			</section>


		</section>
		<%
			} else {
		%>

		<section class="panel">
			<header class="panel-heading">
				Hakkımızda <span class="tools pull-right"> <a
					href="icerik.jsp?isletme_id=<%out.print(session.getAttribute("yonetici_id"));%>"><button
							type="button" class="btn btn-danger" style="margin-top: -7px;">Hakkımızda
							Bilgilerini Düzenle</button></a>

				</span>
			</header>


			<div class="panel-body">
				<div class="position-left">


					<form class="form-horizontal bucket-form" action="" method="post">
						<div class="form-group">
							<label class="col-sm-2 control-label" for="icerik">Hakkımızda:</label>
							<div class="col-sm-6">
								<label class="col-sm-2 control-label" for="icerik"></label>
							</div>
						</div>





					</form>
				</div>



			</div>
		</section>
		</div>


		</div>

	</section>


	</section>

	<%
		}
	%>


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