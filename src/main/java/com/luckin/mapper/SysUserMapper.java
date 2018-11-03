package com.luckin.mapper;

import java.util.List;
import java.util.Map;

import com.luckin.entity.SysUser;
import org.apache.ibatis.annotations.Param;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.Page;
import org.springframework.stereotype.Repository;


/**
 *
 * SysUser 表数据库控制层接口
 *
 */
@Repository
public interface SysUserMapper extends BaseMapper<SysUser> {

	List<Map<Object, Object>> selectUserList(Page<Map<Object, Object>> page, @Param("search") String search);
}