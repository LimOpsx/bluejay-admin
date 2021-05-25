package fun.luwu.bluejay.cb.uaa.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import fun.luwu.bluejay.sii.uaa.model.dto.SysUserPageDTO;
import fun.luwu.bluejay.sii.uaa.model.dto.UserLoginDTO;
import fun.luwu.bluejay.sii.uaa.model.SysUser;
import fun.luwu.bluejay.sii.uaa.model.dto.UserDetailsDTO;
import fun.luwu.bluejay.sii.uaa.model.vo.SysUserPageVO;
import fun.luwu.bluejay.sii.uaa.model.vo.UserInfoVO;

/**
 * @author LimOps
 */
public interface ISysUserService extends IService<SysUser> {

    /**
     * 根据用户名查询用户权限聚合
     * @param username 用户名
     * @return UserDetailsDTO
     */
    UserDetailsDTO loadByUsername(String username);

    /**
     * 用户登录
     * @param userLoginDTO 用户dto对象
     * @return fun.luwu.bluejay.sii.uaa.model.dto.UserDetailsDTO
     */
    UserDetailsDTO doLogin(UserLoginDTO userLoginDTO);

    /**
     * 查询当前用户信息
     * @return fun.luwu.bluejay.sii.uaa.model.vo.UserInfoVO
     */
    UserInfoVO getUserInfo();

    /**
     * 自定义分页查询
     * @param sysUserPageDTO 分页对象
     * @return 分页结果
     */
    IPage<SysUserPageVO> pageDTO(SysUserPageDTO sysUserPageDTO);
}
