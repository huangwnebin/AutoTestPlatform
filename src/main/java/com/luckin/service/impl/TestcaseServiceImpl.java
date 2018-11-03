package com.luckin.service.impl;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.luckin.entity.Testcase;
import com.luckin.mapper.TestcaseMapper;
import com.luckin.service.TestcaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.Date;
import java.util.Map;


/**
 *
 * Testcase 表数据服务层接口实现类
 *
 */
@Service
public class TestcaseServiceImpl extends ServiceImpl<TestcaseMapper, Testcase> implements TestcaseService {

	@Autowired private TestcaseMapper testcaseMapper;

	@Override
	public void insertTestcase(Testcase testcase) {
		// TODO Auto-generated method stub
		testcase.setCreateTime(new Date());
		//保存用户
		testcaseMapper.insert(testcase);
	}

	@Override
	public void updateTestcase(Testcase testcase) {
		// TODO Auto-generated method stub
		//更新用户
		testcaseMapper.updateById(testcase);
	}

	@Override
	public Page<Map<Object, Object>> selectTestcasePage(Page<Map<Object, Object>> page, String search) {
		// TODO Auto-generated method stub
		page.setRecords(baseMapper.selectTestcaseList(page, search));
		return page;
	}

	@Override
	public void delete(String id) {
		// TODO Auto-generated method stub
		this.deleteById(id);
	}


}