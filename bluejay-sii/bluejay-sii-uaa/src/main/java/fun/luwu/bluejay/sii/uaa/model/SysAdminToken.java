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
public class SysAdminToken extends Model<SysAdminToken> {

    @TableId(type = IdType.AUTO)
    private Long id;

    private String target;

    /**
     * 令牌内容
     */
    private String value;

    /**
     * 过期时间(秒)
     */
    private Long expires;

    /**
     * 0正常
     * 1禁用
     * 2过期
     */
    private Integer expStatus;

    /**
     * 禁用开始时间
     */
    private LocalDateTime disableStartDate;

    /**
     * 禁用结束时间
     */
    private LocalDateTime disableEndDate;


    private LocalDateTime createTime;

    private LocalDateTime updateTime;

}
