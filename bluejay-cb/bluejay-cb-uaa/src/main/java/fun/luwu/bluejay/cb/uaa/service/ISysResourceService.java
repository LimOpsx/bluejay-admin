package fun.luwu.bluejay.cb.uaa.service;

import com.baomidou.mybatisplus.extension.service.IService;
import fun.luwu.bluejay.sii.uaa.model.SysResource;
import fun.luwu.bluejay.sii.uaa.model.dto.SysResourceDTO;
import fun.luwu.bluejay.sii.uaa.model.dto.SysResourceSaveDTO;
import fun.luwu.bluejay.sii.uaa.model.vo.SysResourceListVO;

import java.util.List;

/**
 * @author LimOps
 */
public interface ISysResourceService extends IService<SysResource> {

    /**
     * 查询后台路由
     * @return 路由表
     */
    List<SysResourceListVO> routes();

    /**
     * 获取资源列表
     * @return java.util.List
     * @param sysResourceDTO 条件查询对象
     */
    List<SysResourceListVO> listVO(SysResourceDTO sysResourceDTO);

    /**
     * 新增资源
     * @param saveDTO fun.luwu.bluejay.sii.uaa.model.dto.SysResourceSaveDTO
     */
    void add(SysResourceSaveDTO saveDTO);

    /**
     * 修改资源
     * @param sysResource fun.luwu.bluejay.sii.uaa.model.dto.SysResourceSaveDTO
     */
    void update(SysResourceSaveDTO sysResource);
}
