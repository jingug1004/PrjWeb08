package org.zerock.util;

import org.imgscalr.Scalr;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.FileCopyUtils;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

/**
 * Created by wtime on 2017-02-22. 오후 3:00
 * org.zerock.util / Web03
 * It's now or never!
 * What : 게시물 첨부파일 기능 중 전송된 파일의 저장의 파일 업로드용 클래스 설계 선언의 UploadFileUtils.
 * Why : 특정 폴더에만 파일 업로드로 기능 저하 예방. 중복된 파일 이름 예방. 서버에서 최소한의 데이터를 전송하기 위하여.
 * How : 자동적인 폴더 생성 가능하게. 파일 저장은 UUID를 이용해서 처리. 썸네일 이미지를 생성하는 기능.
 * UploadFileUtils는 static으로 구성된 클래스 메소드들만을 가지기 때문에 그 자체로 테스트가 가능.
 */
public class UploadFileUtils {

    /**
     * The constant logger.
     */
    public static final Logger logger =
            LoggerFactory.getLogger(UploadFileUtils.class);

    /**
     * UploadFileUtils는 스프링의 FileCopyUtils(org.springframework.util)와 유사하게 static 기능을 호출해서 파일을 업로드 할 수 있도록 설계.
     * 파일을 업로드하기 위해서는 적어도 다음과 같은 3개의 데이터가 필요 - 파일의 저장경로(uploadPath), 원본 파일의 이름(originalName), 파일 데이터(byte[]).
     * 별도의 데이터가 보관될 필요가 없기 때문에 static으로 설계.
     *
     * @param uploadPath   the upload path
     * @param originalName the original name
     * @param fileData     the file data
     * @return the string
     * @throws Exception the exception
     */
    public static String uploadFile(String uploadPath,
                                    String originalName,
                                    byte[] fileData) throws Exception {

        UUID uid = UUID.randomUUID();

        String savedName = uid.toString() + "_" + originalName;

        String savedPath = calcPath(uploadPath);
        // 저장될 경로를 계산.

        File target = new File(uploadPath + savedPath, savedName);

        FileCopyUtils.copy(fileData, target);
        // 원본 파일을 저장.

        String formatName = originalName.substring(originalName.lastIndexOf(".") + 1);
        // String formatName은 원본 파일의 확장자를 의미. 이를 이용해서 MediaUtils 클래스의
        // getMediaType()을 이용해서 이미지 파일인 경우와 그렇지 않은 경우를 나누어 처리.

        String uploadedFileName = null;

        if (MediaUtils.getMediaType(formatName) != null) {
            uploadedFileName = makeThumbnail(uploadPath, savedPath, savedName);
        } else {
            uploadedFileName = makeIcon(uploadPath, savedPath, savedName);
        }
        // 이미지 타입의 파일인 경우에는 썸네일을 생성, 그렇지 않은 경우에는 makeIcon()를 통해서 결과 창출

        return uploadedFileName;
    }

    private static String makeIcon(String uploadPath,
                                   String path,
                                   String fileName) throws Exception {
        // makeIcon()은 경로 처리를 하는 문자열의 치환용도에 불과

        String iconName = uploadPath + path + File.separator + fileName;

        return iconName.substring(uploadPath.length()).replace(File.separatorChar, '/');
    }

    // calcPath()의 리턴값은 최종 결과 폴더를 반환하는데 내부적으로 폴더를 생성해주는 기능이 필요하기 때문에
    // 기본적인 경로(uploadPath)를 파라미터로 전달받음.
    private static String calcPath(String uploadPath) {

        Calendar cal = Calendar.getInstance();

        String yearPath = File.separator + cal.get(Calendar.YEAR);

        String monthPath = yearPath + File.separator +
                new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);

        String datePath = monthPath + File.separator +
                new DecimalFormat("00").format(cal.get(Calendar.DATE));

        makeDir(uploadPath, yearPath, monthPath, datePath);

        return datePath;

    }

    // 디렉토리 만듬
    private static void makeDir(String uploadPath, String... paths) {

        if (new File(paths[paths.length - 1]).exists()) {
            return;
        }

        for (String path : paths) {

            File dirPath = new File(uploadPath + path);

            if (!dirPath.exists()) {
                dirPath.mkdir();
            }
        }
    }

    /**
     * BufferedImage는 실제 이미지가 아닌 메모리상의 이미지를 의미하는 객체 - 원본 파일을 메모리상으로 로딩 정해진 크기에 맞게 작은 이미지 파일에 원본 이미지 복사
     * 첨부 파일 밑 아이콘 표시
     *
     * @param uploadPath 썸네일을 생성하는 작업은 메소드의 파라미터에 사용된 기본경로(uploadPath)와 년/월/일 폴더(path), 현재 업로드 된 파일의 이름을 이용
     * @param path
     * @param fileName
     * @return 메소드의 리턴시 문자열을 치환하는 이유는 브라우저에서 윈도우의 경로로 사용하는 '원' 문자가 정상적인 경로로 인식되지 않기 때문에 '/'로 치환해 줌
     * @throws Exception
     */
    private static String makeThumbnail(String uploadPath,
                                        String path,
                                        String fileName) throws IOException {

        BufferedImage sourceImg =
                ImageIO.read(new File(uploadPath + path, fileName));

        BufferedImage destImg =
                Scalr.resize(sourceImg,
                        Scalr.Method.AUTOMATIC,
                        Scalr.Mode.FIT_TO_HEIGHT,
                        100);

        String thumbnailName =
                uploadPath + path + File.separator + "s_" + fileName;

        File newFile = new File(thumbnailName);

        String formatName =
                fileName.substring(fileName.lastIndexOf(".") + 1);

        ImageIO.write(destImg, formatName.toUpperCase(), newFile);

        return thumbnailName.substring(
                uploadPath.length()).replace(File.separatorChar, '/');

    }

}



