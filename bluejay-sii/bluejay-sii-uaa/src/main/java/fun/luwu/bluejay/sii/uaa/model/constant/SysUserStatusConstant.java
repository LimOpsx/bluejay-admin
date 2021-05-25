package fun.luwu.bluejay.sii.uaa.model.constant;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 用户状态常量类
 *
 * @author LimOps
 */
public final class SysUserStatusConstant {

    @AllArgsConstructor
    @Getter
    public enum SysUserStatusEnum {
        /**
         * 正常(未删除)
         */
        NORMAL(0),

        /**
         * 隐藏
         */
        HIDE(1),

        /**
         * 禁用(停用)
         */
        DISABLE(2);

        /**
         * 状态
         */
        private final Integer status;
    }

}
