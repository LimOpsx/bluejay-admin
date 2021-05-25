package fun.luwu.bluejay.cb.uaa.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import fun.luwu.bluejay.sii.uaa.model.SysAdminToken;
import fun.luwu.bluejay.sii.uaa.model.dto.SysAdminTokenDTO;
import fun.luwu.bluejay.sii.uaa.model.vo.SysAdminTokenVO;

/**
 * @author LimOps
 */
public interface ISysAdminTokenService extends IService<SysAdminToken> {

    IPage<SysAdminTokenVO> pageDTO(SysAdminTokenDTO sysAdminTokenDTO);
}
