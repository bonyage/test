<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<ul class="breadcrumb">
	<li>
		<i class="icon-home"></i>
		<a href="<c:url value='/'/>"><spring:message code="common.home"/></a>
		<i class="icon-angle-right"></i>
	</li>
	<li><a href="#"><spring:message code="inventory.breadcrumb"/></a></li>
</ul>

<div class="row-fluid sortable">
	<div class="box span12">
		<div class="box-header" data-original-title>
			<h2>
				<i class="halflings-icon user"></i><span class="break"></span><spring:message code="inventory.list.heading"/>
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
					<th><spring:message code="inventory.list.header.productName"/></th>
					<th><spring:message code="inventory.list.header.stockLevel"/></th>
					<th><spring:message code="inventory.list.header.unit"/></th>
					<th><spring:message code="inventory.list.header.status"/></th>
					<th><spring:message code="inventory.list.header.action"/></th>
				</tr>
				</thead>
				<tbody>
				<c:forEach var="product" items="${inventory}">
					<tr>
						<td><c:out value="${product.productName}"/></td>
						<td><c:out value="${product.inventory.intakeBaseUnitStockLevel}"/></td>
						<td><c:out value="${product.inventory.baseUnitName}"/></td>
						<td>
							<c:choose>
								<c:when test="${product.activeProduct}"><spring:message code="product.active"/></c:when>
								<c:otherwise><spring:message code="product.archived"/></c:otherwise>
							</c:choose>
						</td>
						<td>
							<c:choose>
								<c:when test="${not empty product.inventory}">
									<a href="<c:url value='/inventory/${product.productId}'/>"><spring:message code="inventory.update"/></a>
								</c:when>
								<c:otherwise>
									<a href="<c:url value='/inventory/${product.productId}'/>"><spring:message code="inventory.add"/></a>
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
