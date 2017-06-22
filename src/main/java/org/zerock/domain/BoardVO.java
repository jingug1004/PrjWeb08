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

    @Override
    public String toString() {
        return "BoardVO{" +
                "bno=" + bno +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", writer='" + writer + '\'' +
                ", regdate=" + regdate +
                ", viewcnt=" + viewcnt +
                ", replycnt=" + replycnt +
                ", files=" + Arrays.toString(files) +
                '}';
    }
}
