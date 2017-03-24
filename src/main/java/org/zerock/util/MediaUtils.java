package org.zerock.util;

import org.springframework.http.MediaType;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by macbookpro on 2017. 2. 24. AM 10:02
 * sp4chap11-Project / org.zerock.util
 * No pain, No gain!
 * What : 게시물 첨부파일 기능 중 전송된 이미지 파일의 타입을 정의하는 MediaUtils
 * Why : 저장한 파일이 이미지 타입의 파일이라면 이미지 타입을 식별할 수 있는 기능을 별도의 클래스로 작성
 * How : MediaUtils는 확장자를 가지고 이미지 타입인지를 판단해주는 역할 - 별도의 클래스로 구성한 이유는 브라우저에서 파일을 다운로드 할 거인지, 보여줄 것인지를 결정하기 위해서
 */


public class MediaUtils {

    private static Map<String, MediaType> mediaMap;

    static {

        mediaMap = new HashMap<String, MediaType>();
        mediaMap.put("JPG", MediaType.IMAGE_JPEG);
        mediaMap.put("JPEG", MediaType.IMAGE_JPEG);
        mediaMap.put("GIF", MediaType.IMAGE_GIF);
        mediaMap.put("PNG", MediaType.IMAGE_PNG);

    }

    /**
     * Gets media type. private static Map String, MediaType mediaMap; 의 Getter 메소드
     *
     * @param type the type
     * @return the media type
     */
    public static MediaType getMediaType(String type) {

        return mediaMap.get(type.toUpperCase());
    }

}