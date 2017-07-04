package com.korail.batch.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.korail.batch.dao.CityAccotTrainDAO;
import com.korail.batch.dao.KTXInfoDAO;
import com.korail.batch.vo.CityAccotTrainVO;
import com.korail.batch.vo.KTXInfoVO;


/*
 * 에러코드 정리
 * 1 Application Error	
 * 2 DB Error	
 * 3 No Data	
 * 4 HTTP Error	
 * 5 service time out	
 * 1 ~ 5 서비스 제공기관의 관리자에게 문의
 * 10 잘못된 요청 파라미터 에러 = OpenApi 요청시 ServiceKey 
 *   - 파라미터가 없음 OpenAPI 요청 값에서 ServiceKey 파라미터가 누락
 * 11 필수 요청 파라미터가 없음
 *   - 요청하신 OpenApi의 필수 파라미터가 누락
 * 12 해당 오픈 API 서비스가 없거나 폐기됨 = OpenApi 호출시 URL이 잘못됨
 *   - OpenApi 요청 URL을 다시 확인
 * 20 서비스 접근 거부 활용승인이 되지 않은 OpenApi 호출
 *   - OpenAPI활용신청정보의 승인상태를 확인
 * 22 서비스 요청 제한 횟수 초과 에러 = 일일 활용건수가 초과함(활용건수 증가 필요)
 *   - OpenAPI 활용신청정보의 서비스 상세기능별 일일트래픽량을 확인하시기 바랍니다.
 * 30 등록되지 않은 서비스 키 = 잘못된 서비스키를 사용하였거나 서비스키를 URL 인코딩하지 않음
 *   - 서비스키를 다시 확인  OR URL 인코딩 되었는지 다시 확인
 * 31 기한 만료된 서비스 키 = OpenApi 사용기간이 만료됨, (활용연장신청 후 사용가능)
 * 32 등록되지 않은 도메인명 또는 IP 주소 활용신청한 서버의 IP와 실제 OpenAPI호출한 서버가 다를 경우
 *   - IP나 도메인의 정보를 변경하기 위해 변경신청을 할 수 있습니다.
 * */
@Service
public class TrainPairingServiceImpl implements TrainPairingService {
	@Autowired
	private CityAccotTrainDAO stationDAO;
	@Autowired
	private KTXInfoDAO trainPairingDAO;
	@Autowired
	private ConnectURLServiceImpl connectURLServiceImpl;
	private StringBuilder urlBuilder = null;
	private String url = "";
	private String serviceKey = "?serviceKey=EWaIWoYFWMoi3L9NF4%2BP5RVNrq1osLe37eLwQl7hRAhiFSQpFK3i8mOg0Te%2Fd%2Fw4QTE4aZiNB0FZ%2BLQc8l%2FI0w%3D%3D";
	private Elements apiElements = null;
	private List<CityAccotTrainVO> cityAccottrainList= null;
	private List<KTXInfoVO> trainInfoList= null;
	private Map<String, List<KTXInfoVO>> korailInfoListMap = null;
	private KTXInfoVO trainPairingVO;
	@Override
	public void getTrainParing() throws Exception {
		System.out.println("getStrtpntAlocFndTrainInfoURL 실행");
		cityAccottrainList = new ArrayList<CityAccotTrainVO>();
		korailInfoListMap =new HashMap<String, List<KTXInfoVO>>();
		trainInfoList = new ArrayList<KTXInfoVO>();
		getStationData();
		
	}
	
	private String getTakeTime(KTXInfoVO korailInfoVO) throws ParseException{
		Date toStart = parseDate(korailInfoVO.getDepplandTime());
		Date toEnd = parseDate(korailInfoVO.getArrplandTime());
		long startTime = toStart.getTime();
		long endTime = toEnd.getTime();
		long mills = endTime - startTime;
		long hour = mills/(60*60*1000);
		mills = mills%(60*60*1000);
		long min = mills/60000;
		return hour + ":"+ min;
	}
	
	private Date parseDate(String strDate) throws ParseException{
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyyMMddHHmmss");
		Date parsingDate = transFormat.parse(strDate);
		return parsingDate;
	}
	/*출발/도착역 가져오기.*/
	private void getStationData()  throws Exception{
		cityAccottrainList = stationDAO.getDepArrData();
		for(CityAccotTrainVO depArrVo : cityAccottrainList){
			String depPlaceName = depArrVo.getDepplaceName();
			String arrPlaceName = depArrVo.getArrplaceName();
			if(!(depPlaceName.equals(arrPlaceName))){
				getAPIData(depArrVo);
			}
		}
		if((trainInfoList.size()%500) > 0){
			korailInfoListMap.put("trainInfoList", trainInfoList);
			trainPairingDAO.korailInfoInsert(korailInfoListMap);
		}
		
		
	}
	private void getAPIData(CityAccotTrainVO depArrVo) throws Exception{
		//출_도착지기반열차정보 가져오기
		urlBuilder = new StringBuilder("http://openapi.tago.go.kr/openapi/service/TrainInfoService/");
		url = "getStrtpntAlocFndTrainInfo";
		urlBuilder.append(url + serviceKey);
		urlBuilder.append("&numOfRows=100");
		urlBuilder.append("&pageNo=1");
		urlBuilder.append("&depPlaceId=" + depArrVo.getDepID());
		urlBuilder.append("&arrPlaceId=" + depArrVo.getArrID());
		urlBuilder.append("&depPlandTime=" + "20170706");
		urlBuilder.append("&trainGradeCode=" + "00");
		System.out.println(urlBuilder.toString());
		apiElements = connectURLServiceImpl.connectURL(urlBuilder);
		korailInfoListMap = new HashMap<String, List<KTXInfoVO>>();
		if(apiElements != null){
			setKorailDB();
		}
	}
	private void setKorailDB() throws Exception{
		for(Element itemElement : apiElements){
			System.out.println("dataCount 실행 횟수 : " + trainInfoList.size());
			System.out.println("출발역 : " + itemElement.select("arrplacename").text() + "도착역 : " + itemElement.select("depplacename").text());
			trainPairingVO = new KTXInfoVO();
			trainPairingVO.setArrplaceName(itemElement.select("arrplacename").text());
			trainPairingVO.setArrplandTime(itemElement.select("arrplandtime").text());
			trainPairingVO.setDepplaceName(itemElement.select("depplacename").text());
			trainPairingVO.setDepplandTime(itemElement.select("depplandtime").text());
			trainPairingVO.setTrainName(itemElement.select("traingradename").text());
			trainPairingVO.setTakeTime(getTakeTime(trainPairingVO));
			trainInfoList.add(trainPairingVO);
			if((trainInfoList.size() % 500) == 0){
				System.out.println(urlBuilder);
				System.out.println("실행완료 건수 : " + trainInfoList.size());
				korailInfoListMap.put("trainInfoList", trainInfoList);
				trainPairingDAO.korailInfoInsert(korailInfoListMap);
				trainInfoList = new ArrayList<KTXInfoVO>();
				korailInfoListMap =new HashMap<String, List<KTXInfoVO>>();
			}
		}
	}
	
}
