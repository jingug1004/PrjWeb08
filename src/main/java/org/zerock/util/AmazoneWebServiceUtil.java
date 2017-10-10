/**
 * Created by macbookpro on 2017. 6. 1. PM 6:49
 * Project / org.zerock.util
 * No pain, No gain!
 * What :
 * Why :
 * How :
 *
 * @author 개발팀 김진국
 * @version 1.0
 * @see
 * @since 2017/04/11
 * << 개정이력(Modification Information) >>
 * <p>
 * 수정일      수정자          수정내용
 * -------    --------    ---------------------------
 * 2017/04/21  김진국          최초 생성
 */

package org.zerock.util;

import com.amazonaws.AmazonServiceException;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.PutObjectRequest;
import org.imgscalr.Scalr;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

@Service
public class AmazoneWebServiceUtil {
    private static final String BUCKET_NAME = "elasticbeanstalk-ap-northeast-2-571640317946";
    private static final String ACCESS_KEY = "AKIAIWP6L3M37KKV2S3A";
    private static final String SECRET_KEY = "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";
    private AmazonS3 amazonS3;

    public AmazoneWebServiceUtil() {
        AWSCredentials awsCredentials = new BasicAWSCredentials(ACCESS_KEY, SECRET_KEY);
        amazonS3 = new AmazonS3Client(awsCredentials);
    }

    public static final Logger logger = LoggerFactory.getLogger(AmazoneWebServiceUtil.class);


    public static String toUploadFile(String uploadPath,
                                    String originalName,
                                    byte[] fileData) throws Exception {

        logger.info("");

        UUID uuid = UUID.randomUUID();
        String savedName = uuid.toString() + "_" + originalName;
        String savedPath = calcPath(uploadPath);
        File target = new File(uploadPath + savedPath, savedName);

        FileCopyUtils.copy(fileData, target);

        String formatName = originalName.substring(originalName.lastIndexOf(".") + 1);

        String uploadedFileName = null;

        if (MediaUtils.getMediaType(formatName) != null) {
            uploadedFileName = makeThumbnail(uploadPath, savedPath, savedName);
        } else {
            uploadedFileName = makeIcon(uploadPath, savedPath, savedName);
        }
        return uploadedFileName;
    }


    // Todo : 파일 올리기 구현 - input 박스로도 추가
    public void uploadFile(File file) {

        if (amazonS3 != null) {
            try {
                PutObjectRequest putObjectRequest =
                        new PutObjectRequest(BUCKET_NAME + "/Volumes/noname/zzz"/*sub directory*/, file.getName(), file);
                putObjectRequest.setCannedAcl(CannedAccessControlList.PublicRead);      // file permission
                amazonS3.putObject(putObjectRequest);                                   // upload file

            } catch (AmazonServiceException ase) {
                ase.printStackTrace();
            } finally {
                amazonS3 = null;
            }
        }
    }

    public void uploadFileNewFolder(File file) {
        if (amazonS3 != null) {
            try {
                PutObjectRequest putObjectRequest =
//                        new PutObjectRequest(BUCKET_NAME + "/Volumes"/*sub directory*/, file.getName(), file);
                        new PutObjectRequest(BUCKET_NAME + "/NewFolder"/*sub directory*/, file.getName(), file);
                putObjectRequest.setCannedAcl(CannedAccessControlList.PublicRead); // file permission
                amazonS3.putObject(putObjectRequest); // upload file

            } catch (AmazonServiceException ase) {
                ase.printStackTrace();
            } finally {
                amazonS3 = null;
            }
        }
    }

    private static String calcPath(String uploadPath) {

        Calendar calendar = Calendar.getInstance();
        String yearPath = File.separator + calendar.get(Calendar.YEAR);
        String monthPath = yearPath + File.separator +
                new DecimalFormat("00").format(calendar.get(Calendar.MONTH) + 1);
        String datePath = monthPath + File.separator +
                new DecimalFormat("00").format(calendar.get(Calendar.DATE));

        return datePath;
    }

    private static String makeThumbnail(String uploadPath, String path, String fileName) throws IOException {

        logger.info("");

        BufferedImage sourceImg = ImageIO.read(new File(uploadPath + path, fileName));
        BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 100);

        String thumbnailName = uploadPath + path + File.separator + "s_" + fileName;

        File newFile = new File(thumbnailName);

        String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);

        ImageIO.write(destImg, formatName.toUpperCase(), newFile);

        return thumbnailName.substring(uploadPath.length()).replace(File.separatorChar, '/');
    }

    private static String makeIcon(String uploadPath, String path, String fileName) throws Exception {

        String iconName = uploadPath + path + File.separator + fileName;

        return iconName.substring(uploadPath.length()).replace(File.separatorChar, '/');

    }

//    public void uploadFile(File file) {
//        if (amazonS3 != null) {
//            try {
//                PutObjectRequest putObjectRequest =
//                        new PutObjectRequest(BUCKET_NAME + "/Volumes/noname/zzz"/*sub directory*/, file.getName(), file);
//                putObjectRequest.setCannedAcl(CannedAccessControlList.PublicRead);      // file permission
//                amazonS3.putObject(putObjectRequest);                                   // upload file
//
//            } catch (AmazonServiceException ase) {
//                ase.printStackTrace();
//            } finally {
//                amazonS3 = null;
//            }
//        }
//    }
//
//    public void uploadFileNewFolder(File file) {
//        if (amazonS3 != null) {
//            try {
//                PutObjectRequest putObjectRequest =
////                        new PutObjectRequest(BUCKET_NAME + "/Volumes"/*sub directory*/, file.getName(), file);
//                        new PutObjectRequest(BUCKET_NAME + "/NewFolder"/*sub directory*/, file.getName(), file);
//                putObjectRequest.setCannedAcl(CannedAccessControlList.PublicRead); // file permission
//                amazonS3.putObject(putObjectRequest); // upload file
//
//            } catch (AmazonServiceException ase) {
//                ase.printStackTrace();
//            } finally {
//                amazonS3 = null;
//            }
//        }
//    }
}