package fun.luwu.bluejay.tc.security.service.impl;

import cn.dev33.satoken.stp.StpInterface;
import fun.luwu.bluejay.sii.uaa.feign.ISysAuthorityInnerService;
import fun.luwu.bluejay.sii.uaa.feign.ISysRoleInnerService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * 权限验证
 * @author LimOps
 */
@Component
@AllArgsConstructor
public class AuthServiceImpl implements StpInterface {

    private final ISysAuthorityInnerService iSysAuthorityInnerService;

    private final ISysRoleInnerService iSysRoleInnerService;

    /**
     * 返回指定 LoginId 所拥有的权限码集合
     *
     * @param loginId  账号id
     * @param loginKey 账号体系标识
     * @return 该账号id具有的权限码集合
     */
    @Override
    public List<String> getPermissionList(Object loginId, String loginKey) {
        return iSysAuthorityInnerService.getPermissionList(String.valueOf(loginId)).getData();
    }

    /**
     * 返回指定loginId所拥有的角色标识集合
     *
     * @param loginId  账号id
     * @param loginKey 账号体系标识
     * @return 该账号id具有的角色标识集合
     */
    @Override
    public List<String> getRoleList(Object loginId, String loginKey) {
        return iSysRoleInnerService.getRoles(String.valueOf(loginId)).getData();
    }
}
