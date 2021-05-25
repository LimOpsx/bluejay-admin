package fun.luwu.bluejay.cb.uaa.service;

import com.baomidou.mybatisplus.extension.service.IService;
import fun.luwu.bluejay.sii.uaa.model.SysAuthority;

import java.util.List;

/**
 * @author LimOps
 */
public interface ISysAuthorityService extends IService<SysAuthority> {
    /**
     * 根据账号id查询权限码
     * @param loginId 账号id
     * @return 权限码
     */
    List<String> getPermissionList(String loginId);
}
