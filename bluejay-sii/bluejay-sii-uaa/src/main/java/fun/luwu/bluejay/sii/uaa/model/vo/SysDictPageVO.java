package fun.luwu.bluejay.sii.uaa.model.vo;

import lombok.Data;

import java.time.LocalDateTime;

/**
 * @author LimOps
 */
@Data
public class SysDictPageVO {

    private Long id;

    private String name;

    private String value;

    private String type;

    private Integer sort;

    private String remark;

    private Integer status;

    private LocalDateTime createTime;

    private LocalDateTime updateTime;
}
