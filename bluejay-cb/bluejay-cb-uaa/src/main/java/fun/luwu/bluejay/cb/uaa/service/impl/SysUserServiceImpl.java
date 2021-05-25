package fun.luwu.bluejay.cb.uaa.service.impl;

import cn.dev33.satoken.stp.SaTokenInfo;
import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.crypto.SecureUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import fun.luwu.bluejay.cb.uaa.mapper.ISysAdminTokenMapper;
import fun.luwu.bluejay.cb.uaa.mapper.ISysRoleMapper;
import fun.luwu.bluejay.cb.uaa.mapper.ISysUserMapper;
import fun.luwu.bluejay.cb.uaa.service.ISysUserService;
import fun.luwu.bluejay.gc.exception.ServiceException;
import fun.luwu.bluejay.sii.uaa.model.SysAdminToken;
import fun.luwu.bluejay.sii.uaa.model.SysUser;
import fun.luwu.bluejay.sii.uaa.model.constant.SysAdminTokenExpStatusConstant;
import fun.luwu.bluejay.sii.uaa.model.dto.SysUserPageDTO;
import fun.luwu.bluejay.sii.uaa.model.dto.UserDetailsDTO;
import fun.luwu.bluejay.sii.uaa.model.dto.UserLoginDTO;
import fun.luwu.bluejay.sii.uaa.model.vo.SysUserPageVO;
import fun.luwu.bluejay.sii.uaa.model.vo.UserInfoVO;
import fun.luwu.bluejay.tc.security.service.impl.AuthServiceImpl;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

/**
 * @author LimOps
 */
@Service
@AllArgsConstructor
public class SysUserServiceImpl extends ServiceImpl<ISysUserMapper,SysUser> implements ISysUserService {

    private final AuthServiceImpl stpInterface;

    private final ISysRoleMapper iSysRoleMapper;

    private final ISysAdminTokenMapper iSysAdminTokenMapper;

    /**
     * 根据用户名查询用户权限聚合
     *
     * @param username 用户名
     * @return UserDetailsDTO
     */
    @Override
    public UserDetailsDTO loadByUsername(String username) {
        return baseMapper.loadByUsername(username);
    }

    @Override
    public UserDetailsDTO doLogin(UserLoginDTO userLoginDTO) {
        SysUser sysUser = baseMapper.selectOne(new LambdaQueryWrapper<SysUser>().eq(SysUser::getStatus, 0).eq(SysUser::getUsername, userLoginDTO.getUsername()));
        if (ObjectUtil.isNull(sysUser)) {
            throw new ServiceException("用户名或密码错误,请重试!");
        }
        //校验加密
        String rawPassword = SecureUtil.md5(userLoginDTO.getPassword());

        String encPassword = sysUser.getPassword();
        String salt = sysUser.getSalt();
        if(!SecureUtil.md5(rawPassword+ salt).equals(encPassword)){
            throw new ServiceException("用户名或密码错误,请重试!");
        }

        //标记已登录
        String username = sysUser.getUsername();
        StpUtil.setLoginId(username);
        //返回token及用户信息
        SaTokenInfo tokenInfo = StpUtil.getTokenInfo();

        UserDetailsDTO userDetailsDTO = loadByUsername(username);
        userDetailsDTO.setTokenName(tokenInfo.getTokenName());
        String tokenValue = tokenInfo.getTokenValue();
        userDetailsDTO.setTokenValue(tokenValue);

        //插入令牌表
        SysAdminToken entity = new SysAdminToken();
        entity.setTarget(username);
        entity.setValue(tokenValue);
        entity.setExpires(StpUtil.getTokenTimeout());
        entity.setExpStatus(SysAdminTokenExpStatusConstant.SysAdminTokenExpStatusEnum.NORMAL.getExpStatus());
        iSysAdminTokenMapper.insert(entity);

        //写入自定义值
        StpUtil.getSession().set("isAdmin",iSysRoleMapper.getOneByUsername(username).getIsAdmin());
        return userDetailsDTO;
    }

    /**
     * 查询当前用户信息
     *
     * @return fun.luwu.bluejay.sii.uaa.model.vo.UserInfoVO
     */
    @Override
    public UserInfoVO getUserInfo() {
        Object loginId = StpUtil.getLoginId();
        String loginKey = StpUtil.getLoginKey();
        UserInfoVO userInfoVO =  baseMapper.getUserInfo(String.valueOf(loginId));
        userInfoVO.setPermissions(stpInterface.getPermissionList(loginId,loginKey));
        userInfoVO.setRoles(stpInterface.getRoleList(loginId,loginKey));
        return userInfoVO;
    }

    /**
     * 自定义分页查询
     *
     * @param sysUserPageDTO 分页对象
     * @return 分页结果
     */
    @Override
    public IPage<SysUserPageVO> pageDTO(SysUserPageDTO sysUserPageDTO) {

        LambdaQueryWrapper<SysUser> wrapper = new LambdaQueryWrapper<>();
        Integer status = sysUserPageDTO.getStatus();
        if (ObjectUtil.isNotNull(status)) {
            wrapper.eq(SysUser::getStatus,status);
        }
        String username = sysUserPageDTO.getUsername();
        if(StrUtil.isNotBlank(username)){
            wrapper.eq(SysUser::getUsername,username);
        }

        String mobile = sysUserPageDTO.getMobile();
        if(StrUtil.isNotBlank(mobile)){
            wrapper.eq(SysUser::getMobile,mobile);
        }

        return baseMapper.pageDTO(sysUserPageDTO.getPage(),wrapper);
    }
}
