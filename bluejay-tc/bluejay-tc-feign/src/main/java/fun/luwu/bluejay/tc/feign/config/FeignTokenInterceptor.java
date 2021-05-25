package fun.luwu.bluejay.tc.feign.config;

import cn.dev33.satoken.stp.SaTokenInfo;
import cn.dev33.satoken.stp.StpUtil;
import feign.RequestInterceptor;
import feign.RequestTemplate;
import lombok.extern.log4j.Log4j2;
import org.springframework.context.annotation.Configuration;

/**
 * @author LimOps
 */
@Log4j2
@Configuration
public class FeignTokenInterceptor implements RequestInterceptor {


    /**
     * Called for every request. Add data using methods on the supplied {@link RequestTemplate}.
     *
     * @param template request请求
     */
    @Override
    public void apply(RequestTemplate template) {
        log.info("======上下文中获取原请求信息======");
        SaTokenInfo tokenInfo = StpUtil.getTokenInfo();
        log.info("=======Feign添加头部信息start======");
        template.header(tokenInfo.getTokenName(), tokenInfo.getTokenValue());
        log.info("=======Feign添加头部信息end======");
    }
}
