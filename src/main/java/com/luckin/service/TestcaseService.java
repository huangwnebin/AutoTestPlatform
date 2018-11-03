package com.luckin.service;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.IService;
import com.luckin.entity.Testcase;

import java.util.Map;


/**
 *
 * testcase 表数据服务层接口
 *
 */
public interface TestcaseService extends IService<Testcase> {
	
	/**
	 * 分页查询用例
	 */
	Page<Map<Object, Object>> selectTestcasePage(Page<Map<Object, Object>> page, String search);
	
	/**
	 * 保存用例
	 */
	void insertTestcase(Testcase testcase);
	/**
	 * 更新用例
	 */
	void updateTestcase(Testcase testcase);
	/**
	 * 删除用例
	 */
	void delete(String id);
	//查询用例是否存在

}