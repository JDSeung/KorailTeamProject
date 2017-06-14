
package com.korail.client.cscenter.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value ="/qnaboard")
public class QnABoardController {
	/*승열*/
	@RequestMapping(value = "/")
	public String reservation(Model model){
		return "qnaboard/qnaList";
	}
}
