package fun.luwu.gc.constant;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 响应状态码常量类
 * @author LimOps
 */
public final class ResponseCodeConstant {

    @Getter
    @AllArgsConstructor
    public enum ResponseCodeEnum{

        /**
         * 请求失败
         */
        FAILURE(-1,"请求失败!"),

        /**
         * 请求成功
         */
        SUCCESS(200,"请求成功"),

        /**
         * 客户端认证失败
         */
        CLIENT_AUTHENTICATION_FAILED(1001,"客户端认证失败"),
        /**
         * 用户名或密码错误
         */
        USERNAME_OR_PASSWORD_ERROR(1002,"用户名或密码错误"),
        /**
         * 不支持的认证模式
         */
        UNSUPPORTED_GRANT_TYPE(1003, "不支持的认证模式"),

        /**
         * 凭证错误
         */
        AUTH_ERROR(4000,"凭证错误!"),

        /**
         * 参数错误
         */
        PARAMS_ERROR(5001,"参数有误,请重试!"),


        /**
         * 系统出错,请联系管理员!
         */
        ERROR(500,"系统出错,请联系管理员!");

        /**
         * 状态码
         */
        private final Integer code;

        /**
         * 消息
         */
        private final String message;

    }

}
