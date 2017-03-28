package org.zerock.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.domain.SampleVO;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by macbookpro on 2017. 2. 12. PM 7:00
 * sp4chap11-Project / org.zerock.controller
 * No pain, No gain!
 * What : @RestController의 예제를 위한 테스트 컨트롤러.
 * Why :
 * How : @RestController는 JSP와 같은 뷰를 만들어 내지 않는 대신에 데이터 자체를 반환하는데, 이때 주로 사용되는 것은 단순 문자열과 JSON, XML 등으로 나누어 볼 수 있음.
 * 클래스의 선언부에 @RestController 선언시 해당 컨트롤러의 모든 뷰 처리가 JSP가 아니라는 것을 의미.
 * RestController 애노테이션이 사용된 클래스의 모든 메소드는 @ResponseBody가 없어도 동일하게 동작(생략되었다고 생각해도 무방).
 */

@RestController
@RequestMapping("/sample")
public class SampleController {

    /**
     * sayHello()는 문자열을 결과로 반환.
     *
     * @return 결과로 반환하는 문자열이 JSP의 경로가 아닌 일반 문자열이라는 점.
     */
    @RequestMapping("/hello")
    public String sayHello() {
        return "Hello World";
    }

    /**
     * /domain/SampleVO의 작성된 클래스 타입의 객체를 반환하는 메소드.
     *
     * @return the sample vo
     */
    @RequestMapping("/sendVO")
    public SampleVO sendVO() {

        SampleVO vo = new SampleVO();
        vo.setFirstName("길동");
        vo.setLastName("홍");
        vo.setMno(123);

        return vo;
    }

    /**
     * Send list list.
     * 결과값 : [{"mno":0,"firstName":"길동","lastName":"홍"},{"mno":1,"firstName":"길동","lastName":"홍"},{"mno":2,"firstName":"길동","lastName":"홍"},{"mno":3,"firstName":"길동","lastName":"홍"},{"mno":4,"firstName":"길동","lastName":"홍"},{"mno":5,"firstName":"길동","lastName":"홍"},{"mno":6,"firstName":"길동","lastName":"홍"},{"mno":7,"firstName":"길동","lastName":"홍"},{"mno":8,"firstName":"길동","lastName":"홍"},{"mno":9,"firstName":"길동","lastName":"홍"}]
     *
     * @return the list
     */
    @RequestMapping("/sendList")
    public List<SampleVO> sendList() {

        List<SampleVO> list = new ArrayList<>();
        for (int i = 0; i < 10; i++) {
            SampleVO vo = new SampleVO();
            vo.setFirstName("길동");
            vo.setLastName("홍");
            vo.setMno(i);
            list.add(vo);
        }
        return list;
    }

    /**
     * Send map map.
     * 결과값 : {"0":{"mno":0,"firstName":"길동","lastName":"홍"},"1":{"mno":1,"firstName":"길동","lastName":"홍"},"2":{"mno":2,"firstName":"길동","lastName":"홍"},"3":{"mno":3,"firstName":"길동","lastName":"홍"},"4":{"mno":4,"firstName":"길동","lastName":"홍"},"5":{"mno":5,"firstName":"길동","lastName":"홍"},"6":{"mno":6,"firstName":"길동","lastName":"홍"},"7":{"mno":7,"firstName":"길동","lastName":"홍"},"8":{"mno":8,"firstName":"길동","lastName":"홍"},"9":{"mno":9,"firstName":"길동","lastName":"홍"}}
     *
     * @return the map
     */
    @RequestMapping("/sendMap")
    public Map<Integer, SampleVO> sendMap() {

        Map<Integer, SampleVO> map = new HashMap<>();

        for (int i = 0; i < 10; i++) {
            SampleVO vo = new SampleVO();
            vo.setFirstName("길동");
            vo.setLastName("홍");
            vo.setMno(i);
            map.put(i, vo);
        }
        return map;
    }

    /**
     * ResoponseEntity 타입은 개발자가 직접 결과 데이터 + HTTP의 상태 코드를 직접 제어할 수 있는 클래스. ResoponseEntity를 이용하면 개발자는 404나 500 같은 HTTP 상태 코드를 전송하고 싶은 데이터와 함께 전송할 수 있기 때문에 좀 더 세밀한 제어가 필요한 경우에 사용해 볼 수 있음.
     *
     * @return 결과 데이터로 HTTP 상태코드 중 400(Bad Request)을 헤더 메시지로 전송.
     */
    @RequestMapping("/sendErrorAuth")
    public ResponseEntity<Void> sendListAuth() {

        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }

    /**
     * 결과 데이터와 HTTP의 상태 코드를 같이 사용해야 하는 경우.
     *
     * @return 코드의 리턴구문을 보면 바로 위의 List 데이터와 HTTP 상태 코드 404를 전송. 특이한 점은 일반적인 404 메시지와는 달리 전송한 결과는 그대로 보여주면서 상태 코드를 전달한다는 점. 이런 방식은 주로 호출한 쪽으로 에러의 원인 메시지를 전송할 때 사용하는 방식.
     */
    @RequestMapping("/sendErrorNot")
    public ResponseEntity<List<SampleVO>> sendListNot() {

        List<SampleVO> list = new ArrayList<>();
        for (int i = 0; i < 10; i++) {
            SampleVO vo = new SampleVO();
            vo.setFirstName("길동");
            vo.setLastName("홍");
            vo.setMno(i);
            list.add(vo);
        }

        return new ResponseEntity<>(list, HttpStatus.NOT_FOUND);

    }


}
