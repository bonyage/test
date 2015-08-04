<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var="home" value="/"/>
	<div class="nav-collapse sidebar-nav">
					<ul class="nav nav-tabs nav-stacked main-menu">
						<li><a href="${home}dash"><i class="icon-bar-chart"></i><span class="hidden-tablet"> Dashboard</span></a></li>	
						<li><a href="${home}product/list"><i class="icon-barcode"></i><span class="hidden-tablet">Product </span></a></li>
						<li><a href="${home}pricing/list"><i class="icon-tasks"></i><span class="hidden-tablet"> Pricing </span></a></li>
						<li><a href="${home}inventory/list"><i class="icon-qrcode"></i><span class="hidden-tablet"> Inventory </span></a></li>
						<li><a href="${home}order/list"><i class="icon-list-alt"></i><span class="hidden-tablet"> Order</span></a></li>
						<li><a href="${home}agent/list"><i class="icon-user"></i><span class="hidden-tablet"> Agent</span></a></li>
						<li>
							<a class="dropmenu" href="#"><i class="icon-folder-close-alt"></i><span class="hidden-tablet"> Dropdown</span><span class="label label-important"> 3 </span></a>
							<ul>
								<li><a class="submenu" href="submenu.html"><i class="icon-file-alt"></i><span class="hidden-tablet"> Sub Menu 1</span></a></li>
								<li><a class="submenu" href="submenu2.html"><i class="icon-file-alt"></i><span class="hidden-tablet"> Sub Menu 2</span></a></li>
								<li><a class="submenu" href="submenu3.html"><i class="icon-file-alt"></i><span class="hidden-tablet"> Sub Menu 3</span></a></li>
							</ul>	
						</li>
					</ul>
				</div>