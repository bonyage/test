<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<div class="row-fluid">
  <div class="page-header">
    <h1><spring:message code="pricing.form.heading"/> - ${productName}</h1>
  </div>
  <div class="box-content">
  	<c:if test="${mode eq 'new'}">
  		<c:url value="/pricing/${productId}" var="url"/>
  	</c:if>
  	<c:if test="${mode eq 'update'}">
  		<c:url value="/pricing/item/${priceId}" var="url"/>
  	</c:if>
  	
    <form:form id="priceForm" class="form-horizontal" modelAttribute="priceDTO" action="${url}" method="POST">
      <form:hidden id="productId" path="productId"/>
      <form:hidden id="priceId" path="priceId"/>
      <fieldset>
        <div class="control-group">
          <div class="control-label span1">
            <form:label path="baseUnitPrice" for="baseUnitPrice"><spring:message code="pricing.form.baseUnitPrice"/></form:label>
          </div>
          <div class="controls">
            <form:input id="baseUnitPrice" path="baseUnitPrice" type="text" class="span3"/>
          </div>
        </div>
        <div class="control-group">
          <div class="control-label span1">
            <form:label path="marketingBaseUnitPrice" for="marketingBaseUnitPrice"><spring:message code="pricing.form.marketingBaseUnitPrice"/></form:label>
          </div>
          <div class="controls">
            <form:input id="marketingBaseUnitPrice" path="marketingBaseUnitPrice" type="text" class="span3"/>
          </div>
        </div>
        <div class="control-group">
          <div class="control-label span1">
            <form:label path="marketingTag" for="marketingTag"><spring:message code="pricing.form.marketingTag"/></form:label>
          </div>
          <div class="controls">
            <form:select id="marketingTag" path="marketingTag" items="${marketingTags}" class="span2"/>
          </div>
        </div>
        <div class="control-group">
          <div class="control-label span1">
            <form:label path="stockedProduct" for="stockedProduct"><spring:message code="pricing.form.stockedProduct"/></form:label>
          </div>
          <div class="controls">
            <form:checkbox id="stockedProduct" path="stockedProduct" class="span9"/>                    
          </div>
        </div>
        <div class="control-group">
          <div class="control-label span1">
            <form:label path="active" for="active"><spring:message code="pricing.form.active"/></form:label>
          </div>
          <div class="controls">
            <form:checkbox id="active" path="active" class="span9"/>                    
          </div>
        </div>

        <div class="form-actions">
        <c:if test="${mode eq 'new'}">
          <input type="submit" class="btn btn-success btn-large" value="<spring:message code="pricing.create"/>" />
          <a class="btn" href="<c:url value="/pricing/list"/>"><spring:message code="pricing.cancel"/></a>        
        </c:if>
        <c:if test="${mode eq 'update'}">
          <input type="submit" class="btn btn-success btn-large" value="<spring:message code="pricing.update"/>" />
          <a class="btn" href="<c:url value="/pricing/${productId}"/>"><spring:message code="pricing.cancel"/></a>        
        </c:if>
        
        </div>
      </fieldset>
    </form:form>
  </div>

	<c:if test="${not empty allPrices}">
	  <div class="box-content">
	    <table class="table table-striped table-bordered">
	      <thead>
	      <tr>
	        <th><spring:message code="pricing.history.id"/></th>
	        <th><spring:message code="pricing.history.effectiveForm"/></th>
	        <th><spring:message code="pricing.history.baseUnitPrice"/></th>
	        <th><spring:message code="pricing.history.marketingBaseUnitPrice"/></th>
	        <th><spring:message code="pricing.history.marketingTag"/></th>
	        <th><spring:message code="pricing.history.stockedProduct"/></th>
	        <th><spring:message code="pricing.history.status"/></th>
	      </tr>
	      </thead>
	      <tbody>
	      <c:forEach var="price" items="${allPrices}">
	        <tr>
	          <td><a href="<c:url value="/pricing/item/${price.priceId}"/>"><c:out value="${price.priceId}"/></a></td>
	          <td><c:out value="${price.effectiveFrom}"/></td>
	          <td><c:out value="${price.baseUnitPrice}"/></td>
	          <td><c:out value="${price.marketingBaseUnitPrice}"/></td>
	          <td><c:out value="${price.marketingTag.description}"/></td>
	          <td>
	            <c:choose>
	              <c:when test="${price.stockedProduct}"><spring:message code="common.yes"/></c:when>
	              <c:otherwise><spring:message code="common.no"/></c:otherwise>
	            </c:choose>
	          </td>
	          <td>
	            <c:choose>
	              <c:when test="${price.active}"><spring:message code="common.yes"/></c:when>
	              <c:otherwise><spring:message code="common.no"/></c:otherwise>
	            </c:choose>
	          </td>
	        </tr>
	      </c:forEach>
	      </tbody>
	    </table>
	  </div>	
	</c:if>
</div>
