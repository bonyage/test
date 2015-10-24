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
      <fieldset>
        <div class="control-group">
          <div class="control-label span1">
            <form:label path="baseUnitPrice" for="baseUnitPrice">Base Unit Price</form:label>
          </div>
          <div class="controls">
            <form:input id="baseUnitPrice" path="baseUnitPrice" type="text" class="span9"/>
          </div>
        </div>
        <div class="control-group">
          <div class="control-label span1">
            <form:label path="marketingTag" for="marketingTag">Market Tag</form:label>
          </div>
          <div class="controls">
            <form:select id="marketingTag" path="marketingTag" items="${marketingTags}" class="span2"/>
          </div>
        </div>

        <div class="form-actions">
          <input type="submit" class="btn btn-success btn-large" value="Save" />
          <a class="btn" href="<c:url value="/pricing/list"/>">Cancel</a>
        </div>
      </fieldset>
    </form:form>
  </div>

  <div class="box-content">
    <table class="table table-striped table-bordered">
      <thead>
      <tr>
        <th>Effective From</th>
        <th>Base Unit Price</th>
        <th>Marketing Tag</th>
        <th>Status</th>
      </tr>
      </thead>
      <tbody>
      <c:forEach var="price" items="${allPrices}">
        <tr>
          <td><c:out value="${price.effectiveFrom}"/></td>
          <td><c:out value="${price.baseUnitPrice}"/></td>
          <td><c:out value="${price.marketingTag.description}"/></td>
          <td>
            <c:choose>
              <c:when test="${price.active}">Active</c:when>
              <c:otherwise>Archived</c:otherwise>
            </c:choose>
          </td>
        </tr>
      </c:forEach>
      </tbody>
    </table>
  </div>
</div>
