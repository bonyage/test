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
                    <th><spring:message code="user.name.head"/></th>
                    <th><spring:message code="user.mobile.head"/></th>
                    <th><spring:message code="user.email.head"/></th>
                    <th><spring:message code="user.username.head"/></th>
                    <th><spring:message code="user.roles.head"/></th>
                    <th><spring:message code="user.status.head"/></th>
                    <th></th>
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
                                <spring:message code="user.status.active"/>
                            </c:if>
                            <c:if test="${!user.active}">
                                <spring:message code="user.status.inactive"/>
                            </c:if>
                        </td>
                        <td><a href="<c:url value='user/${user.userName}'/>" class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-edit"></span>Edit</a> </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="box-content">
            <a class="btn btn-primary" href="${pageContext.request.contextPath}/administration/user/new">New user</a>
        </div>