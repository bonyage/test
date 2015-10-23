<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%--<script src='<c:url value="/resources/js/jquery-1.11.3.min.js"/>'></script>--%>
<%--<script src='<c:url value="/resources/js/bootstrap-3.2.0.min.js"/>'></script>--%>
<%--<script src='<c:url value="/resources/js/jquery-file-upload-9.11.2/vendor/jquery.ui.widget.js"/>'></script>--%>
<script src='<c:url value="/resources/js/jquery-file-upload-9.11.2/load-image.all.min.js"/>'></script>
<script src='<c:url value="/resources/js/jquery-file-upload-9.11.2/jquery.fileupload.js"/>'></script>
<script src='<c:url value="/resources/js/jquery-file-upload-9.11.2/jquery.fileupload-process.js"/>'></script>
<script src='<c:url value="/resources/js/jquery-file-upload-9.11.2/jquery.fileupload-image.js"/>'></script>
<script src='<c:url value="/resources/js/jquery-file-upload-9.11.2/jquery.fileupload-validate.js"/>'></script>

<script>
  /*jslint unparam: true, regexp: true */
  /*global window, $ */
  $(function () {
    'use strict';
    var imageServiceUrl = '<c:url value="/images/" />';

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
        url: imageServiceUrl,
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
      }).on('fileuploaddone', function (e, data) {
        $.each(data.result.files, function (index, file) {
          if (file.key) {
            $('#' + options.imageKeyId).attr('value', file.key);
            selectElement('.imageContainer img').attr('src', imageServiceUrl + file.key);
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
              imageSectionId: 'icon',
              imageKeyId: 'iconImageKey'
            }
    );
    imageUpload(
            {
              imageSectionId: 'frontSmall',
              imageKeyId: 'frontSmallImageKey'
            }
    );
    imageUpload(
            {
              imageSectionId: 'frontMedium',
              imageKeyId: 'frontMediumImageKey'
            }
    );
    imageUpload(
            {
              imageSectionId: 'frontLarge',
              imageKeyId: 'frontLargeImageKey'
            }
    );
    imageUpload(
            {
              imageSectionId: 'sideSmall',
              imageKeyId: 'sideSmallImageKey'
            }
    );
    imageUpload(
            {
              imageSectionId: 'sideMedium',
              imageKeyId: 'sideMediumImageKey'
            }
    );
    imageUpload(
            {
              imageSectionId: 'sideLarge',
              imageKeyId: 'sideLargeImageKey'
            }
    );
    imageUpload(
            {
              imageSectionId: 'backSmall',
              imageKeyId: 'backSmallImageKey'
            }
    );
    imageUpload(
            {
              imageSectionId: 'backMedium',
              imageKeyId: 'backMediumImageKey'
            }
    );
    imageUpload(
            {
              imageSectionId: 'backLarge',
              imageKeyId: 'backLargeImageKey'
            }
    );
  });
</script>
