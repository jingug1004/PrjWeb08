package org.zerock.persistence;

import org.zerock.domain.MemberVO;

public interface MemberDAO {

    String getTime();

    void insertMember(MemberVO vo);

    MemberVO readMember(String userid) throws Exception;

    MemberVO readWithPW(String userid,
                        String userpw) throws Exception;

}
