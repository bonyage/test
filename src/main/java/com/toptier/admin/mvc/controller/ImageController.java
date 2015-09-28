package com.toptier.admin.mvc.controller;

import com.google.common.collect.ImmutableMap;
import com.google.common.io.ByteStreams;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * Created by wwong on 15-09-3.
 */
@Controller
@RequestMapping("/images")
public class ImageController {

    private final String imageStoreRoot = "/Users/wwong/tmp/oz180/images/";

    @RequestMapping(value = "/{imageKey}", method = RequestMethod.GET)
    @ResponseBody
    public ResponseEntity<byte[]> downloadImage(@PathVariable("imageKey") String imageKey) throws IOException {
        byte[] imageContent;
        try {
            imageContent = retrieve(imageKey);
        } catch (FileNotFoundException e) {
            // TODO Deal with image file not file.
            e.printStackTrace();
            throw e;
        }

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.IMAGE_JPEG);
        headers.setContentLength(imageContent.length);
        return new ResponseEntity<>(imageContent, headers, HttpStatus.OK);
    }

    @RequestMapping(value = "/", method = RequestMethod.POST)
    @ResponseBody
    public Map<Object, Object> uploadImage(@RequestParam("imageFile") MultipartFile imageFile) throws IOException {
        String key = save(imageFile.getBytes());
        Map<Object, Object> f = ImmutableMap.builder().put("name", "someName").put("size", 123456).put("key", key).build();
        List<Map<Object, Object>> imageFileDetails = new ArrayList<>();
        imageFileDetails.add(f);
        return ImmutableMap.builder().put("files", imageFileDetails).build();
//        return ImmutableMap.builder().put("files", Lists.newArrayList(f)).build();
    }

    private byte[] retrieve(String imageKey) throws IOException {
        String fileName = convertToImageFileName(imageKey);
        try (
                InputStream inStream = new FileInputStream(fileName);
                ByteArrayOutputStream outStream = new ByteArrayOutputStream()
        ) {
            ByteStreams.copy(inStream, outStream);
            return outStream.toByteArray();
        }
    }

    private String save(byte[] imageAsBytes) throws IOException {
        // TODO Support different image types.
        String uuid = UUID.randomUUID().toString();
        String fileName = convertToImageFileName(uuid);
        try (
                InputStream inStream = new ByteArrayInputStream(imageAsBytes);
                OutputStream outStream = new FileOutputStream(fileName)
        ) {
            ByteStreams.copy(inStream, outStream);
        }

        return uuid;
    }

    private String convertToImageFileName(String uuid) {
        return imageStoreRoot + uuid;
    }
}
