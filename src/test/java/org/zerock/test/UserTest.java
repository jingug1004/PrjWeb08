package org.zerock.test;


import org.junit.BeforeClass;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;

/**
 * Created by macbookpro on 2017. 3. 3. PM 12:40
 * sp4chap11-Project / org.zerock.test
 * No pain, No gain!
 * What : User가 정상적으로 작동되는지 단위테스트
 * Why : 일일이 서버 돌리는데에 시간과 성능 저하 방지
 * How : 하이버네이트 pom.xml 라이브러리를 통하여
 */

public class UserTest {

    public static final Logger logger =
            LoggerFactory.getLogger(UserTest.class);

    private static Validator validator;

    @BeforeClass
    public static void setUp() {
        ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
        validator = factory.getValidator();
    }

    @Test
    public void userIdWhenIsEmpty() {
//        UserVO userVO = new UserVO
//                ("jingug100", "4444", "4444", "김진", 0, "jingug100@nave.co", "Emi", "09", "1987", "", "");

//        Set<ConstraintViolation<UserVO>> constraintViolations =
//                validator.validate(userVO);
//        assertThat(constraintViolations.size());


    }




}
