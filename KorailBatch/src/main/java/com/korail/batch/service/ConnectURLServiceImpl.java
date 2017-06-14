package com.korail.batch.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Component
public class ConnectURLServiceImpl {
	private URL apiURL = null;
	private HttpURLConnection urlConnect = null;
	private BufferedReader urlRead = null;
	private Document apiDocument = null;
	private Elements apiElements = null;
	private static final Logger logger = LoggerFactory.getLogger(ConnectURLServiceImpl.class);
	public  Elements connectURL(StringBuilder urlBuilder) throws Exception {
		//URL Connect
		try{
			apiURL = new URL(urlBuilder.toString());
			urlConnect = (HttpURLConnection) apiURL.openConnection();
			urlConnect.setRequestMethod("GET");
			urlConnect.setRequestProperty("Context-type", "application/json");
			apiDocument = Jsoup.connect(urlBuilder.toString()).timeout(60*60*1000).get();
			if(urlConnect.getResponseCode() >= 200 && urlConnect.getResponseCode() <= 300){
				//정상 호출시 json 자료 가져오기
				logger.info(apiDocument.select("item").toString());
				apiElements = apiDocument.select("item");
				System.out.println("서비스스 상황 " + apiDocument.select("resultMsg").text() );
			}else{
				//비 정상 호출시 에러 코드 출력
				urlRead = new BufferedReader(new InputStreamReader(urlConnect.getErrorStream()));
				urlRead.close();
			}
			
		}catch (Exception e) {
			System.out.println("getCtyCodeList()Service Error : " + e.getMessage());
			e.printStackTrace();
		}
		return apiElements;
	}

}
