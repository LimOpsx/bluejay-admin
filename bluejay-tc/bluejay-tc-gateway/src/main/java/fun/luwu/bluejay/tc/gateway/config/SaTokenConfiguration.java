package fun.luwu.bluejay.tc.gateway.config;

import cn.dev33.satoken.reactor.filter.SaReactorFilter;
import fun.luwu.bluejay.gc.model.Result;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @author LimOps
 */
@Configuration
public class SaTokenConfiguration {

    @Bean
    public SaReactorFilter getSaReactorFilter() {
        return new SaReactorFilter()
                // 指定 [拦截路由]
                .addInclude("/**")
                // 指定 [放行路由]
                .addExclude("/uaa/sys/user/doLogin","/uaa/sys/dict/getAppConfig")
                // 指定[认证函数]: 每次请求执行
                .setAuth(r -> {
                    System.out.println("---------- sa全局认证");
                    // SaRouterUtil.match("/test/test", () -> StpUtil.checkLogin());
                })
                // 指定[异常处理函数]：每次[认证函数]发生异常时执行此函数
                .setError(e -> {
                    System.out.println("---------- sa全局异常 ");
                    return Result.failure(e.getMessage());
                });
    }
}
