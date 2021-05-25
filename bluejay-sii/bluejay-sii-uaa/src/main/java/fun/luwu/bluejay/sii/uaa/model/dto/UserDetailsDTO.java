package fun.luwu.bluejay.sii.uaa.model.dto;

import lombok.Data;

import java.io.Serializable;
import java.util.List;
import java.util.Set;

/**
 * 用户认证类
 * @author LimOps
 */
@Data
public class UserDetailsDTO implements Serializable {

    private Long userId;

    private String username;

    private String password;

    private String avatar;

    private Integer status;

    private Long roleId;

    private String roleName;

    private String roleCode;

    private String tokenName;

    private String tokenValue;

    private Set<String> permissions;

    private List<String> roles;

}
