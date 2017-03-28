package org.zerock.domain;

/**
 * Created by macbookpro on 2017. 2. 12. PM 7:13
 * sp4chap11-Project / org.zerock.domain
 * No pain, No gain!
 * What : Ajax 댓글 처리를 위한 간단한 도메인 객체.
 * Why :
 * How : @RestController의 경우 별도의 처리가 없어도 객체는 자동으로 JSON으로 처리.
 */


public class SampleVO {

    private Integer mno;
    private String firstName;
    private String lastName;

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
     * Gets first name.
     *
     * @return the first name
     */
    public String getFirstName() {
        return firstName;
    }

    /**
     * Sets first name.
     *
     * @param firstName the first name
     */
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    /**
     * Gets last name.
     *
     * @return the last name
     */
    public String getLastName() {
        return lastName;
    }

    /**
     * Sets last name.
     *
     * @param lastName the last name
     */
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    @Override
    public String toString() {
        return "SampleVO{" +
                "mno=" + mno +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                '}';
    }
}
