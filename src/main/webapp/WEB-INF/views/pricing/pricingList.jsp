<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<ul class="breadcrumb">
	<li>
		<i class="icon-home"></i>
		<a href="<c:url value='/'/>"><spring:message code="common.home"/></a>
		<i class="icon-angle-right"></i>
	</li>
	<li><a href="#"><spring:message code="pricing.breadcrumb"/></a></li>
</ul>

<div class="row-fluid sortable">
	<div class="box span12">
		<div class="box-header" data-original-title>
			<h2>
				<i class="halflings-icon user"></i><span class="break"></span><spring:message code="pricing.list.heading"/>
			</h2>
			<div class="box-icon">
				<a href="#" class="btn-minimize"><i
						class="halflings-icon chevron-up"></i></a>
			</div>
		</div>
		<div class="box-content">
			<table class="table table-striped table-bordered bootstrap-datatable datatable">
				<thead>
				<tr>
					<th><spring:message code="pricing.list.header.productName"/></th>
					<th><spring:message code="pricing.list.header.status"/></th>
					<th><spring:message code="pricing.list.header.action"/></th>
				</tr>
				</thead>
				<tbody>
				<c:forEach var="product" items="${allProducts}">
					<tr>
						<td><c:out value="${product.name}"/></td>
						<td>
							<c:choose>
								<c:when test="${product.active}"><spring:message code="pricing.active"/></c:when>
								<c:otherwise><spring:message code="pricing.archived"/></c:otherwise>
							</c:choose>
						</td>
						<td><a href="<c:url value='/pricing/${product.id}'/>"><spring:message code="pricing.viewPricing"/></a></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
