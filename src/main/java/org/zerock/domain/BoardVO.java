package org.zerock.domain;

import java.util.Arrays;
import java.util.Date;

/**
 * Created by macbookpro on 2017. 2. 3.. PM 7:10
 * What :
 * Why :
 * How : 팁! vo 클래스를 제작할 때 가장 간단한 팁은 가능하면 테이블의 칼럼 이름과 VO의 속성 이름을 동일하게 해주는 것이 읽기에 좋고, 코드를 작성하기도 편리하다는 것.
 */
public class BoardVO {

    private String id;                          // 게시판 작성자 아이디

    private Integer bno;
    private String title;
    private String content;
    private String writer;
    private Date regdate;
    private Date updatedate;

    private int goodcnt;
    private int badcnt;
    private double gbcnt;
    private int spamcnt;

    private int viewcnt;
    private int replycnt;
    private int cnum;                           // 게시판 카테고리 넘버

    private String[] files;                     // 게시판 작성글 첨부파일 -> DB에는 안 만들었음.

    private String boardvisible;                // 게시판 작성글 삭제 여부

    private String getcolor;                    // 게시판 칼라 넘버

    private int utotallevel;                    // 회원의 전체 순위 Lv.0 ~ Lv.100
    private int ucolorlevel;                    // 회원의 칼라 순위 Lv.0 ~ Lv.100

    private String boardip;                     // 게시판 작성글 ip
    private String boardipreal;                 // 게시판 작성글 ip (블라인드 처리 안 된)

    private String fullname;                    // 회원정보 리스트의 첨부파일 가져오기 위한 vo -> DB에는 안 만들었음.

    /*-----*/

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
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

    public int getCnum() {
        return cnum;
    }

    public void setCnum(int cnum) {
        this.cnum = cnum;
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

    public double getGbcnt() {
        return gbcnt;
    }

    public void setGbcnt(double gbcnt) {
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

    public String getBoardvisible() {return boardvisible;}

    public void setBoardvisible(String boardvisible) {this.boardvisible = boardvisible;}

    public String getGetcolor() {
        return getcolor;
    }

    public void setGetcolor(String getcolor) {
        this.getcolor = getcolor;
    }

    public int getUtotallevel() {
        return utotallevel;
    }

    public void setUtotallevel(int utotallevel) {
        this.utotallevel = utotallevel;
    }

    public int getUcolorlevel() {
        return ucolorlevel;
    }

    public void setUcolorlevel(int ucolorlevel) {
        this.ucolorlevel = ucolorlevel;
    }

    public String getBoardip() {
        return boardip;
    }

    public void setBoardip(String boardip) {
        this.boardip = boardip;
    }

    public String getBoardipreal() {
        return boardipreal;
    }

    public void setBoardipreal(String boardipreal) {
        this.boardipreal = boardipreal;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    @Override
    public String toString() {
        return "BoardVO{" +
                "id='" + id + '\'' +
                ", bno=" + bno +
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
                ", boardvisible='" + boardvisible + '\'' +
                ", getcolor='" + getcolor + '\'' +
                ", utotallevel=" + utotallevel +
                ", ucolorlevel=" + ucolorlevel +
                ", boardip='" + boardip + '\'' +
                ", boardipreal='" + boardipreal + '\'' +
                ", fullname='" + fullname + '\'' +
                '}';
    }
}
