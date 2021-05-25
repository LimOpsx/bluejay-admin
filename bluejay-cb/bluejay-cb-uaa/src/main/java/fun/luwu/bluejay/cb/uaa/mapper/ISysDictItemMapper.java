package fun.luwu.bluejay.cb.uaa.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import fun.luwu.bluejay.sii.uaa.model.SysDictItem;
import fun.luwu.bluejay.sii.uaa.model.dto.SysDictItemDTO;
import fun.luwu.bluejay.sii.uaa.model.vo.SysDictItemVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/**
 * @author LimOps
 */
@Mapper
public interface ISysDictItemMapper extends BaseMapper<SysDictItem> {
    IPage<SysDictItemVO> pageDTO(Page page,@Param("ew") SysDictItemDTO sysDictItemDTO);
}
