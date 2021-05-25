package fun.luwu.bluejay.sii.uaa.model.constant;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * @author LimOps
 */
public class SysAdminTokenExpStatusConstant {

    @AllArgsConstructor
    @Getter
    public enum SysAdminTokenExpStatusEnum{

        NORMAL(0,"正常"),

        DISABLE(1,"封禁"),

        DELETE(2,"删除");


        private final Integer expStatus;

        private final String desc;

    }

}
