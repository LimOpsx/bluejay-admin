package fun.luwu.bluejay.gc.exception.handler;

import cn.dev33.satoken.exception.SaTokenException;
import fun.luwu.bluejay.gc.exception.ServiceException;
import fun.luwu.bluejay.gc.model.Result;
import lombok.extern.log4j.Log4j2;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author LimOps
 */
@ControllerAdvice
@ResponseBody
@Log4j2
public class GlobalExceptionHandler {

    @ExceptionHandler(SaTokenException.class)
    public Result<Void> saTokenExceptionHandler(SaTokenException saTokenException){
        log.error(saTokenException.getMessage());
        return Result.failure(saTokenException.getMessage());
    }

    @ExceptionHandler(ServiceException.class)
    public Result<Void> serviceExceptionHandler(ServiceException serviceException){
        log.error(serviceException.getMessage());
        return Result.failure(serviceException.getMessage());
    }

}
