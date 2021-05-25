package fun.luwu.bluejay.cb.sa.controller;

import com.alibaba.cloud.nacos.discovery.NacosDiscoveryClient;
import fun.luwu.bluejay.gc.model.Result;
import fun.luwu.bluejay.sii.sa.model.dto.SaApiGovernDTO;
import fun.luwu.bluejay.sii.sa.model.vo.SaApiGovernVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author LimOps
 */
@RestController
@RequestMapping("/sa/api/govern")
public class SaApiGovernController {

    @PostMapping("/page")
    public Result<SaApiGovernVO> pageDTO(@RequestBody SaApiGovernDTO saApiGovernDTO) {
        return Result.success();
    }

}
