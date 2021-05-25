package fun.luwu.bluejay.cb.uaa.controller;

import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.core.util.ObjectUtil;
import com.baomidou.mybatisplus.core.metadata.IPage;
import fun.luwu.bluejay.cb.uaa.service.ISysAdminTokenService;
import fun.luwu.bluejay.gc.model.Result;
import fun.luwu.bluejay.sii.uaa.model.SysAdminToken;
import fun.luwu.bluejay.sii.uaa.model.constant.SysAdminTokenExpStatusConstant;
import fun.luwu.bluejay.sii.uaa.model.dto.SysAdminTokenDTO;
import fun.luwu.bluejay.sii.uaa.model.vo.SysAdminTokenVO;
import fun.luwu.gc.constant.ResponseCodeConstant;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;

/**
 * @author LimOps
 */
@RestController
@RequestMapping("/sys/admin/token")
@AllArgsConstructor
public class SysAdminTokenController {

    private final ISysAdminTokenService iSysAdminTokenService;

    @PostMapping("/page")
    public Result<IPage<SysAdminTokenVO>> pageDTO(@RequestBody SysAdminTokenDTO sysAdminTokenDTO) {
        return Result.success(iSysAdminTokenService.pageDTO(sysAdminTokenDTO));
    }

    @PostMapping("/disable")
    public Result<Void> disable(@RequestBody SysAdminTokenDTO sysAdminTokenDTO) {
        Long id = sysAdminTokenDTO.getId();
        if (ObjectUtil.isNull(id)) {
            return Result.failure(ResponseCodeConstant.ResponseCodeEnum.PARAMS_ERROR);
        }
        long timeout = StpUtil.getTokenTimeout();
        LocalDateTime now = LocalDateTime.now().plusSeconds(timeout);
        LocalDateTime disableStartDate = sysAdminTokenDTO.getDisableStartDate();
        LocalDateTime disableEndDate = sysAdminTokenDTO.getDisableEndDate();
        LocalDateTime plusStart = disableStartDate.plusSeconds(timeout);
        LocalDateTime plusEnd = disableEndDate.plusSeconds(timeout);
        if(plusStart.isAfter(now) || plusEnd.isAfter(now)){
            return Result.failure("输入错误,封禁的开始或结束时间不能大于令牌的过期时间!");
        }

        long between = ChronoUnit.SECONDS.between(sysAdminTokenDTO.getDisableStartDate(), sysAdminTokenDTO.getDisableEndDate());
        if (0 >= between) {
            return Result.failure("输入错误,封禁的结束时间应该大于开始时间!");
        }

        //更新db
        iSysAdminTokenService.lambdaUpdate()
                .set(SysAdminToken::getExpStatus, SysAdminTokenExpStatusConstant.SysAdminTokenExpStatusEnum.DISABLE.getExpStatus())
                .eq(SysAdminToken::getId, id)
                .update();
        //封禁
        StpUtil.disable(StpUtil.getLoginId(), between);
        return Result.success();
    }

    @PutMapping("/renewal")
    public Result<Void> renewal(){
//        StpUtil.updateLastActivityToNow();
        return Result.success();
    }

    @PostMapping("/down/{id}")
    public Result<Void> down(@PathVariable(name = "id") String id ){
        SysAdminToken adminToken = iSysAdminTokenService.getById(id);
        adminToken.setExpStatus(SysAdminTokenExpStatusConstant.SysAdminTokenExpStatusEnum.DELETE.getExpStatus());
        adminToken.updateById();
        StpUtil.logoutByLoginId(adminToken.getTarget());
        return Result.success();
    }

}
