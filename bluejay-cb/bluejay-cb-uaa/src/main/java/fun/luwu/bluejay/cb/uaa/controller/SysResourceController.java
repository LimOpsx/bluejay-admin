package fun.luwu.bluejay.cb.uaa.controller;

import cn.hutool.core.util.ObjectUtil;
import fun.luwu.bluejay.cb.uaa.service.ISysResourceService;
import fun.luwu.bluejay.gc.model.Result;
import fun.luwu.bluejay.sii.uaa.model.SysResource;
import fun.luwu.bluejay.sii.uaa.model.constant.SysUserStatusConstant;
import fun.luwu.bluejay.sii.uaa.model.dto.SysResourceDTO;
import fun.luwu.bluejay.sii.uaa.model.dto.SysResourceSaveDTO;
import fun.luwu.bluejay.sii.uaa.model.vo.SysResourceListVO;
import fun.luwu.gc.constant.ResponseCodeConstant;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 系统资源
 *
 * @author LimOps
 */
@RestController
@RequestMapping("/sys/resource")
@AllArgsConstructor
public class SysResourceController {

    private final ISysResourceService iSysResourceService;

    @PostMapping("/routes")
    public Result<List<SysResourceListVO>> routes() {
        return Result.success(iSysResourceService.routes());
    }

    @PostMapping("/list")
    public Result<List<SysResourceListVO>> listVO(@RequestBody(required = false) SysResourceDTO sysResourceDTO) {
        return Result.success(iSysResourceService.listVO(sysResourceDTO));
    }

    @PostMapping
    public Result<Void> add(@RequestBody SysResourceSaveDTO sysResource) {
        iSysResourceService.add(sysResource);
        return Result.<Void>success();
    }

    @PutMapping("/{id}")
    public Result<Void> update(@RequestBody SysResourceSaveDTO sysResource, @PathVariable(name = "id") Long id) {
        sysResource.setId(id);
        iSysResourceService.update(sysResource);
        return Result.success();
    }

    @DeleteMapping("/{id}")
    public Result<Void> delete(@PathVariable(name = "id") Long id) {
        if (ObjectUtil.isNull(id)) {
            return Result.failure(ResponseCodeConstant.ResponseCodeEnum.PARAMS_ERROR);
        }
        iSysResourceService.lambdaUpdate()
                .set(SysResource::getStatus, SysUserStatusConstant.SysUserStatusEnum.DISABLE.getStatus())
                .eq(SysResource::getId, id)
                .update();
        return Result.success();
    }

    @GetMapping("/{id}")
    public Result<SysResource> get(@PathVariable(name = "id") Long id) {
        if (ObjectUtil.isNull(id)) {
            return Result.failure(ResponseCodeConstant.ResponseCodeEnum.PARAMS_ERROR);
        }
        return Result.success(iSysResourceService.getById(id));
    }
}
