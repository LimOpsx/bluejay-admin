package fun.luwu.bluejay.sii.uaa.model.vo;

import lombok.Data;

import java.time.LocalDateTime;

/**
 * @author LimOps
 */
@Data
public class SysRolePageVO {

    private Long roleId;

    private String roleCode;

    private String roleName;

    private Integer status;

    /**
     * 是否为管理员 0不是 1是
     */
    private Integer isAdmin;

    private LocalDateTime createTime;

    private LocalDateTime updateTime;

}
