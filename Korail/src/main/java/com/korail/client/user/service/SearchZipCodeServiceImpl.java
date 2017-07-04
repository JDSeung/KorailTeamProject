package com.korail.client.user.service;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.korail.client.user.vo.AddrTO;
import com.korail.client.user.vo.AddrVO;

@Service
public class SearchZipCodeServiceImpl implements SearchZipCodeService {

	/* 슬기형 */
	public static final String ZIPCODE_API_KEY = "a015c9a519a3e7fee1497598373043";
	public static final String ZIPCODE_API_URL = "https://biz.epost.go.kr/KpostPortal/openapi"; // 요청 URL

	@Override
	public String getZipCode(AddrTO addrTO) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();

		// 요청 URL 생성
		StringBuilder queryUrl = new StringBuilder();
		queryUrl.append(ZIPCODE_API_URL);
		queryUrl.append("?regkey=");
		queryUrl.append(ZIPCODE_API_KEY);
		queryUrl.append("&target=postNew");// 서비스 종류 (지번/도로명, 새우편번호 지번/도로명)
		queryUrl.append("&query=");
		// ex) 세종로 17 로 입력하면 세종로와 17사이의 빈칸 때문에 에러가 발생하기 때문에 빈칸을 없앤다.
		queryUrl.append(URLEncoder.encode(addrTO.getQuery().replaceAll(" ", ""), "EUC-KR"));
		queryUrl.append("&countPerPage=");
		queryUrl.append("50");
		queryUrl.append("&currentPage=");
		queryUrl.append(addrTO.getCurrentPage());

		System.out.println(queryUrl.toString());
		Document document = Jsoup.connect(queryUrl.toString()).get();

		String errorCode = document.select("error_code").text();

		// 요청 결과가 정상일 경우 내용을 파싱하여 List 에 담는다.
		if (null == errorCode || "".equals(errorCode)) {
			Elements elements = document.select("item");

			List<AddrVO> list = new ArrayList<AddrVO>();
			AddrVO addrVO = null;

			for (Element element : elements) {
				addrVO = new AddrVO();
				addrVO.setZipcode(element.select("postcd").text());
				addrVO.setLnmAddress(element.select("address").text());
				list.add(addrVO);
			}

			paramMap.put("list", list);

			// 요청 결과가 정상이 아닐 경우 에러 내용을 담는다.
		} else {
			String errorMessage = document.select("message").text();

			paramMap.put("errorCode", errorCode);
			paramMap.put("errorMessage", errorMessage);
		}
		return (new Gson()).toJson(paramMap);
	}
}
