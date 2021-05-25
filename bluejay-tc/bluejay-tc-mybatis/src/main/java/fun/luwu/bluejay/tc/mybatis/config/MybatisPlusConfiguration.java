package fun.luwu.bluejay.tc.mybatis.config;

import com.baomidou.mybatisplus.extension.plugins.inner.PaginationInnerInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * mybatisPlus配置类
 * @author LimOps
 */
@Configuration
public class MybatisPlusConfiguration {



    /**
     * 分页插件
     * @return com.baomidou.mybatisplus.extension.plugins.inner.PaginationInnerInterceptor
     */
    @Bean
    public PaginationInnerInterceptor paginationInterceptor() {
        return new PaginationInnerInterceptor();
    }


}
