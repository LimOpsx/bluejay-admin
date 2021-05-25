package fun.luwu.bluejay.cb.uaa.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import fun.luwu.bluejay.sii.uaa.model.SysRole;
import fun.luwu.bluejay.sii.uaa.model.dto.SysRolePageDTO;
import fun.luwu.bluejay.sii.uaa.model.vo.SysRolePageVO;

import java.util.List;

/**
 * @author LimOps
 */
public interface ISysRoleService extends IService<SysRole> {

    List<String> getRoles(String loginId);

    IPage<SysRolePageVO> pageDTO(SysRolePageDTO page);
}
