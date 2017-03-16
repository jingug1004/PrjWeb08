package org.zerock.dto;

/**
 * Created by macbookpro on 2017. 2. 26. PM 5:22
 * sp4chap11-Project / org.zerock.dto
 * No pain, No gain!
 * What : LoginDTO 클래스
 * Why : 화면에서 전달하는 데이터를 수집하는 용도
 * How : HttpSession 객체를 이용해서 사용자의 정보를 보관하고, 필요한 경우 사용하거나 수정하는 방식
 */


public class LoginDTO {

    private String uid;
    private String upw;
    private boolean useCookie;

    /**
     * Gets uid.
     *
     * @return the uid
     */
    public String getUid() {
        return uid;
    }

    /**
     * Sets uid.
     *
     * @param uid the uid
     */
    public void setUid(String uid) {
        this.uid = uid;
    }

    /**
     * Gets upw.
     *
     * @return the upw
     */
    public String getUpw() {
        return upw;
    }

    /**
     * Sets upw.
     *
     * @param upw the upw
     */
    public void setUpw(String upw) {
        this.upw = upw;
    }

    /**
     * Is use cookie boolean.
     *
     * @return the boolean
     */
    public boolean isUseCookie() {
        return useCookie;
    }

    /**
     * Sets use cookie.
     *
     * @param useCookie the use cookie
     */
    public void setUseCookie(boolean useCookie) {
        this.useCookie = useCookie;
    }

    @Override
    public String toString() {
        return "LoginDTO{" +
                "uid='" + uid + '\'' +
                ", upw='" + upw + '\'' +
                ", useCookie=" + useCookie +
                '}';
    }

}
