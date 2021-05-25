package fun.luwu.bluejay.cb.uaa.service.impl;

import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import fun.luwu.bluejay.cb.uaa.mapper.ISysAuthorityMapResourceMapper;
import fun.luwu.bluejay.cb.uaa.mapper.ISysAuthorityMapper;
import fun.luwu.bluejay.cb.uaa.mapper.ISysResourceMapper;
import fun.luwu.bluejay.cb.uaa.service.ISysResourceService;
import fun.luwu.bluejay.gc.exception.ServiceException;
import fun.luwu.bluejay.sii.uaa.model.SysAuthority;
import fun.luwu.bluejay.sii.uaa.model.SysAuthorityMapResource;
import fun.luwu.bluejay.sii.uaa.model.SysResource;
import fun.luwu.bluejay.sii.uaa.model.constant.ResourceTypeConstant;
import fun.luwu.bluejay.sii.uaa.model.dto.SysResourceDTO;
import fun.luwu.bluejay.sii.uaa.model.dto.SysResourceSaveDTO;
import fun.luwu.bluejay.sii.uaa.model.vo.SysResourceListVO;
import fun.luwu.bluejay.tc.security.service.impl.AuthServiceImpl;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @author LimOps
 */
@Service
@AllArgsConstructor
@Log4j2
public class SysResourceServiceImpl extends ServiceImpl<ISysResourceMapper, SysResource> implements ISysResourceService {

    private final ISysResourceMapper iSysResourceMapper;

    private final ISysAuthorityMapper iSysAuthorityMapper;

    private final ISysAuthorityMapResourceMapper iSysAuthorityMapResourceMapper;

    private final AuthServiceImpl stpInterface;

    /**
     * 查询后台路由
     *
     * @return 路由表
     */
    @Override
    public List<SysResourceListVO> routes() {
        List<String> pmCodes = stpInterface.getPermissionList(StpUtil.getLoginId(), StpUtil.getLoginKey());

        List<SysResourceListVO> routes = iSysResourceMapper.routes(pmCodes);
        if (CollUtil.isEmpty(routes)) {
            return new ArrayList<>();
        }

        return structureChildrenRoutes(routes);
    }

    /**
     * 获取资源列表
     *
     * @param sysResourceDTO 条件查询对象
     * @return java.util.List
     */
    @Override
    public List<SysResourceListVO> listVO(SysResourceDTO sysResourceDTO) {
        List<SysResourceListVO> listVO = iSysResourceMapper.listVO(sysResourceDTO);
        if (CollUtil.isEmpty(listVO)) {
            return new ArrayList<>();
        }

        return structureChildrenRoutes(listVO);
    }

    /**
     * 新增资源
     *
     * @param saveDTO fun.luwu.bluejay.sii.uaa.model.dto.SysResourceSaveDTO
     */
    @Transactional(rollbackFor = Exception.class)
    @Override
    public void add(SysResourceSaveDTO saveDTO) {
        //插入数据
        SysResource target = new SysResource();
        BeanUtil.copyProperties(saveDTO, target);
        this.save(target);

        //查询
        Integer type = target.getType();
        if (ResourceTypeConstant.ResourceTypeEnum.MENU.getType().equals(type)
                || ResourceTypeConstant.ResourceTypeEnum.BUTTON.getType().equals(type)) {
            String permission = saveDTO.getPermission();
            if (StrUtil.isBlank(permission)) {
                throw new ServiceException("权限码为空,请重新输入!");
            }
            //查询权限是否存在
            SysAuthority sysAuthority = iSysAuthorityMapper.selectOne(new LambdaQueryWrapper<SysAuthority>().eq(SysAuthority::getCode, permission));
            if (ObjectUtil.isNull(sysAuthority)) {
                sysAuthority = new SysAuthority();
                //不存在则新建一个权限

                SysAuthority entity = new SysAuthority();
                entity.setCode(permission);
                entity.setName(target.getTitle());
                iSysAuthorityMapper.insert(entity);
                sysAuthority.setId(entity.getId());
            }

            Long sysAuthorityId = sysAuthority.getId();
            Long resourceId = target.getId();
            if (0 == iSysAuthorityMapResourceMapper.selectCount(new LambdaQueryWrapper<SysAuthorityMapResource>().eq(SysAuthorityMapResource::getAuthorityId, sysAuthorityId).eq(SysAuthorityMapResource::getResourceId, resourceId))) {
                SysAuthorityMapResource entity = new SysAuthorityMapResource();
                entity.setAuthorityId(sysAuthorityId);
                entity.setResourceId(resourceId);
                iSysAuthorityMapResourceMapper.insert(entity);
            }
        }

    }

    /**
     * 修改资源
     *
     * @param sysResource fun.luwu.bluejay.sii.uaa.model.dto.SysResourceSaveDTO
     */
    @Override
    public void update(SysResourceSaveDTO sysResource) {
        //插入数据
        SysResource target = new SysResource();
        BeanUtil.copyProperties(sysResource, target);
        this.updateById(target);
        //判断是否修改权限
        Integer type = target.getType();
        if (ResourceTypeConstant.ResourceTypeEnum.MENU.getType().equals(type)
                || ResourceTypeConstant.ResourceTypeEnum.BUTTON.getType().equals(type)) {
            String permission = sysResource.getPermission();
            if (StrUtil.isBlank(permission)) {
                throw new ServiceException("权限码为空,请重新输入!");
            }
            //查询权限是否存在
            SysAuthority sysAuthority = iSysAuthorityMapper.selectOne(new LambdaQueryWrapper<SysAuthority>().eq(SysAuthority::getCode, permission));
            if (ObjectUtil.isNull(sysAuthority)) {
                sysAuthority = new SysAuthority();
                //不存在则新建一个权限,以及关联关系
                SysAuthority entity = new SysAuthority();
                entity.setCode(permission);
                entity.setName(target.getTitle());
                iSysAuthorityMapper.insert(entity);
                sysAuthority.setId(entity.getId());
            }

            //判断关联关系是否存在
            Long sysAuthorityId = sysAuthority.getId();
            Long resourceId = target.getId();
            if (0 == iSysAuthorityMapResourceMapper.selectCount(new LambdaQueryWrapper<SysAuthorityMapResource>().eq(SysAuthorityMapResource::getAuthorityId, sysAuthorityId).eq(SysAuthorityMapResource::getResourceId, resourceId))) {
                SysAuthorityMapResource entity = new SysAuthorityMapResource();
                entity.setAuthorityId(sysAuthorityId);
                entity.setResourceId(resourceId);
                iSysAuthorityMapResourceMapper.insert(entity);
            }
        }

    }

    /**
     * 构造子级数据
     *
     * @param vos 源数据
     * @return java.util.List
     */
    private List<SysResourceListVO> structureChildrenRoutes(List<SysResourceListVO> vos) {
        List<SysResourceListVO> ones = vos.stream().filter(item -> item.getParentId().equals(0L)).collect(Collectors.toList());
        for (SysResourceListVO one : ones) {
            List<SysResourceListVO> child = getChilled(vos, one.getId());
            one.setChildren(child);
        }
        return ones;
    }


    /**
     * 递归组装菜单
     *
     * @param routesVos 路由表菜单
     * @param oId       一级id
     * @return java.util.List
     */
    private List<SysResourceListVO> getChilled(List<SysResourceListVO> routesVos, Long oId) {
        List<SysResourceListVO> vos = new ArrayList<>();
        for (SysResourceListVO routesVO : routesVos) {
            if (routesVO.getParentId().equals(oId)) {
                //找到当前节点的下一级
                vos.add(routesVO);
            }
        }
        //递归查找当前节点的子节点是否包含后代节点
        for (SysResourceListVO vo : vos) {
            List<SysResourceListVO> chilled = getChilled(routesVos, vo.getId());
            vo.setChildren(chilled);
        }

        return vos;
    }
}
