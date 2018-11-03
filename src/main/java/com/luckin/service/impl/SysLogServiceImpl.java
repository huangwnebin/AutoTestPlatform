package com.luckin.service.impl;

import java.util.Date;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.luckin.entity.SysLog;
import com.luckin.mapper.SysLogMapper;
import com.luckin.service.ISysLogService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

/**
 *
 * SysLog 表数据服务层接口实现类
 *
 */
@Service
public class SysLogServiceImpl extends ServiceImpl<SysLogMapper, SysLog> implements ISysLogService {

	public static final Logger logger = LoggerFactory.getLogger(SysLogServiceImpl.class);
	
	@Override
	public void insertLog(String title, String uname, String url, String parms) {
		SysLog sysLog  =new SysLog();
		sysLog.setCreateTime(new Date());
		sysLog.setTitle(title);
		sysLog.setUserName(uname);
		sysLog.setUrl(url);
		sysLog.setParams(parms);
		super.insert(sysLog);
		logger.debug("记录日志:"+sysLog.toString());
	}


}