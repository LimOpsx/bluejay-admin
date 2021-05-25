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
public class SysDictItem extends Model<SysDictItem> {

    @TableId(type = IdType.AUTO)
    private Long id;

    private Long dictId;

    /**
     * 字典值
     */
    private String value;

    private String code;

    private String name;

    /**
     * 字典项名
     */
    private String remark;

    private Short sort;

    private Short status;

    private LocalDateTime createTime;

    private LocalDateTime updateTime;
}
