package fun.luwu.bluejay.cb.uaa.service.impl;

import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import fun.luwu.bluejay.cb.uaa.mapper.ISysRoleMapper;
import fun.luwu.bluejay.cb.uaa.service.ISysRoleService;
import fun.luwu.bluejay.sii.uaa.model.SysRole;
import fun.luwu.bluejay.sii.uaa.model.dto.SysRolePageDTO;
import fun.luwu.bluejay.sii.uaa.model.vo.SysRolePageVO;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author LimOps
 */
@Service
public class SysRoleServiceImpl extends ServiceImpl<ISysRoleMapper, SysRole> implements ISysRoleService {
    @Override
    public List<String> getRoles(String loginId) {
        return baseMapper.getRoles(loginId);
    }

    @Override
    public IPage<SysRolePageVO> pageDTO(SysRolePageDTO sysRolePageDTO) {
        LambdaQueryWrapper<SysRole> wrapper = new LambdaQueryWrapper<>();
        Integer status = sysRolePageDTO.getStatus();
        if (ObjectUtil.isNotNull(status)) {
            wrapper.eq(SysRole::getStatus,status);
        }
        String roleCode = sysRolePageDTO.getRoleCode();
        if(StrUtil.isNotBlank(roleCode)){
            wrapper.eq(SysRole::getCode,roleCode);
        }

        String roleName = sysRolePageDTO.getRoleName();
        if(StrUtil.isNotBlank(roleName)){
            wrapper.eq(SysRole::getName,roleName);
        }
        return baseMapper.<SysRolePageVO>pageDTO(sysRolePageDTO.getPage(), wrapper);
    }
}
