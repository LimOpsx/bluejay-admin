package fun.luwu.bluejay.sii.uaa.model.vo;

import lombok.Data;

import java.time.LocalDateTime;
import java.util.List;

/**
 * @author LimOps
 */
@Data
public class SysResourceListVO {

    private Long id;

    /**
     * 资源编码
     */
    private String name;

    /**
     * 菜单标题
     */
    private String title;

    /**
     * 组件名称
     */
    private String component;

    /**
     * 资源路径
     */
    private String path;

    /**
     * 资源图标
     */
    private String icon;

    /**
     * 父级id,最顶层为0
     */
    private Long parentId;

    /**
     * 是否外链 1是 2否
     */
    private Integer isFrame;

    private Integer status;

    /**
     * 权限码
     */
    private String permission;

    /**
     * 资源子目录
     */
    private List<SysResourceListVO> children;

    private LocalDateTime createTime;

    private LocalDateTime updateTime;


}
