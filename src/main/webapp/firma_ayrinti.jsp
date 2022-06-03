<%@ page contentType="text/html; charset=UTF-8" language="java"
	import="java.sql.*" import="java.*" errorPage=""%>
<%@ include file="admin/ayar.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 //EN">
<html>
<head>
<title>Ottobüs Biletim - Firma Ayrıntıları</title>
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
					
					<%
					ResultSet fa_rs = st.executeQuery("select *from isletme where id='"+request.getParameter("id")+"'");
					fa_rs.next();
					
					
					ResultSet rs_h = st2.executeQuery("select *from hakkimizda where isletme_id = '"+request.getParameter("id")+"'");
					String icerik = "";
					String adres = "";
					String mail = "";
					String telefon = "";
					if(rs_h.next()){
						icerik = rs_h.getString("icerik");
						adres = fa_rs.getString("firma_adresi");
						mail = fa_rs.getString("firma_mail");
						telefon = fa_rs.getString("firma_telefon");
						
						
					}
				
				
					
					
					
					%>
						<h1 style="font-size: 25px;padding: 19px;color: rgb(0, 114, 190);"><%out.print(fa_rs.getString("firma_unvani")); %></h1>
						
						
						
						
						<table id="C0" cellspacing="0" cellpadding="0" class="ContentST">
							<tr id="C0_Row_0">
								<td ID="C0_Cell_0_0"></td>
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
											
											
                       							
                            			<label for="from" class="label">İçerik</label>									
											<div style="font-size: 12px;padding: 10px;color: rgb(163, 163, 163);">	<font size="2" face="Verdana"><% out.print(icerik);  %></font> </div>
										
										
										<label for="from" class="label">ADRES</label>	
											<div style="font-size: 12px;padding: 10px;color: rgb(163, 163, 163);">	<font size="2" face="Verdana"><% out.print(adres);  %></font> </div>

										
										<label for="from" class="label">E-MAİL</label>	
											<div style="font-size: 12px;padding: 10px;color: rgb(163, 163, 163);">	<font size="2" face="Verdana"><% out.print(mail);  %></font> </div>
											
										<label for="from" class="label">TELEFON</label>		
											<div style="font-size: 12px;padding: 10px;color: rgb(163, 163, 163);">	<font size="2" face="Verdana"><% out.print(telefon);  %></font> </div>
										
									
									</td>
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