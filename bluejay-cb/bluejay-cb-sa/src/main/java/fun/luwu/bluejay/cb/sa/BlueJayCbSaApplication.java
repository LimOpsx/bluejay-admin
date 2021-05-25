package fun.luwu.bluejay.cb.sa;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;

/**
 * @author LimOps
 */
@EnableFeignClients(basePackages = {"fun.luwu.bluejay.sii"})
@EnableDiscoveryClient
@SpringBootApplication
public class BlueJayCbSaApplication {

    public static void main(String[] args) {
        SpringApplication.run(BlueJayCbSaApplication.class, args);
    }

}
