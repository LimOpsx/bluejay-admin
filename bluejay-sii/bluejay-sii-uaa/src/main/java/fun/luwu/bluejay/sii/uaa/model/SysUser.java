package fun.luwu.bluejay.sii.uaa.model;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.time.LocalDateTime;

/**
 * @author LimOps
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class SysUser extends Model<SysUser> {

    @TableId(type = IdType.AUTO)
    private Long id;

    /**
     * 用户名
     */
    private String username;

    /**
     * 密码
     */
    private String password;

    /**
     * 手机号
     */
    private String mobile;

    /**
     * 邮件地址
     */
    private String email;

    /**
     * 昵称
     */
    private String nickName;

    /**
     * 性别 0女 1男
     */
    private Integer gender;

    /**
     * 状态 0未删除 1已删除 2停用
     */
    private Integer status;

    /**
     * 密码盐值
     */
    private String salt;

    private LocalDateTime createTime;

    private LocalDateTime updateTime;
}
