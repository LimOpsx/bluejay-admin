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
public class SysAuthority extends Model<SysAuthority> {

    @TableId(type = IdType.AUTO)
    private Long id;

    private String name;

    private String code;

    private Integer status;

    private LocalDateTime createTime;

    private LocalDateTime updateTime;

}
