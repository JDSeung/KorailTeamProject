package com.korail.batch.controller;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.korail.batch.service.TrainPairingService;
import com.korail.batch.vo.KTXInfoVO;


/**
 * Handles requests for the application home page.
 */
@Controller
public class BatchController {
	
	private static final Logger logger = LoggerFactory.getLogger(BatchController.class);

	@Autowired
	private TrainPairingService trainPairingService;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
	
		return "index";
	}
	
	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping(value = "/insert")
	public Map<String,Object> insert(){
		Map<String, Object> batchMap = new HashMap<String, Object>();
		Map<String, Object> trainMap = null;
		int insertDBCnt = 0;
		List<KTXInfoVO> trainList = null;
		long startTime = System.currentTimeMillis();
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");

		String str = dayTime.format(startTime);

		batchMap.put("startTime", str);
		try{
			trainMap = trainPairingService.getTrainParing();
		}catch (Exception e){
			e.printStackTrace();
		}
		if(trainMap != null){
			insertDBCnt = (Integer) trainMap.get("insertDBCnt");
			trainList = (List<KTXInfoVO>) trainMap.get("trainList");
		}
		long endTime = System.currentTimeMillis();
		str = dayTime.format(endTime);
		batchMap.put("endTime", str);
		batchMap.put("insertDBCnt", insertDBCnt);
		batchMap.put("trainList", trainList);
		String runningTime = getTakeTime(startTime, endTime);
		batchMap.put("runningTime", runningTime);
		return batchMap;
	}
	private String getTakeTime(long startTime, long endTime){
		long millis = endTime - startTime;
		double seconds = (millis / 1000);            //초
        int minutes = (int) ((millis / (1000*60)) % 60);  //분
		return minutes + "분 "+ seconds + "초";
	}
}
