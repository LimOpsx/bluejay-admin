package fun.luwu.bluejay.tc.gateway.compo;

import cn.dev33.satoken.listener.SaTokenListener;
import cn.dev33.satoken.stp.SaLoginModel;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 * token状态监听
 * @author LimOps
 */
@Log4j2
@Component
public class BluJayTokenListener implements SaTokenListener {
    /**
     * 每次登录时触发
     *
     * @param loginKey   账号类别
     * @param loginId    账号id
     * @param loginModel 登录参数
     */
    @Override
    public void doLogin(String loginKey, Object loginId, SaLoginModel loginModel) {
        log.info("登录账号============>>loginKey:{},loginId:{},saLoginModel:{}",loginKey,loginId,loginModel);
    }

    /**
     * 每次注销时触发
     *
     * @param loginKey   账号类别
     * @param loginId    账号id
     * @param tokenValue token值
     */
    @Override
    public void doLogout(String loginKey, Object loginId, String tokenValue) {
        log.info("注销账号============>>loginKey:{},loginId:{},tokenValue:{}",loginKey,loginId,tokenValue);
    }

    /**
     * 每次被踢下线时触发
     *
     * @param loginKey   账号类别
     * @param loginId    账号id
     * @param tokenValue token值
     * @param device     设备标识
     */
    @Override
    public void doLogoutByLoginId(String loginKey, Object loginId, String tokenValue, String device) {
        log.info("账号被踢下线============>>loginKey:{},loginId:{},tokenValue:{},device:{}",loginKey,loginId,tokenValue,device);
    }

    /**
     * 每次被顶下线时触发
     *
     * @param loginKey   账号类别
     * @param loginId    账号id
     * @param tokenValue token值
     * @param device     设备标识
     */
    @Override
    public void doReplaced(String loginKey, Object loginId, String tokenValue, String device) {
        log.info("账号被顶下线============>>loginKey:{},loginId:{},tokenValue:{},device:{}",loginKey,loginId,tokenValue,device);
    }

    /**
     * 每次被封禁时触发
     *
     * @param loginKey    账号类别
     * @param loginId     账号id
     * @param disableTime 封禁时长，单位: 秒
     */
    @Override
    public void doDisable(String loginKey, Object loginId, long disableTime) {
        String format = LocalDateTime.now().plusSeconds(disableTime).format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        log.info("账号被封禁============>>loginKey:{},loginId:{},disableTime:{},到期时间:{}",loginKey,loginId,disableTime,format);
    }

    /**
     * 每次被解封时触发
     *
     * @param loginKey 账号类别
     * @param loginId  账号id
     */
    @Override
    public void doUntieDisable(String loginKey, Object loginId) {
        log.info("账号已经解封============>>loginKey:{},loginId:{}",loginKey,loginId);
    }

    /**
     * 每次创建Session时触发
     *
     * @param id SessionId
     */
    @Override
    public void doCreateSession(String id) {

    }

    /**
     * 每次注销Session时触发
     *
     * @param id SessionId
     */
    @Override
    public void doLogoutSession(String id) {

    }
}
