package com.luckin.common.shiro;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.luckin.entity.SysUser;
import com.luckin.service.ISysRoleMenuService;
import com.luckin.service.ISysUserRoleService;
import com.luckin.service.ISysUserService;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Set;

/**
 * shiro Realm
 * @author jameszhou
 *
 */

public class MyRealm extends AuthorizingRealm{
	
	/**
	 * 用户服务
	 */
	@Autowired
    private ISysUserService userService;
	/**
	 * 用户角色服务
	 */
	@Autowired
    private ISysUserRoleService sysUserRoleService;
	/**
	 * 角色菜单服务
	 */
	@Autowired
    private ISysRoleMenuService sysRoleMenuService;
	
	/**
	 * 认证
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		UsernamePasswordToken user = (UsernamePasswordToken) token;
		SysUser sysUser = userService.selectOne(new EntityWrapper<SysUser>().eq("userName", user.getUsername()));
		
		if(sysUser == null){
			throw new UnknownAccountException();
		}
		if(sysUser.getUserState() == SysUser._0){
			throw new LockedAccountException();
		}
		//用户名，数据库中的密码,reaml名称
		//SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(user.getUsername(),sysUser.getPassword(),getName());
		//盐值加密
		ByteSource byteSource = ByteSource.Util.bytes(user.getUsername());
		SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(sysUser,sysUser.getPassword(),byteSource,getName());
		return info;
	}
	
	
	/**
	 * 授权
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		SysUser sysUser = (SysUser) principals.getPrimaryPrincipal();
		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
		Set<String> roles = sysUserRoleService.findRolesByUid(sysUser.getId());
		Set<String> permissions = sysRoleMenuService.findMenusByUid(sysUser.getId());
		info.setRoles(roles);
		info.setStringPermissions(permissions);
		return info;
	}

	
	/**
	 * 密码加密 测试
	 * @param args
	 */
	public static void main(String[] args) {
		// MD5,"原密码","盐",加密次数
		String pwd =  new SimpleHash("MD5", "123456", "admin", 1024).toString();
		System.out.println(pwd);
		
	}
}
