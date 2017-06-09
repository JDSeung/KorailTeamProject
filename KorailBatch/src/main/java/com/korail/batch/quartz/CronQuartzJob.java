package com.korail.batch.quartz;

import org.quartz.JobExecutionContext;
import org.springframework.stereotype.Component;

import com.korail.batch.service.TrainPairingService;
@Component
public class CronQuartzJob extends QuartzJob{

	@Override
	protected void executeJob(JobExecutionContext jobexecutioncontext) {
		TrainPairingService trainPairingServiceImpl = (TrainPairingService)super.getBean("trainPairingServiceImpl"); //get service bean from spring applicationContext
		  
		try {
			trainPairingServiceImpl.deleteTrainParing();
			trainPairingServiceImpl.getTrainParing();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} //call service method
	}

}
