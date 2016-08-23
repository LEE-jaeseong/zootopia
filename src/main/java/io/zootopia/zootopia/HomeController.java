package io.zootopia.zootopia;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		
		return "intro";
	}
	@RequestMapping(value = "/dashboard", method = RequestMethod.GET)
	public String home() {
		return "index";
	}
	@RequestMapping(value = "/situation/sujeong", method = RequestMethod.GET)
	public String situation1() {
		
		
		return "situ_sujeong";
	}
	@RequestMapping(value = "/situation/jungone", method = RequestMethod.GET)
	public String situation2() {
		
		
		return "situ_jungone";
	}
	@RequestMapping(value = "/situation/bundang", method = RequestMethod.GET)
	public String situation3() {
		
		
		return "situ_bundang";
	}
	@RequestMapping(value = "/analytics/cctv", method = RequestMethod.GET)
	public String analy_cctv() {
		
		
		return "analy_cctv";
	}
	
	@RequestMapping(value = "/analytics/seriousArea", method = RequestMethod.GET)
	public String analy_area() {
		
		
		return "serious_area";
	}
	
	
	
	
}
