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
import java.nio.charset.StandardCharsets;
import java.util.UUID;

/**
 * Created by wtime on 2017-02-20. 오후 2:18
 * org.zerock.controller / Web Ex02
 * Better late than never!
 * What : 게시물 첨부파일 기능을 가진 스프링 MVC의 파일 업로드할 수 있는 UploadController.class
 * Why :
 * How :
 * Resource(name = "uploadPath") - servlet-context.xml의 일부
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
    public void uploadForm() {}

    /**
     * Upload form string. 테스트용
     *
     * @param file  MultipartFile은 POST 방식으로 들어온 파일 데이터를 의미
     * @param model the model
     * @return /views/uploadResult.jsp를 이용해서 결과를 보여줌
     * @throws Exception the exception
     */
    @RequestMapping(value = "/uploadForm", method = RequestMethod.POST)
    public String uploadForm(MultipartFile file, Model model) throws Exception {
        String savedName = uploadFile(file.getOriginalFilename(), file.getBytes());
        model.addAttribute("savedName", savedName);
        return "uploadResult";
    }

    /**
     * Upload ajax. 하나의 JSP 페이지를 보여주도록 작성
     */
    @RequestMapping(value = "/uploadAjax", method = RequestMethod.GET)
    public void uploadAjax() {}

    /**
     * Upload File 원본 파일의 이름과 파일 데이터를 byte[]로 변환한 정보를 파라미터로 처리해서 실제로 파일을 업로드
     */
    private String uploadFile(String originalName, byte[] fileData) throws Exception {

        UUID uid = UUID.randomUUID();

        String savedName = uid.toString() + "_" + originalName;

        File target = new File(uploadPath, savedName);

        FileCopyUtils.copy(fileData, target);

        return savedName;

    }


    /**
     * Upload ajax response entity. 실제로 파일을 업로드
     * RequestMapping 속성으로 produces 속성을 지정하고 있는데 이것은 한국어를 정상적으로 전송하기 위한 간단한 설정
     *
     * @param file the file
     * @return HttpStatus.CREATED - 원하는 리소스가 정상적으로 생성되었다는 상태코드(원한다면 HttpStatus.OK를 이용해도 무방)
     * 최종적인 리턴값은 내부적으로 UploadFileUtils의 uploadFile()을 사용하도록 수정
     * @throws Exception the exception
     */
    @ResponseBody
    @RequestMapping(value = "/uploadAjax", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
    public ResponseEntity<String> uploadAjax(MultipartFile file) throws Exception {

        logger.info("lll~~~ originalName: " + file.getOriginalFilename() + " lll~~~");
        logger.info("lll~~~ size: " + file.getSize() + " lll~~~");
        logger.info("lll~~~ contentType: " + file.getContentType() + " lll~~~");

        return new ResponseEntity<>(
                UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()), HttpStatus.CREATED);
    }

    /**
     * displayFile()은 파라미터로 브라우저에서 전송받기를 원하는 파일의 이름을 '/년/월/일/파일명' 형식으로 받음.
     * 메소드의 선언부에는 @ResponseBody를 이용해서 byte[] 데이터가 그대로 전송될 것임을 명시.
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
            // 파일 이름에서 확장자를 추출하고, 이미지 타입의 파일인 경우는 적절한 MIME 타입을 지정.

            HttpHeaders headers = new HttpHeaders();

            in = new FileInputStream(uploadPath + fileName);

            if (mType != null) {
                headers.setContentType(mType);
            } else {

                fileName = fileName.substring(fileName.indexOf("_") + 1);
                headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
                // 이미지가 아닌 경우에는 MIME 타입을 다운로드 용으로 사용되는 'application/octet-stream'으로 지정.
                // 브라우저는 이 MIME 타입을 보고 사용자에게 자동으로 다운로드 창을 열어줌.
                headers.add("Content-Disposition", "attachment; filename=\"" +
                        new String(fileName.getBytes(StandardCharsets.UTF_8), StandardCharsets.ISO_8859_1) + "\"");
                        // 다운로드할 때 사용자에게 보이는 파일의 이름이므로 한글 처리를 해서 전송.
                        // 한글 파일의 경우 다운로드하면 파일의 이름이 깨져서 나오기 때문에 반드시 인코딩 처리를 할 필요가 있음.
            }

            entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in),
                    // IOUtils.toByteArray() - 실제로 데이터를 읽는 부분,
                    // commons 라이브러리의 기능을 활용해서 대상 파일에서 데이터를 읽어냄.
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
     * deleteFile()은 파라미터로 삭제할 파일의 이름을 받아들임. 이미지의 경우 썸네일의 이름.
     * 이미지 파일이 확인되면 원본 파일을 먼저 삭제하고, 이후에 파일을 삭제하는 방식으로 작성.
     *
     * @param fileName 일반 파일은 실제 이름.
     * @return
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
            new File(uploadPath + (front + end).replace('/', File.separatorChar)).delete();
        }

        new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();

        return new ResponseEntity<String>("deleted", HttpStatus.OK);
    }

    /**
     * 게시물의 삭제 처리 시 기존의 첨부파일을 함께 삭제해 주는 것이 좋기 때문에 UploadController를 이용해서 첨부파일에 대한 삭제 작업을 처리.
     *
     * @param files 첨부 파일의 삭제 작업 처리는 여러 개의 파일 이름을 받을 수 있도록 String[]로 작성.
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