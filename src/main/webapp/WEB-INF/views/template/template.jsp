<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<!doctype html>
<!--[if IE 9 ]><html class="ie9" lang="en"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html lang="en"><!--<![endif]-->
<head>
	
	<!-- start: Meta -->
	<meta charset="utf-8">
	<title>oz180 admin web</title>
	<meta name="description" content="Admin Dashboard">
	<meta name="author" content="">
	<meta name="keyword" content="">
	<!-- end: Meta -->
	
	<!-- start: Mobile Specific -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- end: Mobile Specific -->
	
	<!-- start: CSS -->
	<link id="bootstrap-style" href="<c:url value="/resources/css/bootstrap.min.css"/>" rel="stylesheet">
	<link href="<c:url value="/resources/css/bootstrap-responsive.min.css"/>" rel="stylesheet">
	<link id="base-style" href="<c:url value="/resources/css/style.css"/>" rel="stylesheet">
	<link id="base-style-responsive" href="<c:url value="/resources/css/style-responsive.css"/>" rel="stylesheet">
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800&subset=latin,cyrillic-ext,latin-ext' rel='stylesheet' type='text/css'>
	<!-- end: CSS -->
	

	<!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
	<!--[if lt IE 9]>
	  	<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<link id="ie-style" href="<c:url value="/resources/css/ie.css"/>" rel="stylesheet">
	<![endif]-->
	
	<!--[if IE 9]>
		<link id="ie9style" href="<c:url value="/resources/css/ie9.css"/>" rel="stylesheet">
	<![endif]-->
		
	<!-- start: Favicon -->
	<link rel="shortcut icon" href="<c:url value="/resources/img/favicon.ico"/>">
	<!-- end: Favicon -->

	<!-- Bootstrap styles -->
	<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap-3.2.0.min.css"/>'>
	<!-- Generic page styles -->
	<link rel="stylesheet" href='<c:url value="/resources/css/jquery-file-upload-9.11.2/style.css"/>'>
	<!-- CSS to style the file input field as button and adjust the Bootstrap progress bars -->
	<link rel="stylesheet" href='<c:url value="/resources/css/jquery-file-upload-9.11.2/jquery.fileupload.css"/>'>
</head>

<body>
		<!-- start: Header -->
	<div class="navbar">
		<tiles:insertAttribute name="header" />	
	</div>
	<!-- start: Header -->
	
		<div class="container-fluid-full">
		<div class="row-fluid">
				
			<!-- start: Main Menu -->
			<div id="sidebar-left" class="span2">
				<tiles:insertAttribute name="mainMenu" />				
			</div>
			<!-- end: Main Menu -->
			
			<noscript>
				<div class="alert alert-block span10">
					<h4 class="alert-heading">Warning!</h4>
					<p>You need to have <a href="http://en.wikipedia.org/wiki/JavaScript" target="_blank">JavaScript</a> enabled to use this site.</p>
				</div>
			</noscript>
			
			<!-- start: Content -->
			<div id="content" class="span10">
			
			<tiles:insertAttribute name="body" />				

	</div><!--/.fluid-container-->
	
			<!-- end: Content -->
		</div><!--/#content.span10-->
		</div><!--/fluid-row-->
			
	<div class="clearfix"></div>
	
	<tiles:insertAttribute name="footer" />				
	
	
	<!-- start: JavaScript-->

<script src='<c:url value="/resources/js/jquery-1.11.3.min.js"/>'></script>
<%--<script src="<c:url value="/resources/js/jquery-1.9.1.min.js"/>"></script>--%>
	<script src="<c:url value="/resources/js/jquery-migrate-1.0.0.min.js"/>"></script>
	
		<script src="<c:url value="/resources/js/jquery-ui-1.10.0.custom.min.js"/>"></script>
	
		<script src="<c:url value="/resources/js/jquery.ui.touch-punch.js"/>"></script>
	
		<script src="<c:url value="/resources/js/modernizr.js"/>"></script>

<script src='<c:url value="/resources/js/bootstrap-3.2.0.min.js"/>'></script>
<%--<script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>--%>

<%--<script src='<c:url value="/resources/js/jquery-file-upload-9.11.2/vendor/jquery.ui.widget.js"/>'></script>--%>
<script src='<c:url value="/resources/js/jquery-file-upload-9.11.2/load-image.all.min.js"/>'></script>
<script src='<c:url value="/resources/js/jquery-file-upload-9.11.2/jquery.fileupload.js"/>'></script>
<script src='<c:url value="/resources/js/jquery-file-upload-9.11.2/jquery.fileupload-process.js"/>'></script>
<script src='<c:url value="/resources/js/jquery-file-upload-9.11.2/jquery.fileupload-image.js"/>'></script>
<script src='<c:url value="/resources/js/jquery-file-upload-9.11.2/jquery.fileupload-validate.js"/>'></script>

		<script src="<c:url value="/resources/js/jquery.cookie.js"/>"></script>
	
		<script src="<c:url value="/resources/js/fullcalendar.min.js"/>"></script>
	
		<script src="<c:url value="/resources/js/jquery.dataTables.min.js"/>"></script>

		<script src="<c:url value="/resources/js/excanvas.js"/>"></script>
	<script src="<c:url value="/resources/js/jquery.flot.js"/>"></script>
	<script src="<c:url value="/resources/js/jquery.flot.pie.js"/>"></script>
	<script src="<c:url value="/resources/js/jquery.flot.stack.js"/>"></script>
	<script src="<c:url value="/resources/js/jquery.flot.resize.min.js"/>"></script>
	
		<script src="<c:url value="/resources/js/jquery.chosen.min.js"/>"></script>
	
		<script src="<c:url value="/resources/js/jquery.uniform.min.js"/>"></script>
		
		<script src="<c:url value="/resources/js/jquery.cleditor.min.js"/>"></script>
	
		<script src="<c:url value="/resources/js/jquery.noty.js"/>"></script>
	
		<script src="<c:url value="/resources/js/jquery.elfinder.min.js"/>"></script>
	
		<script src="<c:url value="/resources/js/jquery.raty.min.js"/>"></script>
	
		<script src="<c:url value="/resources/js/jquery.iphone.toggle.js"/>"></script>
	
		<script src="<c:url value="/resources/js/jquery.uploadify-3.1.min.js"/>"></script>
	
		<script src="<c:url value="/resources/js/jquery.gritter.min.js"/>"></script>
	
		<script src="<c:url value="/resources/js/jquery.imagesloaded.js"/>"></script>
	
		<script src="<c:url value="/resources/js/jquery.masonry.min.js"/>"></script>
	
		<script src="<c:url value="/resources/js/jquery.knob.modified.js"/>"></script>
	
		<script src="<c:url value="/resources/js/jquery.sparkline.min.js"/>"></script>
	
		<script src="<c:url value="/resources/js/counter.js"/>"></script>
	
		<script src="<c:url value="/resources/js/retina.js"/>"></script>

		<script src="<c:url value="/resources/js/custom.js"/>"></script>
	<!-- end: JavaScript-->

<script>
    /*jslint unparam: true, regexp: true */
    /*global window, $ */
    $(function () {
        'use strict';
        // TODO Fix this URL!!!
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
//                        selectElement('.imageKey').text(file.key);
//								$(options.imageKeyId).text(file.key);
                        $('#' + options.imageKeyId).attr('value', file.key);
                        // TODO Fix this hardcoded URL!!!
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
                    imageSectionId: 'frontLarge',
                    imageKeyId: 'frontLargeImageKey'
                }
        );
//        imageUpload(
//                {
//                    imageSectionId: 'frontSmall',
//                    imageKeyId: 'frontSmallImageKey'
//                }
//        );
    });
</script>
</body>

</html>