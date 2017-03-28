package org.zerock.bank;

/**
 * Created by macbookpro on 2017. 3. 28. AM 11:07
 * Project / org.zerock.bank
 * No pain, No gain!
 * What : 계좌 클래스(Account)에 대한 테스트 케이스 작성을 위해 만든 클래스.
 * Why :
 * How :
 */


public class Account {

    private int balance;

    public Account(int money) {
        this.balance = money;
    }

    public int getBalance() {
        return this.balance;
    }

    public void deposit(int money) {
        this.balance += money;
    }

    public void withdraw(int money) {
        this.balance -= money;
    }

}
