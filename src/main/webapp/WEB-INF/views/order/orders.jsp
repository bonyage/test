<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="joda" uri="http://www.joda.org/joda/time/tags" %>

<ul class="breadcrumb">
	<li><i class="icon-home"></i> <a href="index.html">Home</a> <i class="icon-angle-right"></i></li>
	<li><a href="#"><spring:message code="orders.breadcrumb"/></a></li>
</ul>

<div class="row-fluid sortable">
	<div class="box span12">
		<div class="box-header" data-original-title>
			<h2>
				<i class="halflings-icon user"></i><span class="break"></span>Orders
			</h2>

			<div class="box-icon">
				<a href="#" class="btn-minimize"><i class="halflings-icon chevron-up"></i></a>
			</div>
		</div>
		<div class="box-content">
			<table class="table table-striped table-bordered bootstrap-datatable datatable">
				<thead>
				<tr>
					<th><spring:message code="order.status.head"/></th>
					<th><spring:message code="order.order.head"/></th>
					<th><spring:message code="order.purchased.head"/></th>
					<th><spring:message code="order.shipTo.head"/></th>
					<th><spring:message code="order.createdDate.head"/></th>
					<th><spring:message code="order.actions.head"/></th>
				</tr>
				</thead>
				<tbody>
				<c:forEach var="order" items="${orders}">
					<tr>
						<td><a class="btn btn-sm btn-success" href="#" role="button"><c:out value="${order.status.name() }"/></a></td>
						<td>
							<a href="<c:url value='orders/${order.id}'/>"><c:out value="#${order.id}"/></a>
							<c:out value=" made by ${order.customer.name} "/><br/>
							<c:out value="${order.customer.email } "/><br/>
							<c:out value="${order.customer.phone } "/>
						</td>
						<td><c:out value="${fn:length(order.orderLines)} item(s)"/></td>
						<td><c:out value="${order.customer.name}, ${order.customer.address.addrLines}, ${order.customer.address.region} ${order.customer.address.postcode}"/></td>
						<td><joda:format value="${order.orderDate}" style="M-" /></td>
						<td><a href="<c:url value='orders/${order.id}'/>" class="btn btn-primary btn-sm">Modify</a></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
