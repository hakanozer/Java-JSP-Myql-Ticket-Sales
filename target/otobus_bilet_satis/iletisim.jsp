<%@ page contentType="text/html; charset=UTF-8" language="java"
	import="java.sql.*" import="java.*" errorPage=""%>
<%@ include file="admin/ayar.jsp"%>



<%
	boolean yaz_durum = (request.getParameter("gonderBtn") == null);
	if (!yaz_durum) {

		try {

			
			String tel_no = request.getParameter("MobilePhone");
			String mail = request.getParameter("EmailAddress");
			String mesaj = request.getParameter("Message");
			String baslik = request.getParameter("SubjectHeader");
			int yaz = st.executeUpdate("INSERT INTO  iletisim (telefon,mail,baslik,mesaj,tarihsaat,durum) VALUES ('"+tel_no+"',  '"+mail+"',  '"+baslik+"',  '"+mesaj+"', now() ,  '0')");
			if (yaz > 0) {
				response.sendRedirect("index.jsp");
			}

		} catch (SQLException e) {
			out.print("Hata : " + e);
		}

	}
%>





<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 //EN">
<html>
<head>
<title>Ottobüs Biletim - İletişim</title>
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
	<script type='text/javascript' src="SiteDosyalari/JS/jQuery.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	
	$('input#gonderBtn').click(function(){
		
		if($('#MobilePhone').val() == ""){
			alert("Telefon giriniz");
			$('#MobilePhone').focus();
			return false;
		}else if($('#EmailAddress').val() == ""){
			alert("mail giriniz");
			$('#EmailAddress').focus();
			return false;
		}else if($('#SubjectHeader').val() == ""){
			alert("konu başlığı giriniz");
			$('#SubjectHeader').focus();
			return false;
		}else if($('#Message').val() == ""){
			alert("mesaj giriniz");
			$('#Message').focus();
			return false;
		}else{
			return true;
		}
	});
	
	
	
	
});



</script>

</head>
<body>




	<%@ include file="ust.jsp"%>






	<div id="Content">
		<div id="CustomPage">
			<div id="CustomPageContent">
				<div id="CustomPageLayout">
					<div id="CustomPageLeftPanel">
						<span></span>
					</div>
					<div id="CustomPageRightPanel">


						<h1 style="font-size: 25px; padding: 19px; color: rgb(0, 114, 190);">İletişim</h1>

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

	<form id="ContactUsForm" name="ContactUsForm" action=""  class="ContactUsForm" method="post">
					
					<div class="FormItem">
						<div class="Label">Cep Telefonu :</div>
						<div class="Value">
							<input id="MobilePhone" name="MobilePhone" maxlength="10" type="text" class="textbox">
						</div>
					</div>
					<div class="FormItem">
						<div class="Label">E-posta adresi :</div>
						<div class="Value">
							<input id="EmailAddress" name="EmailAddress" type="text" class="textbox">
						</div>
					</div>
					<div class="FormItem">
						<div class="Label">Konu Başlığı :</div>
						<div class="Value">
							<input id="SubjectHeader" name="SubjectHeader" type="text" class="textbox">
						</div>
					</div>
					<div class="FormItem">
						<div class="Label">Mesaj :</div>
						<div class="Value" >
							<textarea id="Message" name="Message" class="textarea" rows="6" ></textarea>
						</div>
					</div>
					
					<div class="FormItem">
						<input type="submit" name="gonderBtn" id="gonderBtn" class="FormButton">
					</div>
					
					
					
				</form>
						
						
						
					






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