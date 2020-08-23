package org.zerock.awsController;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.zerock.util.AmazoneWebServiceUtil;
import org.zerock.util.MediaUtils;

import javax.annotation.Resource;
import javax.inject.Inject;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.UUID;

/**
 * Created by 김진국 on 2017-08-30 오전 11:30
 * untitled2 / org.zerock.awsController
 * No pain, No gain!
 * What :
 * Why :
 * How :
 * << 개정이력(Modification Information) >>
 * 수정일      수정자          수정내용
 * -------    --------    ---------------------------
 * 2017-08-30 김진국          최초 생성
 * 2017/05/27  이몽룡          인증이 필요없는 URL을 패스하는 로직 추가
 *
 * @author 개발팀 김진국
 * @version 1.0
 * @see
 * @since 2017/04/10
 */

@Controller
@RequestMapping(value = "/s3/*")
public class S3Controller {

    private static final Logger logger = LoggerFactory.getLogger(S3Controller.class);

    @Resource(name = "uploadPath")
    private String uploadPath;

    @Inject
    private AmazoneWebServiceUtil amazoneWebServiceUtil;

    private String uploadFile(String originalName, byte[] fileData) throws Exception {

        logger.info("");

        UUID uuid = UUID.randomUUID();
        String savedName = uuid.toString() + "_" + originalName;
        File target = new File(uploadPath, savedName);
        FileCopyUtils.copy(fileData, target);
        return savedName;
    }

//    @RequestMapping(value = "/s3uploadAjax", method = RequestMethod.GET)
//    public void s3uploadAjax() {}

    @ResponseBody
    @RequestMapping(value = "/s3uploadAjax", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
    public ResponseEntity<String> s3uploadAjax(MultipartFile multipartFile) {

        logger.info(" lllll~~~~~ multipartFile.toString() : " + multipartFile.toString() + " lllll~~~~~ ");

//        return new ResponseEntity<>(
//                AmazoneWebServiceUtil.toUploadFile(uploadPath,
//                        multipartFile.getOriginalFilename(),
//                        multipartFile.getBytes()), HttpStatus.CREATED);
        return null;
    }

    @ResponseBody
    @RequestMapping(value = "/displayFile")
    public ResponseEntity<byte[]> displayFile(String fileName) throws Exception {

        InputStream inputStream = null;
        ResponseEntity<byte[]> entity = null;

        try {
            String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);

            MediaType mediaType = MediaUtils.getMediaType(formatName);

            HttpHeaders httpHeaders = new HttpHeaders();

            inputStream = new FileInputStream(uploadPath + fileName);

            if(mediaType != null) {
                httpHeaders.setContentType(mediaType);
            } else {
                fileName = fileName.substring(fileName.indexOf("_") + 1);
                httpHeaders.setContentType(MediaType.APPLICATION_OCTET_STREAM);
                httpHeaders.add("Content-Disposition", "attachment; filename=\"" +
                new String(fileName.getBytes(StandardCharsets.UTF_8), StandardCharsets.ISO_8859_1) + "\"");
                logger.info("");
            }

            entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(inputStream), httpHeaders, HttpStatus.CREATED);

        } catch (Exception e) {
            e.printStackTrace();
            entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
        } finally {
            inputStream.close();
        }
        return entity;

    }


    @RequestMapping(value = "/view", method = RequestMethod.GET)
    public String viewTest() {

        logger.info("lll~~~ postTest 01  lll~~~");

        String fileName = "c:\\02.jpg";                 // 올릴 파일명.
        File tempFile = new File(fileName);

        amazoneWebServiceUtil.uploadFile(tempFile);     // 올릴 폴더 몇 경로.

        logger.info("lll~~~ postTest 02 lll~~~");

        return "aws/s3/viewTest";
    }

    @RequestMapping(value = "/inputFile", method = RequestMethod.POST)
    public void inputFile(File file, Model model) {

        logger.info("lll~~~ inputFile 01  lll~~~");

//        String fileName =
        String fileName = file.getName();
        File tempFile = new File(fileName);

        amazoneWebServiceUtil.uploadFile(tempFile);

        logger.info("lll~~~ inputFile 01 lll~~~");
    }


//    @RequestMapping(value = "/view02", method = RequestMethod.GET)
//    public String viewTest02() {
//
//        logger.info("lll~~~ postTest 01-02  lll~~~");
//
//        String fileName = "c:\\eng02복사본.txt";
//        File tempFile = new File(fileName);
//
//        amazoneWebServiceUtil.uploadFileNewFolder(tempFile);
//
//        logger.info("lll~~~ postTest 02-02 lll~~~");
//
//        return "aws/s3/viewTest";
//    }

    @RequestMapping(value = "/post", method = RequestMethod.POST)
    public void postTest() {

        //tests

    }

}