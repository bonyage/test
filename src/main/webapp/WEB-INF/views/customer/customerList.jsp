<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<ul class="breadcrumb">
	<li>
		<i class="icon-home"></i>
		<a href="<c:url value='/'/>"><spring:message code="common.home"/></a>
		<i class="icon-angle-right"></i>
	</li>
	<li><a href="#"><spring:message code="customer.breadcrumb"/></a></li>
</ul>

<div class="row-fluid sortable">
	<div class="box span12">
		<div class="box-header" data-original-title>
			<h2>
				<i class="halflings-icon user"></i><span class="break"></span><spring:message code="customer.list.heading"/>
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
						<th><spring:message code="customer.list.header.customerName"/></th>
						<th><spring:message code="customer.list.header.email"/></th>
						<th><spring:message code="customer.list.header.phone"/></th>
						<th><spring:message code="customer.list.header.address"/></th>
						<th><spring:message code="customer.list.header.action"/></th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="customer" items="${allCustomers}">
					<tr>
						<td><c:out value="${customer.customerName}"/></td>
						<td><c:out value="${customer.email}"/></td>
						<td><c:out value="${customer.phone}"/></td>
						<td><c:out value="${customer.region},${customer.addrlines},${customer.postcode}"/></td>
						<td><a href="<c:url value='/customer/${customer.customerId}'/>"><spring:message code="customer.edit"/></a></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
            <a href="new" class="btn btn-success"><spring:message code="customer.list.action.addNewCustomer"/></a>
        </div>
    </div>
</div>
