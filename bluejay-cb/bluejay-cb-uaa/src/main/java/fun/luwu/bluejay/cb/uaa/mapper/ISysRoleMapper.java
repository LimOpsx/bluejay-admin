package fun.luwu.bluejay.cb.uaa.mapper;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import fun.luwu.bluejay.sii.uaa.model.SysRole;
import fun.luwu.bluejay.sii.uaa.model.dto.SysRolePageDTO;
import fun.luwu.bluejay.sii.uaa.model.vo.SysRolePageVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author LimOps
 */
@Mapper
public interface ISysRoleMapper extends BaseMapper<SysRole> {
    List<String> getRoles(@Param("loginId") String loginId);

    IPage<SysRolePageVO> pageDTO(IPage<SysRolePageDTO> page , @Param("ew") Wrapper<SysRole> wrapper);

    SysRole getOneByUsername(@Param("username") String username);
}
