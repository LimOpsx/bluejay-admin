package fun.luwu.bluejay.gc.exception;

import fun.luwu.gc.constant.ResponseCodeConstant;
import lombok.Getter;

/**
 * 服务业务异常
 * @author LimOps
 */
public class ServiceException extends RuntimeException {

    @Getter
    private String code = String.valueOf(ResponseCodeConstant.ResponseCodeEnum.ERROR.getCode());

    /**
     * Constructs a new runtime exception with the specified detail message.
     * The cause is not initialized, and may subsequently be initialized by a
     * call to {@link #initCause}.
     *
     * @param message the detail message. The detail message is saved for
     *                later retrieval by the {@link #getMessage()} method.
     */
    public ServiceException(String message) {
        super(message);
    }

    public ServiceException(String message, Throwable t) {
        super(message, t);
    }

    public ServiceException(String message, String code) {
        super(message);
        this.code = code;
    }
}
