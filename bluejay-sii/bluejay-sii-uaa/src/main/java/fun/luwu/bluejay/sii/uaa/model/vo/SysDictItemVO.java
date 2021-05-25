package fun.luwu.bluejay.sii.uaa.model.vo;

import lombok.Data;

import java.time.LocalDateTime;

/**
 * @author LimOps
 */
@Data
public class SysDictItemVO {

    private Long id;

    private Long dictId;

    private String value;

    private String name;

    private String code;

    private Integer sort;

    private String remark;

    private Integer system;

    private Integer status;

    private LocalDateTime createTime;

    private LocalDateTime updateTime;

}
