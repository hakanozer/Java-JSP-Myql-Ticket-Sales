<%@page import="java.awt.print.Printable"%>
<%@ page contentType="text/html; charset=UTF-8" language="java"
	import="java.sql.*" import="java.*" errorPage=""%>
<%@ include file="admin/ayar.jsp"%>


<%

boolean kullanicii_varmi = (session.getAttribute("kullanici_id") == null);
String kullanicid = "";
if(!kullanicii_varmi){
	kullanicid = String.valueOf(session.getAttribute("kullanici_id"));
}else{
	
	response.sendRedirect("uye_giris.jsp");
}


%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 //EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Ottobüs Biletim - Bilet İşlemlerim</title>
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
						
						
					</div>
					<div id="CustomPageRightPanel">
					
					
						<h1 style="font-size: 25px;padding: 19px;color: rgb(0, 114, 190);">Bilet İşlemlerim</h1>
						
						
						
						<table id="C0" cellspacing="0" cellpadding="0" class="ContentST">
							<tr id="C0_Row_0">
								
							</tr>
							<tr id="C0_Row_1">
								<td ID="C0_Cell_1_0"><div id="ContentContainer">
										<div id="ContentText" class="CustomPageContent">
											<div style="text-align: justify;">
												<font size="2" face="Verdana"><br> </font>
											</div>
											<div style="text-align: justify;">
											
											
											
											<table width="400px" class="Grid VoyageGrid" id="gridcolumn" style="height: 100%;">
													<tbody><tr>
														<td width="60"><div style="width: 100%">Bilgi</div></td>
														<td width="67"><div style="width: 100%">Şirketler</div></td>
														<td width="60"><div style="width: 100%">Saat</div></td>
														<td width="105"><div style="width: 100%">Sefer
																Tipi</div></td>
														<td width="169"><div style="width: 100%">Otobüs
																Tipi</div></td>
														<td width="103"><div style="width: 100%">İndirimli
																Fiyat</div></td>
														<td width="101"><div style="width: 100%">Normal
																Fiyat</div></td>
														<td width="100"><div style="width: 100%">Seçiniz</div></td>
													</tr>
											
											
											
											<%
											
											
											ResultSet rs_b = st.executeQuery("SELECT p. * FROM sefer AS p WHERE p.id IN ( SELECT sefer_id AS s_id FROM biletler WHERE yolcu_tcno ='"+kullanicid+"' )");
											while(rs_b.next()){
											
											
											%>



													<tr id="CB_VoyagesForm_Row_ID_1986249" class="VoyagesRowStyle EvenRow">
														<td width="60" class="cCB_VoyagesForm_Column_Info ">
															<div id="CB_VoyagesForm_Row_ID_1986249_CB_VoyagesForm_Column_Info" style="width: 100%;">
																<div id="DrawerVoyageInfo" style="width: 33px; background: url('SiteDosyalari/Images/Template.png') no-repeat scroll -296px -510px transparent; height: 23px; float: left;">
																</div>
															</div>
														</td>
														<td width="67" class="cCB_VoyagesForm_Column_DepartureTime ">

															<div id="firma_unvani" style="width: 100%;">
																MessuTur
															</div>

														</td>
														<td width="60" class="cCB_VoyagesForm_Column_DepartureTime ">
															<div id="saat" style="width: 60px;">
																03:05:00
															</div>
														</td>
														<td width="105" class="cCB_VoyagesForm_Column_Name ">
															<div id="sefer_tipi" style="width: 100%;">
																<div style="float: left; margin-top: 5px;">
																	Normal
																</div>
															</div>
														</td>
														<td width="169" class="cCB_VoyagesForm_Column_BusName ">
															<div id="otobus_tipi" style="width: 100%;">
																Neoplan
															</div>
														</td>
														<td width="103" class="cCB_VoyagesForm_Column_StrNetPrice ">
															<div id="indirimli_fiyat" style="width: 100%;">
																<div style="color: #00539A; margin-top: 5px; font-weight: bold;">
																	30
																	TL
																</div>
															</div>
														</td>
														<td width="103" class="cCB_VoyagesForm_Column_StrNetPrice "><div id="normal_fiyat" style="width: 100%;">
																<div style="color: #00539A; margin-top: 5px; font-weight: bold;">
																	35
																	TL
																</div>
															</div></td>
														<td width="100" class="cCB_VoyagesForm_Column_SelectedRowLink ">
															<div id="CB_VoyagesForm_Row_ID_1986249_CB_VoyagesForm_Column_SelectedRowLink" style="width: 100%;">
																<a href="iletisim.jsp"><cufon class="cufon cufon-canvas" alt=" " style="width: 3px; height: 12px;"><canvas width="17" height="15" style="width: 17px; height: 15px; top: -3px; left: -1px;"></canvas><cufontext> </cufontext></cufon><div id="SelectedRowLink"><cufon class="cufon cufon-canvas" alt="İptal İsteği" style="width: 20px; height: 12px;"><canvas width="31" height="15" style="width: 31px; height: 15px; top: -3px; left: -1px;"></canvas><cufontext>İptal İsteği</cufontext></cufon></div><cufon class="cufon cufon-canvas" alt=" " style="width: 3px; height: 12px;"><canvas width="17" height="15" style="width: 17px; height: 15px; top: -3px; left: -1px;"></canvas><cufontext> </cufontext></cufon></a>
															</div>
														</td>
													</tr>


											
											<%} %>
											
										</tbody>
									</table>


												<font size="2" face="Verdana"></font>
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