<%@ page contentType="text/html; charset=UTF-8" language="java"
	import="java.sql.*" import="java.*" errorPage=""%>

<aside>
	<div id="sidebar" class="nav-collapse">
		<!-- sidebar menu start-->
		<div class="leftside-navigation">
			<ul class="sidebar-menu" id="nav-accordion">
				<li><a class="active" href="index.jsp"> <i
						class="fa fa-dashboard"></i> <span>Anasayfa</span>
				</a></li>
				<li class="sub-menu"><a href="javascript:;"> <i
						class="fa fa-laptop"></i> <span>Kontroller</span>
				</a>
					<ul class="sub">
						<li><a href="isletme_duzenle.jsp">İşletme Kontrolü</a></li>
						<li><a href="terminal_kontrol.jsp">Terminal Kontrolü</a></li>
						<li><a href="personel_kontrol.jsp">Personel Kontrolü</a></li>
						<li><a href=sefer_kontrol.jsp>Sefer Kontrolü</a></li>
						<li><a href="servis.jsp">Servisler</a></li>

					</ul></li>
				<li class="sub-menu"><a href="javascript:;"> <i
						class="fa fa-book"></i> <span>İçerik Yönetimi</span>
				</a>
					<ul class="sub">
						<li><a href="hakkimizda_kontrol.jsp">Hakkımızda</a></li>
						<li><a href="duyurular_kontrol.jsp">Duyurular</a></li>
						<li><a href="iletisim_kontrol.jsp">İletişim</a></li>
					</ul></li>
				<li class="sub-menu"><a href="javascript:;"> <i
						class="fa fa-bullhorn"></i> <span>Raporlar </span>
				</a>
					<ul class="sub">
						<li><a href="">Rapor</a></li>
					</ul></li>

			</ul>
		</div>
		<!-- sidebar menu end-->
	</div>
</aside>