<%@ page contentType="text/html; charset=UTF-8" language="java"
	import="java.sql.*" import="java.*" errorPage=""%>
<%@ include file="ayar.jsp"%>


<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");

	boolean yaz_durum = (request.getParameter("adres") == null);
	if (!yaz_durum) {

		String isletme_id = request.getParameter("isletme_id");
		String adres = request.getParameter("adres");
		String telefon = request.getParameter("telefon");
		String mail = request.getParameter("mail");

		ResultSet r = st
				.executeQuery("SELECT COUNT(adres) AS rowcount FROM hakkimizda WHERE isletme_id='"
						+ session.getAttribute("yonetici_id") + "'");
		r.next();
		int count = r.getInt("rowcount");
		r.close();

		if (count != 0) {
			try {

				int yaz = st
						.executeUpdate("UPDATE hakkimizda SET adres='"
								+ adres + "', telefon='" + telefon
								+ "',mail='" + mail
								+ "' WHERE isletme_id='"
								+ session.getAttribute("yonetici_id")
								+ "'");

			} catch (Exception e) {
				out.print("Hata : " + e);
			}
		} else {
			try {

				st.executeUpdate("INSERT INTO proje.hakkimizda (id, isletme_id, icerik, duyurular, adres, mail, telefon) VALUES(NULL, '"
						+ session.getAttribute("yonetici_id")
						+ "','','','"
						+ adres
						+ "','"
						+ mail
						+ "','"
						+ telefon + "')");
			} catch (Exception e) {
				out.print("Hata : " + e);
			}

		}
		session.setAttribute("adress", adres);
		session.setAttribute("telefons", telefon);
		session.setAttribute("mails", mail);

		response.sendRedirect("iletisim_kontrol.jsp");
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



				<!--Boş sayfa-->
				<div class="row">


					<div class="col-md-12">


						<!--breadcrumbs start -->
						<ul class="breadcrumb">
							<li><a href="index.jsp"><i class="fa fa-home"></i>
									Anasayfa</a></li>
							<li><a href="iletisim_duzenle.jsp"> İLETİŞİM</a></li>
							<li class="active">İletişim Düzenle</li>
						</ul>
						<!--breadcrumbs end -->



						<%
							ResultSet r = st
									.executeQuery("SELECT COUNT(adres) AS rowcount FROM hakkimizda WHERE isletme_id='"
											+ session.getAttribute("yonetici_id") + "'");
							r.next();
							int count = r.getInt("rowcount");
							r.close();
						%>

						<%
							if (count != 0) {
								String isletme_id = "";
								String icerik = "";
								String duyurular = "";
								String adres = "";
								String mail = "";
								String telefon = "";

								// bilgileri getir.

								try {

									ResultSet b_rs = st
											.executeQuery("select *from hakkimizda where isletme_id = '"
													+ session.getAttribute("yonetici_id") + "'");
									b_rs.next();
									isletme_id = b_rs.getString("isletme_id");
									icerik = b_rs.getString("icerik");
									duyurular = b_rs.getString("duyurular");
									adres = b_rs.getString("adres");
									mail = b_rs.getString("mail");
									telefon = b_rs.getString("telefon");

								} catch (SQLException e) {
									out.print(e);
								}
						%>




						<section class="panel">
							<header class="panel-heading">İletişim Ekle</header>


							<form class="form-horizontal bucket-form" action="" method="post">
								<div class="form-group">
									<label class="col-sm-2 control-label" for="adres">Adres
										*</label>
									<div class="col-sm-6">
										<textarea class="form-control" name="adres" id="adres"
											placeholder="" rows="6">
											<%
												out.print(adres);
											%>
										</textarea>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="telefon">Telefon
										*</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" name="telefon"
											id="telefon" value="<%out.print(telefon);%>" placeholder="">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="mail">Mail *</label>
									<div class="col-sm-6">
										<input type="text" class="mail" name="mail" id="mail"
											value="<%out.print(mail);%>" placeholder="">
									</div>
								</div>

								<div class="form-group">
									<label class="col-sm-2 control-label"></label>
									<div class="col-sm-6">
										<button type="reset" class="btn btn-danger">Temizle</button>
										<button type="submit" value="gonder" class="btn btn-success">Kaydet</button>
									</div>
								</div>


							</form>

						</section>


					</div>



				</div>










			</section>
		</section>
		<%
			} else {
		%>
		<section class="panel">
			<header class="panel-heading">İletişim Ekle</header>


			<form class="form-horizontal bucket-form" action="" method="post">
				<div class="form-group">
					<label class="col-sm-2 control-label" for="adres">Adres *</label>
					<div class="col-sm-6">
						<textarea class="form-control" name="adres" id="adres"
							placeholder="" rows="6"></textarea>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label" for="telefon">Telefon
						*</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="telefon"
							id="telefon" placeholder="">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label" for="mail">Mail *</label>
					<div class="col-sm-6">
						<input type="text" class="mail" name="mail" id="mail"
							placeholder="">
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-2 control-label"></label>
					<div class="col-sm-6">
						<button type="reset" class="btn btn-danger">Temizle</button>
						<button type="submit" value="gonder" class="btn btn-success">Kaydet</button>
					</div>
				</div>


			</form>

		</section>













	</section>

	<%
		}
	%>
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


	<script>
		$(document).ready(function(e) {
			// jquery gövdemiz hazır

			$('button[type="submit"]').click(function() {

				if ($('#adres').val() == "") {
					alert("Lütfen Adres Giriniz");
					$('#adres').focus();
					return false;
				} else if ($('#telefon').val() == "") {
					alert("Lütfen Telefon Giriniz");
					$('#telefon').focus();
					return false;
				} else if ($('#mail').val() == "") {
					alert("Lütfen Mail Adresi Giriniz");
					$('#mail').focus();
					return false;
				} else {
					return true;

				}

			});

		});
	</script>



</body>
</html>