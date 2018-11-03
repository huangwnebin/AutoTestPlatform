package com.luckin.common.aspect;

import com.google.gson.Gson;

import com.luckin.common.anno.Log;
import com.luckin.common.util.ShiroUtil;
import com.luckin.common.util.SpringUtil;
import com.luckin.entity.SysLog;
import com.luckin.entity.SysUser;
import com.luckin.service.ISysLogService;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.util.Date;

/**
 * 正常业务日志记录
 * @author Administrator
 *
 */
@Aspect
@Component
public class LogAdvice {
	
	public static final Logger LOG = LoggerFactory.getLogger(LogAdvice.class);
	
	@Pointcut("@annotation(com.luckin.common.anno.Log)")
	public void controllerAspect() {
		
	}
	/**
	 * 当方法正常返回是执行
	 * @param joinPoint
	 */
	@AfterReturning("controllerAspect()")
	public void doBefore(JoinPoint joinPoint) {
		
		MethodSignature methodSignature = (MethodSignature) joinPoint.getSignature();
		Method method = methodSignature.getMethod();
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		Log log =  method.getAnnotation(Log.class);
		SysUser sysUser = ShiroUtil.getSessionUser();
		if(log != null){
			SysLog sysLog  =new SysLog();
			sysLog.setCreateTime(new Date());
			sysLog.setTitle(log.value());
			sysLog.setUserName((sysUser != null )? sysUser.getUserName() : "system");
			sysLog.setUrl(request.getRequestURI().toString());
			sysLog.setParams(new Gson().toJson(request.getParameterMap()));
			SpringUtil.getBean(ISysLogService.class).insert(sysLog);
			LOG.debug("记录日志:"+sysLog.toString());
		}
	}
}
