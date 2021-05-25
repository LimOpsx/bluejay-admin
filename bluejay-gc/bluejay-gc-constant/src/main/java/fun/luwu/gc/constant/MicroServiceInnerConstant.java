package fun.luwu.gc.constant;

/**
 * 微服务内部常量类
 *
 * @author LimOps
 */
public final class MicroServiceInnerConstant {

    /**
     * @author LimOps
     */
    public interface IMicroServiceInnerConstant {

        /**
         * 服务内部不需要鉴权http头标识
         */
        String FEIGN_NO_AUTH_HEADER = "inner_service_no_auth";

        String FEIGN_NO_AUTH_Y = "y";

        String FEIGN_NO_AUTH_N = "n";

    }

}
