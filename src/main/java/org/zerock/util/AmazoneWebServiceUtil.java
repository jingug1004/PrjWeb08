/**
 * Created by macbookpro on 2017. 6. 1. PM 6:49
 * Project / org.zerock.util
 * No pain, No gain!
 * What :
 * Why :
 * How :
 *
 * @author   개발팀 김진국
 * @version  1.0
 * @see
 * @since    2017/04/11
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자          수정내용
 *  -------    --------    ---------------------------
 *  2017/04/21  김진국          최초 생성
 *
 */

package org.zerock.util;

import com.amazonaws.AmazonServiceException;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.PutObjectRequest;
import org.springframework.stereotype.Service;

import java.io.File;

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

    // Todo : 파일 올리기 구현 - input 박스로도 추가
    public void uploadFile(File file) {
        if (amazonS3 != null) {
            try {
                PutObjectRequest putObjectRequest =
                        new PutObjectRequest(BUCKET_NAME + "/Volumes/noname/zzz"/*sub directory*/, file.getName(), file);
                putObjectRequest.setCannedAcl(CannedAccessControlList.PublicRead); // file permission
                amazonS3.putObject(putObjectRequest); // upload file

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
}