package com.luckin.controller.project;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.luckin.common.anno.Log;
import com.luckin.common.bean.Rest;
import com.luckin.common.controller.SuperController;
import com.luckin.entity.Project;
import com.luckin.entity.SysDept;
import com.luckin.service.ProjectService;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


/**
 * 用户控制器
 * @author Gaojun.Zhou
 * @date 2016年12月13日 上午10:22:41
 */
@Controller
@RequestMapping("/u/project")
public class ProjectController extends SuperController{

	@Autowired private ProjectService projectService;

	/**
	 * 分页查询项目
	 */
	@RequestMapping("/list/{pageNumber}")
	public  String list(@PathVariable Integer pageNumber,@RequestParam(defaultValue="15") Integer pageSize, String search,Model model){

		Page<Project> page = getPage(pageNumber,pageSize);
		model.addAttribute("pageSize", pageSize);
		// 查询分页
		EntityWrapper<Project> ew = new EntityWrapper<Project>();
		if(StringUtils.isNotBlank(search)){
			ew.like("projectName",search);
			model.addAttribute("search",search);
		}
		Page<Project> pageData = projectService.selectPage(page, ew);
		model.addAttribute("pageData", pageData);
		return "u/project/list";
	}

	/**
	 * 新增项目
	 */
	@RequestMapping("/add")
	public  String add(Model model){
		return "u/project/add";
	}

	/**
	 * 执行新增
	 */
	@Log("创建项目")
	@RequestMapping("/doAdd")
	@ResponseBody
	public Rest doAdd(Project project){

		projectService.insert(project);
		return Rest.ok();
	}
	/**
	 * 删除项目
	 */
	@Log("删除项目")
	@RequestMapping("/delete")
	@ResponseBody
	public  Rest delete(String id){
		projectService.deleteById(id);
		return Rest.ok();
	}

	/**
	 * 编辑项目
	 */
	@RequestMapping("/edit/{id}")
	public  String edit(@PathVariable String id,Model model){
		Project project = projectService.selectById(id);

		model.addAttribute("project",project);
		return "u/project/edit";
	}
	/**
	 * 执行编辑
	 */
	@Log("编辑项目")
	@RequestMapping("/doEdit")
	@ResponseBody
	public  Rest doEdit(Project project,Model model){
		projectService.updateById(project);
		return Rest.ok();
	}

}
