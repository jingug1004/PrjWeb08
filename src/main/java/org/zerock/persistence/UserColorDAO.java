package org.zerock.persistence;

/**
 * Created by macbookpro on 2017. 10. 29. PM 7:37
 * sp4chap11-Project / org.zerock.persistence
 * No pain, No gain!
 * What : UserColorDAO 인터페이스
 * Why :
 * How :
 */


public interface UserColorDAO {

    public int userColorInputGET(String userColor) throws Exception;

    public void userColorInputTotalUpd(int userColorNum, String userColor) throws Exception;

    public void totalColorPostNumUPD(int getTotalPostNumByColor, String userColor) throws Exception;

    public void totalColorReplyNumUPD(int getTotalReplyNumByColor, String userColor) throws Exception;

}
