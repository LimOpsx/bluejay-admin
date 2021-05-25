package fun.luwu.gc.constant;

/**
 * @author LimOps
 */
public final class CacheKeyConstant {

    public static final  String PROJECT_NAME = "bluejay_";

    public static final  String OAUTH_PREFIX = "oauth";

    public static final String TOKEN_NAME_PREFIX = "satoken:";

    /**
     * @author LimOps
     */
    public interface ICacheKeyConstant{

        String DISABLE_TOKEN_KEY = TOKEN_NAME_PREFIX+"disable:";
    }

}
