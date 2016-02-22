<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<div class="row-fluid">
    <div class="page-header">
        <h1>${heading}</h1>
    </div>
    <form:form id="productForm" class="form-horizontal" modelAttribute="product" action="${action}" method="POST">
        <form:hidden id="productId" path="id"/>
        <form:hidden id="version" path="version"/>
        <fieldset>
            <div class="control-group">
                <div class="control-label span1">
                    <form:label path="name" for="name"><spring:message code="product.form.name"/></form:label>
                </div>
                <div class="controls">
                    <form:input id="name" path="name" type="text" class="span9"/>
                </div>
            </div>
            <div class="control-group">
                <div class="control-label span1">
                    <form:label path="shortDescription" for="shortDescription"><spring:message code="product.form.shortDescription"/></form:label>
                </div>
                <div class="controls">
                    <form:input id="shortDescription" path="shortDescription" type="text" class="span9"/>
                </div>
            </div>
            <div class="control-group">
                <div class="control-label span1">
                    <form:label path="longDescription" for="longDescription"><spring:message code="product.form.longDescription"/></form:label>
                </div>
                <div class="controls">
                    <form:textarea id="longDescription" path="longDescription" class="span9" cols="40" rows="5"></form:textarea>
                </div>
            </div>
            <div class="control-group">
                <div class="control-label span1">
                    <form:label path="marketingText" for="marketingText"><spring:message code="product.form.marketingText"/></form:label>
                </div>
                <div class="controls">
                    <form:textarea id="marketingText" path="marketingText" class="span9" cols="40" rows="5"></form:textarea>
                </div>
            </div>
          	<div class="control-group">
                <div class="control-label span1">
                    <form:label path="productVolume" for="productVolume"><spring:message code="product.form.productVolume"/></form:label>
                </div>
                <div class="controls">
                    <form:input id="productVolume" path="productVolume" type="text" class="span9"/>
                </div>
            </div>
            <div class="control-group">
                <div class="control-label span1">
                    <form:label path="productWeight" for="productWeight"><spring:message code="product.form.productWeight"/></form:label>
                </div>
                <div class="controls">
                    <form:input id="productWeight" path="productWeight" type="text" class="span9"/>
                </div>
            </div>
            <div class="control-group">
                <div class="control-label span1">
                    <form:label path="productSpecification" for="productSpecification"><spring:message code="product.form.productSpecification"/></form:label>
                </div>
                <div class="controls">
                    <form:input id="productSpecification" path="productSpecification" type="text" class="span9"/>
                </div>
            </div>
            <div class="control-group">
                <div class="control-label span1">
                    <form:label path="sku" for="sku"><spring:message code="product.form.sku"/></form:label>
                </div>
                <div class="controls">
                    <form:input id="sku" path="sku" type="text" class="span9"/>
                </div>
            </div>
            <div class="control-group">
                <div class="control-label span1">
                    <label for="active"><spring:message code="product.form.active"/>?</label>
                </div>
                <div class="controls">
                    <form:checkbox id="active" path="active" class="span9"/>
                </div>
            </div>
            <c:if test="${!empty product.id}">
                <div class="control-group">
                    <div class="control-label span1">
                        <label for="qrCode"><spring:message code="product.form.qrCode"/></label>
                    </div>
                    <div class="controls">
                        <img id="qrCode" src="<c:url value="/images/qrcode/${product.id}"/>" width="200" height="200"/>
                    </div>
                </div>
            </c:if>
            <div class="form-actions">
                <input type="submit" class="btn btn-success btn-large" value="<spring:message code="product.save"/>" />
                <a class="btn" href="<c:url value="/product/list"/>"><spring:message code="product.cancel"/></a>
            </div>

            <form:hidden id="iconImageKey" path="iconImageKey" />
            <form:hidden id="frontSmallImageKey" path="frontSmallImageKey" />
            <form:hidden id="frontMediumImageKey" path="frontMediumImageKey" />
            <form:hidden id="frontLargeImageKey" path="frontLargeImageKey" />
            <form:hidden id="sideSmallImageKey" path="sideSmallImageKey" />
            <form:hidden id="sideMediumImageKey" path="sideMediumImageKey" />
            <form:hidden id="sideLargeImageKey" path="sideLargeImageKey" />
            <form:hidden id="backSmallImageKey" path="backSmallImageKey" />
            <form:hidden id="backMediumImageKey" path="backMediumImageKey" />
            <form:hidden id="backLargeImageKey" path="backLargeImageKey" />
        </fieldset>
    </form:form>
</div>

<div id="icon">
    <h2><spring:message code="product.form.image.icon"/></h2>

    <div class="imageContainer" style="height: 112px; width: 112px; border: 1px; border-style: solid">
        <c:choose>
            <c:when test="${!empty product.iconImageUrl}">
                <img src="<c:url value="${product.iconImageUrl}"/>"/>
            </c:when>
            <c:otherwise>
                <img/>
            </c:otherwise>
        </c:choose>
    </div>

    <div class="previewContainer" class="files" style="height: 102px; width: 102px; border: 1px; border-style: solid">
        <img/>
    </div>

    <div class="fileName">No file selected</div>

    <div>
        <!-- The fileinput-button span is used to style the file input field as button -->
        <span class="selectFileButton btn btn-success fileinput-button">
            <i class="glyphicon glyphicon-plus"></i>
            <span>Select File</span>
            <!-- The file input field used as target for the file upload widget -->
            <input class="fileUpload" type="file" name="imageFile" data-no-uniform="true">
        </span>
    </div>
</div>

<div id="frontSmall">
    <h2><spring:message code="product.form.image.front.small"/></h2>

    <div class="imageContainer" style="height: 244px; width: 244px; border: 1px; border-style: solid">
        <c:choose>
            <c:when test="${!empty product.frontSmallImageUrl}">
                <img src="<c:url value="${product.frontSmallImageUrl}"/>"/>
            </c:when>
            <c:otherwise>
                <img/>
            </c:otherwise>
        </c:choose>
    </div>

    <div class="previewContainer" class="files" style="height: 102px; width: 102px; border: 1px; border-style: solid">
        <img/>
    </div>

    <div class="fileName">No file selected</div>

    <div>
        <!-- The fileinput-button span is used to style the file input field as button -->
        <span class="selectFileButton btn btn-success fileinput-button">
            <i class="glyphicon glyphicon-plus"></i>
            <span>Select File</span>
            <!-- The file input field used as target for the file upload widget -->
            <input class="fileUpload" type="file" name="imageFile" data-no-uniform="true">
        </span>
    </div>
</div>

<div id="frontMedium">
    <h2><spring:message code="product.form.image.front.medium"/></h2>

    <div class="imageContainer" style="height: 440px; width: 440px; border: 1px; border-style: solid">
        <c:choose>
            <c:when test="${!empty product.frontMediumImageUrl}">
                <img src="<c:url value="${product.frontMediumImageUrl}"/>"/>
            </c:when>
            <c:otherwise>
                <img/>
            </c:otherwise>
        </c:choose>
    </div>

    <div class="previewContainer" class="files" style="height: 102px; width: 102px; border: 1px; border-style: solid">
        <img/>
    </div>

    <div class="fileName">No file selected</div>

    <div>
        <!-- The fileinput-button span is used to style the file input field as button -->
        <span class="selectFileButton btn btn-success fileinput-button">
            <i class="glyphicon glyphicon-plus"></i>
            <span>Select File</span>
            <!-- The file input field used as target for the file upload widget -->
            <input class="fileUpload" type="file" name="imageFile" data-no-uniform="true">
        </span>
    </div>
</div>

<div id="frontLarge">
    <h2><spring:message code="product.form.image.front.large"/></h2>

    <div class="imageContainer" style="height: 722px; width: 722px; border: 1px; border-style: solid">
        <c:choose>
            <c:when test="${!empty product.frontLargeImageUrl}">
                <img src="<c:url value="${product.frontLargeImageUrl}"/>"/>
            </c:when>
            <c:otherwise>
                <img/>
            </c:otherwise>
        </c:choose>
    </div>

    <div class="previewContainer" class="files" style="height: 102px; width: 102px; border: 1px; border-style: solid">
        <img/>
    </div>

    <div class="fileName">No file selected</div>

    <div>
        <!-- The fileinput-button span is used to style the file input field as button -->
        <span class="selectFileButton btn btn-success fileinput-button">
            <i class="glyphicon glyphicon-plus"></i>
            <span>Select File</span>
            <!-- The file input field used as target for the file upload widget -->
            <input class="fileUpload" type="file" name="imageFile" data-no-uniform="true">
        </span>
    </div>
</div>

<div id="sideSmall">
    <h2><spring:message code="product.form.image.side.small"/></h2>

    <div class="imageContainer" style="height: 244px; width: 244px; border: 1px; border-style: solid">
        <c:choose>
            <c:when test="${!empty product.sideSmallImageUrl}">
                <img src="<c:url value="${product.sideSmallImageUrl}"/>"/>
            </c:when>
            <c:otherwise>
                <img/>
            </c:otherwise>
        </c:choose>
    </div>

    <div class="previewContainer" class="files" style="height: 102px; width: 102px; border: 1px; border-style: solid">
        <img/>
    </div>

    <div class="fileName">No file selected</div>

    <div>
        <!-- The fileinput-button span is used to style the file input field as button -->
        <span class="selectFileButton btn btn-success fileinput-button">
            <i class="glyphicon glyphicon-plus"></i>
            <span>Select File</span>
            <!-- The file input field used as target for the file upload widget -->
            <input class="fileUpload" type="file" name="imageFile" data-no-uniform="true">
        </span>
    </div>
</div>

<div id="sideMedium">
    <h2><spring:message code="product.form.image.side.medium"/></h2>

    <div class="imageContainer" style="height: 440px; width: 440px; border: 1px; border-style: solid">
        <c:choose>
            <c:when test="${!empty product.sideMediumImageUrl}">
                <img src="<c:url value="${product.sideMediumImageUrl}"/>"/>
            </c:when>
            <c:otherwise>
                <img/>
            </c:otherwise>
        </c:choose>
    </div>

    <div class="previewContainer" class="files" style="height: 102px; width: 102px; border: 1px; border-style: solid">
        <img/>
    </div>

    <div class="fileName">No file selected</div>

    <div>
        <!-- The fileinput-button span is used to style the file input field as button -->
        <span class="selectFileButton btn btn-success fileinput-button">
            <i class="glyphicon glyphicon-plus"></i>
            <span>Select File</span>
            <!-- The file input field used as target for the file upload widget -->
            <input class="fileUpload" type="file" name="imageFile" data-no-uniform="true">
        </span>
    </div>
</div>

<div id="sideLarge">
    <h2><spring:message code="product.form.image.side.large"/></h2>

    <div class="imageContainer" style="height: 722px; width: 722px; border: 1px; border-style: solid">
        <c:choose>
            <c:when test="${!empty product.sideLargeImageUrl}">
                <img src="<c:url value="${product.sideLargeImageUrl}"/>"/>
            </c:when>
            <c:otherwise>
                <img/>
            </c:otherwise>
        </c:choose>
    </div>

    <div class="previewContainer" class="files" style="height: 102px; width: 102px; border: 1px; border-style: solid">
        <img/>
    </div>

    <div class="fileName">No file selected</div>

    <div>
        <!-- The fileinput-button span is used to style the file input field as button -->
        <span class="selectFileButton btn btn-success fileinput-button">
            <i class="glyphicon glyphicon-plus"></i>
            <span>Select File</span>
            <!-- The file input field used as target for the file upload widget -->
            <input class="fileUpload" type="file" name="imageFile" data-no-uniform="true">
        </span>
    </div>
</div>

<div id="backSmall">
    <h2><spring:message code="product.form.image.back.small"/></h2>

    <div class="imageContainer" style="height: 244px; width: 244px; border: 1px; border-style: solid">
        <c:choose>
            <c:when test="${!empty product.backSmallImageUrl}">
                <img src="<c:url value="${product.backSmallImageUrl}"/>"/>
            </c:when>
            <c:otherwise>
                <img/>
            </c:otherwise>
        </c:choose>
    </div>

    <div class="previewContainer" class="files" style="height: 102px; width: 102px; border: 1px; border-style: solid">
        <img/>
    </div>

    <div class="fileName">No file selected</div>

    <div>
        <!-- The fileinput-button span is used to style the file input field as button -->
        <span class="selectFileButton btn btn-success fileinput-button">
            <i class="glyphicon glyphicon-plus"></i>
            <span>Select File</span>
            <!-- The file input field used as target for the file upload widget -->
            <input class="fileUpload" type="file" name="imageFile" data-no-uniform="true">
        </span>
    </div>
</div>

<div id="backMedium">
    <h2><spring:message code="product.form.image.back.medium"/></h2>

    <div class="imageContainer" style="height: 440px; width: 440px; border: 1px; border-style: solid">
        <c:choose>
            <c:when test="${!empty product.backMediumImageUrl}">
                <img src="<c:url value="${product.backMediumImageUrl}"/>"/>
            </c:when>
            <c:otherwise>
                <img/>
            </c:otherwise>
        </c:choose>
    </div>

    <div class="previewContainer" class="files" style="height: 102px; width: 102px; border: 1px; border-style: solid">
        <img/>
    </div>

    <div class="fileName">No file selected</div>

    <div>
        <!-- The fileinput-button span is used to style the file input field as button -->
        <span class="selectFileButton btn btn-success fileinput-button">
            <i class="glyphicon glyphicon-plus"></i>
            <span>Select File</span>
            <!-- The file input field used as target for the file upload widget -->
            <input class="fileUpload" type="file" name="imageFile" data-no-uniform="true">
        </span>
    </div>
</div>

<div id="backLarge">
    <h2><spring:message code="product.form.image.back.large"/></h2>

    <div class="imageContainer" style="height: 722px; width: 722px; border: 1px; border-style: solid">
        <c:choose>
            <c:when test="${!empty product.backLargeImageUrl}">
                <img src="<c:url value="${product.backLargeImageUrl}"/>"/>
            </c:when>
            <c:otherwise>
                <img/>
            </c:otherwise>
        </c:choose>
    </div>

    <div class="previewContainer" class="files" style="height: 102px; width: 102px; border: 1px; border-style: solid">
        <img/>
    </div>

    <div class="fileName">No file selected</div>

    <div>
        <!-- The fileinput-button span is used to style the file input field as button -->
        <span class="selectFileButton btn btn-success fileinput-button">
            <i class="glyphicon glyphicon-plus"></i>
            <span>Select File</span>
            <!-- The file input field used as target for the file upload widget -->
            <input class="fileUpload" type="file" name="imageFile" data-no-uniform="true">
        </span>
    </div>
</div>
