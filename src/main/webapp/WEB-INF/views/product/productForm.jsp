<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="row-fluid">
    <div class="page-header">
        <h1>${heading}</h1>
    </div>
    <form:form id="productForm" class="form-horizontal" modelAttribute="product" action="${action}" method="POST">
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
                <a class="btn" href="<c:url value="/product/list"/>">Cancel</a>
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
    <h2>Icon</h2>

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
    <h2>Front - Small</h2>

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
    <h2>Front - Medium</h2>

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
    <h2>Front - Large</h2>

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
    <h2>Side - Small</h2>

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
    <h2>Side - Medium</h2>

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
    <h2>Side - Large</h2>

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
    <h2>Back - Small</h2>

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
    <h2>Back - Medium</h2>

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
    <h2>Back - Large</h2>

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
