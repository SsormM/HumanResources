package com.iotek.controller;

import com.iotek.entity.Anthorty;
import com.iotek.entity.Role;
import com.iotek.entity.User;
import com.iotek.service.AnthortyService;
import com.iotek.service.RoleService;
import com.iotek.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
public class RoleController {
    @Autowired
    private RoleService roleService;
    @Autowired
    private UserService userService;
    @Autowired
    private AnthortyService anthortyService;

    @RequestMapping("/roleInfo_list")
    public String showRoleList(String target, ModelMap modelMap) {
        System.out.println("-----------------进入roleInfo_list------------------");
        System.out.println("target:" + target);
        List<Role> roleList = roleService.showRoleList();
        if (roleList != null) {
            modelMap.addAttribute("roleList", roleList);
        } else {
            modelMap.addAttribute("noInfo", "无搜索记录");
        }
        return "view/system/" + target;
    }

    @RequestMapping("/roleInfo_show")
    public String showRoleById(Integer roleId, String target, ModelMap modelMap) {
        System.out.println("-----------------进入roleInfo_show------------------");
        System.out.println("roleId:" + roleId);
        System.out.println("target:" + target);
        Role role = roleService.showRoleById(roleId);
        Map<Anthorty, List<Anthorty>> anthortyMap = anthortyService.showAnthortyMap();
        List<Anthorty> roleAnthorties = anthortyService.showAnthortyByRoleId(roleId);

        modelMap.addAttribute("anthortyMap", anthortyMap);
        modelMap.addAttribute("role", role);
        modelMap.addAttribute("roleAnthorties",roleAnthorties);
        return "view/system/" + target;
    }

    @RequestMapping("/roleInfo_delete")
    public String deleteRoleById(Integer roleId, ModelMap modelMap) throws Exception {
        System.out.println("----------------进入roleInfo_delete----------------");
        System.out.println(roleId);
        Integer integer = roleService.deleteRoleById(roleId);
        if (integer > 0) {
            modelMap.addAttribute("mess", "删除成功！");
        } else {
            modelMap.addAttribute("mess", "删除失败！");
        }
        return "forward:/roleInfo_list?target=roleinfo/roleInfo_list";
    }

    @RequestMapping("/roleInfo_add")
    public String addRole(Role role, ModelMap modelMap) {
        System.out.println("----------------进入roleInfo_add----------------");
        System.out.println(role);
        Integer integer = roleService.addRole(role);
        if (integer > 0) {
            modelMap.addAttribute("mess", "添加成功！");
        } else {
            modelMap.addAttribute("mess", "添加失败！");
        }
        return "forward:/roleInfo_list?target=roleinfo/roleInfo_list";
    }

    @RequestMapping("/roleInfo_update")
    public String updateRole(Role role, ModelMap modelMap) {
        System.out.println("----------------进入roleInfo_update----------------");
        System.out.println(role);
        Integer integer = roleService.updateRole(role);
        if (integer > 0) {
            modelMap.addAttribute("mess", "修改成功！");
        } else {
            modelMap.addAttribute("mess", "修改失败！");
        }
        return "forward:/roleInfo_list?target=roleinfo/roleInfo_list";
    }

    @RequestMapping("/roleInfo_find")
    public @ResponseBody
    List<Role> findByRoleName(Role role) {
        System.out.println("----------------进入roleInfo_find----------------");
        System.out.println(role);
        return roleService.findRole(role);
    }

    @RequestMapping("/user_role_show")
    public String roleChange(Integer userId, ModelMap modelMap) throws Exception {
        System.out.println("----------------进入role_change----------------");
        System.out.println("userId:" + userId);
        User user = userService.showUserById(userId);
        List<Role> roleList = roleService.showRoleList();
        modelMap.addAttribute("user", user);
        modelMap.addAttribute("roleList", roleList);
        return "view/system/roleinfo/role_change";
    }

    @RequestMapping("/user_role_update")
    public String updateStaffRole(User user, Role role, ModelMap modelMap) {
        System.out.println("------------------进入staff_role_update------------------");
        System.out.println(user);
        System.out.println(role);

        Integer integer = userService.updateUserRole(user, role);
        if (integer > 0) {
            modelMap.addAttribute("mess", "修改成功！");
        } else {
            modelMap.addAttribute("mess", "修改失败！");
        }
        return "forward:user_list?target=roleinfo/staffInfo_role_list";
    }

}