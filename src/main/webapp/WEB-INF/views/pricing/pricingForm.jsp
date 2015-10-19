<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="row-fluid">
  <div class="page-header">
    <h1>${heading}</h1>
  </div>
  <div class="box-content">
    <form:form id="newPriceForm" class="form-horizontal" modelAttribute="newPrice" action="${action}" method="POST">
      <form:hidden id="productId" path="productId"/>
      <%--<form:hidden id="version" path="version"/>--%>
      <fieldset>
        <div class="control-group">
          <form:label path="baseUnitPrice" class="control-label" for="baseUnitPrice">Base Unit Price</form:label>
          <div class="controls">
            <form:input id="baseUnitPrice" path="baseUnitPrice" type="text" class="input-xlarge"/>
          </div>
        </div>
        <%--<div class="control-group">--%>
          <%--<form:label path="shortDescription" class="control-label" for="shortDescription">Short Description</form:label>--%>
          <%--<div class="controls">--%>
            <%--<form:input id="shortDescription" path="shortDescription" type="text" class="input-xlarge"/>--%>
          <%--</div>--%>
        <%--</div>--%>
        <%--<div class="control-group">--%>
          <%--<form:label path="longDescription" class="control-label" for="longDescription">Long Description</form:label>--%>
          <%--<div class="controls">--%>
            <%--<form:textarea id="longDescription" path="longDescription" cols="40" rows="5"></form:textarea>--%>
          <%--</div>--%>
        <%--</div>--%>
        <%--<div class="control-group">--%>
          <%--<form:label path="marketingText" class="control-label" for="marketingText">Marketing Text</form:label>--%>
          <%--<div class="controls">--%>
            <%--<form:textarea id="marketingText" path="marketingText" cols="40" rows="5"></form:textarea>--%>
          <%--</div>--%>
        <%--</div>--%>
        <%--<div class="control-group">--%>
          <%--<form:label path="sku" class="control-label" for="sku">SKU</form:label>--%>
          <%--<div class="controls">--%>
            <%--<form:input id="sku" path="sku" type="text" class="input-xlarge"/>--%>
          <%--</div>--%>
        <%--</div>--%>
        <%--<div class="control-group">--%>
          <%--<label class="control-label" for="active">Active?</label>--%>
          <%--<div class="controls">--%>
            <%--<form:checkbox id="active" path="active"/>--%>
          <%--</div>--%>
        <%--</div>--%>
        <div class="form-actions">
          <input type="submit" class="btn btn-success btn-large" value="Save" />
          <a class="btn" href="<c:url value="/pricing/list"/>">Cancel</a>
        </div>
      </fieldset>
    </form:form>
  </div>

  <div class="box-content">
    <table class="table table-striped table-bordered">
    <%--<table class="table table-striped table-bordered bootstrap-datatable datatable">--%>
      <thead>
      <tr>
        <th>Effective From</th>
        <th>Base Unit Price</th>
        <th>Status</th>
        <%--<th>Action</th>--%>
      </tr>
      </thead>
      <tbody>
      <c:forEach var="price" items="${allPrices}">
        <tr>
          <td><c:out value="${price.effectiveFrom}"/></td>
          <td><c:out value="${price.baseUnitPrice}"/></td>
          <td>
            <c:choose>
              <c:when test="${price.active}">Active</c:when>
              <c:otherwise>Archived</c:otherwise>
            </c:choose>
          </td>
          <%--<td><a href="${pageContext.request.contextPath}/product/${product.id}">Edit</a></td>--%>
        </tr>
      </c:forEach>
      </tbody>
    </table>
  </div>
</div>
