package org.zerock.controller;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.zerock.util.MediaUtils;
import org.zerock.util.UploadFileUtils;

import javax.annotation.Resource;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.UUID;

/**
 * Created by wtime on 2017-02-20. 오후 2:18
 * org.zerock.controller / Web Ex02
 * Better late than never!
 * What : 게시물 첨부파일 기능을 가진 스프링 MVC의 파일 업로드할 수 있는 UploadController.class
 * Why :
 * How :
 *
 */
@Controller
public class UploadController {

    private static final Logger logger =
            LoggerFactory.getLogger(UploadController.class);

    @Resource(name = "uploadPath")
    private String uploadPath;


    /**
     * Upload form. 테스트용 /views/uploadForm.jsp
     */
    @RequestMapping(value = "/uploadForm", method = RequestMethod.GET)
    public void uploadForm() {

    }

    /**
     * Upload form string. 테스트용
     *
     * @param file  MultipartFile은 POST 방식으로 들어온 파일 데이터를 의미
     * @param model the model
     * @return the string
     * @throws Exception the exception
     */
    @RequestMapping(value = "/uploadForm", method = RequestMethod.POST)
    public String uploadForm(MultipartFile file, Model model) throws Exception {

        logger.info("lll~~~ originalName: " + file.getOriginalFilename() + " lll~~~");
        logger.info("lll~~~ size: " + file.getSize() + " lll~~~");
        logger.info("lll~~~ contentType: " + file.getContentType() + " lll~~~");

        String savedName = uploadFile(file.getOriginalFilename(), file.getBytes());

        model.addAttribute("savedName", savedName);

        return "uploadResult";
    }

    /**
     * Upload ajax.
     */
    @RequestMapping(value = "/uploadAjax", method = RequestMethod.GET)
    public void uploadAjax() {

    }

    private String uploadFile(String originalName, byte[] fileData) throws Exception {

        UUID uid = UUID.randomUUID();

        String savedName = uid.toString() + "_" + originalName;

        File target = new File(uploadPath, savedName);

        FileCopyUtils.copy(fileData, target);

        return savedName;

    }


    /**
     * Upload ajax response entity.
     *
     * @param file the file
     * @return the response entity
     * @throws Exception the exception
     */
    @ResponseBody
    @RequestMapping(value = "/uploadAjax",
                    method = RequestMethod.POST,
                    produces = "text/plain;charset=UTF-8")
    public ResponseEntity<String> uploadAjax(MultipartFile file) throws Exception {

        logger.info("lll~~~ originalName: " + file.getOriginalFilename() + " lll~~~");
        logger.info("lll~~~ size: " + file.getSize() + " lll~~~");
        logger.info("lll~~~ contentType: " + file.getContentType() + " lll~~~");

        return new ResponseEntity<>(
                UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()),
                HttpStatus.CREATED);
    }


    /**
     * Display file response entity.
     *
     * @param fileName the file name
     * @return the response entity
     * @throws Exception the exception
     */
    @ResponseBody
    @RequestMapping("/displayFile")
    public ResponseEntity<byte[]> displayFile(String fileName) throws Exception {

        InputStream in = null;
        ResponseEntity<byte[]> entity = null;

        logger.info("lll~~~ FILE NAME: " + fileName + " lll~~~");

        try {

            String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);

            MediaType mType = MediaUtils.getMediaType(formatName);

            HttpHeaders headers = new HttpHeaders();

            in = new FileInputStream(uploadPath + fileName);

            if (mType != null) {
                headers.setContentType(mType);
            } else {

                fileName = fileName.substring(fileName.indexOf("_") + 1);
                headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
                headers.add("Content-Disposition", "attachment; filename=\"" +
                        new String(fileName.getBytes("UTF-8"), "ISO-8859-1") + "\"");
            }

            entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in),
                    headers,
                    HttpStatus.CREATED);
        } catch (Exception e) {
            e.printStackTrace();
            entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
        } finally {
            in.close();
        }
        return entity;
    }

    /**
     * Delete file response entity.
     *
     * @param fileName the file name
     * @return the response entity
     */
    @ResponseBody
    @RequestMapping(value = "/deleteFile", method = RequestMethod.POST)
    public ResponseEntity<String> deleteFile(String fileName) {

        logger.info("lll~~~ delete file: " + fileName + " lll~~~");

        String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);

        MediaType mType = MediaUtils.getMediaType(formatName);

        if (mType != null) {

            String front = fileName.substring(0, 12);
            String end = fileName.substring(14);
            new File(uploadPath + (front + end)
                    .replace('/', File.separatorChar)).delete();
        }

        new File(uploadPath + fileName
                .replace('/', File.separatorChar)).delete();


        return new ResponseEntity<String>("deleted", HttpStatus.OK);
    }

    /**
     * Delete file response entity.
     *
     * @param files the files
     * @return the response entity
     */
    @ResponseBody
    @RequestMapping(value = "/deleteAllFiles", method = RequestMethod.POST)
    public ResponseEntity<String> deleteFile(@RequestParam("files[]") String[] files) {

        logger.info("lll~~~ delete all files: " + files + " lll~~~");

        if (files == null || files.length == 0) {
            return new ResponseEntity<String>("deleted", HttpStatus.OK);
        }

        for (String fileName : files) {
            String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);

            MediaType mType = MediaUtils.getMediaType(formatName);

            if (mType != null) {

                String front = fileName.substring(0, 12);
                String end = fileName.substring(14);
                new File(uploadPath + (front + end).replace('/', File.separatorChar)).delete();
            }

            new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();

        }
        return new ResponseEntity<String>("deleted", HttpStatus.OK);
    }

}
//  @ResponseBody
//  @RequestMapping(value = "/uploadAjax",
//                 method = RequestMethod.POST,
//                 produces = "text/plain;charset=UTF-8")
//  public ResponseEntity<String> uploadAjax(MultipartFile file) throws Exception {
//
//    logger.info("originalName: " + file.getOriginalFilename());
//    logger.info("size: " + file.getSize());
//    logger.info("contentType: " + file.getContentType());
//
//    return
//        new ResponseEntity<>(file.getOriginalFilename(), HttpStatus.CREATED);
//  }

// @RequestMapping(value = "/uploadForm", method = RequestMethod.POST)
// public void uploadForm(MultipartFile file, Model model) throws Exception {
//
// logger.info("originalName: " + file.getOriginalFilename());
// logger.info("size: " + file.getSize());
// logger.info("contentType: " + file.getContentType());
//
// String savedName = uploadFile(file.getOriginalFilename(), file.getBytes());
//
// model.addAttribute("savedName", savedName);
//
// }
//
// private String uploadFile(String originalName, byte[] fileData)throws
// Exception{
//
// UUID uid = UUID.randomUUID();
//
// String savedName = uid.toString() + "_"+ originalName;
//
// File target = new File(uploadPath,savedName);
//
// FileCopyUtils.copy(fileData, target);
//
// return savedName;
//
// }