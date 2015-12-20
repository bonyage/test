<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<div class="row-fluid">
    <div class="page-header">
        <h1><spring:message code="inventory.form.heading"/> - ${productName}</h1>
    </div>
    <div class="box-content">
        <form:form id="stockLevelForm" class="form-horizontal" modelAttribute="stockLevel" action="${action}" method="POST">
            <form:hidden id="productId" path="productId"/>
            <fieldset>
                <div class="control-group">
                    <div class="control-label span1">
                        <form:label path="inventory.intakeBaseUnitStockLevel" for="quantity"><spring:message code="inventory.form.quantity"/></form:label>
                    </div>
                    <div class="controls">
                        <form:input id="quantity" path="inventory.intakeBaseUnitStockLevel" type="text" class="span5"/>
                        <form:select path="inventory.productUnitCode" items="${allProductUnitsAsMap}" class="span5"></form:select>
                    </div>
                </div>
                <div class="control-group">
                    <div class="control-label span1">
                        <form:label path="inventory.baseUnitName" for="unit"><spring:message code="inventory.form.unit"/></form:label>
                    </div>
                    <div class="controls">
                        <form:input id="unit" path="inventory.baseUnitName" type="text" class="span9"/>
                    </div>
                </div>

                <div class="form-actions">
                    <input type="submit" class="btn btn-success btn-large" value="<spring:message code="inventory.save"/>" />
                    <a class="btn" href="<c:url value="/inventory/list"/>"><spring:message code="inventory.cancel"/></a>
                </div>
            </fieldset>
        </form:form>
    </div>
</div>
