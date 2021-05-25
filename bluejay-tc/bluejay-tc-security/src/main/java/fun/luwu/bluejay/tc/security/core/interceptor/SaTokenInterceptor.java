package fun.luwu.bluejay.tc.security.core.interceptor;

import cn.dev33.satoken.context.model.SaRequest;
import cn.dev33.satoken.context.model.SaResponse;
import cn.dev33.satoken.interceptor.SaRouteInterceptor;
import cn.hutool.core.util.StrUtil;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * @author LimOps
 */
@Configuration
public class SaTokenInterceptor implements WebMvcConfigurer {

    /**
     * Add Spring MVC lifecycle interceptors for pre- and post-processing of
     * controller method invocations and resource handler requests.
     * Interceptors can be registered to apply to all requests or be limited
     * to a subset of URL patterns.
     *
     * @param registry 拦截注册
     */
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        // 注册登录拦截器，并排除登录接口地址
        SaRouteInterceptor interceptor = new SaRouteInterceptor(SaTokenInterceptor::exc);

        registry.addInterceptor(interceptor).addPathPatterns("/**").excludePathPatterns("/sys/user/doLogin","/sys/dict/getAppConfig");
    }

    private static void exc(SaRequest saRequest, SaResponse saResponse, Object o) {
        String satoken = saRequest.getHeader("satoken");
        if(StrUtil.isNotBlank(satoken)){

        }
    }


}
