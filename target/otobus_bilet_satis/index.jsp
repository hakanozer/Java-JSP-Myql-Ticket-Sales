<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" import="java.*" errorPage=""%>
 <%@include file="admin/ayar.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 //EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Bilet Projesi</title>
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
<link rel="shortcut icon" href="SiteDosyalari/Images/favicon.ico?version=v_7.0" type="image/x-icon" />
<link rel="shortcut icon" href="/favicon.ico" />




<link rel="shortcut icon" href="/favicon.ico?version=v_7.0" type="image/x-icon" />
<link href="SiteDosyalari/CSS/Style.css?version = v_7.0" rel="stylesheet" type="text/css" />
<link href="SiteDosyalari/CSS/Style2.css?version = v_7.0" rel="stylesheet" type="text/css" />
<link href="SiteDosyalari/CSS/StyleSheet1.css?version = v_7.0" rel="stylesheet" type="text/css" />
<script type='text/javascript' src='SiteDosyalari/JS/jQuery.js?version=v_7.0'></script>
<script type='text/javascript' src='SiteDosyalari/JS/Script.js?version=v_7.0'></script>
<script type='text/javascript' src='SiteDosyalari/JS/Headline.js?version=v_7.0'></script>
<script type='text/javascript' src='SiteDosyalari/JS/Script2.js?version=v_7.0'></script>
<script type='text/javascript' src='SiteDosyalari/JS/cufon-yui.js?version=v_7.0'></script>
<script type='text/javascript' src='SiteDosyalari/JS/DINPro.js?version=v_7.0'></script>
<script type='text/javascript' src='SiteDosyalari/JS/Seal.js?version=v_7.0'></script>
<script type='text/javascript' src='SiteDosyalari/JS/AjaxPanel.js?version=v_7.0'></script>


<link href="SiteDosyalari/CSS/picker_2.css" rel="stylesheet" type="text/css" />
<link href="SiteDosyalari/CSS/picker.css" rel="stylesheet" type="text/css" />
<link href="SiteDosyalari/CSS/core.css" rel="stylesheet" type="text/css" />



<script type='text/javascript' src='SiteDosyalari/JS/jqueryDataPicker_2.js'></script>
<script type='text/javascript' src='SiteDosyalari/JS/jqueryUiDataPicker.js'></script>
<script type='text/javascript' src='SiteDosyalari/JS/jqueryWidtget.js'></script>
<script type='text/javascript' src='SiteDosyalari/JS/jqueryCore.js'></script>

<script type='text/javascript'>
	if (window.addEventListener) {
	
		window.addEventListener('load', function() {
			$('.datetimepicker').datepicker({
				showOn : 'button',
				buttonImage : 'SiteDosyalari/Images/btn_calendar.png',
				buttonImageOnly : true,
				minDate : new Date()
			}).datepicker("setDate", "0");
			;
		}, false);
	} else if (window.attachEvent) {
		window.attachEvent('onload', function() {
			$('.datetimepicker').datepicker({
				showOn : 'button',
				buttonImage : 'SiteDosyalari/Images/btn_calendar.png',
				buttonImageOnly : true,
				minDate : new Date()
			}).datepicker("setDate", "0");
			;
		})
		
	}
</script>




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


<script type="text/javascript">

$(document).ready(function(){
	$('#sefer_ara').click(function(){
		
		if($('#kalkis_yeri option:selected').text() == "Seç"){
			alert("Lüten Kalkıs Yeri Seçiniz");
			$('#kalkis_yeri').focus();
			return false;
		} else if($('#varis_yeri option:selected').text() == "Seç"){
			alert("Lüten Varış Yeri Seçiniz");
			$('#varis_yeri').focus();
			return false;
		} else if($('#VoyageDate').val() == ""){
			alert("Lüten Tarih Seçiniz");
			$('#VoyageDate').focus();
			return false;
		}else{
			return true;
		}

	})
})


</script>



</head>
<body>

<%@ include file="ust.jsp"%>






	<div id="Content">
		<div id="ContentPanel">
			<div id="ContentRegion">
				<div id="ContentImage_1" class="MainBackground"
					style="background-image: url('SiteDosyalari/Images/Headlines/635346293177254475_0205201412_08_37.jpg'); background-repeat: no-repeat;">
					<input id="ColorCodes" name="ColorCodes" value="#ffffff,#ffffff,#ffffff" type="hidden">
				</div>
			</div>
			<div id="FunctionalButtonsPanel">
				<div id="BuyTicketPosition">
					<div id="BuyTicketContent">
						<div id="BuyTicketContainer">
							<div id="LoadingImageContainer"></div>
							<input id="TextVoyageDeparture" name="TextVoyageDeparture" type="text" class="VoyageTextBox"> 
							<input id="TextVoyageArrival" name="TextVoyageArrival" type="text" class="VoyageTextBox">
							<div id="SelectBoxClick_0" onclick="SelectBoxOpen('0',false);" class="SelectBoxClick"></div>
							<div id="SelectBoxClick_1" onclick="SelectBoxOpen('1',false);" class="SelectBoxClick"></div>
							<input id="QueryTimeHiddenUrlValue" name="QueryTimeHiddenUrlValue" value="/biletsatinal" type="hidden">
							<input id="BuyTicketHiddenUrlValue" name="BuyTicketHiddenUrlValue" value="/biletsatinal" type="hidden"> 
							<input id="MakeReservationHiddenUrlValue" name="MakeReservationHiddenUrlValue" value="/rezervasyonyap" type="hidden">
						</div>
						<div id="BuyTicketDirection" class="Direction"></div>
					</div>
				</div>
				
				<div id="FunctionalButtonsContent">
					<div id="FunctionalButtonsPosition">
						<div id="SelectLink"></div>
						<a id="Online" class="Click" onclick="GetOnlinePanel($(this));">Online İşlemler</a>
						<a id="MyTickets" class="UnClick" onclick="GetMyTicketsPanel($(this));">Biletlerim</a>
						<a id="Suggestions" class="UnClick" href="iletisim.jsp">Öneri ve Görüşleriniz</a>
					</div>
				</div>
				
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
				
				
				<form action="bilet_sorgula.jsp" method="get">
				
				<div id="FunctionalPanel">
					<div id="OnlineProcess">
						<div class="FunctionalLabel">Nereden</div>
						<select  name="kalkis_yeri" id="kalkis_yeri" class="SelectField" onchange="showUser(this.value)">
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
													<%}}%>
							
						</select>
						<div class="FunctionalLabel">Nereye</div>
						
						
						
						<div class="col-sm-6" id="gar2">
												<select name="varis_yeri" class="SelectField"	id="varis_yeri">
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
						
						
						<div class="FunctionalLabel">Gidiş Tarihi</div>
						<div id="ActionContainer" style="margin-top: 10px;">
							<input id="VoyageDate" name="VoyageDate"  maxlength="10" type="text" class="datetimepicker VoyageDate">
						</div>
						<div id="ActionContainer">
							<input type="submit" id="sefer_ara" value="Sefer Ara"  class="FunctionalLink" style="width: 90px;height: 40px;"> 
						</div>
						
					</div>
				</div>
				
				
				</form>
				
			</div>
					</div>
	</div>


	<%@ include file="alt.jsp"%>


</body>
</html>

<style>
#ui-datepicker-div { display: none; }
</style>

