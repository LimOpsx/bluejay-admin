package fun.luwu.bluejay.cb.uaa.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import fun.luwu.bluejay.sii.uaa.model.SysAuthority;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author LimOps
 */
@Mapper
public interface ISysAuthorityMapper extends BaseMapper<SysAuthority> {
    /**
     * 查询权限码
     * @param loginId
     * @return
     */
    List<String> getPermissionList(@Param("loginId") String loginId);
}
