package fun.luwu.bluejay.tc.gateway.compo;

import cn.dev33.satoken.exception.SaTokenException;
import cn.hutool.core.bean.BeanUtil;
import com.fasterxml.jackson.databind.ObjectMapper;
import fun.luwu.bluejay.gc.exception.ServiceException;
import fun.luwu.bluejay.gc.model.Result;
import fun.luwu.gc.constant.ResponseCodeConstant;
import org.springframework.boot.web.error.ErrorAttributeOptions;
import org.springframework.boot.web.reactive.error.DefaultErrorAttributes;
import org.springframework.stereotype.Component;
import org.springframework.web.reactive.function.server.ServerRequest;

import java.util.Map;

/**
 * @author LimOps
 */
@Component
public class GlobalErrorAttributes extends DefaultErrorAttributes {

    private final ObjectMapper objectMapper;

    public GlobalErrorAttributes(ObjectMapper objectMapper) {
        this.objectMapper = objectMapper;
    }

    @Override
    public Map<String, Object> getErrorAttributes(ServerRequest request, ErrorAttributeOptions options) {
        Result<String> result;
        //获取异常
        Throwable error = getError(request);
        //对不同异常进行处理
        if (error instanceof ServiceException) {
            result = Result.failure(((ServiceException) error).getCode(), error.getMessage());
        } else if (error instanceof SaTokenException) {
            result = Result.failure(ResponseCodeConstant.ResponseCodeEnum.AUTH_ERROR.getCode(), error.getMessage());
        } else {
            //未知异常
            result = Result.failure(500, error.getMessage());
        }
        Map<String, Object> res = BeanUtil.beanToMap(result);
        res.put("status",result.getCode());
        return objectMapper.convertValue(res, objectMapper.getTypeFactory().constructParametricType(Map.class, String.class, Object.class));
    }
}
