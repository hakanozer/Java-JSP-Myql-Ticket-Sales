<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" 
import="java.*" errorPage="" %>

<aside>
    <div id="sidebar" class="nav-collapse">
        <!-- sidebar menu start-->
        <div class="leftside-navigation">
            <ul class="sidebar-menu" id="nav-accordion">
                <li>
                    <a class="active" href="index.jsp">
                        <i class="fa fa-dashboard"></i>
                        <span>Anasayfa</span>
                    </a>
                </li>
                <li class="sub-menu">
                    <a href="javascript:;">
                        <i class="fa fa-laptop"></i>
                        <span>Kontroller</span>
                        
                    </a>
                    
                    <ul class="sub">
                        <li><a href="isletme_kontrolu.jsp">İşletme Kontorlü</a></li>
                        <li><a href="hakkimizda.jsp">Hakkımızda</a></li>
                        <li><a href="siteharitasi.jsp">Site Haritası</a></li>
                         <li><a href="hukum.jsp">Hüküm Ve Koşullar</a></li>
                         <li><a href="gizlilik.jsp">Gizlilik Politikası</a></li>
                       <li><a href="uyelik.jsp">Üyelik Anlaşması</a></li>
                    </ul>
                </li>
                <li>
                    <a class="sub-menu" href="mesaj.jsp">
                        <i class="fa fa-envelope"></i>
                        <span>Mesajlarım</span>
                    </a>
                </li>
            
                   
                
            </ul>            </div>
        <!-- sidebar menu end-->
    </div>
</aside>