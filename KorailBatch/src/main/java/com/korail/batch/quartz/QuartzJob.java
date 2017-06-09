package com.korail.batch.quartz;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.context.ApplicationContext;
import org.springframework.scheduling.quartz.QuartzJobBean;

public abstract class QuartzJob extends QuartzJobBean{
	
	private ApplicationContext appContext;
	
	@Override
	protected void executeInternal(JobExecutionContext context) throws JobExecutionException {
		appContext = (ApplicationContext) context.getJobDetail().getJobDataMap().get("applicationContext");
		try{
			executeJob(context);
		}catch(Exception e){
			e.printStackTrace();
			e.getMessage();
		}
	}

	protected Object getBean(String beanId){
		return appContext.getBean(beanId);
	}
	protected abstract void executeJob(JobExecutionContext jobexecutioncontext);
}

