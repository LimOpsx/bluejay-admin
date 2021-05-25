package fun.luwu.bluejay.cb.uaa.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import fun.luwu.bluejay.sii.uaa.model.SysAdminToken;
import fun.luwu.bluejay.sii.uaa.model.dto.SysAdminTokenDTO;
import fun.luwu.bluejay.sii.uaa.model.vo.SysAdminTokenVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/**
 * @author LimOps
 */
@Mapper
public interface ISysAdminTokenMapper extends BaseMapper<SysAdminToken> {

    IPage<SysAdminTokenVO> pageDTO(Page page, @Param("ew") SysAdminTokenDTO sysAdminTokenDTO);

}
