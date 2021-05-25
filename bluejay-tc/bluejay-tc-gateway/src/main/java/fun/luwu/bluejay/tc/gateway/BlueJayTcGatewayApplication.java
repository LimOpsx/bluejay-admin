package fun.luwu.bluejay.tc.gateway;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

/**
 * 网关启动类
 * @author LimOps
 */
@EnableDiscoveryClient
@SpringBootApplication
public class BlueJayTcGatewayApplication {

    public static void main(String[] args) {
        SpringApplication.run(BlueJayTcGatewayApplication.class);
    }

}
