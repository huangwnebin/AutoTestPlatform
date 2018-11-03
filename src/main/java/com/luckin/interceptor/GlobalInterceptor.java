package com.luckin.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.luckin.common.util.ShiroUtil;
import com.luckin.common.util.SpringUtil;
import com.luckin.entity.SysSetting;
import com.luckin.entity.SysUser;
import com.luckin.entity.vo.TreeMenu;
import com.luckin.service.ISysMenuService;
import com.luckin.service.ISysSettingService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


/**
 * 全局拦截器
 * @author jameszhou
 *
 */
//@Component
public class GlobalInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {

		if (handler instanceof HandlerMethod) {
			
			/**
			 * 加载全局非登录访问常量
			 */
			List<SysSetting> list =  SpringUtil.getBean(ISysSettingService.class).findAll();
			for(SysSetting setting : list){
				request.setAttribute(setting.getSysKey(),setting.getSysValue());
			}
			
			/**
			 * 保存登录信息
			 */
			SysUser me = ShiroUtil.getSessionUser();
			if(me == null){
				return true;
			}
			me.setPassword("");
			request.setAttribute("me", me);
			/**
			 * 资源和当前选中菜单
			 */
			String res = request.getParameter("p");
			if (StringUtils.isNotBlank(res)) {
				request.getSession().setAttribute("res", res);
			}
			String cur = request.getParameter("t");
			if (StringUtils.isNotBlank(cur)) {
				request.getSession().setAttribute("cur", cur);
			}
			/**
			 * 获取当前用户的菜单
			 */
			List<TreeMenu> treeMenus = SpringUtil.getBean(ISysMenuService.class).selectTreeMenuByUserId(me.getId());
			request.setAttribute("treeMenus", treeMenus);
			
		}

		/**
		 * 通过拦截
		 */
		return true;
	}

}
