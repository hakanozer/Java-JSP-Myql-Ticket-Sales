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
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");


String sayi1 = "";
String sayi2 = "";

String mail1 = "";
String baslik1 = "";
String mesaj1= "";
String saat1 = "";
String tarih1 = "";
DateFormat formatterr=null,formatterr1=null;
Date noww=null,noww1=null;



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



boolean id = (request.getParameter("id") == null);
if (!id) {
	String id1=request.getParameter("id");
	
	
	
	ResultSet rst1 = st3 .executeQuery("select count(id) from iletisim where durum = '0'");
	
	rst1.next();
	sayi1 = rst1.getString("count(id)");
	ResultSet rst2 = st3 .executeQuery("select count(id) from iletisim where durum = '1'");
	rst2.next();
	sayi2 = rst2.getString("count(id)");
	
	

	ResultSet rst3 = st3 .executeQuery("select * from iletisim where id = '"+id1+"'");
	
	rst3.next();
	mail1 = rst3.getString("mail");
	mesaj1 = rst3.getString("mesaj");	
	baslik1=rst3.getString("baslik");	
	saat1 = rst3.getTime("tarihsaat").toString();
	tarih1 = rst3.getDate("tarihsaat").toString();
	
	noww = rst3.getTime("tarihsaat");
	formatterr = new SimpleDateFormat("HH:mm");
	
	noww1 = rst3.getDate("tarihsaat");
	formatterr1 = new SimpleDateFormat("dd-MM-yyyy");
	
	
	
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
									<li><a href="mesaj.jsp?list=1"> <i class="fa fa-file-text-o"></i>
											Arşiv <span
											class="label label-info pull-right inbox-notification">
												<%
													out.print(sayi2);
												%>
										</span></a>
										</li>

								</ul>
							</div>
						</section>


					</div>
					<div class="col-sm-9">
                <section class="panel">
                <%
					
				
				%>
                
                
                    <header class="panel-heading wht-bg">
                       <h4 class="gen-case"> Mesaj Görüntüle
                           <form class="pull-right mail-src-position">
                            <div class="input-append">
                                <input type="text" class="form-control " placeholder="Search Mail">
                            </div>
                        </form>
                       </h4>
                    </header>
                    <div class="panel-body ">

                        <div class="mail-header row">
                            <div class="col-md-8">
                                <h4 class="pull-left"> <%=baslik1 %> </h4>
                            </div>
                            <div class="col-md-4">
                                <div class="compose-btn pull-right">
                                    <a href="?olay=arsiv&id=<%=request.getParameter("id")%>"><button type="button" class="btn btn-default">Arşivle</button></a>
                                    </div>
                            </div>

                        </div>
                        <div class="mail-sender">
                            <div class="row">
                                <div class="col-md-8">
                                    <img src="../dosya/images/mini.png" alt="">
                                    <strong>[<%=mail1 %>]</strong>
                                    <span>to</span>
                                    
                                    <strong>me</strong>
                                </div>
                                <div class="col-md-4">
                                    <p class="date"><%out.print(formatterr.format(noww).toString()); %> // <%=formatterr1.format(noww1).toString() %></p>
                                </div>
                            </div>
                        </div>
                        <div class="view-mail">
                            <p> <%=mesaj1 %> </p>
                        </div>
                       
                        <div class="compose-btn pull-right">
                            <a href="?olay=arsiv&id=<%=request.getParameter("id")%>"><button type="button" class="btn btn-default">Arşivle</button></a>
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