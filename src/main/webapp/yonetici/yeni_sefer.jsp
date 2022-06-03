<%@include file="kontrol.jsp"%>
<%@ page contentType="text/html; charset=UTF-8" language="java"
	import="java.sql.*" import="java.*" errorPage=""%>
<%@ include file="ayar.jsp"%>
<%@ page import="java.util.ArrayList" language="java"%>
<%
request.setCharacterEncoding("UTF-8"); 
response.setCharacterEncoding("UTF-8"); 
response.setContentType("text/html; charset=UTF-8"); 



boolean yaz_durum = (request.getParameter("kalkis_yeri") == null);
if(!yaz_durum){
	
	try{
		
		String isletme_id = String.valueOf(session.getAttribute("yonetici_id"));
		String kalkis_yeri = request.getParameter("kalkis_yeri");
		String varis_yeri = request.getParameter("varis_yeri");
		String saat = request.getParameter("saat");
		String sefer_tipi = request.getParameter("sefer_tipi");
	    String otobus_tipi = request.getParameter("otobus_tipi");
	    String limit = request.getParameter("limit");
	    String normal_fiyat = request.getParameter("normal_fiyat");
	    String indirimli_fiyat = request.getParameter("indirimli_fiyat");
	    String bilgi = request.getParameter("bilgi");
	   
	
		int yazz=st.executeUpdate("INSERT INTO `proje`.`sefer` ( `id` , `isletme_id` , `kalkis_yeri` , `varis_yeri` , `saat` , `sefer_tipi` , `otobus_tipi` , `limit` , `normal_fiyat` , `indirimli_fiyat` , `bilgi` ) VALUES ( NULL , '"+isletme_id+"', '"+kalkis_yeri+"', '"+varis_yeri+"', '"+saat+"', '"+sefer_tipi+"', '"+otobus_tipi+"', '"+limit+"', '"+normal_fiyat+"', '"+indirimli_fiyat+"', '"+bilgi+"' )");
		if(yazz >0){
			response.sendRedirect("sefer_kontrol.jsp");
		}
		
	}catch(SQLException e){
		out.print("Hata : " + e);
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
<title>Yeni Sefer Ekle</title>
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


<link rel="stylesheet"
	href="../dosya/js/timepicker/include/ui-1.10.0/ui-lightness/jquery-ui-1.10.0.custom.min.css"
	type="text/css" />
<link rel="stylesheet"
	href="../dosya/js/timepicker/jquery.ui.timepicker.css?v=0.3.3"
	type="text/css" />

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
							<li><a href="sefer_kontrol.jsp">Sefer Kontrol</a></li>
							<li class="active">Yeni Sefer Gir</li>
						</ul>
						<!--breadcrumbs end -->






						<section class="panel">
							<header class="panel-heading">Yeni Sefer Ekle </header>

							<div class="panel-body">
								<div class="position-left">

									<form class="form-horizontal bucket-form" action=""
										method="post">

										<div class="form-group">
											<label class="col-sm-2 control-label" for="kalkis_yeri">Kalkış
												Yeri *</label>
											<div class="col-sm-6">

												<div class="form-group">

													<div class="col-lg-6">
														<div class="select2-container populate" id="s2id_e1"
															style="width: 300px;">
															<abbr class="select2-search-choice-close"></abbr> <span
																class="select2-arrow" role="presentation"><b
																role="presentation"></b></span><label for="s2id_autogen1"
																class="select2-offscreen"></label><input
																class="select2-focusser select2-offscreen" type="text"
																aria-haspopup="true" role="button"
																aria-labelledby="select2-chosen-1" id="s2id_autogen1">
														</div>
														<select id="e1" name="kalkis_yeri"
															class="populate  select2-offscreen" style="width: 300px"
															tabindex="-1" title="">
															<%
                              ResultSet rs;
                              ResultSet rs1;
                              ResultSet rs2;
                           
                              for(int i=1;i<82;i++){
                            	
                              		rs1 = st1.executeQuery("select * from garlar where il_id='"+i+"' LIMIT 0 , 1");
                              			while(rs1.next()){
                              			  rs2=st2.executeQuery("SELECt * from il where id='"+ rs1.getString("il_id")+ "'");
                             					while(rs2.next()){
		                             				 String il=rs2.getString("il");
		                             				 %>
															<optgroup
																label="<%out.print(il.toString().toUpperCase());%>">

																<%
						                                     
						                                      rs = st.executeQuery("select * from garlar where il_id='"+rs1.getString("il_id")+"'");
						                                   	  while(rs.next()){
						                                   		 
						                                    	 %>
																<option value="<%out.print(rs.getString("id"));%>">
																	<%out.print(rs.getString("gar_adi"));%>
																</option>

																<%}%>

															</optgroup>

															<%}}}%>
														</select>
													</div>
												</div>
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-2 control-label" for="varis_yeri">Varış
												Yeri *</label>
											<div class="col-sm-6">

												<div class="form-group">

													<div class="col-lg-6">
														<div class="select2-container populate" id="s2id_e2"
															style="width: 300px;">
															<abbr class="select2-search-choice-close"></abbr> <span
																class="select2-arrow" role="presentation"><b
																role="presentation"></b></span><label for="s2id_autogen1"
																class="select2-offscreen"></label><input
																class="select2-focusser select2-offscreen"
																id="kalkis_saat" type="text" aria-haspopup="true"
																role="button" aria-labelledby="select2-chosen-1"
																id="s2id_autogen1">
														</div>
														<select id="e2" name="varis_yeri"
															class="populate  select2-offscreen" style="width: 300px"
															tabindex="-1" title="">
															<%
                             
                              for(int i=1;i<82;i++){
                            	
                              		rs1 = st1.executeQuery("select * from garlar where il_id='"+i+"' LIMIT 0 , 1");
                              			while(rs1.next()){
                              			  rs2=st2.executeQuery("SELECt * from il where id='"+ rs1.getString("il_id")+ "'");
                             					while(rs2.next()){
		                             				 String il=rs2.getString("il");
		                             				 %>
															<optgroup
																label="<%out.print(il.toString().toUpperCase());%>">

																<%
						                                     
						                                      rs = st.executeQuery("select * from garlar where il_id='"+rs1.getString("il_id")+"'");
						                                   	  while(rs.next()){
						                                   		 
						                                    	 %>
																<option value="<%out.print(rs.getString("id"));%>">
																	<%out.print(rs.getString("gar_adi"));%>
																</option>

																<%}%>

															</optgroup>

															<%}}}%>
														</select>
													</div>
												</div>
											</div>
										</div>


										<div class="form-group">
											<label class="col-sm-2 control-label" for="saat">Saat
												*</label>
											<div class="col-sm-5">
												<input type="time" class="form-control" id="saat"
													name="saat" placeholder="Saat">
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-2 control-label" for="sefer_tipi">Sefer
												Tipi *</label>
											<div class="col-sm-6">
												<input type="text" class="form-control" name="sefer_tipi"
													id="sefer_tipi" placeholder="Sefer Tipi">
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label" for="otobus_tipi">Otobüs
												Tipi *</label>
											<div class="col-sm-6">
												<input type="text" class="form-control" name="otobus_tipi"
													id="otobus_tipi" placeholder="Otobüs Tipi">
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label" for="limit">Limit
												*</label>
											<div class="col-sm-6">
												<input type="text" class="form-control" name="limit"
													id="limit" placeholder="Limit">
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label" for="normal_fiyat">Normal
												Fiyat *</label>
											<div class="col-sm-6">
												<input type="text" class="form-control" name="normal_fiyat"
													id="normal_fiyat" placeholder="Normal Fiyat">
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label" for="indirimli_fiyat">İndirimli
												Fiyat *</label>
											<div class="col-sm-6">
												<input type="text" class="form-control"
													name="indirimli_fiyat" id="indirimli_fiyat"
													placeholder="İndirimli Fiyat">
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label" for="bilgi">Bilgi
											</label>
											<div class="col-sm-6">
												<input type="text" class="form-control" name="bilgi"
													id="bilgi" placeholder="Bilgi">
											</div>
										</div>





										<div class="form-group">
											<label class="col-sm-2 control-label"></label>
											<div class="col-sm-6">
												<button type="reset" class="btn btn-danger">Temizle</button>
												<button type="submit" value="gonder" class="btn btn-success">Gönder</button>
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
		<!--main content end-->
		
	</section>
	<!-- Placed js at the end of the document so the pages load faster -->
	<!--Core js-->


	<script type="text/javascript"
		src="https://apis.google.com/js/plusone.js"></script>

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
	<!--Easy Pie Chart-->
	<script src="../dosya/js/easypiechart/jquery.easypiechart.js"></script>
	<!--Sparkline Chart-->
	<script src="../dosya/js/sparkline/jquery.sparkline.js"></script>
	<!--jQuery Flot Chart-->
	<script src="../dosya/js/flot-chart/jquery.flot.js"></script>
	<script src="../dosya/js/flot-chart/jquery.flot.tooltip.min.js"></script>
	<script src="../dosya/js/flot-chart/jquery.flot.resize.js"></script>
	<script src="../dosya/js/flot-chart/jquery.flot.pie.resize.js"></script>





	<script type="text/javascript"
		src="../dosya/js/timepicker/include/jquery-1.9.0.min.js"></script>
	<script type="text/javascript"
		src="../dosya/js/timepicker/include/ui-1.10.0/jquery.ui.core.min.js"></script>
	<script type="text/javascript"
		src="../dosya/js/timepicker/include/ui-1.10.0/jquery.ui.widget.min.js"></script>
	<script type="text/javascript"
		src="../dosya/js/timepicker/include/ui-1.10.0/jquery.ui.tabs.min.js"></script>
	<script type="text/javascript"
		src="../dosya/js/timepicker/include/ui-1.10.0/jquery.ui.position.min.js"></script>

	<script type="text/javascript"
		src="../dosya/js/timepicker/jquery.ui.timepicker.js?v=0.3.3"></script>



	<script>
		var $j = jQuery.noConflict();

		$j(document).ready(function(e) {
			// jquery gövdemiz hazır

			$j('#saat').timepicker({
				showNowButton : true,
				showDeselectButton : true,
				defaultTime : '', // removes the highlighted time for when the input is empty.
				showCloseButton : true
			});

		});
	</script>




	<script>
		$(document).ready(function(e) {
			// jquery gövdemiz hazır

			$('button[type="submit"]').click(function() {

				if ($('#otobus_tipi').val() == "") {
					alert("Lütfen Otobüs Tipini Giriniz");
					$('#otobus_tipi').focus();
					return false;
				} else if ($('#saat').val() == "") {
					alert("Lütfen Saat Giriniz");
					$('#saat').focus();
					return false;
				} else if ($('#sefer_tipi').val() == "") {
					alert("Lütfen Sefer Tipini Giriniz");
					$('#sefer_tipi').focus();
					return false;
				} else if ($('#limit').val() == "") {
					alert("Lütfen Limit Giriniz");
					$('#limit').focus();
					return false;
				} else if ($('#normal_fiyat').val() == "") {
					alert("Lütfen Limit Giriniz");
					$('#normal_fiyat').focus();
					return false;
				} else if ($('#indirimli_fiyat').val() == "") {
					alert("Lütfen Limit Giriniz");
					$('#indirimli_fiyat').focus();
					return false;
				} else {
					return true;

				}
			})

		})
	</script>

</body>
</html>