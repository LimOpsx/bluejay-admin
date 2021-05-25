package fun.luwu.bluejay.cb.uaa.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import fun.luwu.bluejay.sii.uaa.model.SysDictItem;
import fun.luwu.bluejay.sii.uaa.model.dto.SysDictItemDTO;
import fun.luwu.bluejay.sii.uaa.model.vo.SysDictItemVO;

/**
 * @author LimOps
 */
public interface ISysDictItemService extends IService<SysDictItem> {
    IPage<SysDictItemVO> pageDTO(SysDictItemDTO sysDictItemDTO);
}
