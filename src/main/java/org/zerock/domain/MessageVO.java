package org.zerock.domain;

import java.util.Date;

/**
 * Created by macbookpro on 2017. 2. 19. PM 2:07
 * sp4chap11-Project / org.zerock.domain
 * No pain, No gain!
 * What : AOP와 트랜잭션 처리를 위한 준비(테스트).
 * Why :
 * How :
 */


public class MessageVO {
    private Integer mno;
    private String targetid;
    private String sender;
    private String message;
    private Date opendate;
    private Date senddate;


    /**
     * Gets mno.
     *
     * @return the mno
     */
    public Integer getMno() {
        return mno;
    }

    /**
     * Sets mno.
     *
     * @param mno the mno
     */
    public void setMno(Integer mno) {
        this.mno = mno;
    }

    /**
     * Gets targetid.
     *
     * @return the targetid
     */
    public String getTargetid() {
        return targetid;
    }

    /**
     * Sets targetid.
     *
     * @param targetid the targetid
     */
    public void setTargetid(String targetid) {
        this.targetid = targetid;
    }

    /**
     * Gets sender.
     *
     * @return the sender
     */
    public String getSender() {
        return sender;
    }

    /**
     * Sets sender.
     *
     * @param sender the sender
     */
    public void setSender(String sender) {
        this.sender = sender;
    }

    /**
     * Gets message.
     *
     * @return the message
     */
    public String getMessage() {
        return message;
    }

    /**
     * Sets message.
     *
     * @param message the message
     */
    public void setMessage(String message) {
        this.message = message;
    }

    /**
     * Gets opendate.
     *
     * @return the opendate
     */
    public Date getOpendate() {
        return opendate;
    }

    /**
     * Sets opendate.
     *
     * @param opendate the opendate
     */
    public void setOpendate(Date opendate) {
        this.opendate = opendate;
    }

    /**
     * Gets senddate.
     *
     * @return the senddate
     */
    public Date getSenddate() {
        return senddate;
    }

    /**
     * Sets senddate.
     *
     * @param senddate the senddate
     */
    public void setSenddate(Date senddate) {
        this.senddate = senddate;
    }

    @Override
    public String toString() {
        return "MessageVO{" +
                "mno=" + mno +
                ", targetid='" + targetid + '\'' +
                ", sender='" + sender + '\'' +
                ", message='" + message + '\'' +
                ", opendate=" + opendate +
                ", senddate=" + senddate +
                '}';
    }
}
