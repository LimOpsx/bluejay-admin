package fun.luwu.bluejay.sii.uaa.model.vo;

import lombok.Data;

import java.util.List;

/**
 * 路由表
 * @author LimOps
 */
@Data
public class RoutesVO {

    private String title;

    private String icon;

    private String path;

    /**
     * 父id
     */
    private Long parentId;

    private List<RoutesVO> children;

    private Long roleId;

    private String component;

    private Long menuId;

    private String menuName;

    private String menuType;

    private String permission;

    private Integer sort;

}
