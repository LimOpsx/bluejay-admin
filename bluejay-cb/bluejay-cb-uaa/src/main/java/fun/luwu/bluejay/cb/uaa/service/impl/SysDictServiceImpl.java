package fun.luwu.bluejay.cb.uaa.service.impl;

import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import fun.luwu.bluejay.cb.uaa.mapper.ISysDictItemMapper;
import fun.luwu.bluejay.cb.uaa.mapper.ISysDictMapper;
import fun.luwu.bluejay.cb.uaa.service.ISysDictService;
import fun.luwu.bluejay.sii.uaa.model.SysDict;
import fun.luwu.bluejay.sii.uaa.model.SysDictItem;
import fun.luwu.bluejay.sii.uaa.model.dto.SysDictPageDTO;
import fun.luwu.bluejay.sii.uaa.model.vo.AppConfigVO;
import fun.luwu.bluejay.sii.uaa.model.vo.SysDictPageVO;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * @author LimOps
 */
@Service
@AllArgsConstructor
public class SysDictServiceImpl extends ServiceImpl<ISysDictMapper, SysDict> implements ISysDictService {

    private final ISysDictItemMapper iSysDictItemMapper;

    @Override
    public AppConfigVO getAppConfig() {
        SysDict sysDict = baseMapper.selectOne(new LambdaQueryWrapper<SysDict>().eq(SysDict::getStatus, 0).eq(SysDict::getType, "appConfig"));
        List<SysDictItem> sysDictItems = iSysDictItemMapper.selectList(new LambdaQueryWrapper<SysDictItem>().eq(SysDictItem::getStatus, 0).eq(SysDictItem::getDictId, sysDict.getId()));
        Map<String, String> collect = sysDictItems.stream().collect(Collectors.toMap(SysDictItem::getCode, SysDictItem::getValue));
        AppConfigVO appConfigVO = new AppConfigVO();
        appConfigVO.setSysAppLogo(collect.get("sysAppLogo"));
        appConfigVO.setSysAppName(collect.get("sysAppName"));
        return appConfigVO;
    }

    @Override
    public IPage<SysDictPageVO> pageDTO(SysDictPageDTO sysDictPageDTO) {
        LambdaQueryWrapper<SysDict> queryWrapper = new LambdaQueryWrapper<>();
        String type = sysDictPageDTO.getType();
        if (StrUtil.isNotBlank(type)) {
            queryWrapper.eq(SysDict::getType, type);
        }
        String name = sysDictPageDTO.getName();
        if (StrUtil.isNotBlank(name)) {
            queryWrapper.eq(SysDict::getName, name);
        }

        Integer status = sysDictPageDTO.getStatus();
        if (ObjectUtil.isNotNull(status)) {
            queryWrapper.eq(SysDict::getStatus, status);
        }

        return baseMapper.pageDTO(sysDictPageDTO.getPage(), queryWrapper);
    }
}
