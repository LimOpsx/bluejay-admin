package fun.luwu.bluejay.gc.model;

import fun.luwu.gc.constant.ResponseCodeConstant;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * 通用响应实体
 *
 * @author LimOps
 */
@Getter
@Setter
@ToString
public class Result<C> {

    private Integer code;

    private String message;

    private C data;

    public Result() {
    }

    public Result(Integer code, String message, C data) {
        this.code = code;
        this.message = message;
        this.data = data;
    }

    public static <CM> Result<CM> success(){
        ResponseCodeConstant.ResponseCodeEnum success = ResponseCodeConstant.ResponseCodeEnum.SUCCESS;
        return new Result<>(success.getCode(), success.getMessage(), null);
    }

    public static <CM> Result<CM> success(CM data) {
        ResponseCodeConstant.ResponseCodeEnum success = ResponseCodeConstant.ResponseCodeEnum.SUCCESS;
        return new Result<>(success.getCode(), success.getMessage(), data);
    }

    public static <CM> Result<CM> success(String message) {
        ResponseCodeConstant.ResponseCodeEnum success = ResponseCodeConstant.ResponseCodeEnum.SUCCESS;
        return new Result<>(success.getCode(), message, null);
    }

    public static <CM> Result<CM> success(CM data, String message) {
        ResponseCodeConstant.ResponseCodeEnum success = ResponseCodeConstant.ResponseCodeEnum.SUCCESS;
        return new Result<>(success.getCode(), message, data);
    }

    public static <CM> Result<CM> success(ResponseCodeConstant.ResponseCodeEnum codeEnum) {
        return new Result<>(codeEnum.getCode(), codeEnum.getMessage(), null);
    }

    public static <CM> Result<CM> failure(CM data) {
        ResponseCodeConstant.ResponseCodeEnum failure = ResponseCodeConstant.ResponseCodeEnum.FAILURE;
        return new Result<>(failure.getCode(), failure.getMessage(), data);
    }

    public static <CM> Result<CM> failure(String message) {
        ResponseCodeConstant.ResponseCodeEnum failure = ResponseCodeConstant.ResponseCodeEnum.FAILURE;
        return new Result<>(failure.getCode(), message, null);
    }

    public static <CM> Result<CM> failure(CM data, String message) {
        ResponseCodeConstant.ResponseCodeEnum failure = ResponseCodeConstant.ResponseCodeEnum.FAILURE;
        return new Result<>(failure.getCode(), message, data);
    }

    public static Result<String> failure(Integer code, String message) {
        return new Result<String>(code, message, null);
    }

    public static <CM> Result<CM> any(CM data, String message, Integer code) {
        return new Result<>(code, message, data);
    }

    public static <CM> Result<CM> failure(ResponseCodeConstant.ResponseCodeEnum codeEnum) {
        return new Result<>(codeEnum.getCode(), codeEnum.getMessage(), null);
    }



}
