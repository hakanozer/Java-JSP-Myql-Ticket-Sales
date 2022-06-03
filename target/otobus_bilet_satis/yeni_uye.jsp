<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" import="java.*" errorPage=""%>
<%@ include file="admin/ayar.jsp"%>


<%
request.setCharacterEncoding("UTF-8"); 
response.setCharacterEncoding("UTF-8"); 
response.setContentType("text/html; charset=UTF-8"); 
	boolean yaz_durum = (request.getParameter("gonderBtn") == null);
	if (!yaz_durum) {

		try {

			String tcno = request.getParameter("tcno");
			String adi = request.getParameter("adi");
			String soyadi = request.getParameter("soyadi");
			String tel_no = request.getParameter("MobilePhone");
			String mail = request.getParameter("EmailAddress");
			String sifre = request.getParameter("sifre");
			String durum = request.getParameter("durum");

			out.print("sifre");
			
			int satir=0;
			ResultSet kontrol=st.executeQuery("select * from yolcular where yolcu_tc='"+ tcno +"' OR mail='"+ mail +"' ");
			while(kontrol.next()){
					satir++;
			}
				if(satir>=1){
						
						out.print("bu kullanıcı var");
							
					}else{
						int yaz = st.executeUpdate("INSERT INTO yolcular (yolcu_tc , adi, soyadi, tel ,mail , sifre,durum) VALUES ( '" + tcno + "', '" + adi + "','" + soyadi + "', '" + tel_no + "',  '" + mail + "',  '" + sifre + "', '0')");
						if (yaz > 0) {
							response.sendRedirect("uye_giris.jsp");
						}
						
					}

		} catch (SQLException e) {
			out.print("Hata : " + e);
		}

	}
%>







<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 //EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Ottobüs Biletim - Yeni Üye</title>
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



<link href="SiteDosyalari/CSS/picker_2.css" rel="stylesheet" type="text/css" />
<link href="SiteDosyalari/CSS/picker.css" rel="stylesheet" type="text/css" />
<link href="SiteDosyalari/CSS/core.css" rel="stylesheet" type="text/css" />


<script src="SiteDosyalari/JS/jQuery.js" type="text/javascript"></script>
<!-- Add jQuery library -->
<script type="text/javascript" src="dosya/js/jquery-1.10.1.min.js"></script>

<!-- Add mousewheel plugin (this is optional) -->
<script type="text/javascript"
	src="dosya/js/jquery.mousewheel-3.0.6.pack.js"></script>

<!-- Add fancyBox main JS and CSS files -->
<script type="text/javascript"
	src="dosya/source/jquery.fancybox.js?v=2.1.5"></script>
<link rel="stylesheet" type="text/css"
	href="dosya/source/jquery.fancybox.css?v=2.1.5" media="screen" />

<!-- Add Button helper (this is optional) -->
<link rel="stylesheet" type="text/css"
	href="dosya/source/helpers/jquery.fancybox-buttons.css?v=1.0.5" />
<script type="text/javascript"
	src="dosya/source/helpers/jquery.fancybox-buttons.js?v=1.0.5"></script>

<!-- Add Thumbnail helper (this is optional) -->
<link rel="stylesheet" type="text/css"
	href="dosya/source/helpers/jquery.fancybox-thumbs.css?v=1.0.7" />
<script type="text/javascript"
	src="dosya/source/helpers/jquery.fancybox-thumbs.js?v=1.0.7"></script>

<!-- Add Media helper (this is optional) -->
<script type="text/javascript"
	src="dosya/source/helpers/jquery.fancybox-media.js?v=1.0.6"></script>

	<script type="text/javascript">
	$(document).ready(function() {
		/*
		 *  Simple image gallery. Uses default settings
		 */

		$('.fancybox').fancybox();

		/*
		 *  Different effects
		 */

		// Change title type, overlay closing speed
		$(".fancybox-effects-a").fancybox({
			helpers: {
				title : {
					type : 'outside'
				},
				overlay : {
					speedOut : 0
				}
			}
		});

		// Disable opening and closing animations, change title type
		$(".fancybox-effects-b").fancybox({
			openEffect  : 'none',
			closeEffect	: 'none',

			helpers : {
				title : {
					type : 'over'
				}
			}
		});

		// Set custom style, close if clicked, change title type and overlay color
		$(".fancybox-effects-c").fancybox({
			wrapCSS    : 'fancybox-custom',
			closeClick : true,

			openEffect : 'none',

			helpers : {
				title : {
					type : 'inside'
				},
				overlay : {
					css : {
						'background' : 'rgba(238,238,238,0.85)'
					}
				}
			}
		});

		// Remove padding, set opening and closing animations, close if clicked and disable overlay
		$(".fancybox-effects-d").fancybox({
			padding: 0,

			openEffect : 'elastic',
			openSpeed  : 150,

			closeEffect : 'elastic',
			closeSpeed  : 150,

			closeClick : true,

			helpers : {
				overlay : null
			}
		});

		/*
		 *  Button helper. Disable animations, hide close button, change title type and content
		 */

		$('.fancybox-buttons').fancybox({
			openEffect  : 'none',
			closeEffect : 'none',

			prevEffect : 'none',
			nextEffect : 'none',

			closeBtn  : false,

			helpers : {
				title : {
					type : 'inside'
				},
				buttons	: {}
			},

			afterLoad : function() {
				this.title = 'Image ' + (this.index + 1) + ' of ' + this.group.length + (this.title ? ' - ' + this.title : '');
			}
		});


		/*
		 *  Thumbnail helper. Disable animations, hide close button, arrows and slide to next gallery item if clicked
		 */

		$('.fancybox-thumbs').fancybox({
			prevEffect : 'none',
			nextEffect : 'none',

			closeBtn  : false,
			arrows    : false,
			nextClick : true,

			helpers : {
				thumbs : {
					width  : 50,
					height : 50
				}
			}
		});

		/*
		 *  Media helper. Group items, disable animations, hide arrows, enable media and button helpers.
		*/
		$('.fancybox-media')
			.attr('rel', 'media-gallery')
			.fancybox({
				openEffect : 'none',
				closeEffect : 'none',
				prevEffect : 'none',
				nextEffect : 'none',

				arrows : false,
				helpers : {
					media : {},
					buttons : {}
				}
			});

		/*
		 *  Open manually
		 */

		$("#fancybox-manual-a").click(function() {
			$.fancybox.open('1_b.jpg');
		});

		$("#fancybox-manual-b").click(function() {
			$.fancybox.open({
				href : 'iframe.html',
				type : 'iframe',
				padding : 5
			});
		});

		$("#fancybox-manual-c").click(function() {
			$.fancybox.open([
				{
					href : '1_b.jpg',
					title : 'My title'
				}, {
					href : '2_b.jpg',
					title : '2nd title'
				}, {
					href : '3_b.jpg'
				}
			], {
				helpers : {
					thumbs : {
						width: 75,
						height: 50
					}
				}
			});
		});


	});
		
	</script>
	<style type="text/css">
		.fancybox-custom .fancybox-skin {
			box-shadow: 0 0 50px #222;
		}

		body {
			max-width: 700px;
			margin: 0 auto;
		}
	</style>



<script type="text/javascript">


$(document).ready(function(){
	
	$('input#gonderBtn').click(function(){
		
		//boolean sozlesme = (request.getParameter("sozlesme") == null);
		
		var sozlesme = 0;
		if($("#sozlesme").is(':checked'))
			sozlesme = 1;  // checked
		else
			sozlesme = 0;  // unchecked

		if (!validateKimlikNo($('input#tcno').val())) {
			alert("Lütfen TC Kimlik Bölümünü Gerektiği Gibi Giriniz");
			$('#tcno').focus();
			return false;
		} else if ($('#adi').val() == "") {
			alert("Lütfen Adınızı Giriniz");
			$('#adi').focus();
			return false;
		} else if ($('#soyadi').val() == "") {
			alert("Lütfen Soyadınızı  Giriniz");
			$('#soyadi').focus();
			return false;
		} else if ($('#MobilePhone').val() == "") {
			alert("Lütfen Cep Numaranızı  Giriniz");
			$('#MobilePhone').focus();
			return false;
		} else if ($('#EmailAddress').val() == "") {
			alert("Lütfen E-posta Adresinizi Giriniz");
			$('#EmailAddress').focus();
			return false;
		} else if ($('#sifre').val() == "") {
			alert("Lütfen bi şifre  Giriniz");
			$('#sifre').focus();
			return false;
		} else if ($('#sifre_t').val() != $('#sifre').val()) {
			alert("Şifreler Uyuşmuyor");
			$('#sifre_t').focus();
			return false;
		} else if (sozlesme == 0) {
			alert("Üyelik Sözleşmesini Kabul Etmelisiniz.");
			$('#sifre').focus();
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


		<h1 style="font-size: 25px; padding: 19px; color: rgb(0, 114, 190);">Üye Kayıt</h1>

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


		<form name="tcform" id="tcform" action="" method="post" class="ContactUsForm">
		
					<div class="FormItem">
						<div class="Label">TC Kimlik Numarası:</div>
						<div class="Value">
							<input name="tcno" id="tcno"  maxlength="11" type="text" class="textbox">
						</div>
					</div>
					
					
					<div class="FormItem">
						<div class="Label">Adı :</div>
						<div class="Value">
							<input id="adi" name="adi" maxlength="25" type="text" class="textbox">
						</div>
					</div>
					
					<div class="FormItem">
						<div class="Label">Soyadı :</div>
						<div class="Value">
							<input id="soyadi" name="soyadi" maxlength="20" type="text" class="textbox">
						</div>
					</div>
					
					
					
					
					
					<div class="FormItem">
						<div class="Label">Cep Telefonu :</div>
						<div class="Value">
							<input id="MobilePhone" name="MobilePhone" maxlength="10"
								type="text" class="textbox">
						</div>
					</div>
					<div class="FormItem">
						<div class="Label">E-posta adresi :</div>
						<div class="Value">
							<input id="EmailAddress" name="EmailAddress" type="text" class="textbox">
						</div>
					</div>
					<div class="FormItem">
						<div class="Label">Şifre :</div>
						<div class="Value">
							<input id="sifre" name="sifre" type="password" class="textbox">
						</div>
					</div>
					<div class="FormItem">
						<div class="Label">Şifre Onay :</div>
						<div class="Value">
							<input id="sifre_t" name="sifre_t" type="password" class="textbox">
						</div>
					</div>
					<div class="FormItem">
						<input name="sozlesme" id="sozlesme" type="checkbox" style="width: 15px; height: 15px">
						
					<%
	
							String uyelik = "";
						
								// bilgileri getir.
						
								try {
						
									ResultSet rsk = st
											.executeQuery("select *from admin where id = '1'");
									rsk.next();
									
									uyelik = rsk.getString("uyelik");
						
								} catch (SQLException e) {
									out.print(e);
								}
						
						
						%>
						
						
						<div class="Value">
						
							<a class="fancybox" href="#inline1" title="Üyelik Sözleşmesini onaylıyorum">Üyelik Sözleşmesini onaylıyorum</a>
						</div>
					</div>
					
					<div class="FormItem">
						<input type="submit" value="Gönder" name="gonderBtn" id="gonderBtn" class="FormButton">
					</div>
					<div id="inline1" style="width:400px;display: none;">
							<h3>Üyelik Sözleşmesi</h3>
							<p>
							<%=uyelik %>
							</p>
					</div>
				</form>







											</div>


										</div>
									</div>
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