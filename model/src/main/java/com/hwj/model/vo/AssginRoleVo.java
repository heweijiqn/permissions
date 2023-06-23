/**
 * @author 何伟健
 * @version 1.0
 *@date 2023/6/12 17:46
 */

package com.hwj.model.vo;


import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.List;

@ApiModel(description = "分配菜单")
@Data
public class AssginRoleVo {

    @ApiModelProperty(value = "用户id")
    private String userId;

    @ApiModelProperty(value = "角色id列表")
    private List<String> roleIdList;

}
