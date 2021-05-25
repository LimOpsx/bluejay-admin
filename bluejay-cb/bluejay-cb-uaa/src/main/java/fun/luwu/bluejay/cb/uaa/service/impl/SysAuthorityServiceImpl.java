package fun.luwu.bluejay.cb.uaa.service.impl;

import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.core.util.ObjectUtil;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import fun.luwu.bluejay.cb.uaa.mapper.ISysAuthorityMapper;
import fun.luwu.bluejay.cb.uaa.service.ISysAuthorityService;
import fun.luwu.bluejay.sii.uaa.model.SysAuthority;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

/**
 * @author LimOps
 */
@Service
public class SysAuthorityServiceImpl extends ServiceImpl<ISysAuthorityMapper, SysAuthority> implements ISysAuthorityService {
    /**
     * 根据账号id查询权限码
     *
     * @param loginId 账号id
     * @return 权限码
     */
    @Override
    public List<String> getPermissionList(String loginId) {
        Integer isAdmin = StpUtil.getSessionByLoginId(loginId).getInt("isAdmin");
        if (ObjectUtil.isNotNull(isAdmin) && isAdmin.equals(1)) {
            return this.list().stream().map(SysAuthority::getCode).collect(Collectors.toList());
        }
        return baseMapper.getPermissionList(loginId);
    }
}
