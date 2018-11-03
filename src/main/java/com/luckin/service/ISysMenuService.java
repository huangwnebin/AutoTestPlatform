package com.luckin.service;

import com.baomidou.mybatisplus.service.IService;
import com.luckin.entity.SysMenu;
import com.luckin.entity.vo.TreeMenu;
import com.luckin.entity.vo.TreeMenuAllowAccess;

import java.util.List;


/**
 *
 * SysMenu 表数据服务层接口
 *
 */
public interface ISysMenuService extends IService<SysMenu> {

	/**
	 * 获取指定用户拥有的菜单
	 */
	List<String> selectMenuIdsByuserId(String uid);
	/**
	 * 获取指定用户的菜单
	 * @param  menuIds 当前用户所在角色拥有的权限ID集合
	 * @param  pid 菜单父ID
	 */
	List<TreeMenu> selectTreeMenuByMenuIdsAndPid(List<String> menuIds, String pid);
	/**
	 * 获取当前用户的菜单
	 */
	List<TreeMenu> selectTreeMenuByUserId(String uid);
	/**
	 * 获取指定用户拥有权限
	 * @param  menuIds 该角色拥有的权限ID集合
	 * @param  pid 菜单父ID
	 */
	List<TreeMenuAllowAccess> selectTreeMenuAllowAccessByMenuIdsAndPid(List<String> menuIds, String pid);

}