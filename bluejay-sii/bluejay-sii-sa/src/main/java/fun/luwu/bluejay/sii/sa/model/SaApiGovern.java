package fun.luwu.bluejay.sii.sa.model;

import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @author LimOps
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class SaApiGovern extends Model<SaApiGovern> {

    private Long id;

    private String uri;
}
