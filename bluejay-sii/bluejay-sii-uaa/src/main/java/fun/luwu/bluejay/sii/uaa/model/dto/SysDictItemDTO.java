package fun.luwu.bluejay.sii.uaa.model.dto;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.Data;

/**
 * @author LimOps
 */
@Data
public class SysDictItemDTO {

    private Page page;

    private String type;

    private String name;

    private Integer status;

    private Long dictId;

}
