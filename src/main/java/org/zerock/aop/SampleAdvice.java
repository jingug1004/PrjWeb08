package org.zerock.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import java.util.Arrays;

/**
 * What : AOP와 트랜잭션 처리를 위한 준비 후 연습.
 * Why :
 * How : DAO를 설정하고 서비스 객체를 생성하는 것까지는 기존의 개발 방식과 완전히 동일하지만, 스프링의 AOP 기능을 활용하기 위해서는 추가로 Advice 객체를 생성하고 이를 애노테이션이나 XML을 이용해서 원하는 기능에 적용하는 설정이 필요.
 */

/**
 * 클래스 선언부의 @Aspect 애노테이션은 AOP 기능을 하는 클래스의 선언에 추가해줘야 함. @Component는 스프링의 빈으로 인식되기 위해서 설정.
 */
@Component
@Aspect
public class SampleAdvice {

    private static final Logger logger = LoggerFactory.getLogger(SampleAdvice.class);

    /**
     * startLog() 설정 중 @Before 해당 메소드를 먼저 실행한 후 target 메소드가 실행되게 하는 것(애노테이션의 종류 참고).
     * 'execution'으로 시작하는 구문은 Pointcut을 지정하는 문법으로, AspectJ 언어의 문법을 사용.
     * 'org.zerock.service.MessageService'로 시작하는 모든 클래스의 '*'(모든) 메소드를 지정하고 있음.
     *
     * @param jp the jp
     */
    @Before("execution(* org.zerock.service.MessageService*.*(..))")
    public void startLog(JoinPoint jp) {

        logger.info("lll~~~ ---------------------------- lll~~~");
        logger.info("lll~~~ ---------------------------- lll~~~");
        logger.info(Arrays.toString(jp.getArgs()));

    }

    /**
     * ProceedingJoinPoint의 proceed()는 특이하게도 Exception 보다도 상위의 Throwable을 처리해야 하므로 시간을 체크하는 기능을 작성할 수 있음.
     *
     * @Around 를 이용하는 경우에는 반드시 메소드의 리턴 타입은 Object로 선언해야 함. 다른 Advice와 달리 @Around는 메소드를 직접 호출하고, 결과를 반환해야만 정상적인 처리.
     * @param pjp the pjp
     * @return proceed()를 이용해서 실제 메소드를 호출.
     * @throws Throwable the throwable
     */
    @Around("execution(* org.zerock.service.MessageService*.*(..))")
    public Object timeLog(ProceedingJoinPoint pjp) throws Throwable {

        long startTime = System.currentTimeMillis();
        logger.info(Arrays.toString(pjp.getArgs()));

        Object result = pjp.proceed();

        long endTime = System.currentTimeMillis();
        logger.info(pjp.getSignature().getName() + " : " + (endTime - startTime));
        logger.info("lll~~~ ============================================= lll~~~");

        return result;
    }


}
