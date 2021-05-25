package fun.luwu.bluejay.sii.uaa.model.vo;

import lombok.Data;

import java.util.List;

/**
 * @author LimOps
 */
@Data
public class UserInfoVO {

//    {"requestId":"9aa1b4ee-8f8e-4dea-b09f-01dcb7733a1d","code":200,"data":{"avatar":"https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif","buttons":["*:*:*"],"deptId":1,"introduction":" am a super administrator","name":"zhangwj","permissions":["*:*:*"],"roles":["admin"],"userId":1,"userName":"zhangwj"}}

    /**
     * 头像
     */
    private String avatar;

    private List<String> roles;

    private List<String> permissions;

    private String userName;

    private Long userId;

    private String name;


}
