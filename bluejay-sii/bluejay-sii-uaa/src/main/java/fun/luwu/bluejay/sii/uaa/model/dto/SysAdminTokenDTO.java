package fun.luwu.bluejay.sii.uaa.model.dto;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * @author LimOps
 */
@Data
public class SysAdminTokenDTO {

    private Page page;

    private Long id;

    private String target;

    private LocalDateTime disableStartDate;

    private LocalDateTime disableEndDate;

    private Long expires;

}
