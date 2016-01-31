<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<ul class="breadcrumb">

	<li><i class="icon-home"></i> <a href="index.html">Home</a> <i
		class="icon-angle-right"></i></li>
	<li><a href="#">Dashboard</a></li>
</ul>

<div class="row-fluid sortable">
	<div class=" sortable span4">
		<div class="box span12">
			<div class="box-header" data-original-title>
				<h2>
					<i class="icon-list-alt"></i><span class="break"></span>
					<spring:message code="index.order.list.heading" />
				</h2>

				<div class="box-icon">
					<a href="#" class="btn-minimize"><i
						class="halflings-icon chevron-up"></i></a>
				</div>
			</div>
			<div class="box-content">
				<table
					class="table table-striped table-bordered">
				<thead>
				<tr>
					<th><spring:message code="index.order.list.header.number"/></th>
				</tr>
				</thead>
				<tbody>
					<tr>
						<td><a href="orders?orderStatus=NEW"><span>${newOrderNum}
								 </span></a></td>
					</tr>
				</tbody>
			</table>
			</div>
		</div>
	</div>
	<div class=" sortable span8">
		<div class="box span12">
			<div class="box-header" data-original-title>
				<h2>
					<i class="icon-qrcode"></i><span class="break"></span>
					<spring:message code="index.product.list.heading" />
				</h2>

				<div class="box-icon">
					<a href="#" class="btn-minimize"><i
						class="halflings-icon chevron-up"></i></a>
				</div>
			</div>
			<div class="box-content">

				<table
					class="table table-striped table-bordered bootstrap-datatable datatable">
					<thead>
						<tr>
							<th><spring:message code="inventory.list.header.productName" /></th>
							<th><spring:message code="inventory.list.header.stockLevel" /></th>
							<th><spring:message code="inventory.list.header.unit" /></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="product" items="${inventory}">
							<tr>
								<td><a href="inventory/${product.productId}"><c:out
											value="${product.productName}" /></a></td>
								<td><c:out
										value="${product.inventory.intakeBaseUnitStockLevel}" /></td>
								<td><c:out value="${product.inventory.baseUnitName}" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

