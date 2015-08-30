<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<div class="row-fluid">
    <div class="page-header">
        <h1>${formConfig.heading}</h1>
    </div>
    <form:form id="productForm" class="form-horizontal" modelAttribute="product" action="${formConfig.action}" method="POST">
        <form:hidden id="productId" path="id"/>
        <form:hidden id="version" path="version"/>
        <fieldset>
            <div class="control-group">
                <form:label path="name" class="control-label" for="name">Name</form:label>
                <div class="controls">
                    <form:input id="name" path="name" type="text" class="input-xlarge"/>
                </div>
            </div>
            <div class="control-group">
                <form:label path="shortDescription" class="control-label" for="shortDescription">Short Description</form:label>
                <div class="controls">
                    <form:input id="shortDescription" path="shortDescription" type="text" class="input-xlarge"/>
                </div>
            </div>
            <div class="control-group">
                <form:label path="longDescription" class="control-label" for="longDescription">Long Description</form:label>
                <div class="controls">
                    <form:textarea id="longDescription" path="longDescription" cols="40" rows="5"></form:textarea>
                </div>
            </div>
            <div class="control-group">
                <form:label path="marketingText" class="control-label" for="marketingText">Marketing Text</form:label>
                <div class="controls">
                    <form:textarea id="marketingText" path="marketingText" cols="40" rows="5"></form:textarea>
                </div>
            </div>
            <div class="control-group">
                <form:label path="sku" class="control-label" for="sku">SKU</form:label>
                <div class="controls">
                    <form:input id="sku" path="sku" type="text" class="input-xlarge"/>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="active">Active?</label>
                <div class="controls">
                    <form:checkbox id="active" path="active"/>
                </div>
            </div>
            <div class="form-actions">
                <input type="submit" class="btn btn-success btn-large" value="Save" />
                <a class="btn" href="${pageContext.request.contextPath}/product/list">Cancel</a>
            </div>
        </fieldset>
    </form:form>
</div>
