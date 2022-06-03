<%@page import="com.sun.corba.se.spi.orbutil.fsm.Guard.Result"%>
<%@ page contentType="text/html; charset=UTF-8" language="java"
	import="java.sql.*" import="java.*" errorPage=""%>
<%@ include file="admin/ayar.jsp"%>
<%
	boolean kalkis = (request.getParameter("kalkis_yeri") == null);
	boolean varis = (request.getParameter("varis_yeri") == null);
	boolean tarih = (request.getParameter("VoyageDate") == null);
	if (kalkis || varis || tarih) {
		//response.sendRedirect("index.jsp");
	}
	String secilen[] = null;

	boolean scln_k_d = (request.getParameter("scln_k") == null);
	if (!scln_k_d) {

		secilen = request.getParameterValues("scln_k");
		

	}
	
	
	boolean satis_d = (request.getParameter("satis") == null);
	if (!satis_d) {
		boolean yid_d = (request.getParameter("yid") == null);
		if (!yid_d) {
			String satis = request.getParameter("satis");
			if(satis.equals("onay")){
				String koltuk="";
				for(String i:secilen){
				
				int rssatis=st3.executeUpdate("insert into biletler values(NULL,'"+request.getParameter("yid")+"','"+request.getParameter("secilen_firma_id")+"','"+request.getParameter("VoyageDate")+"','"+i+"','','1','')");
				}
				
			}
		}else{
			/*String satis = request.getParameter("satis");
			if(satis.equals("onay")){
				
				ResultSet rssatis=st3.executeQuery("insert into biletler values(NULL,'"+request.getParameter("")+"','"++"')");
				
				
			}*/
			response.sendRedirect("yeni_uye.jsp");
		}

	}
	
	
	
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 //EN">
<html>
<head>
<title>Ottobüs Biletim - Bilet Sorgula</title>
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
<script type='text/javascript'
	src='SiteDosyalari/JS/jQuery.js?version=v_7.0'></script>
<script type='text/javascript'
	src='SiteDosyalari/JS/Script.js?version=v_7.0'></script>
<script type='text/javascript'
	src='SiteDosyalari/JS/Headline.js?version=v_7.0'></script>
<script type='text/javascript'
	src='SiteDosyalari/JS/Script2.js?version=v_7.0'></script>
<script type='text/javascript'
	src='SiteDosyalari/JS/cufon-yui.js?version=v_7.0'></script>
<script type='text/javascript'
	src='SiteDosyalari/JS/DINPro.js?version=v_7.0'></script>
<script type='text/javascript'
	src='SiteDosyalari/JS/Seal.js?version=v_7.0'></script>
<script type='text/javascript'
	src='SiteDosyalari/JS/AjaxPanel.js?version=v_7.0'></script>

<!-- 
<script type="text/javascript">
	$(document).ready(function() {
		$('#satinal').click(function() {

			if ($('#kimlik').text() == "") {
				alert("Lüten TC No Giriniz");
				$('#kimlik').focus();
				return false;
			} else if ($('#adi').text() == "") {
				alert("Lüten Adı Giriniz");
				$('#adi').focus();
				return false;
			} else if ($('#soyadi').val() == "") {
				alert("Lüten Soyadı Giriniz");
				$('#soyadi').focus();
				return false;
			} else {
				return true;
			}

		})
	})
</script>-->

<link href="SiteDosyalari/CSS/picker_2.css" rel="stylesheet"
	type="text/css" />
<link href="SiteDosyalari/CSS/picker.css" rel="stylesheet"
	type="text/css" />
<link href="SiteDosyalari/CSS/core.css" rel="stylesheet" type="text/css" />



<script type='text/javascript'
	src='SiteDosyalari/JS/jqueryDataPicker_2.js'></script>
<script type='text/javascript'
	src='SiteDosyalari/JS/jqueryUiDataPicker.js'></script>
<script type='text/javascript' src='SiteDosyalari/JS/jqueryWidtget.js'></script>
<script type='text/javascript' src='SiteDosyalari/JS/jqueryCore.js'></script>


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





					<form action="" method="get">

						<input name="kalkis_yeri"
							value="<%out.print(request.getParameter("kalkis_yeri"));%>"
							style="visibility: hidden;" /> <input name="varis_yeri"
							value="<%out.print(request.getParameter("varis_yeri"));%>"
							style="visibility: hidden;" /> <input name="VoyageDate"
							value="<%out.print(request.getParameter("VoyageDate"));%>"
							style="visibility: hidden;" /> <input name="secilen_firma_id"
							value="<%out.print(request.getParameter("secilen_firma_id"));%>"
							style="visibility: hidden;" />

						<div id="CustomPageRightPanel">


							<h1
								style="font-size: 25px; padding: 19px; color: rgb(0, 114, 190);">Bilet
								Sorgula</h1>



							<table id="C0" cellspacing="0" cellpadding="0" class="ContentST">
								<tr id="C0_Row_0">
									<td ID="C0_Cell_0_0"></td>
								</tr>
								<tr id="C0_Row_1">
									<td ID="C0_Cell_1_0"><div id="ContentContainer">
											<div id="ContentText" class="CustomPageContent">




												<div id="GridHeaderContainer">
													<a id="PreviousDay"
														href="javascript:getPreviousDayVoyages()"></a><a
														id="NextDay" href="javascript:getNextDayVoyages()"></a>
													<div id="NextDayTitle" onclick="getNextDayVoyages();">Önceki
														Gün</div>
													<div id="PreviousDayTitle"
														onclick="getPreviousDayVoyages();">Sonraki Gün</div>
													<div id="HeaderAllDate">
														<%
															out.print(request.getParameter("VoyageDate"));
														%>
													</div>
												</div>
												<table width="400px" class="Grid VoyageGrid" id="gridcolumn">
													<tr>
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
														ResultSet rs5 = st
																.executeQuery("Select * From sefer left join isletme on(sefer.isletme_id=isletme.id) where kalkis_yeri='"
																		+ request.getParameter("kalkis_yeri")
																		+ "' and varis_yeri='"
																		+ request.getParameter("varis_yeri")
																		+ "'  order by firma_unvani , saat");
														while (rs5.next()) {
													%>



													<tr id="CB_VoyagesForm_Row_ID_1986249"
														class="VoyagesRowStyle EvenRow">
														<td width="60" class="cCB_VoyagesForm_Column_Info ">
															<div
																id="CB_VoyagesForm_Row_ID_1986249_CB_VoyagesForm_Column_Info"
																style="width: 100%;">
																<div id="DrawerVoyageInfo"
																	style="width: 33px; background: url('SiteDosyalari/Images/Template.png') no-repeat scroll -296px -510px transparent; height: 23px; float: left;">
																</div>
															</div>
														</td>
														<td width="67"
															class="cCB_VoyagesForm_Column_DepartureTime ">

															<div id="firma_unvani" style="width: 100%;">
																<%
																	out.print(rs5.getString("firma_unvani"));
																%>
															</div>

														</td>
														<td width="60"
															class="cCB_VoyagesForm_Column_DepartureTime ">
															<div id="saat" style="width: 60px;">
																<%
																	out.print(rs5.getString("saat"));
																%>
															</div>
														</td>
														<td width="105" class="cCB_VoyagesForm_Column_Name ">
															<div id="sefer_tipi" style="width: 100%;">
																<div style="float: left; margin-top: 5px;">
																	<%
																		out.print(rs5.getString("sefer_tipi"));
																	%>
																</div>
															</div>
														</td>
														<td width="169" class="cCB_VoyagesForm_Column_BusName ">
															<div id="otobus_tipi" style="width: 100%;">
																<%
																	out.print(rs5.getString("otobus_tipi"));
																%>
															</div>
														</td>
														<td width="103"
															class="cCB_VoyagesForm_Column_StrNetPrice ">
															<div id="indirimli_fiyat" style="width: 100%;">
																<div
																	style="color: #00539A; margin-top: 5px; font-weight: bold;">
																	<%
																		out.print(rs5.getString("indirimli_fiyat"));
																	%>
																	TL
																</div>
															</div>
														</td>
														<td width="103"
															class="cCB_VoyagesForm_Column_StrNetPrice "><div
																id="normal_fiyat" style="width: 100%;">
																<div
																	style="color: #00539A; margin-top: 5px; font-weight: bold;">
																	<%
																		out.print(rs5.getString("normal_fiyat"));
																	%>
																	TL
																</div>
															</div></td>
														<td width="100"
															class="cCB_VoyagesForm_Column_SelectedRowLink ">
															<div
																id="CB_VoyagesForm_Row_ID_1986249_CB_VoyagesForm_Column_SelectedRowLink"
																style="width: 100%;">
																<a
																	href="?kalkis_yeri=<%out.print(request.getParameter("kalkis_yeri"));%>&varis_yeri=<%out.print(request.getParameter("varis_yeri"));%>&VoyageDate=<%out.print(request.getParameter("VoyageDate"));%>&secilen_firma_id=<%out.print(rs5.getString("id"));%>">
																	<div id="SelectedRowLink">Seç</div>
																</a>
															</div>
														</td>
													</tr>

													<%
														}
													%>
												</table>













											</div>
										</div></td>
								</tr>

							</table>
						</div>
						<%
							boolean secilen_firma_id_durum = (request
									.getParameter("secilen_firma_id") == null);
							if (!secilen_firma_id_durum) {
						%>
						<div id="CustomPageRightPanel" height="100px">
							<h1
								style="font-size: 25px; padding: 19px; color: rgb(0, 114, 190);">Koltuk
								Seçimi</h1>
							<table width="400px" class="Grid VoyageGrid" id="gridcolumn">
								<%
									ResultSet rs = st.executeQuery("Select * from sefer where id='"
												+ (request.getParameter("secilen_firma_id")) + "'");
										while (rs.next()) {
											int koltuk_sayisi = Integer.valueOf(rs
													.getString("koltuk_sayisi"));
								%>
								<tr class="VoyagesRowStyle EvenRow">
									<%
										for (int i = 1; i < koltuk_sayisi + 1; i++) {
									%>

									<td id="LoginForm_Layout_Cell_0_0FieldsStructure_Cell_3_0"><input
										name="scln_k"
										style="float: left; margin-right: 10px; margin-left: 0px; margin-top: 20px"
										type="checkbox" value="<%out.print(i);%>"> <%
 	out.print(i);
 %></td>

									<%
										}
									%>
								</tr>
								<tr class="VoyagesRowStyle EvenRow">
									<td id="LoginForm_Layout_Cell_0_0FieldsStructure_Cell_3_0"
										colspan="<%=koltuk_sayisi%>"><input type="submit"
										value="Gönder" /></td>

								</tr>
								<%
									}
									}
								%>

							</table>
						</div>




					</form>


					<%
						if (!scln_k_d) {

							boolean kullanici_varmi1 = (session
									.getAttribute("kullanici_id") == null);
							if (!kullanici_varmi1) {

								ResultSet rs4 = st3
										.executeQuery("Select * From yolcular where id='"
												+ session.getAttribute("kullanici_id")
												+ "'");
								while (rs4.next()) {
					%>






					<form action="" method="get">
						<input name="kalkis_yeri"
							value="<%out.print(request.getParameter("kalkis_yeri"));%>"
							style="visibility: hidden;" /> <input name="varis_yeri"
							value="<%out.print(request.getParameter("varis_yeri"));%>"
							style="visibility: hidden;" /> <input name="VoyageDate"
							value="<%out.print(request.getParameter("VoyageDate"));%>"
							style="visibility: hidden;" /> <input name="secilen_firma_id"
							value="<%out.print(request.getParameter("secilen_firma_id"));%>"
							style="visibility: hidden;" />

						<div id="CustomPageRightPanel">
							<h1
								style="font-size: 25px; padding: 19px; color: rgb(0, 114, 190);">
								Yolcu Bilgilerii</h1>



							<table width="400px" class="Grid VoyageGrid" id="gridcolumn">

								<tbody>
									<tr class="VoyagesRowStyle EvenRow">
										<td width="60"><div style="width: 100%">Cinsiyet</div></td>
										<td width="67"><div style="width: 100%">Kimlik</div></td>
										<td width="60"><div style="width: 100%">Adı</div></td>
										<td width="105"><div style="width: 100%">Soyadı</div></td>
										<td width="169"><div style="width: 100%">K.No</div></td>
										<td width="103"><div style="width: 100%">Fiyat</div></td>
										<td width="100"><div style="width: 100%">Kalkış-Varış-Tarih</div></td>

									</tr>

									<%
										
													for (int i = 0; i < secilen.length; i++) {

														ResultSet rsf = st2
																.executeQuery("Select * From sefer where id='"
																		+ request
																				.getParameter("secilen_firma_id")
																		+ "'");
														while (rsf.next()) {
									%>

									<tr class="VoyagesRowStyle EvenRow">
										<td width="60"><div style="width: 100%">
												<select name="cinsiyet" id="cinsiyet"
													class="PaymentPageSelectBox" style="width: 100%;">
													<option value="1">BAY</option>
													<option value="2">BAYAN</option>
												</select>
											</div></td>
										<td width="67"><div style="width: 100%"><%=rs4.getString("yolcu_tc")%>
											</div></td>
										<td width="60"><div style="width: 100%"><%=rs4.getString("adi")%></div></td>
										<td width="105"><div style="width: 100%"><%=rs4.getString("soyadi")%></div></td>
										<td width="169"><div style="width: 100%">
												<input name="scln_k" value="<%out.print(secilen[i]);%>"
													style="visibility: hidden;" />
												<%
													
																		out.print(secilen[i]);
												%>
											</div></td>
										<td width="103"><div style="width: 100%"><%=rsf.getString("normal_fiyat")%></div></td>
										<td width="100"><div style="width: 100%"><%=request.getParameter("VoyageDate")%></div></td>

									</tr>
									<%
										}
													}
									%>
									<tr class="VoyagesRowStyle EvenRow">
										<td id="LoginForm_Layout_Cell_0_0FieldsStructure_Cell_3_0"
											colspan="7>"><input name="yid"
											value="<%out.print(session.getAttribute("kullanici_id"));%>"
											style="visibility: hidden;" /> <input name="satis"
											value="onay" style="visibility: hidden;" /> <input
											type="submit" value="Satın Al" /></td>

									</tr>

								</tbody>
							</table>
						</div>



					</form>



					<%
						}
							} else {
					%>


					<form action="" method="get">

						<input name="kalkis_yeri"
							value="<%out.print(request.getParameter("kalkis_yeri"));%>"
							style="visibility: hidden;" /> <input name="varis_yeri"
							value="<%out.print(request.getParameter("varis_yeri"));%>"
							style="visibility: hidden;" /> <input name="VoyageDate"
							value="<%out.print(request.getParameter("VoyageDate"));%>"
							style="visibility: hidden;" /> <input name="secilen_firma_id"
							value="<%out.print(request.getParameter("secilen_firma_id"));%>"
							style="visibility: hidden;" />

						<div id="CustomPageRightPanel">
							<h1
								style="font-size: 25px; padding: 19px; color: rgb(0, 114, 190);">
								Yolcu Bilgilerii</h1>



							<table width="400px" class="Grid VoyageGrid" id="gridcolumn">

								<tbody>
									<tr id="CB_VoyagesForm_Row_ID_1986249"
										class="VoyagesRowStyle EvenRow">
										<td width="60"><div style="width: 100%">Cinsiyet</div></td>
										<td width="67"><div style="width: 100%">Kimlik</div></td>
										<td width="60"><div style="width: 100%">Adı</div></td>
										<td width="105"><div style="width: 100%">Soyadı</div></td>
										<td width="169"><div style="width: 100%">K.No</div></td>
										<td width="103"><div style="width: 100%">Fiyat</div></td>
										<td width="100"><div style="width: 100%">Kalkış-Varış-Tarih</div></td>

									</tr>

									<%
										
												for (int i = 0; i < secilen.length; i++) {

													ResultSet rsf = st2
															.executeQuery("Select * From sefer where id='"
																	+ request
																			.getParameter("secilen_firma_id")
																	+ "'");
													while (rsf.next()) {
									%>

									<tr id="CB_VoyagesForm_Row_ID_1986249"
										class="VoyagesRowStyle EvenRow">
										<td width="60"><div style="width: 100%">
												<select name="cinsiyet" id="cinsiyet"
													class="PaymentPageSelectBox" style="width: 100%;">
													<option value="1">BAY</option>
													<option value="2">BAYAN</option>
												</select>
											</div></td>
										<td width="67"><div style="width: 100%">
												<input id="kimlik" name="kimlik" type="text"
													style="width: 100%;">
											</div></td>
										<td width="60"><div style="width: 100%">
												<input id="adi" name="adi" type="text" style="width: 100%;">
											</div></td>
										<td width="105"><div style="width: 100%">
												<input id="soyadi" name="soyadi" type="text"
													style="width: 100%;">
											</div></td>
										<td width="169"><div style="width: 100%">
												<input name="scln_k" value="<%out.print(secilen[i]);%>"
													style="visibility: hidden;" />
												<%
													
																	out.print(secilen[i]);
												%>
											</div></td>
										<td width="103"><div style="width: 100%"></div></td>
										<td width="100"><div style="width: 100%"><%=request.getParameter("VoyageDate")%></div></td>

									</tr>
									<%
										}
												}
							
									%>
									<tr class="VoyagesRowStyle EvenRow">
										<td id="LoginForm_Layout_Cell_0_0FieldsStructure_Cell_3_0"
											colspan="7"><input name="satis" value="onay"
											style="visibility: hidden;" /> <input type="submit"
											id="satinal" value="Satın Al" /></td>

									</tr>

								</tbody>
							</table>
						</div>

					</form>

					<%
						}
						}
					%>








				</div>
			</div>
		</div>
	</div>


	<%@ include file="alt.jsp"%>


</body>
</html>