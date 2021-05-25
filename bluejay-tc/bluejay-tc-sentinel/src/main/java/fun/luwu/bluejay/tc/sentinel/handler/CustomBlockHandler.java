package fun.luwu.bluejay.tc.sentinel.handler;

import com.alibaba.csp.sentinel.adapter.spring.webmvc.callback.BlockExceptionHandler;
import com.alibaba.csp.sentinel.slots.block.BlockException;
import com.alibaba.csp.sentinel.slots.block.authority.AuthorityException;
import com.alibaba.csp.sentinel.slots.block.degrade.DegradeException;
import com.alibaba.csp.sentinel.slots.block.flow.FlowException;
import com.alibaba.csp.sentinel.slots.block.flow.param.ParamFlowException;
import com.alibaba.csp.sentinel.slots.system.SystemBlockException;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author LimOps
 */
@Log4j2
@Component
public class CustomBlockHandler implements BlockExceptionHandler {

    /**
     * Handle the request when blocked.
     *
     * @param request  Servlet request
     * @param response Servlet response
     * @param ex       the block exception
     * @throws Exception users may throw out the BlockException or other error occurs
     */
    @Override
    public void handle(HttpServletRequest request, HttpServletResponse response, BlockException ex) throws Exception {
        String message = null;
        if (ex instanceof FlowException) {
            message = "限流了";
        } else if (ex instanceof DegradeException) {
            message = "降级了";
        } else if (ex instanceof ParamFlowException) {
            message = "热点参数限流";
        } else if (ex instanceof SystemBlockException) {
            message = "系统规则（负载/...不满足要求）";
        } else if (ex instanceof AuthorityException) {
            message = "授权规则不通过";
        }
        log.warn("sentinel告警!{}", message);
        // spring mvc自带的json操作工具，叫jackson
        // http状态码
        response.setStatus(500);
        response.setCharacterEncoding("utf-8");
        response.setHeader("Content-Type", "application/json;charset=utf-8");
        response.setContentType("application/json;charset=utf-8");
        // spring mvc自带的json操作工具，叫jackson
        new ObjectMapper()
                .writeValue(
                        response.getWriter(),
                        message
                );
    }
}
