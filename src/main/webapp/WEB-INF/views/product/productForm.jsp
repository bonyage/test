<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<div class="row-fluid">
    <div class="page-header">
        <h1>New Product</h1>
    </div>
    <form:form id="productForm" class="form-horizontal" modelAttribute="product" action="${pageContext.request.contextPath}/product/" method="POST">
        <fieldset>
            <div class="control-group">
                <form:label path="name" class="control-label" for="name">Name</form:label>
                <div class="controls">
                    <form:input path="name" type="text" class="input-xlarge" id="name" />
                </div>
            </div>
            <div class="control-group">
                <form:label path="shortDescription" class="control-label" for="shortDescription">Short Description</form:label>
                <div class="controls">
                    <form:input path="shortDescription" type="text" class="input-xlarge" id="shortDescription" />
                </div>
            </div>
            <div class="control-group">
                <form:label path="longDescription" class="control-label" for="longDescription">Long Description</form:label>
                <div class="controls">
                    <form:textarea path="longDescription" cols="40" rows="5" id="longDescription"></form:textarea>
                </div>
            </div>
            <div class="control-group">
                <form:label path="marketingText" class="control-label" for="marketingText">Marketing Text</form:label>
                <div class="controls">
                    <form:textarea path="marketingText" cols="40" rows="5" id="marketingText"></form:textarea>
                </div>
            </div>
            <div class="control-group">
                <form:label path="sku" class="control-label" for="sku">SKU</form:label>
                <div class="controls">
                    <form:input path="sku" type="text" class="input-xlarge" id="sku" />
                </div>
            </div>
            <%--<div class="control-group">--%>
                <%--<label class="control-label" for="role">Role</label>--%>
                <%--<div class="controls">--%>
                    <%--<select id="role">--%>
                        <%--<option value="admin">Admin</option>--%>
                        <%--<option value="mod">Moderator</option>--%>
                        <%--<option value="user" selected>User</option>--%>
                    <%--</select>--%>
                <%--</div>--%>
            <%--</div>--%>
            <%--<div class="control-group">--%>
                <%--<label class="control-label" for="active">Active?</label>--%>
                <%--<div class="controls">--%>
                    <%--<input type="checkbox" id="active" value="1" />--%>
                <%--</div>--%>
            <%--</div>--%>
            <div class="form-actions">
                <input type="submit" class="btn btn-success btn-large" value="Save" /> <a class="btn" href="users.html">Cancel</a>
            </div>
        </fieldset>
    </form:form>
</div>
