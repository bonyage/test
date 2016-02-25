<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url var="home" value="/"/>
<div class="nav-collapse sidebar-nav">
    <ul class="nav nav-tabs nav-stacked main-menu">
        <li><a href="${home}dash"><i class="icon-bar-chart"></i><span class="hidden-tablet"> Dashboard</span></a></li>
        <li>
            <a class="dropmenu" href="#"><i class="icon-wrench"></i><span class="hidden-tablet">Administration</span></a>
            <ul>
                <li><a class="submenu" href="${home}administration/users">><i class="icon-user"></i><span class="hidden-tablet">Users</span></a></li>
            </ul>
        </li>
        <li><a href="${home}product/list"><i class="icon-barcode"></i><span class="hidden-tablet">Product </span></a>
        </li>
        <li><a href="${home}pricing/list"><i class="icon-tasks"></i><span class="hidden-tablet"> Pricing </span></a>
        </li>
        <li><a href="${home}inventory/list"><i class="icon-qrcode"></i><span class="hidden-tablet"> Inventory </span></a></li>
        <li>
            <a class="dropmenu" href="#"><i class="icon-list-alt"></i><span class="hidden-tablet">Order</span></a>
            <ul>
                <li><a class="submenu" href="${home}orders/new">><i class="icon-list-alt"></i><span class="hidden-tablet"> Create</span></a></li>
                <li><a class="submenu" href="${home}orders?orderStatus=">><i class="icon-list-alt"></i><span class="hidden-tablet"> Orders</span></a></li>
            </ul>
        </li>
        <li><a href="${home}customer/list"><i class="icon-user"></i><span class="hidden-tablet"> Customer</span></a></li>
    </ul>
</div>