package org.zerock.domain;

import java.sql.Timestamp;

/**
 * Created by macbookpro on 2017. 2. 19. PM 2:09
 * sp4chap11-Project / org.zerock.domain
 * No pain, No gain!
 * What : AOP와 트랜잭션 처리를 위한 준비(테스트).
 * Why :
 * How :
 */


public class UserVO {

    // @NotEmpty
    // @Size(min = 4, max = 12)
    private String uid;

    // @NotEmpty @Size(min = 4, max = 12)
    private String upw;

    // @NotEmpty @Size(min = 4, max = 12)
    private String upwconfirm;

    // @NotEmpty
    private String uname;

    private int upoint;
    /*
    point 테이블(A): 잔액
    고객키      + balance point(B point - C point)
    ex) jingug1004 + 100
    */

    //    @Email
    private String email;

    //    @NotEmpty
    private String nickname;

    private String uday;
    private String uyear;

    private String delyn;
    private String ugender;

    private Timestamp regdate;

    private String regip;
    private String updip;

    /**
     * Instantiates a new User vo.
     */
    public UserVO() {

    }

    /**
     * UserTest
     *
     * @param uid        the uid
     * @param upw        the upw
     * @param upwconfirm the upwconfirm
     * @param uname      the uname
     * @param upoint     the upoint
     * @param email      the email
     * @param nickname   the nickname
     * @param uday       the uday
     * @param uyear      the uyear
     * @param delyn      the delyn
     * @param ugender    the ugender
     */
    public UserVO(String uid, String upw, String upwconfirm, String uname, int upoint, String email, String nickname, String uday, String uyear, String delyn, String ugender) {
        this.uid = uid;
        this.upw = upw;
        this.upwconfirm = upwconfirm;
        this.uname = uname;
        this.upoint = upoint;
        this.email = email;
        this.nickname = nickname;
        this.uday = uday;
        this.uyear = uyear;
        this.delyn = delyn;
        this.ugender = ugender;
    }


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
     * Gets upwconfirm.
     *
     * @return the upwconfirm
     */
    public String getUpwconfirm() {
        return upwconfirm;
    }

    /**
     * Sets upwconfirm.
     *
     * @param upwconfirm the upwconfirm
     */
    public void setUpwconfirm(String upwconfirm) {
        this.upwconfirm = upwconfirm;
    }

    /**
     * Gets uname.
     *
     * @return the uname
     */
    public String getUname() {
        return uname;
    }

    /**
     * Sets uname.
     *
     * @param uname the uname
     */
    public void setUname(String uname) {
        this.uname = uname;
    }

    /**
     * Gets upoint.
     *
     * @return the upoint
     */
    public int getUpoint() {
        return upoint;
    }

    /**
     * Sets upoint.
     *
     * @param upoint the upoint
     */
    public void setUpoint(int upoint) {
        this.upoint = upoint;
    }

    /**
     * Gets email.
     *
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * Sets email.
     *
     * @param email the email
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * Gets nickname.
     *
     * @return the nickname
     */
    public String getNickname() {
        return nickname;
    }

    /**
     * Sets nickname.
     *
     * @param nickname the nickname
     */
    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    /**
     * Gets uday.
     *
     * @return the uday
     */
    public String getUday() {
        return uday;
    }

    /**
     * Sets uday.
     *
     * @param uday the uday
     */
    public void setUday(String uday) {
        this.uday = uday;
    }

    /**
     * Gets uyear.
     *
     * @return the uyear
     */
    public String getUyear() {
        return uyear;
    }

    /**
     * Sets uyear.
     *
     * @param uyear the uyear
     */
    public void setUyear(String uyear) {
        this.uyear = uyear;
    }

    public String getDelyn() {
        return delyn;
    }

    public void setDelyn(String delyn) {
        this.delyn = delyn;
    }

    /**
     * Gets ugender.
     *
     * @return the ugender
     */
    public String getUgender() {
        return ugender;
    }

    /**
     * Sets ugender.
     *
     * @param ugender the ugender
     */
    public void setUgender(String ugender) {
        this.ugender = ugender;
    }

    /**
     * Gets regdate.
     *
     * @return the regdate
     */
    public Timestamp getRegdate() {
        return regdate;
    }

    /**
     * Sets regdate.
     *
     * @param regdate the regdate
     */
    public void setRegdate(Timestamp regdate) {
        this.regdate = regdate;
    }

    public String getRegip() {
        return regip;
    }

    public void setRegip(String regip) {
        this.regip = regip;
    }

    public String getUpdip() {
        return updip;
    }

    public void setUpdip(String updip) {
        this.updip = updip;
    }

    @Override
    public String toString() {
        return "UserVO{" +
                "uid='" + uid + '\'' +
                ", upw='" + upw + '\'' +
                ", upwconfirm='" + upwconfirm + '\'' +
                ", uname='" + uname + '\'' +
                ", upoint=" + upoint +
                ", email='" + email + '\'' +
                ", nickname='" + nickname + '\'' +
                ", uday='" + uday + '\'' +
                ", uyear='" + uyear + '\'' +
                ", delyn='" + delyn + '\'' +
                ", ugender='" + ugender + '\'' +
                ", regdate=" + regdate +
                ", regip='" + regip + '\'' +
                ", updip='" + updip + '\'' +
                '}';
    }
}
