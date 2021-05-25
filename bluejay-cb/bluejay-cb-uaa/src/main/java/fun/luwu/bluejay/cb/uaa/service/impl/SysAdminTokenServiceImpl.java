package fun.luwu.bluejay.cb.uaa.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import fun.luwu.bluejay.cb.uaa.mapper.ISysAdminTokenMapper;
import fun.luwu.bluejay.cb.uaa.service.ISysAdminTokenService;
import fun.luwu.bluejay.sii.uaa.model.SysAdminToken;
import fun.luwu.bluejay.sii.uaa.model.dto.SysAdminTokenDTO;
import fun.luwu.bluejay.sii.uaa.model.vo.SysAdminTokenVO;
import org.springframework.stereotype.Service;

/**
 * @author LimOps
 */
@Service
public class SysAdminTokenServiceImpl extends ServiceImpl<ISysAdminTokenMapper, SysAdminToken> implements ISysAdminTokenService {
    @Override
    public IPage<SysAdminTokenVO> pageDTO(SysAdminTokenDTO sysAdminTokenDTO) {
        return baseMapper.pageDTO(sysAdminTokenDTO.getPage(),sysAdminTokenDTO);
    }
}
