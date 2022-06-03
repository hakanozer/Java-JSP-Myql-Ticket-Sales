<%@ page contentType="text/html; charset=UTF-8" language="java"
	import="java.sql.*" import="java.*" errorPage=""%>
<%@ include file="admin/ayar.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 //EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Ottobüs Biletim - Site Haritası</title>
<meta http-equiv="content-language" content="TR" />
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=8" />
<meta property="ya:interaction" content="XML_FORM" />
<meta property="ya:interaction:url"
	content="https://www.kamilkoc.com.tr/kamilkoc.xml" />
<meta name="description" content="Kamil Koç Otobüsleri A.Ş. - Kamil Koç" />
<meta name="keywords"
	content="otobüs bileti, kamil koç, kamil koc, bilet, seyahat, otobus, otobüs, otogar, terminal, otobüs bileti,Ana Sayfa, Kamil, Koç, KamilKoç,Turizm, otobüs bileti, otobüs, koc" />
<meta name="author" content="Kamil Koç Otobüsleri A.Ş." />
<style type="text/css">
FORM {
	display: inline;
}

TEXTAREA {
	resize: none;
}

div.ui-datepicker {
	font-size: 10px;
}

Body {
	margin-top: 0px;
	margin-left: 0px;
	margin-right: 0px;
}
</style>
<link rel="shortcut icon" href="SiteDosyalari/Images/favicon.ico" />
<link rel="shortcut icon"
	href="SiteDosyalari/Images/favicon.ico?version=v_7.0"
	type="image/x-icon" />
<link rel="shortcut icon" href="/favicon.ico" />
<link rel="shortcut icon" href="/favicon.ico?version=v_7.0"
	type="image/x-icon" />
<link href="SiteDosyalari/CSS/Style.css?version = v_7.0"
	rel="stylesheet" type="text/css" />
<link href="SiteDosyalari/CSS/Style2.css?version = v_7.0"
	rel="stylesheet" type="text/css" />
<link href="SiteDosyalari/CSS/StyleSheet1.css?version = v_7.0"
	rel="stylesheet" type="text/css" />
<link
	href="/?DisplayFile=filename,,jqueryuicore.css$$$Namespace,,Ardita&version = v_7.0"
	rel="stylesheet" type="text/css" />
<link
	href="/?DisplayFile=filename,,jqueryuidatepicker.css$$$Namespace,,Ardita&version = v_7.0"
	rel="stylesheet" type="text/css" />
<link
	href="/?DisplayFile=filename,,jqueryuitheme.css$$$Namespace,,Ardita&version = v_7.0"
	rel="stylesheet" type="text/css" />
<script type='text/javascript'
	src='SiteDosyalari/JS/jQuery.js?version=v_7.0'></script>
<script type='text/javascript'
	src='SiteDosyalari/JS/Script.js?version=v_7.0'></script>
<script type='text/javascript'
	src='SiteDosyalari/JS/Headline.js?version=v_7.0'></script>
<script type='text/javascript'
	src='SiteDosyalari/JS/Script2.js?version=v_7.0'></script>

<script type='text/javascript'
	src='SiteDosyalari/JS/DINPro.js?version=v_7.0'></script>
<script type='text/javascript'
	src='SiteDosyalari/JS/Seal.js?version=v_7.0'></script>
<script type='text/javascript'
	src='SiteDosyalari/JS/AjaxPanel.js?version=v_7.0'></script>
<script type='text/javascript'
	src='/?DisplayFile=filename,,jqueryuicore.js$$$Namespace,,Ardita&version=v_7.0'></script>
<script type='text/javascript'
	src='/?DisplayFile=filename,,jqueryuiwidget.js$$$Namespace,,Ardita&version=v_7.0'></script>
<script type='text/javascript'
	src='/?DisplayFile=filename,,jqueryuidatepicker.js$$$Namespace,,Ardita&version=v_7.0'></script>
<script type='text/javascript'
	src='/?DisplayFile=filename,,jqueryuidatepickertr.js$$$Namespace,,Ardita&version=v_7.0'></script>


</head>
<body>




	<%@ include file="ust.jsp"%>






	<div id="Content">
		<div id="CustomPage">
			<div id="CustomPageContent">
				<div id="CustomPageLayout">
					<div id="CustomPageLeftPanel">
						<span>Şirketimiz</span>
					</div>
					<div id="CustomPageRightPanel">
					
					
						<h1 style="font-size: 25px;padding: 19px;color: rgb(0, 114, 190);">Site Haritası</h1>
						
						
						
						<table id="C0" cellspacing="0" cellpadding="0" class="ContentST">
							<tr id="C0_Row_0">
								<td ID="C0_Cell_0_0"><img alt=""
									style="margin-bottom: 10px; margin-left: 10px; max-width: 790px; border: 0px #000 none; border-left: 0px #000000 solid; border-right: 0px #000000 solid; border-top: 0px #000000 solid; border-bottom: 0px #000000 solid;"
									src="SiteDosyalari/Images/hakkimizda.jpg" /></td>
							</tr>
							<tr id="C0_Row_1">
								<td ID="C0_Cell_1_0"><div id="ContentContainer">
										<div id="ContentText" class="CustomPageContent">
											<div style="text-align: justify;">
												<font size="2" face="Verdana"><br> </font>
											</div>
											<div style="text-align: justify;">
											
											
											<%
											
											ResultSet oku = st.executeQuery("select *from admin where id = '1'");
											oku.next();
											
											%>
											
											
												<font size="2" face="Verdana"><% out.print(oku.getString("siteharitasi"));  %></font>
											</div>
											
											
										</div>
									</div></td>
							</tr>
							<tr id="C0_Row_2">
								<td ID="C0_Cell_2_0"><div class="Line"></div></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>


	<%@ include file="alt.jsp"%>


</body>
</html>