<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<div class="row-fluid">
    <div class="page-header">
        <%--<h1><spring:message code="pricing.form.heading"/> - ${productName}</h1>--%>
        <h1>Stock Level - ${productName}</h1>
    </div>
    <div class="box-content">
        <form:form id="stockLevelForm" class="form-horizontal" modelAttribute="stockLevel" action="${action}" method="POST">
            <form:hidden id="productId" path="productId"/>
            <fieldset>
                <%--<div class="control-group">--%>
                    <%--<div class="control-label span1">--%>
                        <%--<form:label path="baseUnitPrice" for="baseUnitPrice"><spring:message code="pricing.form.baseUnitPrice"/></form:label>--%>
                    <%--</div>--%>
                    <%--<div class="controls">--%>
                        <%--<form:input id="baseUnitPrice" path="baseUnitPrice" type="text" class="span9"/>--%>
                    <%--</div>--%>
                <%--</div>--%>
                <div class="control-group">
                    <div class="control-label span1">
                        <form:label path="quantity" for="quantity">Quantity</form:label>
                    </div>
                    <div class="controls">
                        <form:input id="quantity" path="quantity" type="text" class="span9"/>
                    </div>
                </div>
                <div class="control-group">
                    <div class="control-label span1">
                        <form:label path="unit" for="unit">Unit</form:label>
                    </div>
                    <div class="controls">
                        <form:input id="unit" path="unit" type="text" class="span9"/>
                    </div>
                </div>
                <%--<div class="control-group">--%>
                    <%--<div class="control-label span1">--%>
                        <%--<form:label path="marketingTag" for="marketingTag"><spring:message code="pricing.form.marketingTag"/></form:label>--%>
                    <%--</div>--%>
                    <%--<div class="controls">--%>
                        <%--<form:select id="marketingTag" path="marketingTag" items="${marketingTags}" class="span2"/>--%>
                    <%--</div>--%>
                <%--</div>--%>

                <div class="form-actions">
                    <%--<input type="submit" class="btn btn-success btn-large" value="<spring:message code="pricing.save"/>" />--%>
                    <%--<a class="btn" href="<c:url value="/pricing/list"/>"><spring:message code="pricing.cancel"/></a>--%>
                    <input type="submit" class="btn btn-success btn-large" value="Save" />
                    <a class="btn" href="<c:url value="/inventory/list"/>">Cancel</a>
                </div>
            </fieldset>
        </form:form>
    </div>

    <%--<div class="box-content">--%>
        <%--<table class="table table-striped table-bordered">--%>
            <%--<thead>--%>
            <%--<tr>--%>
                <%--<th><spring:message code="pricing.history.effectiveForm"/></th>--%>
                <%--<th><spring:message code="pricing.history.baseUnitPrice"/></th>--%>
                <%--<th><spring:message code="pricing.history.marketingTag"/></th>--%>
                <%--<th><spring:message code="pricing.history.status"/></th>--%>
            <%--</tr>--%>
            <%--</thead>--%>
            <%--<tbody>--%>
            <%--<c:forEach var="price" items="${allPrices}">--%>
                <%--<tr>--%>
                    <%--<td><c:out value="${price.effectiveFrom}"/></td>--%>
                    <%--<td><c:out value="${price.baseUnitPrice}"/></td>--%>
                    <%--<td><c:out value="${price.marketingTag.description}"/></td>--%>
                    <%--<td>--%>
                        <%--<c:choose>--%>
                            <%--<c:when test="${price.active}"><spring:message code="pricing.active"/></c:when>--%>
                            <%--<c:otherwise><spring:message code="pricing.archived"/></c:otherwise>--%>
                        <%--</c:choose>--%>
                    <%--</td>--%>
                <%--</tr>--%>
            <%--</c:forEach>--%>
            <%--</tbody>--%>
        <%--</table>--%>
    <%--</div>--%>
</div>
