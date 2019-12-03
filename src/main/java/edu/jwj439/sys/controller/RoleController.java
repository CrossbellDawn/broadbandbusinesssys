package edu.jwj439.sys.controller;

import edu.jwj439.sys.service.IRoleService;
import edu.jwj439.sys.utils.DataGridView;
import edu.jwj439.sys.utils.ResultObj;
import edu.jwj439.sys.vo.RoleVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 角色管理控制器
 */
@RestController
@RequestMapping("role")
public class RoleController {

    @Autowired
    private IRoleService roleService;

    /**
     * 加载角色列表返回DataGridView
     * @param roleVo
     * @return
     */
    @RequestMapping("loadAllRole")
    public DataGridView loadAllRole(RoleVo roleVo){
        return this.roleService.queryAllRole(roleVo);
    }

    /**
     * 添加角色
     * @param roleVo
     * @return
     */
    @RequestMapping("addRole")
    public ResultObj addRole(RoleVo roleVo){
        try{
            this.roleService.addRole(roleVo);
            return ResultObj.ADD_SUCCESS;
        }catch (Exception e){
            e.printStackTrace();
            return ResultObj.ADD_ERROR;
        }
    }

    /**
     * 修改角色
     * @param roleVo
     * @return
     */
    @RequestMapping("updateRole")
    public ResultObj updateRole(RoleVo roleVo){
        try {
            this.roleService.updateRole(roleVo);
            return ResultObj.UPDATE_SUCCESS;
        }catch (Exception e){
            e.printStackTrace();
            return ResultObj.UPDATE_ERROR;
        }
    }

    /**
     * 删除角色
     * @param roleVo
     * @return
     */
    @RequestMapping("deleteRole")
    public ResultObj deleteRole(RoleVo roleVo){
        try {
            this.roleService.deleteRole(roleVo.getRoleid());
            return ResultObj.DELETE_SUCCESS;
        }catch (Exception e){
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
    }

    /**
     * 批量删除角色
     * @param roleVo
     * @return
     */
    @RequestMapping("deleteBatchRole")
    public ResultObj deleteBatchRole(RoleVo roleVo){
        try {
            this.roleService.deleteBatchRole(roleVo.getIds());
            return ResultObj.DELETE_SUCCESS;
        }catch (Exception e){
            return ResultObj.DELETE_ERROR;
        }
    }

    /**
     * 加载角色管理分配菜单的json
     * @param roleid
     * @return
     */
    @RequestMapping("initRoleMenuTreeJson")
    public DataGridView initRoleMenuJson(Integer roleid){
        return this.roleService.initRoleMenuTreeJson(roleid);
    }

    /**
     * 保存角色和菜单的关系
     * @param roleVo
     * @return
     */
    @RequestMapping("saveRoleMenu")
    public ResultObj saveRoleMenu(RoleVo roleVo){
        try {

            this.roleService.saveRoleMenu(roleVo);
            return ResultObj.DISPATCH_SUCCESS;
        }catch (Exception e){
            e.printStackTrace();
            return ResultObj.DISPATCH_ERROR;
        }
    }



}
