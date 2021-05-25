package fun.luwu.bluejay.sii.uaa.model.dto;

import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

/**
 * @author LimOps
 */
@Data
public class SysResourceSaveDTO {

    private Long id;

    private String permission;

    @NotBlank(message = "资源标题不能为空!")
    private String title;

    @NotBlank(message = "资源名称不能为空!")
    private String name;

    @NotNull(message = "请选择父级资源!")
    private Long parentId;

    @NotBlank(message = "资源路径不能为空!")
    private String path;

    @NotBlank(message = "资源类型不能为空!")
    private Integer type;

    @NotBlank(message = "组件名称不能为空!")
    private String component;

    private String icon;

    private Integer isFrame;

    @NotNull(message = "资源排序值不能为空!")
    private Integer sort;

    @NotNull(message = "资源状态为必选!")
    private Integer status;

}
