package org.zerock.domain;

import java.util.Arrays;
import java.util.Date;

/**
 * Created by macbookpro on 2017. 2. 3.. PM 7:10
 * What :
 * Why :
 * How : 팁! VO 클래스를 제작할 때 가장 간단한 팁은 가능하면 테이블의 칼럼 이름과 VO의 속성 이름을 동일하게 해주는 것이 읽기에 좋고, 코드를 작성하기도 편리하다는 것.
 */
public class BoardVO {

    private Integer bno;
    private String title;
    private String content;
    private String writer;
    private Date regdate;
    private Date updatedate;

    private int goodcnt;
    private int badcnt;
    private int gbcnt;
    private int spamcnt;

    private int viewcnt;
    private int replycnt;
    private int cnum;

    public int getCnum() {
        return cnum;
    }

    public void setCnum(int cnum) {
        this.cnum = cnum;
    }

    private String[] files;

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
     * Gets title.
     *
     * @return the title
     */
    public String getTitle() {
        return title;
    }

    /**
     * Sets title.
     *
     * @param title the title
     */
    public void setTitle(String title) {
        this.title = title;
    }

    /**
     * Gets content.
     *
     * @return the content
     */
    public String getContent() {
        return content;
    }

    /**
     * Sets content.
     *
     * @param content the content
     */
    public void setContent(String content) {
        this.content = content;
    }

    /**
     * Gets writer.
     *
     * @return the writer
     */
    public String getWriter() {
        return writer;
    }

    /**
     * Sets writer.
     *
     * @param writer the writer
     */
    public void setWriter(String writer) {
        this.writer = writer;
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
     * Gets viewcnt.
     *
     * @return the viewcnt
     */
    public int getViewcnt() {
        return viewcnt;
    }

    /**
     * Sets viewcnt.
     *
     * @param viewcnt the viewcnt
     */
    public void setViewcnt(int viewcnt) {
        this.viewcnt = viewcnt;
    }

    /**
     * 댓글의 숫자를 의미하는 replycnt 칼럼 추가.
     *
     * @return the replycnt
     */
    public int getReplycnt() {
        return replycnt;
    }

    /**
     * S댓글의 숫자를 의미하는 replycnt 칼럼 추가.
     *
     * @param replycnt the replycnt
     */
    public void setReplycnt(int replycnt) {
        this.replycnt = replycnt;
    }

    /**
     * Get files string [ ].
     *
     * @return the string [ ]
     */
    public String[] getFiles() {
        return files;
    }

    /**
     * Sets files.
     *
     * @param files the files
     */
    public void setFiles(String[] files) {
        this.files = files;
    }

    public int getGoodcnt() {
        return goodcnt;
    }

    public void setGoodcnt(int goodcnt) {
        this.goodcnt = goodcnt;
    }

    public int getBadcnt() {
        return badcnt;
    }

    public void setBadcnt(int badcnt) {
        this.badcnt = badcnt;
    }

    public int getGbcnt() {
        return gbcnt;
    }

    public void setGbcnt(int gbcnt) {
        this.gbcnt = gbcnt;
    }

    public int getSpamcnt() {
        return spamcnt;
    }

    public void setSpamcnt(int spamcnt) {
        this.spamcnt = spamcnt;
    }

    public Date getUpdatedate() {
        return updatedate;
    }

    public void setUpdatedate(Date updatedate) {
        this.updatedate = updatedate;
    }

    @Override
    public String toString() {
        return "BoardVO{" +
                "bno=" + bno +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", writer='" + writer + '\'' +
                ", regdate=" + regdate +
                ", updatedate=" + updatedate +
                ", goodcnt=" + goodcnt +
                ", badcnt=" + badcnt +
                ", gbcnt=" + gbcnt +
                ", spamcnt=" + spamcnt +
                ", viewcnt=" + viewcnt +
                ", replycnt=" + replycnt +
                ", cnum=" + cnum +
                ", files=" + Arrays.toString(files) +
                '}';
    }
}
