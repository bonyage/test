<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="joda" uri="http://www.joda.org/joda/time/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="com.toptier.core.model.CustomerOrder.Status" %>

<ul class="breadcrumb">
	<li><i class="icon-home"></i> <a href="index.html">Home</a> <i class="icon-angle-right"></i></li>
	<li><a href="#"><spring:message code="orders.breadcrumb"/></a></li>
</ul>

<div class="row-fluid sortable">
	<div class="box span12">
		<div class="box-header" data-original-title>
			<h2>
				<i class="halflings-icon user"></i><span class="break"></span><spring:message code="orders.breadcrumb"/>
			</h2>

			<div class="box-icon">
				<a href="#" class="btn-minimize"><i class="halflings-icon chevron-up"></i></a>
			</div>
		</div>
		<div class="box-content">
			<form class="form-horizontal" method="get" action="#" name="ordersTables" >
			<div class="span12">
				<div id="orderStatus_0" class="dataTables_length">
					<label>
						<select size="1" name="orderStatus" aria-controls="DataTables_search_0_Status">
							<option value="ALL"><spring:message code="orders.statues.showAll"/></option>
							<option value="NEW"><spring:message code="orders.statues.new"/></option>
							<option value="CONFIRMED"><spring:message code="orders.statues.confirmed"/></option>
							<option value="PACKAGED"><spring:message code="orders.statues.packaged"/></option>
							<option value="DISPATCHED"><spring:message code="orders.statues.dispatched"/></option>
						</select>
						<button type="submit" class="btn btn-default">Filter</button>
					</label>
				</div>
			</div>
			</form>
			<table class="table table-striped table-bordered bootstrap-datatable">
				<thead>
				<tr>
					<th></th>
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
						<td>
							<c:choose>
								<c:when test="${order.status.name() == 'CANCELED' }">
									<i class="glyphicons-icon ban"></i>
								</c:when>
								<c:when test="${order.status.name() == 'NEW'}">
									<i class="glyphicons-icon circle_question_mark"></i>
								</c:when>
								<c:when test="${order.status.name() == 'CONFIRMED'}">
									<i class="glyphicons-icon ok"></i>
								</c:when>
								<c:when test="${order.status.name() == 'PACKAGED'}">
									<i class="glyphicons-icon cargo"></i>
								</c:when>
								<c:when test="${order.status.name() == 'DISPATCHED'}">
									<i class="glyphicons-icon airplane"></i>
								</c:when>
							</c:choose>
						</td>
						<td><c:out value="${order.status.name() }"/></td>
						<td>
							<a class="text-info" href="<c:url value='orders/${order.id}'/>"><c:out value="Order #${order.id}"/></a>
							<c:out value=" by ${order.customer.name} "/><br/>
							<c:out value="Email: ${order.customer.email } "/><br/>
							<c:out value="Tel: ${order.customer.phone } "/>
						</td>
						<td><c:out value="${fn:length(order.orderLines)} item(s)"/></td>
						<td><c:out value="${order.customer.name}, ${order.customer.address.addrLines}, ${order.customer.address.region} ${order.customer.address.postcode}"/></td>
						<td><joda:format value="${order.orderDate}" style="M-" /></td>
						<td >
							<c:if test="${order.status.name() != 'CANCELED' }">
							  <a href="<c:url value='orders/modify/${order.id}'/>" class="btn btn-primary btn-sm">Modify</a>
							  <a href="<c:url value='orders/cancel/${order.id}'/>" class="btn btn-warning btn-sm">Cancel</a>
							</c:if>
						</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
