<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" import="java.*" errorPage=""%>
<%@ include file="admin/ayar.jsp"%>







<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 //EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Ottobüs Biletim - Üye Giriş</title>
<meta http-equiv="content-language" content="TR" />
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=8" />
<meta property="ya:interaction" content="XML_FORM" />
<meta property="ya:interaction:url" content="https://www.kamilkoc.com.tr/kamilkoc.xml" />
<meta name="description" content="Kamil Koç Otobüsleri A.Ş. - Kamil Koç" />
<meta name="keywords" content="otobüs bileti, kamil koç, kamil koc, bilet, seyahat, otobus, otobüs, otogar, terminal, otobüs bileti,Ana Sayfa, Kamil, Koç, KamilKoç,Turizm, otobüs bileti, otobüs, koc" />
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



<link href="SiteDosyalari/CSS/picker_2.css" rel="stylesheet" type="text/css" />
<link href="SiteDosyalari/CSS/picker.css" rel="stylesheet" type="text/css" />
<link href="SiteDosyalari/CSS/core.css" rel="stylesheet" type="text/css" />


<script src="SiteDosyalari/JS/jQuery.js" type="text/javascript"></script>





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


						<h1 style="font-size: 25px; padding: 19px; color: rgb(0, 114, 190);">Üye Giriş</h1>

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






												<form name="tcform" id="tcform" action="uye_giris_kontrol.jsp" method="post">
													<table cellspacing="0" cellpadding="0" border="0">
														<tr>
															<td>
															<input id="LoginFormIsSubmitted" name="LoginFormIsSubmitted" value="1" type="hidden">
															<input id="LoginFormAction" name="LoginFormAction" value="1" type="hidden">
															</td>
														</tr>
														<tr>
															<td>
															<table cellspacing="0" cellpadding="0" class="WebPosForm">
																	<tbody>
																		<tr id="LoginForm_Layout_Row_0">
																			<td width="364" id="LoginForm_Layout_Cell_0_0">
																			<table id="LoginForm_Layout_Cell_0_0FieldsStructure" cellspacing="2" cellpadding="2">
																					<tbody>
																						<tr id="LoginForm_Layout_Cell_0_0FieldsStructure_Row_0">

																						</tr>
																						<tr id="LoginForm_Layout_Cell_0_0FieldsStructure_Row_1">
																							<td width="135" class="LoginFormFieldCellStyle" id="LoginForm_Layout_Cell_0_0FieldsStructure_Cell_1_0">
																							<div id="UserName_Header" class="LoginForm_HeaderClassName">TC Kimlik</div>
																							</td>
																							<td width="187" id="LoginForm_Layout_Cell_0_0FieldsStructure_Cell_1_1" >
																							<input name="tcno" id="tcno" type="text"  maxlength="11"> 
																							</td>
																						</tr>
																						<tr id="LoginForm_Layout_Cell_0_0FieldsStructure_Row_2">
																							<td id="LoginForm_Layout_Cell_0_0FieldsStructure_Cell_2_0" class="LoginFormFieldCellStyle">
																							<div id="Password_Header" class="LoginForm_HeaderClassName">Şifre</div>
																							</td>
																							<td id="LoginForm_Layout_Cell_0_0FieldsStructure_Cell_2_1">
																							<input id="Password" name="Password" autocomplete="off" type="password">
																							</td>
																						</tr>
																						<tr id="LoginForm_Layout_Cell_0_0FieldsStructure_Row_3">
																							<td id="LoginForm_Layout_Cell_0_0FieldsStructure_Cell_3_0" colspan="2">
																							<input name="beni_hatirla" style="float: left; margin-left: 136px; margin-top: 20px" id="RememberMe" type="checkbox" checked="checked">
																								<div id="RememberLabel">Beni Hatırla</div>
																								</td>
																						</tr>
																						<tr id="LoginForm_Layout_Cell_0_0FieldsStructure_Row_4" style="text-align: right;">
																							<td id="LoginForm_Layout_Cell_0_0FieldsStructure_Cell_4_0" colspan="2"><div></div> 
																							<input type="submit"  id="gonderBtn" name="gonderBtn" value="Giriş" class="FormButton">
																							</td>
																						</tr>
																					</tbody>
																				</table>
																				</td>
																		</tr>
																	</tbody>
																</table></td>
														</tr>
													</table>
												</form>







											</div>


										</div>
									</div></td>
							</tr>
						
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>


	<%@ include file="alt.jsp"%>
<script type="text/javascript">


$(document).ready(function(){
	
	$('input#gonderBtn').click(function(){
		
		//boolean sozlesme = (request.getParameter("sozlesme") == null);
		
		var RememberLabel = 0;
		if($("#RememberLabel").is(':checked'))
			sozlesme = 1;  // checked
		else
			sozlesme = 0;  // unchecked

		if (!validateKimlikNo($('input#tcno').val())) {
			alert("Lütfen TC Kimlik Bölümünü Gerektiği Gibi Giriniz");
			$('#tcno').focus();
			return false;
		} else if ($('#Password').val() == "") {
			alert("Lütfen Şifrenizi Giriniz");
			$('#Password').focus();
			return false;
		} else {
			return true;

		};
	});
	
});



function validateKimlikNo( KimlikNo ){
	KimlikNo = String(KimlikNo);
	if( ! KimlikNo.match(/^[0-9]{11}$/) )
	return false;

	pr1 = parseInt(KimlikNo.substr(0,1));
	pr2 = parseInt(KimlikNo.substr(1,1));
	pr3 = parseInt(KimlikNo.substr(2,1));
	pr4 = parseInt(KimlikNo.substr(3,1));
	pr5 = parseInt(KimlikNo.substr(4,1));
	pr6 = parseInt(KimlikNo.substr(5,1));
	pr7 = parseInt(KimlikNo.substr(6,1));
	pr8 = parseInt(KimlikNo.substr(7,1));
	pr9 = parseInt(KimlikNo.substr(8,1));
	pr10 = parseInt(KimlikNo.substr(9,1));
	pr11 = parseInt(KimlikNo.substr(10,1));

	if( (pr1+pr3+pr5+pr7+pr9+pr2+pr4+pr6+pr8+pr10) % 10 != pr11 )
	return false;
	if( ( (pr1+pr3+pr5+pr7+pr9)*7 + (pr2+pr4+pr6+pr8)*9 ) % 10 != pr10 )
	return false;
	if( ( (pr1+pr3+pr5+pr7+pr9)*8) % 10 != pr11 )
	return false;

	return true;
	}

</script>


</body>
</html>