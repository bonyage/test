<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
    <title>Upload File Request Page</title>
    <!-- Bootstrap styles -->
    <link rel="stylesheet" href="css/bootstrap-3.2.0.min.css">
    <!-- Generic page styles -->
    <link rel="stylesheet" href="css/jquery-file-upload-9.11.2/style.css">
    <!-- CSS to style the file input field as button and adjust the Bootstrap progress bars -->
    <link rel="stylesheet" href="css/jquery-file-upload-9.11.2/jquery.fileupload.css">
</head>
<body>

<div id="frontLarge">
    <div class="imageContainer" style="height: 722px; width: 722px; border: 1px; border-style: solid">
        <img src="/admin-web/resources/img/gallery/photo11.jpg"/>
    </div>

    <div class="imageKey"></div>

    <div class="progress">
        <div class="progress-bar progress-bar-success"></div>
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
            <input class="fileUpload" type="file" name="imageFile">
        </span>
    </div>
</div>

<div id="frontSmall">
    <div class="imageContainer" style="height: 244px; width: 244px; border: 1px; border-style: solid">
        <img src="/admin-web/resources/img/gallery/photo11.jpg"/>
    </div>

    <div class="imageKey"></div>

    <div class="progress">
        <div class="progress-bar progress-bar-success"></div>
    </div>

    <div class="previewContainer" class="files" style="height: 102px; width: 102px; border: 1px; border-style: solid">
        <img/>
    </div>

    <div class="fileName">No file selected</div>

    <div>
        <!-- The fileinput-button span is used to style the file input field as button -->
        <span class="selectFileButton btn btn-success fileinput-button">
        <%--<span class="selectFileButton" class="btn btn-success fileinput-button">--%>
            <i class="glyphicon glyphicon-plus"></i>
            <span>Select File</span>
            <!-- The file input field used as target for the file upload widget -->
            <input class="fileUpload" type="file" name="imageFile">
        </span>
    </div>
</div>

<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/bootstrap-3.2.0.min.js"></script>
<script src="js/jquery-file-upload-9.11.2/vendor/jquery.ui.widget.js"></script>
<script src="js/jquery-file-upload-9.11.2/load-image.all.min.js"></script>
<script src="js/jquery-file-upload-9.11.2/jquery.fileupload.js"></script>
<script src="js/jquery-file-upload-9.11.2/jquery.fileupload-process.js"></script>
<script src="js/jquery-file-upload-9.11.2/jquery.fileupload-image.js"></script>
<script src="js/jquery-file-upload-9.11.2/jquery.fileupload-validate.js"></script>

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

            var selectElement = function(selector) {
                return $('#' + options.imageSectionId + ' ' + selector);
            }

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
                previewMaxWidth: 100,
                previewMaxHeight: 100,
                previewCrop: true
            }).on('fileuploadadd', function (e, data) {
                $.each(data.files, function (index, file) {
                    selectElement('.fileName').text(file.name);
                    selectElement('.selectFileButton').after(uploadButton.clone(true).addClass('uploadButton').data(data));
                });
            }).on('fileuploadprocessalways', function (e, data) {
                var index = data.index,
                    file = data.files[index],
                    node = selectElement('.previewContainer *');
                if (file.preview) {
                    node.replaceWith(file.preview);
                    selectElement('.progress-bar').css('width', '0%');
                }
                if (file.error) {
                    node.append('<br>')
                        .append($('<span class="text-danger"/>').text(file.error));
                }
                if (index + 1 === data.files.length) {
                    selectElement('.uploadButton')
                            .text('Upload')
                            .prop('disabled', !!data.files.error);
                }
            }).on('fileuploadprogressall', function (e, data) {
                var progress = parseInt(data.loaded / data.total * 100, 10);
                selectElement('.progress-bar').css('width', progress + '%');
            }).on('fileuploaddone', function (e, data) {
                $.each(data.result.files, function (index, file) {
                    if (file.key) {
                        selectElement('.imageKey').text(file.key);
                        selectElement('.imageContainer img').attr('src', 'http://localhost:8080/admin-web/images/' + file.key);
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
                    imageSectionId: 'frontLarge'
                }
        );
        imageUpload(
                {
                    imageSectionId: 'frontSmall'
                }
        );
    });
</script>

</body>
</html>
