<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<ul class="breadcrumb">

  <li><i class="icon-home"></i> <a href="index.html">Home</a> <i
          class="icon-angle-right"></i></li>
  <li><a href="#"><spring:message code="admin.user.breadcrumb"/></a></li>
</ul>

<div class="row-fluid sortable">
  <div class="box span12">
    <div class="box-header" data-original-title>
      <h2>
        <i class="halflings-icon user"></i><span class="break"></span><spring:message code="admin.user.breadcrumb"/>
      </h2>

      <div class="box-icon">
        <a href="#" class="btn-minimize"><i class="halflings-icon chevron-up"></i></a>
      </div>
    </div>
    <div class="box-content">

        <form:form class="form-horizontal" method="post" modelAttribute="user" commandName="user" action="${pageContext.request.contextPath}/administration/user/new">
        <div class="control-group">
          <label class="control-label" for="name"><spring:message code="user.name.head"/></label>
          <div class="controls">
            <form:input type="text" path="name" id="name" placeholder="Name"/>
          </div>
        </div>
        <div class="control-group">
          <label class="control-label" for="phone"><spring:message code="user.mobile.head"/></label>
          <div class="controls">
            <form:input type="tel" path="phone" id="phone" placeholder="Phone"/>
          </div>
        </div>
        <div class="control-group">
          <label class="control-label" for="email"><spring:message code="user.email.head"/></label>
          <div class="controls">
            <form:input type="email" path="email" id="email" placeholder="Email"/>
          </div>
        </div>
        <div class="control-group">
          <label class="control-label" for="username"><spring:message code="user.username.head"/></label>
          <div class="controls">
            <form:input type="text" path="username" id="username" placeholder="Username"/>
          </div>
        </div>
        <div class="control-group">
          <label class="control-label" for="password"><spring:message code="user.password.head"/></label>
          <div class="controls">
            <form:password path="password" id="password" placeholder="Password"/>
          </div>
        </div>
        <div class="control-group">
          <label class="control-label" for="active"><spring:message code="user.status.head"/>?</label>
          <div class="controls">
            <form:checkbox path="active" id="active"/>
          </div>
        </div>

        <div class="control-group">
          <label class="control-label"><spring:message code="user.roles.head"/></label>
          <div class="controls">
            <label class="checkbox-inline">
              <form:checkbox path="roles" value="ROLE_ADMIN"/> <spring:message code="user.roles.admin"/>
            </label>
            <label class="checkbox-inline">
              <form:checkbox path="roles" value="ROLE_ORDER_MANAGEMENT"/> <spring:message code="user.roles.order"/>
            </label>
            <label class="checkbox-inline">
              <form:checkbox path="roles" value="ROLE_PRODUCT"/> <spring:message code="user.roles.product"/>
            </label>
            <label class="checkbox-inline">
              <form:checkbox path="roles" value="ROLE_INVENTORY"/> <spring:message code="user.roles.inventory"/>
            </label>
          </div>
        </div>

        <div class="control-group">
          <div class="controls">
            <c:if test="${!empty user.username}">
              <form:button type="submit" class="btn btn-primary"><spring:message code="user.edit"/></form:button>
            </c:if>
            <c:if test="${empty user.username}">
              <form:button type="submit" class="btn btn-primary"><spring:message code="user.save"/></form:button>
            </c:if>

            <a href="${pageContext.request.contextPath}/administration/users" class="btn active"><i class="icon-chevron-left"></i> <spring:message code="user.back"/></a>
          </div>
        </div>
      </form:form>
    </div>
