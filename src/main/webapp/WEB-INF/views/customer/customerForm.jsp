<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<div class="row-fluid">
    <div class="page-header">
        <h1>${heading}</h1>
    </div>
    <form:form id="customerForm" class="form-horizontal" modelAttribute="customerAddress" action="${action}" method="POST">
        <form:hidden id="customerId" path="id"/>
        <fieldset>
            <div class="control-group">
                <div class="control-label span1">
                    <form:label path="name" for="name"><spring:message code="customer.form.name"/></form:label>
                </div>
                <div class="controls">
                    <form:input id="name" path="name" type="text" class="span9"/>
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
                    <form:label path="address.region" for="address.region"><spring:message code="customer.form.region"/></form:label>
                </div>
                <div class="controls">
                    <form:input id="region" path="address.region" type="text" class="span9"/>
                </div>
            </div>
             <div class="control-group">
                <div class="control-label span1">
                    <form:label path="address.addrLines" for="address.addrLines"><spring:message code="customer.form.addrlines"/></form:label>
                </div>
                <div class="controls">
                    <form:textarea id="addrlines" path="address.addrLines" class="span9" cols="40" rows="5"></form:textarea>
                </div>
            </div>
           	<div class="control-group">
                <div class="control-label span1">
                    <form:label path="address.postcode" for="address.postcode"><spring:message code="customer.form.postcode"/></form:label>
                </div>
                <div class="controls">
                    <form:input id="postcode" path="address.postcode" type="text" class="span9"/>
                </div>
            </div>
            <div class="form-actions">
                <input type="submit" class="btn btn-success btn-large" value="<spring:message code="customer.save"/>" />
                <a class="btn" href="<c:url value="/customer/list"/>"><spring:message code="customer.cancel"/></a>
            </div>
        </fieldset>
    </form:form>
</div>
