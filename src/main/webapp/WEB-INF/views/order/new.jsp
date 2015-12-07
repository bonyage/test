<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="joda" uri="http://www.joda.org/joda/time/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>
    function addItem() {
        var row = $("<tr><td>1</td><td>E</td><td>E</td><td>E</td><td>E</td><td>E</td></tr>");
        $("#invoice-items-list > tbody").append(row);
    };
</script>
<script type='text/javascript'>//<![CDATA[
function addItem() {
    var row = $("<tr><td>1</td><td>E</td><td>E</td><td>E</td><td>E</td><td><i class=\"halflings-icon icon-trash\"></i></td></tr>");
    $("#invoice-items-list > tbody").append(row);
};
</script>
<ul class="breadcrumb">
    <li><i class="icon-home"></i> <a href="index.html">Home</a> <i class="icon-angle-right"></i></li>
    <li><a href="#"><spring:message code="sale.breadcrumb"/> </a></li>
</ul>
<form:form class="form-horizontal" method="post" modelAttribute="order" commandName="order"
           action="${pageContext.request.contextPath}/orders/new">

    <div class="row-fluid sortable">
        <div class="span12">
            <div class="box-header">
                <h2>
                    <i class="halflings-icon shopping-cart"></i><span class="break"></span>
                </h2>

                <div class="box-icon">
                    <a href="#" class="btn-minimize"><i class="halflings-icon chevron-up"></i></a>
                </div>
            </div>

            <div class="box-content">

                <div class="table-responsive">
                    <table class="table table-striped table-bordered">
                        <tbody>
                        <tr>
                            <td class="span6" style="text-align: center;">
                                <spring:message code="sale.breadcrumb"/><br><br>
                                <i class="icon icon-shopping-cart" style="font-size: 80px;"></i>
                            </td>
                            <td class="span6">
                                <label for="customerId"><spring:message code="sale.customer.head"/></label>

                                <div class="input-group">
                                    <form:select class="form-group" path="customerId" items="${customers}"/>
                                </div>

                                <label><spring:message code="sale.invoice.date.head"/></label>

                                <div class="input-group input-prepend">
                                    <span class="add-on"><i class="icon-calendar"></i></span>
                                    <input type="text" id="date" class="form-control" value="${date}" disabled />
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>

                <div class="row-fluid sortable">
                    <div class=" sortable span4">
                        <div class="box span12">
                            <div class="box-header" data-original-title>
                                <h2>
                                    <i class="halflings-icon barcode"></i><span class="break"></span><spring:message
                                        code="sale.order.search.product"/>
                                </h2>

                                <div class="box-icon">
                                    <a href="#" class="btn-minimize"><i class="halflings-icon chevron-up"></i></a>
                                </div>
                            </div>
                            <div class="box-content">

                                <div class="form-group">
                                    <label for="product">Products</label>
                                    <select id="product" class="form-control" name="product">
                                        <c:forEach items="${productPriceList}" var="productPrice">
                                            <option value="${productPrice.getProduct().getId()}">${productPrice.getProduct().getName()}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="item-quantity">Quantity</label>
                                    <input type="number" value="1" id="item-quantity" name="itemQuantity"/>
                                </div>
                                <div class="form-group">
                                    <button type="submit" id="add-item" class="btn btn-info" name="action" value="add-item">
                                        <spring:message code="order.new.add.item"/>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class=" sortable span8">
                        <div class="box span12">
                            <div class="box-header" data-original-title>
                                <h2>
                                    <i class="halflings-icon barcode"></i><span class="break"></span><spring:message
                                        code="sale.order.entries"/>
                                </h2>

                                <div class="box-icon">
                                    <a href="#" class="btn-minimize"><i class="halflings-icon chevron-up"></i></a>
                                </div>
                            </div>
                            <div class="box-content">
                                <div class="box-content">
                                    <table id="invoice-items-list" class="table table-hover">
                                        <thead>
                                        <tr>
                                            <th><spring:message code="order.product.productCode"/></th>
                                            <th><spring:message code="order.product.name"/></th>
                                            <th><spring:message code="order.product.quantity"/></th>
                                            <th><spring:message code="order.product.pricePerUnit"/></th>
                                            <th><spring:message code="order.product.subtotal"/></th>
                                            <th></th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${order.items}" var="item">
                                            <tr>
                                                <td><c:out value="${item.productCode}"/></td>
                                                <td><c:out value="${item.productName}"/></td>
                                                <td><c:out value="${item.quantity}"/></td>
                                                <td><fmt:formatNumber pattern="#,##0" value="${item.price / 100}" /></td>
                                                <td><fmt:formatNumber pattern="#,##0" value="${item.price / 100 * item.quantity}" /></td>
                                                <td>
                                                    <button type="submit" id="delete-item" name="action" value="delete-item-${item.productCode}">
                                                        <i class="halflings-icon icon-trash">
                                                        </i>
                                                    </button>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>

                                    <div style="float:right">
                                        <table class="table-bordered">

                                            <div class="control-group input-prepend">
                                                <label class="control-label" for="subTotal"><spring:message code="order.new.subtotal"/></label>
                                                <div class="controls">
                                                    <span class="add-on"><spring:message code="order.product.currency"/></span>
                                                    <input type="text" id="subTotal" class="form-control" value="<fmt:formatNumber pattern="#,##0" value="${order.subTotal / 100}" />" readonly/>
                                                </div>
                                            </div>

                                            <div class="control-group">
                                                <label class="control-label" for="discount"><spring:message code="order.new.discount"/></label>

                                                <div class="controls">
                                                    <input type="text" id="discount" class="form-control" value="0" readonly /> %
                                                </div>
                                            </div>

                                            <div class="control-group">
                                                <label class="control-label" for="tax"><spring:message code="order.new.tax"/></label>
                                                <div class="controls">
                                                    <input type="text" id="tax" class="form-control" value="10.00" readonly/> %
                                                </div>
                                            </div>

                                            <div class="control-group input-prepend">
                                                <label class="control-label" for="total"><spring:message code="order.new.total"/></label>
                                                <div class="controls">
                                                    <span class="add-on"><spring:message code="order.product.currency"/></span>
                                                    <input type="text" id="total" class="form-control" value="<fmt:formatNumber pattern="#,##0" value="${order.total / 100}" />" readonly/>
                                                </div>
                                            </div>

                                            <div class="control-group">
                                                <div class="controls">
                                                    <button type="submit" id="submit" class="btn btn-primary" name="action" value="submit-new-order">
                                                        <spring:message code="order.new.submit"/>
                                                    </button>
                                                </div>
                                            </div>
                                            <div class="control-group">
                                                <div class="controls">
                                                    <a class="btn btn-default" href="${pageContext.request.contextPath}/orders/new" role="button">
                                                        <spring:message code="order.new.cancel"/>
                                                    </a>
                                                </div>
                                            </div>

                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

</form:form>

