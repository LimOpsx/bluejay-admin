package fun.luwu.bluejay.cb.uaa.controller;

import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.metadata.IPage;
import fun.luwu.bluejay.cb.uaa.service.ISysUserService;
import fun.luwu.bluejay.gc.annotation.ServiceAuthInner;
import fun.luwu.bluejay.gc.model.Result;
import fun.luwu.bluejay.sii.uaa.model.dto.SysUserPageDTO;
import fun.luwu.bluejay.sii.uaa.model.dto.UserDetailsDTO;
import fun.luwu.bluejay.sii.uaa.model.dto.UserLoginDTO;
import fun.luwu.bluejay.sii.uaa.model.vo.SysUserPageVO;
import fun.luwu.bluejay.sii.uaa.model.vo.UserInfoVO;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

/**
 * @author LimOps
 */
@RestController
@RequestMapping("/sys/user")
@AllArgsConstructor
public class SysUserController {

    private final ISysUserService iSysUserService;

    @ServiceAuthInner(value = false)
    @GetMapping("/loadByUsername")
    public Result<UserDetailsDTO> loadByUsername(String username) {
        if (StrUtil.isBlankIfStr(username)) {
            return Result.failure("认证用户失败!");
        }
        return Result.success(iSysUserService.loadByUsername(username));
    }

    @PostMapping("/doLogin")
    public Result<UserDetailsDTO> doLogin(@RequestBody UserLoginDTO userLoginDTO) {
        if (ObjectUtil.hasNull(userLoginDTO)) {
            return Result.failure("账号密码不能为空!");
        }
        return Result.success(iSysUserService.doLogin(userLoginDTO));
    }

    /**
     * 刷新当前登录的token
     * @return token
     */
    @PostMapping("/refresh")
    public Result<String> refresh() {
//        StpUtil
        return Result.success();
    }

    @PostMapping("/getUserInfo")
    public Result<UserInfoVO> getUserInfo() {
        return Result.<UserInfoVO>success(iSysUserService.getUserInfo());
    }

    /**
     * 退出登录
     *
     * @return void
     */
    @PostMapping("/logout")
    public Result<Void> logout() {
        StpUtil.logout();
        return Result.success();
    }

    @PostMapping("/page")
    public Result<IPage<SysUserPageVO>> pageDTO(@RequestBody SysUserPageDTO sysUserPageDTO) {
        return Result.<IPage<SysUserPageVO>>success(iSysUserService.pageDTO(sysUserPageDTO));
    }

}
