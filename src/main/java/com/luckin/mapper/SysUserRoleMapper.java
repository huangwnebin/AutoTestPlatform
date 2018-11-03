package com.luckin.mapper;

import java.util.List;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.luckin.entity.SysUserRole;
import org.springframework.stereotype.Repository;

/**
 *
 * SysUserRole 表数据库控制层接口
 *
 */
@Repository
public interface SysUserRoleMapper extends BaseMapper<SysUserRole> {

	List<String> selectPermissionByUid(String uid);

}