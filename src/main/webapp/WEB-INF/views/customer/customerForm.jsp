<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<div class="row-fluid">
    <div class="page-header">
        <h1>${heading}</h1>
    </div>
    <form:form id="customerForm" class="form-horizontal" modelAttribute="customer" action="${action}" method="POST">
        <form:hidden id="customerId" path="customerId"/>
        <fieldset>
            <div class="control-group">
                <div class="control-label span1">
                    <form:label path="customerName" for="customerName"><spring:message code="customer.form.name"/></form:label>
                </div>
                <div class="controls">
                    <form:input id="customerName" path="customerName" type="text" class="span9"/>
                </div>
            </div>
            <div class="control-group">
                <div class="control-label span1">
                    <form:label path="email" for="email"><spring:message code="customer.form.email"/></form:label>
                </div>
                <div class="controls">
                    <form:input id="email" path="email" type="text" class="span9"/>
                </div>
            </div>
            <div class="control-group">
                <div class="control-label span1">
                    <form:label path="phone" for="phone"><spring:message code="customer.form.phone"/></form:label>
                </div>
                <div class="controls">
                    <form:input id="phone" path="phone" type="text" class="span9"/>
                </div>
            </div>
            <div class="control-group">
                <div class="control-label span1">
                    <form:label path="region" for="region"><spring:message code="customer.form.region"/></form:label>
                </div>
                <div class="controls">
                    <form:input id="region" path="region" type="text" class="span9"/>
                </div>
            </div>
             <div class="control-group">
                <div class="control-label span1">
                    <form:label path="addrlines" for="addrlines"><spring:message code="customer.form.addrlines"/></form:label>
                </div>
                <div class="controls">
                    <form:textarea id="addrlines" path="addrlines" class="span9" cols="40" rows="5"></form:textarea>
                </div>
            </div>
           	<div class="control-group">
                <div class="control-label span1">
                    <form:label path="postcode" for="postcode"><spring:message code="customer.form.postcode"/></form:label>
                </div>
                <div class="controls">
                    <form:input id="postcode" path="postcode" type="text" class="span9"/>
                </div>
            </div>
            <div class="form-actions">
                <input type="submit" class="btn btn-success btn-large" value="<spring:message code="customer.save"/>" />
                <a class="btn" href="<c:url value="/customer/list"/>"><spring:message code="customer.cancel"/></a>
            </div>
        </fieldset>
    </form:form>
</div>
