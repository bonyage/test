<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
    <title>Upload File Request Page</title>
    <!-- Bootstrap styles -->
    <link rel="stylesheet" href="css/bootstrap-3.2.0.min.css">
    <%--<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">--%>
    <!-- Generic page styles -->
    <link rel="stylesheet" href="jquery-file-upload/css/style.css">
    <!-- CSS to style the file input field as button and adjust the Bootstrap progress bars -->
    <link rel="stylesheet" href="jquery-file-upload/css/jquery.fileupload.css">
</head>
<body>

<%--<form method="POST" action="/admin-web/images/" enctype="multipart/form-data">--%>
  <%--File to upload: <input type="file" name="files[]"><br />--%>
  <%--Name: <input type="text" name="name"><br /> <br />--%>
  <%--<input type="submit" value="Upload"> Press here to upload the file!--%>
<%--</form>--%>

<div id="frontLarge">
    <div class="imageKey"></div>

    <!-- The container for the uploaded files -->
    <div class="previewContainer" class="files" style="min-height: 722px; max-height: 722px; border: 1px; border-style: solid">
        <div></div>
    </div>

    <div class="progress">
    <%--<div id="progress" class="progress">--%>
        <div class="progress-bar progress-bar-success"></div>
    </div>

    <div class="fileName">No file selected</div>

    <div>
        <!-- The fileinput-button span is used to style the file input field as button -->
        <span class="selectFileButton btn btn-success fileinput-button">
        <%--<span class="selectFileButton" class="btn btn-success fileinput-button">--%>
            <i class="glyphicon glyphicon-plus"></i>
            <span>Select File</span>
            <!-- The file input field used as target for the file upload widget -->
            <input class="fileUpload" type="file" name="imageFile" multiple>
        </span>
    </div>
</div>

<%--<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>--%>
<script src="js/jquery-1.11.3.min.js"></script>
<!-- The jQuery UI widget factory, can be omitted if jQuery UI is already included -->
<script src="js/vendor/jquery.ui.widget.js"></script>
<!-- The Load Image plugin is included for the preview images and image resizing functionality -->
<script src="js/load-image.all.min.js"></script>
<!-- The Canvas to Blob plugin is included for image resizing functionality -->
<script src="js/canvas-to-blob.min.js"></script>
<!-- Bootstrap JS is not required, but included for the responsive demo navigation -->
<script src="js/bootstrap-3.2.0.min.js"></script>
<!-- The Iframe Transport is required for browsers without support for XHR file uploads -->
<script src="js/jquery.iframe-transport.js"></script>
<!-- The basic File Upload plugin -->
<script src="js/jquery.fileupload.js"></script>
<!-- The File Upload processing plugin -->
<script src="js/jquery.fileupload-process.js"></script>
<!-- The File Upload image preview & resize plugin -->
<script src="js/jquery.fileupload-image.js"></script>
<!-- The File Upload validation plugin -->
<script src="js/jquery.fileupload-validate.js"></script>

<script>
    /*jslint unparam: true, regexp: true */
    /*global window, $ */
    $(function () {
        'use strict';
        var url = '/admin-web/images/';

        var imageUpload = function(options) {
            var uploadButton = $('<button/>')
                        .addClass('btn btn-primary')
                        .prop('disabled', true)
                        .text('Processing...')
                        .on('click', function () {
                            var $this = $(this),
                                    data = $this.data();
                            $this
                                    .off('click')
                                    .text('Abort')
                                    .on('click', function () {
                                        $this.remove();
                                        data.abort();
                                    });
                            data.submit().always(function () {
                                $this.remove();
                            });
                        });
//            var sectionId = '#' + options.imageSectionId;
            var selectElement = function(selector) {
                return $('#' + options.imageSectionId + ' ' + selector);
            }
//            $(sectionId + ' .fileUpload').fileupload({
            selectElement('.fileUpload').fileupload({
                url: url,
                dataType: 'json',
                autoUpload: false,
                acceptFileTypes: /(\.|\/)(gif|jpe?g|png)$/i,
                maxFileSize: 999000,
                // Enable image resizing, except for Android and Opera,
                // which actually support image resizing, but fail to
                // send Blob objects via XHR requests:
                disableImageResize: /Android(?!.*Chrome)|Opera/
                        .test(window.navigator.userAgent),
                previewMaxWidth: options.previewWidth,
                previewMaxHeight: options.previewHeight,
                previewCrop: true
            }).on('fileuploadadd', function (e, data) {
                $.each(data.files, function (index, file) {
//                    $(sectionId + ' .fileName').text(file.name);
//                    $(sectionId + ' .selectFileButton').after(uploadButton.clone(true).addClass('uploadButton').data(data));
                    selectElement('.fileName').text(file.name);
                    selectElement('.selectFileButton').after(uploadButton.clone(true).addClass('uploadButton').data(data));
                });
            }).on('fileuploadprocessalways', function (e, data) {
                var index = data.index,
                    file = data.files[index],
//                    node = $(sectionId + ' .previewContainer div');
                    node = selectElement('.previewContainer *');
                if (file.preview) {
//                    node.append(file.preview);
                    node.replaceWith(file.preview);
                    selectElement('.progress-bar').css('width', '0%');
                }
                if (file.error) {
                    node
                            .append('<br>')
                            .append($('<span class="text-danger"/>').text(file.error));
                }
                if (index + 1 === data.files.length) {
//                    $(sectionId + ' .uploadButton')
                    selectElement('.uploadButton')
                            .text('Upload')
                            .prop('disabled', !!data.files.error);
                }
            }).on('fileuploadprogressall', function (e, data) {
                var progress = parseInt(data.loaded / data.total * 100, 10);
//                $(sectionId + ' .progress-bar').css(
                selectElement('.progress-bar').css(
                        'width',
                        progress + '%'
                );
            }).on('fileuploaddone', function (e, data) {
                $.each(data.result.files, function (index, file) {
                    if (file.key) {
                        selectElement('.imageKey').text(file.key);
                    } else if (file.error) {
                        var error = $('<span class="text-danger"/>').text(file.error);
                        $(data.context.children()[index])
                                .append('<br>')
                                .append(error);
                    }
                });
            }).on('fileuploadfail', function (e, data) {
                $.each(data.files, function (index) {
                    var error = $('<span class="text-danger"/>').text('File upload failed.');
                    $(data.context.children()[index])
                            .append('<br>')
                            .append(error);
                });
            }).prop('disabled', !$.support.fileInput)
                    .parent().addClass($.support.fileInput ? undefined : 'disabled');
        };

        imageUpload(
                {
                    imageSectionId: 'frontLarge',
                    previewWidth: 720,
                    previewHeight: 720
                }
        );
    });
</script>

</body>
</html>
