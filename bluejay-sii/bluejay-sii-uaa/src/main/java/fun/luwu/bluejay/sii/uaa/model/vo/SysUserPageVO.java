package fun.luwu.bluejay.sii.uaa.model.vo;

import lombok.Data;

import java.time.LocalDateTime;

/**
 * @author LimOps
 */
@Data
public class SysUserPageVO {

    private Long userId;

    private String username;

    private String nickName;

    private Integer status;

    /**
     * 邮箱号
     */
    private String email;

    /**
     * 性别 0 女 1 男
     */
    private Integer gender;

    /**
     * 电话号
     */
    private String mobile;

    /**
     * 头像
     */
    private String avatar;

    private LocalDateTime createTime;

    private LocalDateTime updateTime;

}
