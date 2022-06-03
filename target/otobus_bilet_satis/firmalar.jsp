<%@ page contentType="text/html; charset=UTF-8" language="java"
	import="java.sql.*" import="java.*" errorPage=""%>
<%@ include file="admin/ayar.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 //EN">
<html>
<head>
<title>Ottobüs Biletim - Firmalar</title>
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



<style>

.ana_div {
	width: 800px
}

.firma {
	float: left;
	width: 100px;
	height: 100px;
	background-color: rgb(238, 238, 238);
	margin: 5px;
	padding: 5px;
	border: 4px solid rgb(226, 226, 226);
	font-family: Arial;
	font-size: 13px;
	text-align: center;
}

.firma:hover {
	border: 4px solid rgb(54, 50, 50);
	cursor: pointer;
}


</style>




	<div id="Content">
		<div id="CustomPage">
			<div id="CustomPageContent">
				<div id="CustomPageLayout">
					<div id="CustomPageLeftPanel">
						
					</div>
					<div id="CustomPageRightPanel">
					
					
						<h1 style="font-size: 25px;padding: 19px;color: rgb(0, 114, 190);">Üye Firmalarımız</h1>
						
						
						
						<table id="C0" cellspacing="0" cellpadding="0" class="ContentST">
							<tr id="C0_Row_0">
								
							</tr>
							
							<div class"ana_div">
						
						<%
						
						ResultSet f_rs = st.executeQuery("select *from isletme where durum = 0  order by id desc");
						while(f_rs.next()){
						%>
						
						
							<a href="firma_ayrinti.jsp?id=<% out.print(f_rs.getString("id")); %>"> 
							
								<div class="firma">
								<%
								if(f_rs.getString("logo").equals("")){
								%>
								<img alt="<% out.print(f_rs.getString("firma_unvani")); %>" title="<% out.print(f_rs.getString("firma_unvani")); %>" src="SiteDosyalari/Images/firma_logo_yok.png">
								<%}else{ %>
								<img alt="" src="">
								<%} %>
								
								
								<div style="margin-top: 7px;"><% out.print(f_rs.getString("firma_unvani")); %></div>
								</div>
							</a>

					<%} %>		
							
							
							
							</div>
							
							
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