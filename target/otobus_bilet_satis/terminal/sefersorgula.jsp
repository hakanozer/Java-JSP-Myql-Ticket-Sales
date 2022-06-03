<%@ include file="ayar.jsp"%>
<%@include file="kontrol.jsp"%>
<%@ page contentType="text/html; charset=UTF-8" language="java"
	import="java.sql.*" import="java.*" errorPage=""%>


<%
	String isletme_id = "";
	try {
		ResultSet rs_firma = st
				.executeQuery("select * from terminal inner join personel where personel.id='"
						+ session.getAttribute("personel_id")
						+ "' and terminal.id=personel.terminal_id");

		rs_firma.next();
		isletme_id = rs_firma.getString("isletme_id");
	} catch (SQLException ex) {
		out.print(ex);
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
<title>Sefer Sorgula-Terminal Paneli</title>
<!--Core CSS -->
<link href="../dosya/bs3/css/bootstrap.min.css" rel="stylesheet">
<link href="../dosya/css/bootstrap-reset.css" rel="stylesheet">
<link href="../dosya/font-awesome/css/font-awesome.css" rel="stylesheet" />

<link rel="stylesheet" href="../dosya/css/bootstrap-switch.css" />
<link rel="stylesheet" type="text/css"
	href="../dosya/js/bootstrap-fileupload/bootstrap-fileupload.css" />
<link rel="stylesheet" type="text/css"
	href="../dosya/js/bootstrap-wysihtml5/bootstrap-wysihtml5.css" />
<link rel="stylesheet" type="text/css"
	href="../dosya/js/bootstrap-datepicker/css/datepicker.css" />
<link rel="stylesheet" type="text/css"
	href="../dosya/js/bootstrap-timepicker/compiled/timepicker.css" />
<link rel="stylesheet" type="text/css"
	href="../dosya/js/bootstrap-colorpicker/css/colorpicker.css" />
<link rel="stylesheet" type="text/css"
	href="../dosya/js/bootstrap-daterangepicker/daterangepicker-bs3.css" />
<link rel="stylesheet" type="text/css"
	href="../dosya/js/bootstrap-datetimepicker/css/datetimepicker.css" />
<link rel="stylesheet" type="text/css"
	href="../dosya/js/jquery-multi-select/css/multi-select.css" />
<link rel="stylesheet" type="text/css"
	href="../dosya/js/jquery-tags-input/jquery.tagsinput.css" />

<link rel="stylesheet" type="text/css"
	href="../dosya/js/select2/select2.css" />

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


<!-- Add jQuery library -->
<script type="text/javascript" src="../dosya/js/jquery-1.10.1.min.js"></script>

<!-- Add mousewheel plugin (this is optional) -->
<script type="text/javascript"
	src="../dosya/js/jquery.mousewheel-3.0.6.pack.js"></script>

<!-- Add fancyBox main JS and CSS files -->
<script type="text/javascript"
	src="../dosya/source/jquery.fancybox.js?v=2.1.5"></script>
<link rel="stylesheet" type="text/css"
	href="../dosya/source/jquery.fancybox.css?v=2.1.5" media="screen" />

<!-- Add Button helper (this is optional) -->
<link rel="stylesheet" type="text/css"
	href="../dosya/source/helpers/jquery.fancybox-buttons.css?v=1.0.5" />
<script type="text/javascript"
	src="../dosya/source/helpers/jquery.fancybox-buttons.js?v=1.0.5"></script>

<!-- Add Thumbnail helper (this is optional) -->
<link rel="stylesheet" type="text/css"
	href="../dosya/source/helpers/jquery.fancybox-thumbs.css?v=1.0.7" />
<script type="text/javascript"
	src="../dosya/source/helpers/jquery.fancybox-thumbs.js?v=1.0.7"></script>

<!-- Add Media helper (this is optional) -->
<script type="text/javascript"
	src="../dosya/source/helpers/jquery.fancybox-media.js?v=1.0.6"></script>

<script type="text/javascript">
	var $j = jQuery.noConflict();
	$j(document).ready(
			function() {
				/*
				 *  Simple image gallery. Uses default settings
				 */

				$j('.fancybox').fancybox();

				/*
				 *  Different effects
				 */

				// Change title type, overlay closing speed
				$j(".fancybox-effects-a").fancybox({
					helpers : {
						title : {
							type : 'outside'
						},
						overlay : {
							speedOut : 0
						}
					}
				});

				// Disable opening and closing animations, change title type
				$j(".fancybox-effects-b").fancybox({
					openEffect : 'none',
					closeEffect : 'none',

					helpers : {
						title : {
							type : 'over'
						}
					}
				});

				// Set custom style, close if clicked, change title type and overlay color
				$j(".fancybox-effects-c").fancybox({
					wrapCSS : 'fancybox-custom',
					closeClick : true,

					openEffect : 'none',

					helpers : {
						title : {
							type : 'inside'
						},
						overlay : {
							css : {
								'background' : 'rgba(238,238,238,0.85)'
							}
						}
					}
				});

				// Remove padding, set opening and closing animations, close if clicked and disable overlay
				$j(".fancybox-effects-d").fancybox({
					padding : 0,

					openEffect : 'elastic',
					openSpeed : 150,

					closeEffect : 'elastic',
					closeSpeed : 150,

					closeClick : true,

					helpers : {
						overlay : null
					}
				});

				/*
				 *  Button helper. Disable animations, hide close button, change title type and content
				 */

				$j('.fancybox-buttons')
						.fancybox(
								{
									openEffect : 'none',
									closeEffect : 'none',

									prevEffect : 'none',
									nextEffect : 'none',

									closeBtn : false,

									helpers : {
										title : {
											type : 'inside'
										},
										buttons : {}
									},

									afterLoad : function() {
										this.title = 'Image '
												+ (this.index + 1)
												+ ' of '
												+ this.group.length
												+ (this.title ? ' - '
														+ this.title : '');
									}
								});

				/*
				 *  Thumbnail helper. Disable animations, hide close button, arrows and slide to next gallery item if clicked
				 */

				$j('.fancybox-thumbs').fancybox({
					prevEffect : 'none',
					nextEffect : 'none',

					closeBtn : false,
					arrows : false,
					nextClick : true,

					helpers : {
						thumbs : {
							width : 50,
							height : 50
						}
					}
				});

				/*
				 *  Media helper. Group items, disable animations, hide arrows, enable media and button helpers.
				 */
				$j('.fancybox-media').attr('rel', 'media-gallery').fancybox({
					openEffect : 'none',
					closeEffect : 'none',
					prevEffect : 'none',
					nextEffect : 'none',

					arrows : false,
					helpers : {
						media : {},
						buttons : {}
					}
				});

				/*
				 *  Open manually
				 */

				$j("#fancybox-manual-a").click(function() {
					$j.fancybox.open('1_b.jpg');
				});

				$j("#fancybox-manual-b").click(function() {
					$j.fancybox.open({
						href : 'seferbilgi.jsp?id=',
						type : 'iframe',
						padding : 5
					});
				});

				$j("#fancybox-manual-c").click(function() {
					$j.fancybox.open([ {
						href : '1_b.jpg',
						title : 'My title'
					}, {
						href : '2_b.jpg',
						title : '2nd title'
					}, {
						href : '3_b.jpg'
					} ], {
						helpers : {
							thumbs : {
								width : 75,
								height : 50
							}
						}
					});
				});

			});
</script>
<style type="text/css">
.fancybox-custom .fancybox-skin {
	box-shadow: 0 0 50px #222;
}
</style>





<script>
	function showUser(str) {
		if (str == "") {
			document.getElementById("gar2").innerHTML = "";
			return;
		}
		if (window.XMLHttpRequest) {
			// code for IE7+, Firefox, Chrome, Opera, Safari
			xmlhttp = new XMLHttpRequest();
		} else { // code for IE6, IE5
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				document.getElementById("gar2").innerHTML = xmlhttp.responseText;
			}
		}
		xmlhttp.open("GET", "gar2.jsp?id=" + str, true);
		xmlhttp.send();
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
					<%
						String kalkis_yeri = "", varis_yeri = "", tarih = "";
						boolean kalkis_durum = (request.getParameter("kalkis_yeri") == null);
						boolean varis_durum = (request.getParameter("varis_yeri") == null);
						boolean tarih_durum = (request.getParameter("tarih") == null);
						if (!kalkis_durum && !varis_durum) {
							kalkis_yeri = request.getParameter("kalkis_yeri");
							varis_yeri = request.getParameter("varis_yeri");
							tarih = request.getParameter("tarih");

						}

						ResultSet rs_gar = st.executeQuery("select * from garlar");
					%>

					<div class="col-md-12">


						<!--breadcrumbs start -->
						<ul class="breadcrumb">
							<li><a href="index.jsp"><i class="fa fa-home"></i>
									Anasayfa</a></li>
							<li class="active">Sefer Sorgula</li>
						</ul>
						<!--breadcrumbs end -->


						<section class="panel">
							<header class="panel-heading"> Sefer Seçimi </header>
							<div class="panel-body">
								<div class="position-center">
									<form class="form-horizontal bucket-form" role="form"
										method="post">
										<div class="form-group">
											<label class="col-sm-2 control-label">Kalkış</label>
											<div class="col-sm-6">
												<select class="form-control m-bot15" name="kalkis_yeri"
													id="kalkis_yeri" onchange="showUser(this.value)">
													<option>Seç</option>
													<%
														while (rs_gar.next()) {
															if (!kalkis_durum && kalkis_yeri.equals(rs_gar.getString("id"))) {
													%>

													<option selected="selected"
														value="<%=rs_gar.getString("id")%>"><%=rs_gar.getString("gar_adi")%></option>
													<%
														} else {
													%>
													<option value="<%=rs_gar.getString("id")%>"><%=rs_gar.getString("gar_adi")%></option>
													<%
														}
														}
													%>
												</select>
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-2 control-label">Varış</label>
											<div class="col-sm-6" id="gar2">
												<select class="form-control m-bot15" name="varis_yeri"
													id="varis_yeri">
													<option>Seç</option>
													<%
														rs_gar.first();
														if (!varis_durum && varis_yeri.equals(rs_gar.getString("id"))) {
													%>
													<option selected="selected"
														value="<%=rs_gar.getString("id")%>"><%=rs_gar.getString("gar_adi")%></option>
													<%
														} else {
													%>
													<option value="<%=rs_gar.getString("id")%>"><%=rs_gar.getString("gar_adi")%></option>
													<%
														}

														while (rs_gar.next()) {
															if (!varis_durum && varis_yeri.equals(rs_gar.getString("id"))) {
													%>

													<option selected="selected"
														value="<%=rs_gar.getString("id")%>"><%=rs_gar.getString("gar_adi")%></option>
													<%
														} else {
													%>
													<option value="<%=rs_gar.getString("id")%>"><%=rs_gar.getString("gar_adi")%></option>
													<%
														}
														}
													%>
												</select>
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-2 control-label">Tarih</label>
											<div class="col-sm-6">
												<input
													class="form-control form-control-inline input-medium default-date-picker"
													size="16" type="text" name="tarih" id="tarih" value="">
												<span class="help-block">Tarih Seçin</span>
											</div>
										</div>


										<div class="form-group">
											<label class="col-sm-2 control-label"> </label>
											<div class="col-sm-6">
												<button type="submit" class="btn btn-info">Seferleri
													Listele</button>
											</div>
										</div>







									</form>

								</div>

							</div>
						</section>

						<%
							try {
								ResultSet rs;

								if (!kalkis_durum && !varis_durum && !tarih_durum) {
									rs = st.executeQuery("select *from sefer where kalkis_yeri='"
											+ kalkis_yeri
											+ "' and varis_yeri='"
											+ varis_yeri
											+ "' and isletme_id='"
											+ isletme_id
											+ "' order by saat asc");
									while (rs.next()) {
						%>

						<section class="panel">
							<header class="panel-heading">
								Seferler

								<!-- <span class="tools pull-right">
        <a href="#"><button type="button" class="btn btn-success" style="margin-top: -7px;"><i class="fa fa-eye"></i> Arşiv </button></a>
        <a href="yeni_sefer.jsp"><button type="button" class="btn btn-danger" style="margin-top: -7px;"><i class="fa fa-cloud"></i> Yeni İşletme Ekle</button></a>
    </span>
          -->
							</header>




							<div class="panel-body">
								<

								<div class="adv-table">
									<table class="display table table-bordered table-striped"
										id="dynamic-table">
										<thead>
											<tr>
												<th hidden="true" class="hidden-phone">ID</th>
												<th hidden="true" class="hidden-phone">İşletme ID</th>
												<th>Saat</th>
												<th>Sefer Tipi</th>
												<th>Otobüs Tipi</th>
												<th>Koltuk Sayısı</th>
												<th>İndirimli Fiyat</th>
												<th>Normal Fiyat</th>
												<th>Bilgi</th>
											</tr>
										</thead>
										<tbody>




											<tr class="gradeX">
												<td hidden="true" class="hidden-phone">
													<%
														out.print(rs.getString("id"));
													%>
												</td>
												<td hidden="true" class="hidden-phone">
													<%
														out.print(rs.getString("isletme_id"));
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
													%> TL
												</td>
												<td>
													<%
														out.print(rs.getString("indirimli_fiyat"));
													%> TL
												</td>
												<td><a class="fancybox fancybox.iframe"
													href="seferbilgi.jsp?id=<%=rs.getString("id")%>&tarih=<%=tarih%>">Bilgi</a></td>



											</tr>








										</tbody>
										<tfoot>
											<tr>
												<th hidden="true" class="hidden-phone">ID</th>
												<th hidden="true" class="hidden-phone">İşletme ID</th>
												<th>Saat</th>
												<th>Sefer Tipi</th>
												<th>Otobüs Tipi</th>
												<th>Koltuk Sayısı</th>
												<th>İndirimli Fiyat</th>
												<th>Normal Fiyat</th>
												<th>Bilgi</th>
											</tr>
										</tfoot>
									</table>
								</div>
							</div>
						</section>


						<%
							}
								}
							} catch (SQLException ex) {
								out.print(ex);
							}
						%>









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
	<script src="../dosya/js/jquery-1.8.3.min.js"></script>
	<script src="../dosya/bs3/js/bootstrap.min.js"></script>
	<script src="../dosya/js/jquery-ui-1.9.2.custom.min.js"></script>
	<script class="include" type="text/javascript"
		src="../dosya/js/jquery.dcjqaccordion.2.7.js"></script>
	<script src="../dosya/js/jquery.scrollTo.min.js"></script>
	<script src="../dosya/js/easypiechart/jquery.easypiechart.js"></script>
	<script src="../dosya/js/jQuery-slimScroll-1.3.0/jquery.slimscroll.js"></script>
	<script src="../dosya/js/jquery.nicescroll.js"></script>
	<script src="../dosya/js/jquery.nicescroll.js"></script>

	<script src="../dosya/js/bootstrap-switch.js"></script>

	<script type="text/javascript"
		src="../dosya/js/fuelux/js/spinner.min.js"></script>
	<script type="text/javascript"
		src="../dosya/js/bootstrap-fileupload/bootstrap-fileupload.js"></script>
	<script type="text/javascript"
		src="../dosya/js/bootstrap-wysihtml5/wysihtml5-0.3.0.js"></script>
	<script type="text/javascript"
		src="../dosya/js/bootstrap-wysihtml5/bootstrap-wysihtml5.js"></script>
	<script type="text/javascript"
		src="../dosya/js/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
	<script type="text/javascript"
		src="../dosya/js/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
	<script type="text/javascript"
		src="../dosya/js/bootstrap-daterangepicker/moment.min.js"></script>
	<script type="text/javascript"
		src="../dosya/js/bootstrap-daterangepicker/daterangepicker.js"></script>
	<script type="text/javascript"
		src="../dosya/js/bootstrap-colorpicker/js/bootstrap-colorpicker.js"></script>
	<script type="text/javascript"
		src="../dosya/js/bootstrap-timepicker/js/bootstrap-timepicker.js"></script>
	<script type="text/javascript"
		src="../dosya/js/jquery-multi-select/js/jquery.multi-select.js"></script>
	<script type="text/javascript"
		src="../dosya/js/jquery-multi-select/js/jquery.quicksearch.js"></script>

	<script type="text/javascript"
		src="../dosya/js/bootstrap-inputmask/bootstrap-inputmask.min.js"></script>

	<script src="../dosya/js/jquery-tags-input/jquery.tagsinput.js"></script>

	<script src="../dosya/js/select2/select2.js"></script>
	<script src="../dosya/js/select-init.js"></script>


	<!--common script init for all pages-->
	<script src="../dosya/js/scripts.js"></script>

	<script src="../dosya/js/toggle-init.js"></script>

	<script src="../dosya/js/advanced-form.js"></script>
</body>
</html>