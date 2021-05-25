package fun.luwu.bluejay.sii.uaa.feign;

import fun.luwu.bluejay.gc.model.Result;
import fun.luwu.gc.constant.MicroServicesNameConstant;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * @author LimOps
 */
@FeignClient(contextId = "iSysAuthorityInnerService",value = MicroServicesNameConstant.IMicroServicesNameConstant.CB_UAA)
public interface ISysAuthorityInnerService {

    /**
     * 获取权限码列表
     * @param loginId 登录id
     * @return 权限码
     */
    @PostMapping("/sys/auth/getPermissionList")
    Result<List<String>> getPermissionList(@RequestParam(name = "loginId") String loginId);


}
