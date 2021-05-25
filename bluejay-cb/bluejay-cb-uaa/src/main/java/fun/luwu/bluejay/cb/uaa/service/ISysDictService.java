package fun.luwu.bluejay.cb.uaa.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import fun.luwu.bluejay.sii.uaa.model.SysDict;
import fun.luwu.bluejay.sii.uaa.model.dto.SysDictPageDTO;
import fun.luwu.bluejay.sii.uaa.model.vo.AppConfigVO;
import fun.luwu.bluejay.sii.uaa.model.vo.SysDictPageVO;

/**
 * @author LimOps
 */
public interface ISysDictService extends IService<SysDict> {

    AppConfigVO getAppConfig();

    IPage<SysDictPageVO> pageDTO(SysDictPageDTO sysDictPageDTO);
}
