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
public class SysResource extends Model<SysResource> {

    @TableId(type = IdType.AUTO)
    private Long id;

    private String title;

    private String name;

    private String component;

    private Long parentId;

    private String path;

    private Integer type;

    private String icon;

    private Integer sort;

    private Integer status;

    private LocalDateTime createTime;

    private LocalDateTime updateTime;

}
