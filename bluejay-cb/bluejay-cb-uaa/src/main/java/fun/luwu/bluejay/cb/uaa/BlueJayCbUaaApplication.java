package fun.luwu.bluejay.cb.uaa;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;

/**
 * @author LimOps
 */
@SpringBootApplication(scanBasePackages = "fun.luwu.bluejay")
@EnableFeignClients(basePackages = {"fun.luwu.bluejay.sii"})
@EnableDiscoveryClient
public class BlueJayCbUaaApplication {

    public static void main(String[] args) {
        SpringApplication.run(BlueJayCbUaaApplication.class);
    }

}
