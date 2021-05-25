package fun.luwu.bluejay.cb.uaa.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import fun.luwu.bluejay.cb.uaa.service.ISysDictItemService;
import fun.luwu.bluejay.cb.uaa.service.ISysDictService;
import fun.luwu.bluejay.gc.model.Result;
import fun.luwu.bluejay.sii.uaa.model.SysDict;
import fun.luwu.bluejay.sii.uaa.model.SysDictItem;
import fun.luwu.bluejay.sii.uaa.model.dto.SysDictPageDTO;
import fun.luwu.bluejay.sii.uaa.model.vo.AppConfigVO;
import fun.luwu.bluejay.sii.uaa.model.vo.SysDictPageVO;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author LimOps
 */
@RestController
@RequestMapping("/sys/dict")
@AllArgsConstructor
public class SysDictController {

    private final ISysDictService iSysDictService;

    private final ISysDictItemService iSysDictItemService;

    @GetMapping("/getAppConfig")
    public Result<AppConfigVO> getAppConfig() {
        return Result.<AppConfigVO>success(iSysDictService.getAppConfig());
    }

    @GetMapping("/getList")
    public Result<List<SysDictItem>> getList(String type) {
        SysDict sysDict = iSysDictService.getOne(new LambdaQueryWrapper<SysDict>().eq(SysDict::getStatus, 0).eq(SysDict::getType, type));

        List<SysDictItem> sysDictItems = iSysDictItemService.list(new LambdaQueryWrapper<SysDictItem>()
                .eq(SysDictItem::getStatus, 0)
                .eq(SysDictItem::getDictId, sysDict.getId()));

        return Result.success(sysDictItems);
    }

    @PostMapping("/page")
    public Result<IPage<SysDictPageVO>> pageDTO(@RequestBody SysDictPageDTO sysDictPageDTO) {
        return Result.success(iSysDictService.pageDTO(sysDictPageDTO));
    }

    @GetMapping("/{dictId}")
    public Result<SysDict> get(@PathVariable(name = "dictId") String dictId) {
        return Result.<SysDict>success(iSysDictService.getOne(new LambdaQueryWrapper<SysDict>().eq(SysDict::getId,dictId)));
    }


}
