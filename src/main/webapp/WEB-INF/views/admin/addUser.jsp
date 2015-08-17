<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
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
        <i class="halflings-icon user"></i><span class="break"></span>Add User
      </h2>

      <div class="box-icon">
        <a href="#" class="btn-minimize"><i class="halflings-icon chevron-up"></i></a>
      </div>
    </div>
    <div class="box-content">

      <form:form class="form-horizontal" method="post" modelAttribute="userForm" action="${pageContext.request.contextPath}/administration/addUser">
        <div class="control-group">
          <label class="control-label" for="name">Name</label>
          <div class="controls">
            <form:input type="text" path="name" id="name" placeholder="Name"/>
          </div>
        </div>
        <div class="control-group">
          <label class="control-label" for="phone">Phone</label>
          <div class="controls">
            <form:input type="tel" path="phone" id="phone" placeholder="Phone"/>
          </div>
        </div>
        <div class="control-group">
          <label class="control-label" for="email">Email</label>
          <div class="controls">
            <form:input type="email" path="email" id="email" placeholder="Email"/>
          </div>
        </div>
        <div class="control-group">
          <label class="control-label" for="username">Username</label>
          <div class="controls">
            <form:input type="text" path="username" id="username" placeholder="Username"/>
          </div>
        </div>
        <div class="control-group">
          <label class="control-label" for="password">Password</label>
          <div class="controls">
            <form:password path="password" id="password" placeholder="Password"/>
          </div>
        </div>
        <div class="control-group">
          <label class="control-label" for="active">Active?</label>
          <div class="controls">
            <form:checkbox path="active" id="active"/>
          </div>
        </div>

        <div class="control-group">
          <label class="control-label">Roles</label>
          <div class="controls">
            <label class="checkbox-inline">
              <form:checkbox path="roles" value="ROLE_ADMIN"/> Administrator role
            </label>
            <label class="checkbox-inline">
              <form:checkbox path="roles" value="ROLE_ORDER_MANAGEMENT"/> Order management role
            </label>
            <label class="checkbox-inline">
              <form:checkbox path="roles" value="ROLE_PRODUCT"/> Product role
            </label>
            <label class="checkbox-inline">
              <form:checkbox path="roles" value="ROLE_INVENTORY"/> Inventory role
            </label>
          </div>
        </div>

        <div class="control-group">
          <div class="controls">
            <form:button type="submit" class="btn btn-primary">Save</form:button>
          </div>
        </div>
      </form:form>
    </div>
