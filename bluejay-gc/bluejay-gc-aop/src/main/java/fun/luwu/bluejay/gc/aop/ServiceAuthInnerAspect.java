package fun.luwu.bluejay.gc.aop;

import fun.luwu.bluejay.gc.annotation.ServiceAuthInner;
import fun.luwu.bluejay.gc.exception.ServiceException;
import fun.luwu.gc.constant.MicroServiceInnerConstant;
import lombok.extern.log4j.Log4j2;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.core.Ordered;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.nio.file.AccessDeniedException;

/**
 * @author LimOps
 */
@Aspect
@Component
@Log4j2
public class ServiceAuthInnerAspect implements Ordered {

    @Around("@annotation(serviceAuthInner)")
    public Object around(ProceedingJoinPoint point, ServiceAuthInner serviceAuthInner) throws Throwable {
        //获取request对象
        RequestAttributes ra = RequestContextHolder.getRequestAttributes();
        ServletRequestAttributes sra = (ServletRequestAttributes) ra;
        if (sra == null) {
            log.error("feign 调用失败");
            throw new ServiceException("feign 调用失败!");
        }
        HttpServletRequest request = sra.getRequest();
        String header = request.getHeader(MicroServiceInnerConstant.IMicroServiceInnerConstant.FEIGN_NO_AUTH_Y);

        if (serviceAuthInner.value() && !MicroServiceInnerConstant.IMicroServiceInnerConstant.FEIGN_NO_AUTH_Y.equals(header)){
            log.warn("访问接口 {} 没有权限", point.getSignature().getName());
            throw new AccessDeniedException("Access is denied");
        }
        return point.proceed();
    }

    @Override
    public int getOrder() {
        return Ordered.HIGHEST_PRECEDENCE + 1;
    }

}
