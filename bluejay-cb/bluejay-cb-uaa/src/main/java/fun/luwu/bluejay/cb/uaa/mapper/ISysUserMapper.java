package fun.luwu.bluejay.cb.uaa.mapper;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import fun.luwu.bluejay.sii.uaa.model.SysUser;
import fun.luwu.bluejay.sii.uaa.model.dto.UserDetailsDTO;
import fun.luwu.bluejay.sii.uaa.model.vo.SysUserPageVO;
import fun.luwu.bluejay.sii.uaa.model.vo.UserInfoVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/**
 * @author LimOps
 */
@Mapper
public interface ISysUserMapper extends BaseMapper<SysUser> {
    /**
     * 根据用户名查询用户权限聚合
     * @param username 用户名
     * @return UserDetailsDTO
     */
    UserDetailsDTO loadByUsername(@Param("username") String username);

    UserInfoVO getUserInfo(@Param("loginId") String loginId);

    IPage<SysUserPageVO> pageDTO(Page page, @Param("ew") Wrapper<SysUser> wrapper);
}
