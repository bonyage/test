package com.toptier.admin.mvc.controller;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;

import org.springframework.beans.factory.annotation.Autowired;
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

import com.google.common.collect.ImmutableMap;
import com.toptier.service.ProductService;

/**
 * Created by wwong on 15-09-3.
 */
@Controller
@RequestMapping("/images")
public class ImageController {
	static final Logger LOGGER = Logger.getLogger(ImageController.class.getName());
    
	@Autowired
	ProductService productService;

    @RequestMapping(value = "/{imageKey:.+}", method = RequestMethod.GET)
    @ResponseBody
    public ResponseEntity<byte[]> downloadImage(@PathVariable("imageKey") String imageKey) throws IOException {
        byte[] imageContent;
        try {
            imageContent = productService.getProductImage(imageKey);
        } catch (FileNotFoundException e) {
        	LOGGER.log(Level.SEVERE, "error serving image for key: "+imageKey, e);
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
    }


    private String save(byte[] imageAsBytes) throws IOException {
        // TODO Support different image types.
        String uuid = UUID.randomUUID().toString() + ".jpg";
        
        productService.saveProductImage(uuid, imageAsBytes);
        return uuid;
    }

}
