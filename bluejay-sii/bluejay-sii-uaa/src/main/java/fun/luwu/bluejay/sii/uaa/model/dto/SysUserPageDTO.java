package fun.luwu.bluejay.sii.uaa.model.dto;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.Data;

/**
 * @author LimOps
 */
@Data
public class SysUserPageDTO {

    private Page page;

    private String username;

    private String mobile;

    private Integer status;

}
