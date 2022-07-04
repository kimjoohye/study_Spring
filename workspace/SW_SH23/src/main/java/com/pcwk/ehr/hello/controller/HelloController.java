package com.pcwk.ehr.hello.controller;

import java.sql.SQLException;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pcwk.ehr.cmn.SearchVO;

@Controller("helloController")
@RequestMapping("hello")
public class HelloController {
	final Logger LOG = LogManager.getLogger(getClass());
	
    @RequestMapping(value="/hello.do", method=RequestMethod.GET)
    public String hello(SearchVO inVO, Model model) throws SQLException{
    	LOG.debug("=================");
    	LOG.debug("=hello()=");
    	LOG.debug("=================");
    	
    	return "hello/hello";
    }
	 
}
