package org.zerock.domain;

import java.util.Date;

/**
 * Created by 김진국 on 2017-11-11 오후 4:36
 * Web08 / org.zerock.domain
 * No pain, No gain!
 * What :
 * Why :
 * How :
 * << 개정이력(Modification Information) >>
 * 수정일         수정자          수정내용
 * -------       --------       ---------------------------
 * 2017/04/21     김진국          최초 생성
 * 2017/05/27     이몽룡          인증이 필요없는 URL을 패스하는 로직 추가
 *
 * @author 개발팀 김진국
 * @version 1.0
 * @see
 * @since 2017/04/10
 */


public class ProductVO {

    private String product_id;
    private String content;
    private String detail_url;
    private int price;
    private String prod_desc;
    private String prod_name;
    private Date reg_date;
    private int review_count;
    private float review_star;
    private int sale;
    private int sale_price;
    private int stop_selling;
    private String thumb_url;
    private int view_count;
    private int brand_id;
    private int delivery_id;
    private String seller;
    private int event;
    private int time_sale;
    private int box;
    private int score;
    private String banner;

    public String getProduct_id() {
        return product_id;
    }

    public void setProduct_id(String product_id) {
        this.product_id = product_id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getDetail_url() {
        return detail_url;
    }

    public void setDetail_url(String detail_url) {
        this.detail_url = detail_url;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getProd_desc() {
        return prod_desc;
    }

    public void setProd_desc(String prod_desc) {
        this.prod_desc = prod_desc;
    }

    public String getProd_name() {
        return prod_name;
    }

    public void setProd_name(String prod_name) {
        this.prod_name = prod_name;
    }

    public Date getReg_date() {
        return reg_date;
    }

    public void setReg_date(Date reg_date) {
        this.reg_date = reg_date;
    }

    public int getReview_count() {
        return review_count;
    }

    public void setReview_count(int review_count) {
        this.review_count = review_count;
    }

    public float getReview_star() {
        return review_star;
    }

    public void setReview_star(float review_star) {
        this.review_star = review_star;
    }

    public int getSale() {
        return sale;
    }

    public void setSale(int sale) {
        this.sale = sale;
    }

    public int getSale_price() {
        return sale_price;
    }

    public void setSale_price(int sale_price) {
        this.sale_price = sale_price;
    }

    public int getStop_selling() {
        return stop_selling;
    }

    public void setStop_selling(int stop_selling) {
        this.stop_selling = stop_selling;
    }

    public String getThumb_url() {
        return thumb_url;
    }

    public void setThumb_url(String thumb_url) {
        this.thumb_url = thumb_url;
    }

    public int getView_count() {
        return view_count;
    }

    public void setView_count(int view_count) {
        this.view_count = view_count;
    }

    public int getBrand_id() {
        return brand_id;
    }

    public void setBrand_id(int brand_id) {
        this.brand_id = brand_id;
    }

    public int getDelivery_id() {
        return delivery_id;
    }

    public void setDelivery_id(int delivery_id) {
        this.delivery_id = delivery_id;
    }

    public String getSeller() {
        return seller;
    }

    public void setSeller(String seller) {
        this.seller = seller;
    }

    public int getEvent() {
        return event;
    }

    public void setEvent(int event) {
        this.event = event;
    }

    public int getTime_sale() {
        return time_sale;
    }

    public void setTime_sale(int time_sale) {
        this.time_sale = time_sale;
    }

    public int getBox() {
        return box;
    }

    public void setBox(int box) {
        this.box = box;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public String getBanner() {
        return banner;
    }

    public void setBanner(String banner) {
        this.banner = banner;
    }

    @Override
    public String toString() {
        return "ProductVO{" +
                "product_id='" + product_id + '\'' +
                ", content='" + content + '\'' +
                ", detail_url='" + detail_url + '\'' +
                ", price=" + price +
                ", prod_desc='" + prod_desc + '\'' +
                ", prod_name='" + prod_name + '\'' +
                ", reg_date=" + reg_date +
                ", review_count=" + review_count +
                ", review_star=" + review_star +
                ", sale=" + sale +
                ", sale_price=" + sale_price +
                ", stop_selling=" + stop_selling +
                ", thumb_url='" + thumb_url + '\'' +
                ", view_count=" + view_count +
                ", brand_id=" + brand_id +
                ", delivery_id=" + delivery_id +
                ", seller='" + seller + '\'' +
                ", event=" + event +
                ", time_sale=" + time_sale +
                ", box=" + box +
                ", score=" + score +
                ", banner='" + banner + '\'' +
                '}';
    }
}