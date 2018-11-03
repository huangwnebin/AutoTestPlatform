package com.luckin.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.luckin.common.bean.Rest;
import com.luckin.common.controller.SuperController;
import com.luckin.entity.SysUser;
import com.luckin.service.ISysLogService;
import com.luckin.service.ISysUserService;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * 注册控制器
 * @author Gaojun.Zhou
 * @date 2016年12月14日 下午2:54:01
 */
@Controller
@RequestMapping("/register")
public class RegisterController extends SuperController {
	/**
	 * 日志服务
	 */
	@Resource
	private ISysLogService sysLogService;
	@Autowired
	private ISysUserService sysUserService;

	/**
	 * 注册页面
	 */
	@RequestMapping
	public String register(){
		return "register";
	}
	
	/**
	 * 执行注册
	 */
	@RequestMapping("/doRegister")
	@ResponseBody
    public Rest doRegister(SysUser user) {
		String[] roleId={"6a2994e4788a44f0973b5ca6ac4b6d73"};//默认普通用户角色
		user.setDeptId("nes44429b597d754c4180c6b40cdfb0f565");//默认部门为未分组
		Date now = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");//可以方便地修改日期格式
		user.setUserDesc("新注册用户-"+ dateFormat.format( now ));
		user.setUserState(1);
		sysUserService.insertUser(user,roleId);
		return Rest.ok();

	}



	/**
	 * 验证用户名是否已存在
	 */
	@RequestMapping("/checkName")
	@ResponseBody
	public Rest checkName(String userName){
		List<SysUser> list = sysUserService.selectList(new EntityWrapper<SysUser>().eq("userName", userName));
		if(list.size() > 0){
			return Rest.failure("用户名已存在");
		}
		return Rest.ok();
	}
}
