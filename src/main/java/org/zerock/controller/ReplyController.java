package org.zerock.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageMaker;
import org.zerock.domain.ReplyVO;
import org.zerock.service.ReplyService;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by wtime on 2017-02-13. ${time}
 * org.zerock.controller / Web Ex02
 * Better late than never!
 * What : Ajax 댓글 처리를 위한 REST 방식의 ReplyController.
 * Why :
 * How :
 */
//@Controller
@RestController
@RequestMapping("/replies")
public class ReplyController {

    @Inject
    private ReplyService service;

    /**
     * 만일 새로운 댓글을 드옥하는데 실패하면 try~catch에 선언되었듯이 예외의 원인 메시지를 전송하고, 사용자에게는 BAD_REQUEST(400)를 결과로 전송.
     *
     * @param vo the vo
     * @return
     */
    @RequestMapping(value = "", method = RequestMethod.POST)
    public ResponseEntity<String> register(@RequestBody ReplyVO vo) {

        ResponseEntity<String> entity = null;
        try {
            service.addReply(vo);
            entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
        return entity;
    }

    /**
     * 특정 게시물의 전체 댓글의 목록은 GET 방식으로 처리돼야 하고, 반드시 특정 게시물의 번호(bno)를 필요로 하기 때문에 다음과 같은 형태로 작성.
     *
     * @param bno URI 내의 경로 {bno}를 활용. {bno}는 메소드의 파라미터에서 @PathVariable("bno")로 활용.
     * @return 메소드의 처리가 성공하는 경우에는 HttpStatus.OK 헤더를 전송하고, 데이터를 같이 전송.
     */
    @RequestMapping(value = "/all/{bno}", method = RequestMethod.GET)
    public ResponseEntity<List<ReplyVO>> list(@PathVariable("bno") Integer bno) {

        ResponseEntity<List<ReplyVO>> entity = null;
        try {
            entity = new ResponseEntity<>(
                    service.listReply(bno), HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
        return entity;
    }

    /**
     * REST 방식에서 update 작업은 PUT, PATCH 방식을 이용해서 처리. 일반적으로 전체 데이터를 수정하는 경우에는 PUT을 이용. 일부의 데이터를 수정하는 경우에는 PATCH를 이용.
     *
     * @param rno the rno
     * @param vo  the vo
     * @return the response entity
     */
    @RequestMapping(value = "/{rno}", method = {RequestMethod.PUT, RequestMethod.PATCH})
    public ResponseEntity<String> update(@PathVariable("rno") Integer rno,
                                         @RequestBody ReplyVO vo) {

        ResponseEntity<String> entity = null;
        try {
            vo.setRno(rno);
            service.modifyReply(vo);

            entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
        return entity;
    }

    /**
     * 댓글의 삭제에 대한 처리는 PUT과 유사. 다만, 추가적인 데이터가 없다는 부분 때문에 더 간단히 처리할 수 있음.
     *
     * @param rno the rno
     * @return the response entity
     */
    @RequestMapping(value = "/{rno}", method = RequestMethod.DELETE)
    public ResponseEntity<String> remove(@PathVariable("rno") Integer rno) {

        ResponseEntity<String> entity = null;
        try {
            service.removeReply(rno);
            entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
        return entity;
    }

    /**
     * listPage() 메소드는 페이징 처리를 위해서 '/게시물의 번호/페이지 번호'를 패턴으로 처리.
     * 가장 신경써야 하는 점은 Ajax로 호출된 것이므로 Model을 사용하지 못한다는 점. 전달해야 하는 데이터들을 담기 위해서 Map 타입의 객체를 별도로 생성.
     *
     * @param bno  the bno
     * @param page the page
     * @return 화면으로 전달되는 Map 데이터는 페이징 처리된 댓글의 목록(list)과 PageMaker 클래스의 객체를 담음(pageMaker).
     */
    @RequestMapping(value = "/{bno}/{page}", method = RequestMethod.GET)
    public ResponseEntity<Map<String, Object>> listPage(@PathVariable("bno") Integer bno,
                                                        @PathVariable("page") Integer page) {

        ResponseEntity<Map<String, Object>> entity = null;

        try {
            Criteria cri = new Criteria();
            cri.setPage(page);

            PageMaker pageMaker = new PageMaker();
            pageMaker.setCri(cri);

            Map<String, Object> map = new HashMap<String, Object>();
            List<ReplyVO> list = service.listReplyPage(bno, cri);

            map.put("list", list);

            int replyCount = service.count(bno);
            pageMaker.setTotalCount(replyCount);

            map.put("pageMaker", pageMaker);

            entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);

        } catch (Exception e) {
            e.printStackTrace();
            entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
        }
        return entity;
    }
}
