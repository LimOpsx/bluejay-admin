package fun.luwu.bluejay.sii.uaa.feign;

import fun.luwu.bluejay.gc.model.Result;
import fun.luwu.gc.constant.MicroServicesNameConstant;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * @author LimOps
 */
@FeignClient(MicroServicesNameConstant.IMicroServicesNameConstant.CB_UAA)
public interface ISysRoleInnerService {

    @GetMapping("/sys/role/getRoles")
    Result<List<String>> getRoles(@RequestParam("loginId") String loginId);

}
