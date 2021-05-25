package fun.luwu.bluejay.sii.uaa.feign;

import fun.luwu.bluejay.gc.model.Result;
import fun.luwu.bluejay.sii.uaa.model.dto.UserDetailsDTO;
import fun.luwu.bluejay.sii.uaa.model.dto.UserLoginDTO;
import fun.luwu.gc.constant.MicroServiceInnerConstant;
import fun.luwu.gc.constant.MicroServicesNameConstant;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.*;

/**
 * 用户内部访问接口
 *
 * @author LimOps
 */
@FeignClient(contextId = "iUserInnerService",value = MicroServicesNameConstant.IMicroServicesNameConstant.CB_UAA)
public interface IUserInnerService {

    /**
     * 调用user模块接口进行认证
     *
     * @param header   鉴权header
     * @param username 用户名
     * @return fun.luwu.bluejay.gc.model.Result
     */
    @GetMapping("/sys/user/loadByUsername")
    Result<UserDetailsDTO> loadByUsername(@RequestHeader(value = MicroServiceInnerConstant.IMicroServiceInnerConstant.FEIGN_NO_AUTH_N) String header, @RequestParam(name = "username") String username);

    @PostMapping("/sys/user/doLogin")
    Result<UserDetailsDTO> doLogin(@RequestBody UserLoginDTO UserLoginDTO);
}
