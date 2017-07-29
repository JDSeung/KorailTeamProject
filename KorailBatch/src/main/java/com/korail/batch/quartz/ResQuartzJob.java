package com.korail.batch.quartz;

import org.quartz.JobExecutionContext;
import org.springframework.stereotype.Component;

import com.korail.batch.service.ResService;
@Component
public class ResQuartzJob extends QuartzJob{

	@Override
	protected void executeJob(JobExecutionContext jobexecutioncontext) {
		ResService resService = (ResService)super.getBean("resServiceImpl"); //get service bean from spring applicationContext
		  
		try {
			/*실행 할 서비스*/
			resService.resChange();
			resService.resCancle();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} //call service method
	}

}
