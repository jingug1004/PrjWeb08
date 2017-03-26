package org.zerock.bank;

/**
 * Created by macbookpro on 2017. 3. 26. PM 10:33
 * Project / org.zerock.bank
 * No pain, No gain!
 * What : 계좌 클래스(Account)에 대한 테스트 케이스 작성을 위해 만든 테스트 클래스.
 * Why :
 * How :
 */

public class AccountTest {

    public void testAccount() {
        Account account = Account();
        if (account == null) {
            throw new Exception("계좌생성 실패");
        }
    }

    public static void main(String[] args) {
        AccountTest test = new AccountTest();
        test.testAccount();   // 테스트 케이스 실행.
    }

}
