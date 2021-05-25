package fun.luwu.bluejay.cb.uaa.mapper;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import fun.luwu.bluejay.sii.uaa.model.SysDict;
import fun.luwu.bluejay.sii.uaa.model.vo.SysDictPageVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/**
 * @author LimOps
 */
@Mapper
public interface ISysDictMapper extends BaseMapper<SysDict> {
    IPage<SysDictPageVO> pageDTO(Page page,@Param("ew") Wrapper<SysDict> queryWrapper);
}
