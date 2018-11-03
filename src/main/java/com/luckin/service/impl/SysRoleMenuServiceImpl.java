package com.luckin.service.impl;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.luckin.entity.SysRoleMenu;
import com.luckin.mapper.SysMenuMapper;
import com.luckin.mapper.SysRoleMenuMapper;
import com.luckin.service.ISysRoleMenuService;
import org.apache.commons.lang3.ArrayUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



/**
 *
 * SysRoleMenu 表数据服务层接口实现类
 *
 */
@Service
public class SysRoleMenuServiceImpl extends ServiceImpl<SysRoleMenuMapper, SysRoleMenu> implements ISysRoleMenuService {
	
	@Autowired private SysMenuMapper sysMenuMapper;
	
	@Override
	public void addAuth(String roleId, String[] menuIds) {
		
		/**
		 * 删除原有权限
		 */
		this.delete(new EntityWrapper<SysRoleMenu>().eq("roleId",roleId));
		/**
		 * 重新授权
		 */
		if(ArrayUtils.isNotEmpty(menuIds)){
			for(String menuId : menuIds){
				SysRoleMenu sysRoleMenu2 = new SysRoleMenu();
				sysRoleMenu2.setRoleId(roleId);
				sysRoleMenu2.setMenuId(menuId);
				this.insert(sysRoleMenu2);
			}
		}
	}

	@Override
	public List<SysRoleMenu> selectByRole(String roleId) {
		EntityWrapper<SysRoleMenu> ew = new EntityWrapper<SysRoleMenu>();
		ew.addFilter("roleId = {0}", roleId);
		return this.selectList(ew);
		
	}

	@Override
	public Set<String> findMenusByUid(String id) {
		List<String> list =  sysMenuMapper.selectResourceByUid(id);
		return new HashSet<>(list);
	}


}