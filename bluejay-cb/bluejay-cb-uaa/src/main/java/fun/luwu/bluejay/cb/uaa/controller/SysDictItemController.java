package fun.luwu.bluejay.cb.uaa.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import fun.luwu.bluejay.cb.uaa.service.ISysDictItemService;
import fun.luwu.bluejay.gc.model.Result;
import fun.luwu.bluejay.sii.uaa.model.dto.SysDictItemDTO;
import fun.luwu.bluejay.sii.uaa.model.vo.SysDictItemVO;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author LimOps
 */
@RestController
@RequestMapping("/sys/dict/item")
@AllArgsConstructor
public class SysDictItemController {

    private final ISysDictItemService iSysDictItemService;

    @PostMapping("/page")
    public Result<IPage<SysDictItemVO>> pageDTO(@RequestBody SysDictItemDTO sysDictItemDTO){
        return Result.success(iSysDictItemService.pageDTO(sysDictItemDTO));
    }

}
