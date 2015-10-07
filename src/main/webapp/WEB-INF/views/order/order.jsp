<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="joda" uri="http://www.joda.org/joda/time/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script>

    function showOrHideSaveStatusButton(currentStatus) {
        var e = document.getElementById("status");
        var newStatus = e.options[e.selectedIndex].value;
        if (currentStatus == newStatus) {
            $('#orderStatusSaveButton').addClass('hidden');
        } else {
            $('#orderStatusSaveButton').removeClass('hidden');
        }

    }
</script>

<ul class="breadcrumb">
    <li><i class="icon-home"></i> <a href="index.html">Home</a> <i class="icon-angle-right"></i></li>
    <li><a href="#"><spring:message code="order.order.head"/> </a></li>
</ul>
<form:form class="form-horizontal" method="post" modelAttribute="order" commandName="order" action="${pageContext.request.contextPath}/orders/new">
    <div class="row-fluid sortable">
        <div class="span12">
            <div class="box-header" data-original-title>
                <h2>
                    <i class="halflings-icon shopping-cart"></i><span class="break"></span><spring:message code="order.order.head"/><c:out value=" #${order.id}"/>
                </h2>
                <input type="hidden" name="id" value="${order.id}"/>
                <div class="box-icon">
                    <a href="#" class="btn-minimize"><i class="halflings-icon chevron-up"></i></a>
                </div>
            </div>
            <div class="box-content">
                <div class="table-responsive">
                    <table class="table table-striped table-bordered">
                        <thead>
                        <tr>
                            <th><spring:message code="order.customer.name.head"/></th>
                            <th><spring:message code="order.customer.email.head"/></th>
                            <th><spring:message code="order.orderDate.head"/></th>
                            <th><spring:message code="order.status.head"/></th>
                            <th><spring:message code="order.total.head"/></th>
                        </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><c:out value="${order.customer.name}"/></td>
                                <td><c:out value="${order.customer.email}"/></td>
                                <td><joda:format value="${order.orderDate}" style="M-"/></td>
                                <td>
                                    <div class="form-group">
                                        <select id="status" class="form-control" name="status" onchange="showOrHideSaveStatusButton('${order.status.name()}')">
                                            <c:forEach items="${order.validStatuses}" var="orderStatus">
                                                <option value="${orderStatus.name()}" ${order.status.name() == orderStatus.name() ? 'selected="selected"' : ''}>${orderStatus.name()}</option>
                                            </c:forEach>
                                        </select>
                                        <button type="submit" id="orderStatusSaveButton" class="hidden btn btn-primary">Save</button>
                                    </div>
                                </td>
                                <td><spring:message code="order.product.currency"/><c:out value="${order.total}"/></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="row-fluid sortable">
                    <div class="box span12">
                        <div class="box-header" data-original-title>
                            <h2>
                                <i class="halflings-icon barcode"></i><span class="break"></span><spring:message code="order.order.products"/><c:out value=" (${fn:length(order.orderLines)})"/>
                            </h2>

                            <div class="box-icon">
                                <a href="#" class="btn-minimize"><i class="halflings-icon chevron-up"></i></a>
                            </div>
                        </div>
                        <div class="box-content">
                            <div class="box-content">
                                <table class="table table-hover">
                                    <thead>
                                    <tr>
                                        <th><spring:message code="order.product.productCode"/></th>
                                        <th><spring:message code="order.product.name"/></th>
                                        <th><spring:message code="order.product.sku"/></th>
                                        <th><spring:message code="order.product.quantity"/></th>
                                        <th><spring:message code="order.product.pricePerUnit"/></th>
                                        <th><spring:message code="order.product.subtotal"/></th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="orderline" items="${order.orderLines}">
                                        <tr>
                                            <td><c:out value="${orderline.productPricing.product.productCode}"/></td>
                                            <td><c:out value="${orderline.productPricing.product.name}"/></td>
                                            <td><c:out value="${orderline.productPricing.product.sku}"/></td>
                                            <td><c:out value="${orderline.quantity}"/></td>
                                            <td><spring:message code="order.product.currency"/><c:out value="${orderline.productPricing.baseUnitPrice / 100}"/></td>
                                            <td><spring:message code="order.product.currency"/><c:out value="${orderline.subtotal}"/></td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row-fluid sortable">

                    <div class="box span12">
                        <div class="box-header" data-original-title>
                            <h2>
                                <i class="halflings-icon list"></i><span class="break"></span><spring:message code="order.order.details"/>
                            </h2>

                            <div class="box-icon">
                                <a href="#" class="btn-minimize"><i class="halflings-icon chevron-up"></i></a>
                            </div>
                        </div>
                        <div class="box-content">
                            <div class="table-responsive">
                                <table class="table table-striped table-hover">
                                    <thead>
                                    <tr>
                                        <th></th>
                                        <th></th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td><spring:message code="order.order.orderDate"/></td>
                                        <td><joda:format value="${order.orderDate}" style="M-" /></td>
                                    </tr>
                                    <tr>
                                        <td><spring:message code="order.order.confirmedDate"/></td>
                                        <td><joda:format value="${order.confirmedDate}" style="M-" /></td>
                                    </tr>
                                    <tr>
                                        <td><spring:message code="order.order.packagedDate"/></td>
                                        <td><joda:format value="${order.packagedDate}" style="M-" /></td>
                                    </tr>
                                    <tr>
                                        <td><spring:message code="order.order.dispatchDate"/></td>
                                        <td><joda:format value="${order.dispatchDate}" style="M-" /></td>
                                    </tr>
                                    <tr>
                                        <td><spring:message code="order.order.deliveryNotes"/></td>
                                        <td><c:out value="${order.deliveryNotes}"/></td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row-fluid sortable">
                    <div class="box span12">
                        <div class="box-header" data-original-title>
                            <h2>
                                <i class="halflings-icon home"></i><span class="break"></span><spring:message code="order.order.address.billing"/>
                            </h2>

                            <div class="box-icon">
                                <a href="#" class="btn-minimize"><i class="halflings-icon chevron-up"></i></a>
                            </div>
                        </div>
                        <div class="box-content">
                            <div class="table-responsive">
                                <table class="table table-striped table-hover">
                                    <thead>
                                    <tr>
                                        <th></th>
                                        <th></th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td><spring:message code="order.order.address"/></td>
                                        <td>
                                            <address>
                                                <strong><c:out value="${order.customer.name}"/></strong><br>
                                                <c:out value="${order.customer.address.addrLines}"/><br>
                                                <c:out value="${order.customer.address.region}"/> <c:out value="${order.customer.address.postcode}"/><br>
                                                <abbr title="Phone">P:</abbr> <c:out value="${order.customer.phone}"/>
                                            </address>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row-fluid sortable">

                    <div class="box span12">
                        <div class="box-header" data-original-title>
                            <h2>
                                <i class="halflings-icon plane"></i><span class="break"></span><spring:message code="order.order.address.shipping"/>
                            </h2>

                            <div class="box-icon">
                                <a href="#" class="btn-minimize"><i class="halflings-icon chevron-up"></i></a>
                            </div>
                        </div>
                        <div class="box-content">
                            <div class="table-responsive">
                                <table class="table table-striped table-hover">
                                    <thead>
                                    <tr>
                                        <th></th>
                                        <th></th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td><spring:message code="order.order.address"/></td>
                                        <td>
                                            <address>
                                                <strong><c:out value="${order.customer.name}"/></strong><br>
                                                <c:out value="${order.customer.address.addrLines}"/><br>
                                                <c:out value="${order.customer.address.region}"/> <c:out value="${order.customer.address.postcode}"/><br>
                                                <abbr title="Phone">P:</abbr> <c:out value="${order.customer.phone}"/>
                                            </address>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="box-content">
        <a class="btn btn-danger" href="${pageContext.request.contextPath}/orders/${order.id}">Update</a> <a class="btn btn-danger" href="${pageContext.request.contextPath}/orders/${order.id}">Update and Finished</a>
    </div>
</form:form>

