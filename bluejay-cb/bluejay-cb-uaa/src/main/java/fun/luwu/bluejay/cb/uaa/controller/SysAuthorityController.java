package fun.luwu.bluejay.cb.uaa.controller;

import cn.hutool.core.util.StrUtil;
import fun.luwu.bluejay.cb.uaa.service.ISysAuthorityService;
import fun.luwu.bluejay.gc.model.Result;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @author LimOps
 */
@RestController
@RequestMapping("/sys/auth")
@AllArgsConstructor
public class SysAuthorityController {

    private final ISysAuthorityService iSysAuthorityService;

    @PostMapping("/getPermissionList")
    public Result<List<String>> getPermissionList(String loginId){
        if(StrUtil.isBlank(loginId)){
            return Result.failure("获取权限码集合失败,loginId为空!");
        }
        return Result.<List<String>>success(iSysAuthorityService.getPermissionList(loginId));
    }

}
