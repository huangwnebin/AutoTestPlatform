package com.luckin.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.luckin.entity.Project;
import com.luckin.mapper.ProjectMapper;
import com.luckin.service.ProjectService;
import org.springframework.stereotype.Service;


/**
 *
 * Project 表数据服务层接口实现类
 *
 */
@Service
public class ProjectServiceImpl extends ServiceImpl<ProjectMapper, Project> implements ProjectService {


}