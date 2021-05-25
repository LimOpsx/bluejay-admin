package fun.luwu.bluejay.sii.uaa.model.dto;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.Data;

/**
 * @author LimOps
 */
@Data
public class SysRolePageDTO {

    private String roleName;

    private String roleCode;

    private Integer status;

    private Page<SysRolePageDTO> page;

}
