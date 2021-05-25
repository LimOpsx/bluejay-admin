package fun.luwu.bluejay.cb.uaa.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import fun.luwu.bluejay.cb.uaa.mapper.ISysDictItemMapper;
import fun.luwu.bluejay.cb.uaa.service.ISysDictItemService;
import fun.luwu.bluejay.sii.uaa.model.SysDictItem;
import fun.luwu.bluejay.sii.uaa.model.dto.SysDictItemDTO;
import fun.luwu.bluejay.sii.uaa.model.vo.SysDictItemVO;
import org.springframework.stereotype.Service;

/**
 * @author LimOps
 */
@Service
public class SysDictItemServiceImpl extends ServiceImpl<ISysDictItemMapper, SysDictItem> implements ISysDictItemService {
    @Override
    public IPage<SysDictItemVO> pageDTO(SysDictItemDTO sysDictItemDTO) {
        return baseMapper.pageDTO(sysDictItemDTO.getPage(),sysDictItemDTO);
    }
}
