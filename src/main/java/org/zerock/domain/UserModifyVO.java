package org.zerock.domain;

import java.sql.Timestamp;

/**
 * Created by EMIYA on 2018. 5. 12. PM 21:043
 * sp4chap11-Project / org.zerock.domain
 * No pain, No gain!
 * What : 유저 정보 변경시 기록 남길 VO.
 * Why :
 * How :
 */


public class UserModifyVO {

    private String modid;
    private String modupw;
    private String modupwconf;
    private String modrespectname;
    private int modupoint;
    private String modemail;
    private String modnickname;
    private String modcolor;
    private String moddelyn;
    private String modtrendency;
    private Timestamp modregdate;
    private String modregip;                        // 최초 회원가입 등록시 아이피
    private String modblindip;                      // 회원정보 변경시 아이피
    private int modtpost;
    private int modtreply;
    private int modtgood;
    private int modtbad;
    private int modtspam;
    private int modutotallevel;                    // 회원의 전체 순위 Lv.0 ~ Lv.100
    private int moducolorlevel;                    // 회원의 칼라 순위 Lv.0 ~ Lv.100

    public String getModid() {
        return modid;
    }

    public void setModid(String modid) {
        this.modid = modid;
    }

    public String getModupw() {
        return modupw;
    }

    public void setModupw(String modupw) {
        this.modupw = modupw;
    }

    public String getModupwconf() {
        return modupwconf;
    }

    public void setModupwconf(String modupwconf) {
        this.modupwconf = modupwconf;
    }

    public String getModrespectname() {
        return modrespectname;
    }

    public void setModrespectname(String modrespectname) {
        this.modrespectname = modrespectname;
    }

    public int getModupoint() {
        return modupoint;
    }

    public void setModupoint(int modupoint) {
        this.modupoint = modupoint;
    }

    public String getModemail() {
        return modemail;
    }

    public void setModemail(String modemail) {
        this.modemail = modemail;
    }

    public String getModnickname() {
        return modnickname;
    }

    public void setModnickname(String modnickname) {
        this.modnickname = modnickname;
    }

    public String getModcolor() {
        return modcolor;
    }

    public void setModcolor(String modcolor) {
        this.modcolor = modcolor;
    }

    public String getModdelyn() {
        return moddelyn;
    }

    public void setModdelyn(String moddelyn) {
        this.moddelyn = moddelyn;
    }

    public String getModtrendency() {
        return modtrendency;
    }

    public void setModtrendency(String modtrendency) {
        this.modtrendency = modtrendency;
    }

    public Timestamp getModregdate() {
        return modregdate;
    }

    public void setModregdate(Timestamp modregdate) {
        this.modregdate = modregdate;
    }

    public String getModregip() {
        return modregip;
    }

    public void setModregip(String modregip) {
        this.modregip = modregip;
    }

    public String getModblindip() {
        return modblindip;
    }

    public void setModblindip(String modblindip) {
        this.modblindip = modblindip;
    }

    public int getModtpost() {
        return modtpost;
    }

    public void setModtpost(int modtpost) {
        this.modtpost = modtpost;
    }

    public int getModtreply() {
        return modtreply;
    }

    public void setModtreply(int modtreply) {
        this.modtreply = modtreply;
    }

    public int getModtgood() {
        return modtgood;
    }

    public void setModtgood(int modtgood) {
        this.modtgood = modtgood;
    }

    public int getModtbad() {
        return modtbad;
    }

    public void setModtbad(int modtbad) {
        this.modtbad = modtbad;
    }

    public int getModtspam() {
        return modtspam;
    }

    public void setModtspam(int modtspam) {
        this.modtspam = modtspam;
    }

    public int getModutotallevel() {
        return modutotallevel;
    }

    public void setModutotallevel(int modutotallevel) {
        this.modutotallevel = modutotallevel;
    }

    public int getModucolorlevel() {
        return moducolorlevel;
    }

    public void setModucolorlevel(int moducolorlevel) {
        this.moducolorlevel = moducolorlevel;
    }

    @Override
    public String toString() {
        return "UserModifyVO{" +
                "modid='" + modid + '\'' +
                ", modupw='" + modupw + '\'' +
                ", modupwconf='" + modupwconf + '\'' +
                ", modrespectname='" + modrespectname + '\'' +
                ", modupoint=" + modupoint +
                ", modemail='" + modemail + '\'' +
                ", modnickname='" + modnickname + '\'' +
                ", modcolor='" + modcolor + '\'' +
                ", moddelyn='" + moddelyn + '\'' +
                ", modtrendency='" + modtrendency + '\'' +
                ", modregdate=" + modregdate +
                ", modregip='" + modregip + '\'' +
                ", modblindip='" + modblindip + '\'' +
                ", modtpost=" + modtpost +
                ", modtreply=" + modtreply +
                ", modtgood=" + modtgood +
                ", modtbad=" + modtbad +
                ", modtspam=" + modtspam +
                ", modutotallevel=" + modutotallevel +
                ", moducolorlevel=" + moducolorlevel +
                '}';
    }
}
