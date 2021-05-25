package fun.luwu.bluejay.cb.uaa.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import fun.luwu.bluejay.cb.uaa.service.ISysRoleService;
import fun.luwu.bluejay.gc.model.Result;
import fun.luwu.bluejay.sii.uaa.model.dto.SysRolePageDTO;
import fun.luwu.bluejay.sii.uaa.model.vo.SysRolePageVO;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author LimOps
 */
@RestController
@RequestMapping("/sys/role")
@AllArgsConstructor
public class SysRoleController {

    private final ISysRoleService iSysRoleService;

    @GetMapping("/getRoles")
    public Result<List<String>> getRoles(@RequestParam("loginId") String loginId){
        return Result.<List<String>>success(iSysRoleService.getRoles(loginId));
    }

    @PostMapping("/page")
    public Result<IPage<SysRolePageVO>> page(@RequestBody SysRolePageDTO sysRolePageDTO){
        return Result.<IPage<SysRolePageVO>>success(iSysRoleService.pageDTO(sysRolePageDTO));
    }

}
