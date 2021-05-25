package fun.luwu.bluejay.cb.uaa.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import fun.luwu.bluejay.sii.uaa.model.SysResource;
import fun.luwu.bluejay.sii.uaa.model.dto.SysResourceDTO;
import fun.luwu.bluejay.sii.uaa.model.vo.SysResourceListVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author LimOps
 */
@Mapper
public interface ISysResourceMapper extends BaseMapper<SysResource> {
    /**
     * 根据权限编码列表查询路由表
     * @param pmCodes 权限编码列表
     * @return java.util.List
     */
    List<SysResourceListVO> routes(@Param("ews") List<String> pmCodes);

    /**
     * 查询资源列表,包括已删除
     * @return java.util.List
     * @param sysResourceDTO 条件查询对象
     */
    List<SysResourceListVO> listVO(@Param("ew") SysResourceDTO sysResourceDTO);
}
