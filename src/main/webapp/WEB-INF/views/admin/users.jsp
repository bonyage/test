<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<ul class="breadcrumb">

    <li><i class="icon-home"></i> <a href="index.html">Home</a> <i
            class="icon-angle-right"></i></li>
    <li><a href="#"><spring:message code="admin.user.breadcrumb"/></a></li>
</ul>

<div class="row-fluid sortable">
    <div class="box span12">
        <div class="box-header" data-original-title>
            <h2>
                <i class="halflings-icon user"></i><span class="break"></span>Users (all)
            </h2>

            <div class="box-icon">
                <a href="#" class="btn-minimize"><i class="halflings-icon chevron-up"></i></a>
            </div>
        </div>
        <div class="box-content">
            <table class="table table-striped table-bordered bootstrap-datatable datatable">
                <thead>
                <tr>
                    <th>Name</th>
                    <th>Mobile</th>
                    <th>E-mail</th>
                    <th>Username</th>
                    <th>Roles</th>
                    <th>Status</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="user" items="${users}">
                    <tr>
                        <td><c:out value="${user.name }"/></td>
                        <td><c:out value="${user.mobile }"/></td>
                        <td><c:out value="${user.email }"/></td>
                        <td><c:out value="${user.userName }"/></td>
                        <td>
                            <c:forEach var="userRole" items="${user.userRole}">
                                <c:out value="${userRole.role },"/>
                            </c:forEach>
                        </td>
                        <td>
                            <c:if test="${user.active}">
                                <c:out value="Active"/>
                            </c:if>
                            <c:if test="${!user.active}">
                                <c:out value="Inactive"/>
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="box-content">
            <a class="btn btn-primary" href="${pageContext.request.contextPath}/administration/addUser">New user</a>
        </div>