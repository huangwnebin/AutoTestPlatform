package com.luckin.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.luckin.entity.Testcase;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;


/**
 *
 * Testcase 表数据库控制层接口
 *
 */
@Repository
public interface TestcaseMapper extends BaseMapper<Testcase> {

	List<Map<Object, Object>> selectTestcaseList(Page<Map<Object, Object>> page, @Param("search") String search);
}