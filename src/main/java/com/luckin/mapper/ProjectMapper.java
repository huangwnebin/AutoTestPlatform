package com.luckin.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.luckin.entity.Project;
import com.luckin.entity.SysDept;
import org.springframework.stereotype.Repository;


/**
 *
 * SysDept 表数据库控制层接口
 *
 */
@Repository
public interface ProjectMapper extends BaseMapper<Project> {


}