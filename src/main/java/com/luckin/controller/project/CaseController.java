package com.luckin.controller.project;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.luckin.common.anno.Log;
import com.luckin.common.bean.Rest;
import com.luckin.common.controller.SuperController;
import com.luckin.entity.Testcase;
import com.luckin.service.*;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

/**
 * 测试用例控制器
 */
@Controller
@RequestMapping("/u/testcase")
public class CaseController extends SuperController{

	@Autowired private TestcaseService testcaseService;
	@Autowired private ProjectService projectService;
	
	/**
	 * 分页查询测试用例
	 */
    @RequestMapping("/list/{pageNumber}")
    public  String list(@PathVariable Integer pageNumber,@RequestParam(defaultValue="15") Integer pageSize,String search,Model model){
		if(StringUtils.isNotBlank(search)){
			model.addAttribute("search", search);
		}
    	Page<Map<Object, Object>> page = getPage(pageNumber,pageSize);
    	model.addAttribute("pageSize", pageSize);
    	Page<Map<Object, Object>> pageData = testcaseService.selectTestcasePage(page, search);
    	model.addAttribute("pageData", pageData);
    	return "u/testcase/list";
    } 
    /**
     * 新增用例
     */
    @RequestMapping("/add")
    public  String add(Model model){
    	model.addAttribute("projectList", projectService.selectList(null));
		return "u/testcase/add";
    } 
    
    /**
     * 执行新增
     */
    @Log("新增用例")
    @RequestMapping("/doAdd")
    @ResponseBody
    public  Rest doAdd(Testcase testcase){
    	testcaseService.insertTestcase(testcase);
    	return Rest.ok();
    }
    /**
     * 删除用例
     */
    @Log("删除用例")
    @RequestMapping("/delete")
    @ResponseBody
    public  Rest delete(String id){
		testcaseService.delete(id);
    	return Rest.ok();
    }
    /**
     * 编辑用户
     */
    @RequestMapping("/caseresult/{id}")
    public  String caseresult(@PathVariable String id,Model model){
        Testcase testcase = testcaseService.selectById(id);
        model.addAttribute("testcase",testcase);
        model.addAttribute("projectList", projectService.selectList(null));
        return "u/testcase/caseresult";
    }
    /**
	 * 编辑用户
	 */
    @RequestMapping("/edit/{id}")  
    public  String edit(@PathVariable String id,Model model){
    	Testcase testcase = testcaseService.selectById(id);
    	model.addAttribute("testcase",testcase);

    	model.addAttribute("projectList", projectService.selectList(null));
    	return "u/testcase/edit";
    } 
    /**
     * 执行编辑
     */
    @Log("编辑用户")
    @RequestMapping("/doEdit")
    @ResponseBody
    public  Rest doEdit(Testcase testcase){
		testcaseService.updateTestcase(testcase);
    	return Rest.ok();
    } 
    
    /**
     * 验证用例名称是否已存在
     */
    @RequestMapping("/checkName")  
    @ResponseBody
    public Rest checkName(String testcaseName){
    	List<Testcase> list = testcaseService.selectList(new EntityWrapper<Testcase>().eq("testcaseName", testcaseName));
    	if(list.size() > 0){
    		return Rest.failure("用例已存在");
    	}
    	return Rest.ok();
    }
    
}
