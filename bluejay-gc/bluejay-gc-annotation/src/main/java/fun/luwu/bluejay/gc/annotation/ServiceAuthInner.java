package fun.luwu.bluejay.gc.annotation;

import java.lang.annotation.*;

/**
 * 服务内部不需要鉴权
 *
 * @author LimOps
 */@Documented

@Retention(RetentionPolicy.RUNTIME)
@Target(value = ElementType.METHOD)
public @interface ServiceAuthInner {

    /**
     * 不需要鉴权
     * 需要鉴权,为默认
     * @return java.lang.String
     */
    boolean value() default true;

}
