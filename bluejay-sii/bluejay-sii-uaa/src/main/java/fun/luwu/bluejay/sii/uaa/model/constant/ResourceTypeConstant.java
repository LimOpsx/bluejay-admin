package fun.luwu.bluejay.sii.uaa.model.constant;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * @author LimOps
 */
public class ResourceTypeConstant {

    @AllArgsConstructor
    @Getter
    public enum ResourceTypeEnum{
        /**
         * 目录
         */
        CATALOGUE(1,"目录"),
        /**
         * 菜单
         */
        MENU(2,"菜单"),
        /**
         * 按钮
         */
        BUTTON(3,"按钮"),
        /**
         * 接口
         */
        INTERFACE(4,"接口");

        private final Integer type;

        private final String desc;
    }

}
