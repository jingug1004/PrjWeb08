package org.zerock.domain;

import java.util.Date;

/**
 * Created by wtime on 2017-02-13. ${time}
 * org.zerock.domain / Web Ex02
 * Better late than never!
 * What : Ajax 댓글 처리를 위한 REST와 도메인 객체 설계.
 * Why : 게시물과 마찬가지로 댓글 역시 같은 방식.
 * How :
 */


public class ReplyVO {

    private Integer rno;
    private Integer bno;
    private String replytext;
    private String replyer;

    private Date regdate;
    private Date updatedate;

    /**
     * Gets rno.
     *
     * @return the rno
     */
    public Integer getRno() {
        return rno;
    }

    /**
     * Sets rno.
     *
     * @param rno the rno
     */
    public void setRno(Integer rno) {
        this.rno = rno;
    }

    /**
     * Gets bno.
     *
     * @return the bno
     */
    public Integer getBno() {
        return bno;
    }

    /**
     * Sets bno.
     *
     * @param bno the bno
     */
    public void setBno(Integer bno) {
        this.bno = bno;
    }

    /**
     * Gets replytext.
     *
     * @return the replytext
     */
    public String getReplytext() {
        return replytext;
    }

    /**
     * Sets replytext.
     *
     * @param replytext the replytext
     */
    public void setReplytext(String replytext) {
        this.replytext = replytext;
    }

    /**
     * Gets replyer.
     *
     * @return the replyer
     */
    public String getReplyer() {
        return replyer;
    }

    /**
     * Sets replyer.
     *
     * @param replyer the replyer
     */
    public void setReplyer(String replyer) {
        this.replyer = replyer;
    }

    /**
     * Gets regdate.
     *
     * @return the regdate
     */
    public Date getRegdate() {
        return regdate;
    }

    /**
     * Sets regdate.
     *
     * @param regdate the regdate
     */
    public void setRegdate(Date regdate) {
        this.regdate = regdate;
    }

    /**
     * Gets updaterdate.
     *
     * @return the updaterdate
     */
    public Date getUpdaterdate() {
        return updatedate;
    }

    /**
     * Sets updaterdate.
     *
     * @param updaterdate the updaterdate
     */
    public void setUpdaterdate(Date updaterdate) {
        this.updatedate = updaterdate;
    }

    @Override
    public String toString() {
        return "ReplyVO{" +
                "rno=" + rno +
                ", bno=" + bno +
                ", replytext='" + replytext + '\'' +
                ", replyer='" + replyer + '\'' +
                ", regdate=" + regdate +
                ", updatedate=" + updatedate +
                '}';
    }
}
