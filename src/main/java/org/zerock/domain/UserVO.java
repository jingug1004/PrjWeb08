package org.zerock.domain;

import java.sql.Timestamp;

/**
 * Created by macbookpro on 2017. 2. 19. PM 2:09
 * sp4chap11-Project / org.zerock.domain
 * No pain, No gain!
 */


public class UserVO {

//    @NotEmpty
//    @Size(min = 4, max = 12)
    private String uid;

//    @NotEmpty @Size(min = 4, max = 12)
    private String upw;

//    @NotEmpty @Size(min = 4, max = 12)
    private String upwconfirm;

//    @NotEmpty
    private String uname;

    private int upoint;

//    @Email
    private String email;

//    @NotEmpty
    private String nickname;

    private String uday;
    private String uyear;

    private String umonth;
    private String ugender;

    private Timestamp regdate;

    public UserVO () {

    }

    public UserVO(String uid, String upw, String upwconfirm, String uname, int upoint, String email, String nickname, String uday, String uyear, String umonth, String ugender) {
        this.uid = uid;
        this.upw = upw;
        this.upwconfirm = upwconfirm;
        this.uname = uname;
        this.upoint = upoint;
        this.email = email;
        this.nickname = nickname;
        this.uday = uday;
        this.uyear = uyear;
        this.umonth = umonth;
        this.ugender = ugender;
    }


    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getUpw() {
        return upw;
    }

    public void setUpw(String upw) {
        this.upw = upw;
    }

    public String getUpwconfirm() {
        return upwconfirm;
    }

    public void setUpwconfirm(String upwconfirm) {
        this.upwconfirm = upwconfirm;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public int getUpoint() {
        return upoint;
    }

    public void setUpoint(int upoint) {
        this.upoint = upoint;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getUday() {
        return uday;
    }

    public void setUday(String uday) {
        this.uday = uday;
    }

    public String getUyear() {
        return uyear;
    }

    public void setUyear(String uyear) {
        this.uyear = uyear;
    }

    public String getUmonth() {
        return umonth;
    }

    public void setUmonth(String umonth) {
        this.umonth = umonth;
    }

    public String getUgender() {
        return ugender;
    }

    public void setUgender(String ugender) {
        this.ugender = ugender;
    }

    public Timestamp getRegdate() {
        return regdate;
    }

    public void setRegdate(Timestamp regdate) {
        this.regdate = regdate;
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
                ", umonth='" + umonth + '\'' +
                ", ugender='" + ugender + '\'' +
                ", regdate=" + regdate +
                '}';
    }
}
