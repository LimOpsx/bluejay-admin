package fun.luwu.bluejay.sii.uaa.model;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @author LimOps
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class SysAuthorityMapResource extends Model<SysAuthorityMapResource> {

    @TableId(type = IdType.AUTO)
    private Long id;

    private Long authorityId;

    private Long resourceId;

}
